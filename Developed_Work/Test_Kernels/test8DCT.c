#include "lib/kernels.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
/* Compare two implementations of 1D DCT 8:
    - AV1 Implementation
    - "FPGA Implementation of Pipelined 8×8 2-D DCT and IDCT Structure for H.264 Protocol"

    Read file with 8 lengthed input vectors, transform with both implementations and verify differences.
*/

#define N_VECTORS 1000000000

int main() {
    int32_t *in_v = malloc(8* sizeof *in_v);
    int32_t *av1_out_p = malloc(8* sizeof *av1_out_p);
    int32_t *fpga_out_p = malloc(8* sizeof *fpga_out_p);
    int32_t *test_out_p = malloc(8* sizeof *test_out_p);
    int32_t *av1_rest_p = malloc(8* sizeof *av1_out_p);
    int32_t *fpga_rest_p = malloc(8* sizeof *fpga_out_p);
    int32_t *test_rest_p = malloc(8* sizeof *test_out_p);
    double av1_PSNR, av1_ems_r, fpga_PSNR, fpga_ems_r, test_PSNR, test_ems_r = 0;
    double ell_av1, ell_fpga, ell_test = 0;
    struct timeval t1, t2;
    uint32_t i = 0;

    FILE *f_p = fopen("TransformInputs.txt","r");
    
    if(f_p == NULL) {
        perror("Error opening file");
        return(-1);
    }
    char temp_str[200];

    for(i = 0; (fgets(temp_str, 200, f_p) != NULL) && i < N_VECTORS; i++) {
        sscanf( temp_str,"%d %d %d %d %d %d %d %d",
                &in_v[0], 
                &in_v[1], 
                &in_v[2], 
                &in_v[3], 
                &in_v[4], 
                &in_v[5], 
                &in_v[6], 
                &in_v[7]);                

        gettimeofday(&t1,NULL);
        av1_fdct8(in_v, av1_out_p);
        av1_idct8(av1_out_p, av1_rest_p);
        gettimeofday(&t2,NULL);
        ell_av1 += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        gettimeofday(&t1,NULL);
        fpga_fdct8(in_v, fpga_out_p);
        av1_idct8(fpga_out_p, fpga_rest_p);     
        gettimeofday(&t2,NULL);
        ell_fpga += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        gettimeofday(&t1,NULL);
        inttest_fdct8(in_v, test_out_p);
        av1_idct8(test_out_p, test_rest_p);     
        gettimeofday(&t2,NULL);
        ell_test += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);
        
        for (uint8_t k = 0; k < 8; k++)
        {
            av1_ems_r += pow((in_v[k] - av1_rest_p[k]),2);
            fpga_ems_r += pow((in_v[k] - fpga_rest_p[k]),2);
            test_ems_r += pow((in_v[k] - test_rest_p[k]),2);
        }        
    }

    av1_ems_r /= (8*(i+1));
    fpga_ems_r /= (8*(i+1));
    test_ems_r /= (8*(i+1));

    av1_PSNR = 10*log10(2082249/av1_ems_r);
    fpga_PSNR = 10*log10(2082249/fpga_ems_r);
    test_PSNR = 10*log10(2082249/test_ems_r);

    printf("      | AV1_FWD -> AV1_INV | FPGA_FWD -> AV1_INV | TEST_FWD -> AV1_INV |\n"
           "________________________________________________________________________\n"
           "PSNR  | %16.2f dB| %17.2f dB| %17.2f dB|\n"
           "EMS   | %19.2f| %20.2f| %20.2f|\n"
           "t (us)| %19.2e| %20.2e| %20.2e|\n",
           av1_PSNR, fpga_PSNR, test_PSNR,
           av1_ems_r, fpga_ems_r, test_ems_r,
           ell_av1, ell_fpga, ell_test);

    return fclose(f_p);
}