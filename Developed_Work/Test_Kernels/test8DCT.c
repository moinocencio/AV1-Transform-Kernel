#include "lib/kernels.h"
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
/* Compare two implementations of 1D DCT 8:
    - AV1 Implementation
    - "FPGA Implementation of Pipelined 8×8 2-D DCT and IDCT Structure for H.264 Protocol"

    Read file with 8 lengthed input vectors, transform with both implementations and verify differences.
*/

#define N_VECTORS 1000000

int main() {
    FILE *f_p = fopen("TransformInputs.txt","r");
    int32_t *in_v = malloc(8* sizeof *in_v);
    int32_t *av1_out_p = malloc(8* sizeof *av1_out_p);
    int32_t *fpga_out_p = malloc(8* sizeof *fpga_out_p);
    int32_t *av1_rest_p = malloc(8* sizeof *av1_out_p);
    int32_t *fpga_rest_p = malloc(8* sizeof *fpga_out_p);
    double av1_PSNR, av1_ems_r, fpga_PSNR, fpga_ems_r = 0;

    if(f_p == NULL) {
        perror("Error opening file");
        return(-1);
    }
    char temp_str[200];

    for(uint32_t i = 0; (fgets(temp_str, 200, f_p) != NULL) && i < N_VECTORS; i++) {
        sscanf( temp_str,"%d %d %d %d %d %d %d %d",
                &in_v[0], 
                &in_v[1], 
                &in_v[2], 
                &in_v[3], 
                &in_v[4], 
                &in_v[5], 
                &in_v[6], 
                &in_v[7]);                

        
        av1_fdct8(in_v, av1_out_p);
        av1_idct8(av1_out_p, av1_rest_p);

        fpga_fdct8(in_v, fpga_out_p);
        //fpga_idct8(fpga_out_p, fpga_rest_p);  // Don't use "fast IDCT"
        av1_idct8(fpga_out_p, fpga_rest_p);     

        for (uint8_t k = 0; k < 8; k++)
        {
            av1_ems_r += pow((in_v[k] - av1_rest_p[k]),2);
            fpga_ems_r += pow((in_v[k] - fpga_rest_p[k]),2);
        }        
    }

    av1_ems_r /= (8*N_VECTORS);
    fpga_ems_r /= (8*N_VECTORS);

    av1_PSNR = 10*log10(65025/av1_ems_r);
    fpga_PSNR = 10*log10(65025/fpga_ems_r);

    printf("AV1_FWD -> AV1_INV: PSNR %4f dB\n                    EMS  %4f\nFPGA_FWD -> AV1_INV: PSNR %f dB\n                     EMS  %4f\n",av1_PSNR, av1_ems_r,fpga_PSNR, fpga_ems_r);

    return fclose(f_p);
}