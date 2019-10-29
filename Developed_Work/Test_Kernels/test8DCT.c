#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <sys/time.h>
#include "lib/kernels.h"
/* Compare two implementations of 1D DCT SIZE:
    - AV1 Implementation

    Read file with SIZE lengthed input vectors, transform with both implementations and verify differences.
*/

#define SIZE 8
#define N_VECTORS 1000000

int main() {
    int32_t in_v[SIZE];
    int32_t *in_v_p = in_v;

    int32_t *av1_out_p = malloc(SIZE* sizeof *av1_out_p);
    int32_t *test_out_mult_p = malloc(SIZE* sizeof *test_out_mult_p);
    int32_t *test_out_p = malloc(SIZE* sizeof *test_out_p);
    int32_t *test_out_bmult_p = malloc(SIZE* sizeof *test_out_bmult_p);

    int32_t *av1_rest_p = malloc(SIZE* sizeof *av1_out_p);
    int32_t *test_rest_mult_p = malloc(SIZE* sizeof *test_rest_mult_p);
    int32_t *test_rest_p = malloc(SIZE* sizeof *test_out_p);
    int32_t *test_rest_bmult_p = malloc(SIZE* sizeof *test_rest_bmult_p);

    int32_t *temp_p = malloc(SIZE* sizeof *temp_p);
    double av1_ems_r, test_mult_ems_r, test_ems_r, test_bmult_ems_r = 0;
    double ell_av1, ell_test_mult, ell_test, ell_bmult = 0;
    struct timeval t1, t2;
    uint32_t i,k  = 0;

    double t_dif;

    FILE *f_p = fopen("TransformInputs.txt","r");
    
    if(f_p == NULL) {
        perror("Error opening file");
        return(-1);
    }
    char temp_str[200];

    for(i = 0; (fgets(temp_str, 200, f_p) != NULL) && i < N_VECTORS; i++) {
        sscanf( temp_str,"%d %d %d %d %d %d %d %d",
                &in_v_p[0], 
                &in_v_p[1], 
                &in_v_p[2], 
                &in_v_p[3], 
                &in_v_p[4], 
                &in_v_p[5], 
                &in_v_p[6], 
                &in_v_p[7]);                

        gettimeofday(&t1,NULL);
        av1_fdct8(in_v_p, av1_out_p);
        for (k = 0; k < SIZE; k++)
            temp_p[k] = av1_out_p[k]>>2;
        av1_idct8(temp_p, av1_rest_p);
        gettimeofday(&t2,NULL);
        ell_av1 += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        gettimeofday(&t1,NULL);
        slowtest_fdct8_mult(in_v_p, test_out_mult_p);
        for (k = 0; k < SIZE; k++)
            temp_p[k] = test_out_mult_p[k]>>2;
        av1_idct8(temp_p, test_rest_mult_p);     
        gettimeofday(&t2,NULL);
        ell_test_mult += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        gettimeofday(&t1,NULL);
        slowtest_fdct8_shift(in_v_p, test_out_p);
        for (k = 0; k < SIZE; k++)
            temp_p[k] = test_out_p[k]>>2;
        av1_idct8(temp_p, test_rest_p);     
        gettimeofday(&t2,NULL);
        ell_test += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);
        
        gettimeofday(&t1,NULL);
        butttest_fdct8_mult(in_v_p, test_out_bmult_p);
        for (k = 0; k < SIZE; k++)
            temp_p[k] = test_out_bmult_p[k]>>2;
        av1_idct8(temp_p, test_rest_bmult_p);     
        gettimeofday(&t2,NULL);
        ell_bmult += ((unsigned long long)t2.tv_sec - (unsigned long long)t1.tv_sec)*1000000 + ((unsigned long long)t2.tv_usec - (unsigned long long)t1.tv_usec);

        //for (uint8_t k = 0; k < SIZE; k++)
        //{
        //    printf("%2d ",in_v_p[k]);
        //}
        //printf("\n");
        //for (uint8_t k = 0; k < SIZE; k++)
        //{
        //    printf("%2d ",av1_rest_p[k]);
        //}
        //printf("\n");
        //for (uint8_t k = 0; k < SIZE; k++)
        //{
        //    printf("%2d ",test_rest_p[k]);
        //}
        //printf("\n");
        //for (uint8_t k = 0; k < SIZE; k++)
        //{
        //    printf("%2d ",test_rest_bmult_p[k]);
        //}
        //printf("\n\n");

        for (uint8_t k = 0; k < SIZE; k++)
        {
            av1_ems_r += pow((in_v_p[k] - av1_rest_p[k]),2);
            test_mult_ems_r += pow((in_v_p[k] - test_rest_mult_p[k]),2);
            test_ems_r += pow((in_v_p[k] - test_rest_p[k]),2);
            test_bmult_ems_r += pow((in_v_p[k] - test_rest_bmult_p[k]),2);
        }        
    }

    av1_ems_r /= (SIZE*(i+1));
    test_mult_ems_r /= (SIZE*(i+1));
    test_ems_r /= (SIZE*(i+1));
    test_bmult_ems_r /= (SIZE*(i+1));

    t_dif = ((ell_test_mult - ell_av1)/ell_av1)*100;

    printf("      | AV1_FWD -> AV1_INV | TEST_FWD_MULT -> AV1_INV | TEST_FWD_SHIFT -> AV1_INV | BUTT_FWD_MULT -> AV1_INV \n"
           "_____________________________________________________________________________________________________________\n"
           "EMS   | %19.2f| %25.2f| %26.2f| %25.2f|\n"
           "t (us)| %19.2e| %16.2e (%3.1f%%)| %26.2e| %25.2e|\n",
           av1_ems_r, test_mult_ems_r, test_ems_r, test_bmult_ems_r,
           ell_av1, ell_test_mult, t_dif, ell_test, ell_bmult);

    return fclose(f_p);
}