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

#define SIZE 32
#define N_VECTORS 5000

int main() {
    int32_t *in_v = malloc(SIZE* sizeof *in_v);
    int32_t *av1_out_p = malloc(SIZE* sizeof *av1_out_p);
    int32_t *test_out_p = malloc(SIZE* sizeof *test_out_p);
    int32_t *av1_rest_p = malloc(SIZE* sizeof *av1_out_p);
    int32_t *test_rest_p = malloc(SIZE* sizeof *test_out_p);
    double av1_PSNR, av1_ems_r, test_PSNR, test_ems_r = 0;
    double ell_av1, ell_test = 0;
    struct timeval t1, t2;
    uint32_t i = 0;

    FILE *f_p = fopen("TransformInputs64.txt","r");
    
    if(f_p == NULL) {
        perror("Error opening file");
        return(-1);
    }
    char temp_str[200];

    for(i = 0; (fgets(temp_str, 400, f_p) != NULL) && i < N_VECTORS; i++) {
        sscanf( temp_str,"%d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d %d",
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
                &in_v[31]);

        //for (uint8_t k = 0; k < SIZE; k++)
        //{
        //    printf("%2d ",in_v[k]);
        //}
        //printf("\n");
        
        gettimeofday(&t1,NULL);
        av1_fdct32(in_v, av1_out_p);
        av1_idct32(av1_out_p, av1_rest_p);
        gettimeofday(&t2,NULL);
        ell_av1 += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        gettimeofday(&t1,NULL);
        slowtest_fdct32(in_v, test_out_p);
        av1_idct32(test_out_p, test_rest_p);     
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