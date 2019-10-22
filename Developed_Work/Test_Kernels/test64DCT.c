#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
#include "lib/kernels.h"
/* Compare two implementations of 1D DCT SIZE:
    - AV1 Implementation
    - "FPGA Implementation of Pipelined 8×8 2-D DCT and IDCT Structure for H.264 Protocol"

    Read file with SIZE lengthed input vectors, transform with both implementations and verify differences.
*/

#define SIZE 64
#define N_VECTORS 1000

int main() {
    int32_t *in_v = malloc(SIZE* sizeof *in_v);
    int32_t *av1_out_p = malloc(SIZE* sizeof *av1_out_p);
    int32_t *fpga_out_p = malloc(SIZE* sizeof *fpga_out_p);
    int32_t *test_out_p = malloc(SIZE* sizeof *test_out_p);
    int32_t *av1_rest_p = malloc(SIZE* sizeof *av1_out_p);
    int32_t *fpga_rest_p = malloc(SIZE* sizeof *fpga_out_p);
    int32_t *test_rest_p = malloc(SIZE* sizeof *test_out_p);
    int32_t *temp_p = malloc(SIZE* sizeof *temp_p);
    double av1_PSNR, av1_ems_r, fpga_PSNR, fpga_ems_r, test_PSNR, test_ems_r = 0;
    double ell_av1, ell_fpga, ell_test = 0;
    struct timeval t1, t2;
    uint32_t i, k = 0;

    FILE *f_p = fopen("TransformInputs64.txt","r");
    
    if(f_p == NULL) {
        perror("Error opening file");
        return(-1);
    }
    char temp_str[200];

    for(i = 0; (fgets(temp_str, 400, f_p) != NULL) && i < N_VECTORS; i++) {
        sscanf( temp_str,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",
                &in_v[0], 
                &in_v[1], 
                &in_v[2], 
                &in_v[3], 
                &in_v[4], 
                &in_v[5], 
                &in_v[6], 
                &in_v[7],
                &in_v[8],
                &in_v[9],
                &in_v[10],
                &in_v[11],
                &in_v[12],
                &in_v[13],
                &in_v[14],
                &in_v[15],
                &in_v[16], 
                &in_v[17], 
                &in_v[18], 
                &in_v[19], 
                &in_v[20], 
                &in_v[21], 
                &in_v[22], 
                &in_v[23],
                &in_v[24],
                &in_v[25],
                &in_v[26],
                &in_v[27],
                &in_v[28],
                &in_v[29],
                &in_v[30],
                &in_v[31],
                &in_v[32], 
                &in_v[33], 
                &in_v[34], 
                &in_v[35], 
                &in_v[36], 
                &in_v[37], 
                &in_v[38], 
                &in_v[39],
                &in_v[40],
                &in_v[41],
                &in_v[42],
                &in_v[43],
                &in_v[44],
                &in_v[45],
                &in_v[46],
                &in_v[47],
                &in_v[48], 
                &in_v[49], 
                &in_v[50], 
                &in_v[51], 
                &in_v[52], 
                &in_v[53], 
                &in_v[54], 
                &in_v[55],
                &in_v[56],
                &in_v[57],
                &in_v[58],
                &in_v[59],
                &in_v[60],
                &in_v[61],
                &in_v[62],
                &in_v[63]);

        gettimeofday(&t1,NULL); 
        av1_fdct64(in_v, av1_out_p);
        for (k = 0; k < SIZE; k++)
            temp_p[k] = (int) (av1_out_p[k]/sqrt(2));
        av1_idct64(temp_p, av1_rest_p);
        gettimeofday(&t2,NULL);
        ell_av1 += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        gettimeofday(&t1,NULL);
        slowtest_fdct64(in_v, test_out_p);
        for (k = 0; k < SIZE; k++)
            temp_p[k] = (int) (test_out_p[k]/sqrt(2));
        av1_idct64(temp_p, test_rest_p);     
        gettimeofday(&t2,NULL);
        ell_test += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);
    
        for (uint8_t k = 0; k < SIZE; k++)
        {
            av1_ems_r += pow((in_v[k] - av1_rest_p[k]),2);
            test_ems_r += pow((in_v[k] - test_rest_p[k]),2);
        }        
    }

    av1_ems_r /= (SIZE*(i+1));
    test_ems_r /= (SIZE*(i+1));

    printf("      | AV1_FWD -> AV1_INV | TEST_FWD -> AV1_INV |\n"
           "__________________________________________________\n"
           "EMS   | %19.2f| %20.2f|\n"
           "t (us)| %19.2e| %20.2e|\n",
           av1_ems_r, test_ems_r,
           ell_av1, ell_test);

    return fclose(f_p);
}