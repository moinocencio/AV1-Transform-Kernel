#include <stdlib.h>
#include "lib/kernels.h"

static inline int32_t round_shift(int64_t value, int bit) {
  assert(bit >= 1);
  return (int32_t)((value + (1ll << (bit - 1))) >> bit);
}

static inline int32_t half_btf(int32_t w0, int32_t in0, int32_t w1, int32_t in1,
                               int bit) {
  int64_t result_64 = (int64_t)(w0 * in0) + (int64_t)(w1 * in1);
  return round_shift(result_64, bit);
}

void av1_fdct4(const int32_t *input, int32_t *output) {
  const int32_t size = 4;
  const int32_t *cospi;
  int8_t cos_bit = 13;

  int32_t *bf0, *bf1;
  int32_t step[4];

  // stage 1;
  bf1 = output;
  bf1[0] = input[0] + input[3];
  bf1[1] = input[1] + input[2];
  bf1[2] = -input[2] + input[1];
  bf1[3] = -input[3] + input[0];

  // stage 2
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(-cospi[32], bf0[1], cospi[32], bf0[0], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[48], bf0[3], -cospi[16], bf0[2], cos_bit);

  // stage 3
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[2];
  bf1[2] = bf0[1];
  bf1[3] = bf0[3];
}

void av1_idct4(const int32_t *input, int32_t *output) {
  assert(output != input);
  int8_t cos_bit = 13;
  const int32_t size = 4;
  const int32_t *cospi = cospi_arr(cos_bit);

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[4];

  // stage 1;
  bf1 = output;
  bf1[0] = input[0];
  bf1[1] = input[2];
  bf1[2] = input[1];
  bf1[3] = input[3];

  // stage 2
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(cospi[32], bf0[0], -cospi[32], bf0[1], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], -cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[16], bf0[2], cospi[48], bf0[3], cos_bit);

  // stage 3
  bf0 = step;
  bf1 = output;
  bf1[0] =bf0[0] + bf0[3];
  bf1[1] =bf0[1] + bf0[2];
  bf1[2] =bf0[1] - bf0[2];
  bf1[3] =bf0[0] - bf0[3];
}

void fpga_fdct4(int32_t *input, int32_t *output) {
    int32_t *bf0, *bf1;
    int32_t step[4];

    // Stage 1
    bf1 = step;
    bf1[0] = input[0] + input[3];
    bf1[1] = input[1] + input[2];
    bf1[2] = input[0] - input[3];
    bf1[3] = input[1] - input[2];
    
    // Stage 2
    bf0 = output;
    bf0[0] = bf1[0] + bf1[1];
    bf0[1] = bf1[3] + bf1[2]>>1;
    bf0[2] = bf1[0] - bf1[1];
    bf0[3] = bf1[3]>>1 - bf1[2];   
}


void av1_fdct8(int32_t *input, int32_t *output) {
  const int32_t size = 8;
  const int32_t *cospi;
  int8_t cos_bit = 13;

  int32_t *bf0, *bf1;
  int32_t step[8];

  // stage 1;
  bf1 = output;
  bf1[0] = input[0] + input[7];
  bf1[1] = input[1] + input[6];
  bf1[2] = input[2] + input[5];
  bf1[3] = input[3] + input[4];
  bf1[4] = -input[4] + input[3];
  bf1[5] = -input[5] + input[2];
  bf1[6] = -input[6] + input[1];
  bf1[7] = -input[7] + input[0];

  // stage 2
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0] + bf0[3];
  bf1[1] = bf0[1] + bf0[2];
  bf1[2] = -bf0[2] + bf0[1];
  bf1[3] = -bf0[3] + bf0[0];
  bf1[4] = bf0[4];
  bf1[5] = half_btf(-cospi[32], bf0[5], cospi[32], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[32], bf0[6], cospi[32], bf0[5], cos_bit);
  bf1[7] = bf0[7];

  // stage 3
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(-cospi[32], bf0[1], cospi[32], bf0[0], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[48], bf0[3], -cospi[16], bf0[2], cos_bit);
  bf1[4] = bf0[4] + bf0[5];
  bf1[5] = -bf0[5] + bf0[4];
  bf1[6] = -bf0[6] + bf0[7];
  bf1[7] = bf0[7] + bf0[6];

  // stage 4
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = half_btf(cospi[56], bf0[4], cospi[8], bf0[7], cos_bit);
  bf1[5] = half_btf(cospi[24], bf0[5], cospi[40], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[24], bf0[6], -cospi[40], bf0[5], cos_bit);
  bf1[7] = half_btf(cospi[56], bf0[7], -cospi[8], bf0[4], cos_bit);

  // stage 5
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[4];
  bf1[2] = bf0[2];
  bf1[3] = bf0[6];
  bf1[4] = bf0[1];
  bf1[5] = bf0[5];
  bf1[6] = bf0[3];
  bf1[7] = bf0[7];
}

void av1_idct8(int32_t *input, int32_t *output) {
  int8_t cos_bit = 13;
  const int32_t size = 8;
  const int32_t *cospi = cospi_arr(cos_bit);

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[8];

  // stage 1;
  stage++;
  bf1 = output;
  bf1[0] = input[0];
  bf1[1] = input[4];
  bf1[2] = input[2];
  bf1[3] = input[6];
  bf1[4] = input[1];
  bf1[5] = input[5];
  bf1[6] = input[3];
  bf1[7] = input[7];

  // stage 2
  stage++;
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = half_btf(cospi[56], bf0[4], -cospi[8], bf0[7], cos_bit);
  bf1[5] = half_btf(cospi[24], bf0[5], -cospi[40], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[40], bf0[5], cospi[24], bf0[6], cos_bit);
  bf1[7] = half_btf(cospi[8], bf0[4], cospi[56], bf0[7], cos_bit);

  // stage 3
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(cospi[32], bf0[0], -cospi[32], bf0[1], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], -cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[16], bf0[2], cospi[48], bf0[3], cos_bit);
  bf1[4] = bf0[4] + bf0[5];
  bf1[5] = bf0[4] - bf0[5];
  bf1[6] = -bf0[6] + bf0[7];
  bf1[7] = bf0[6] + bf0[7];

  // stage 4
  stage++;
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0] + bf0[3];
  bf1[1] = bf0[1] + bf0[2];
  bf1[2] = bf0[1] - bf0[2];
  bf1[3] = bf0[0] - bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = half_btf(-cospi[32], bf0[5], cospi[32], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[32], bf0[5], cospi[32], bf0[6], cos_bit);
  bf1[7] = bf0[7];

  // stage 5
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[7];
  bf1[1] = bf0[1] + bf0[6];
  bf1[2] = bf0[2] + bf0[5];
  bf1[3] = bf0[3] + bf0[4];
  bf1[4] = bf0[3] - bf0[4];
  bf1[5] = bf0[2] - bf0[5];
  bf1[6] = bf0[1] - bf0[6];
  bf1[7] = bf0[0] - bf0[7];
}

void fpga_fdct8(int32_t *input, int32_t *output) {
    int32_t *bf0, *bf1;
    int32_t step[8];

    // Stage 1
    bf1 = output;
    bf1[0] = input[0] + input[7];
    bf1[1] = input[1] + input[6];
    bf1[2] = input[2] + input[5];
    bf1[3] = input[3] + input[4];
    bf1[4] = input[0] - input[7];
    bf1[5] = input[1] - input[6];
    bf1[6] = input[2] - input[5];
    bf1[7] = input[3] - input[4];

    // Stage 2
    bf0 = step;
    bf0[0] = bf1[0] + bf1[3];
    bf0[1] = bf1[1] + bf1[2];
    bf0[2] = bf1[0] - bf1[3];
    bf0[3] = bf1[1] - bf1[2];
    bf0[4] = bf1[5] + bf1[6] + ((bf1[4]>>1)+bf1[4]);
    bf0[5] = bf1[4] - bf1[7] - ((bf1[6]>>1)+bf1[6]);
    bf0[6] = bf1[4] + bf1[7] - ((bf1[5]>>1)+bf1[5]);
    bf0[7] = bf1[5] - bf1[6] + ((bf1[7]>>1)+bf1[7]);

    // Stage 3
    bf1[0] = bf0[0] + bf0[1];
    bf1[2] = bf0[2] + (bf0[3]>>1);
    bf1[4] = bf0[0] - bf0[1];
    bf1[6] = (bf0[2]>>1) - bf0[3];
    bf1[1] = bf0[4] + (bf0[7]>>2);
    bf1[3] = bf0[5] + (bf0[6]>>2);
    bf1[5] = bf0[6] - (bf0[5]>>2);
    bf1[7] = -bf0[7] + (bf0[4]>>2);
}

void fpga_idct8(int32_t *input, int32_t *output) {
    int32_t *bf0, *bf1;
    int32_t step[8];

    // Stage 1
    bf1 = output;
    bf1[0] = input[0] + input[4];
    bf1[4] = input[0] - input[4];
    bf1[2] = (input[2]>>1) - input[6];
    bf1[6] = (input[2]>>1) + input[6];
    bf1[1] = input[5] - input[3] - input[7] - input[7]>>1;
    bf1[3] = input[7] + input[1] - input[3] - input[3]>>1;
    bf1[5] = input[7] - input[1] + input[5] + input[5]>>1;
    bf1[7] = input[3] + input[5] + input[1] + input[1]>>1;

    // Stage 2
    bf0 = step;
    bf0[0] = bf1[0] + bf1[6];
    bf0[2] = bf1[4] + bf1[2];
    bf0[4] = bf1[4] - bf1[2];
    bf0[6] = bf1[0] - bf1[6];
    bf0[1] = bf1[1] + bf1[7]>>2;
    bf0[7] = bf1[7] - bf1[1]>>2;
    bf0[3] = bf1[3] + bf1[5]>>2;
    bf0[5] = bf1[3]>>2 - bf1[5];

    // Stage 3
    bf1[0] = bf0[0] + bf0[7];
    bf1[1] = bf0[2] + bf0[5];
    bf1[2] = bf0[4] + bf0[3];
    bf1[3] = bf0[6] + bf0[1];
    bf1[4] = bf0[6] - bf0[1];
    bf1[5] = bf0[4] - bf0[3];
    bf1[6] = bf0[2] - bf0[5];
    bf1[7] = bf0[0] - bf0[7];
}

void inttest_fdct8(int32_t *input, int32_t *output) {
  int32_t *bf0, *bf1;

  output[0] = input[0] +
              input[1] +
              input[2] +
              input[3] +
              input[4] +
              input[5] +
              input[6] +
              input[7];

  output[1] =  input[0]*11/8 
             + input[1]*9/8
             + input[2]*6/8
             + input[3]*2/8
             - input[4]*2/8
             - input[5]*6/8
             - input[6]*9/8
             - input[7]*11/8;
  
  output[2] =  input[0]*10/8 
             + input[1]*4/8
             - input[2]*4/8
             - input[3]*10/8
             - input[4]*10/8
             - input[5]*4/8
             + input[6]*4/8
             + input[7]*10/8;

  output[3] =  input[0]*9/8 
             - input[1]*2/8
             - input[2]*11/8
             - input[3]*6/8
             + input[4]*6/8
             + input[5]*11/8
             + input[6]*2/8
             - input[7]*9/8;

  output[4] =  input[0]*8/8 
             - input[1]*8/8
             - input[2]*8/8
             + input[3]*8/8
             + input[4]*8/8
             - input[5]*8/8
             - input[6]*8/8
             + input[7]*8/8;

  output[5] =  input[0]*6/8 
             - input[1]*11/8
             + input[2]*2/8
             + input[3]*9/8
             - input[4]*9/8
             - input[5]*2/8
             + input[6]*11/8
             - input[7]*6/8;             

  output[6] =  input[0]*4/8 
             - input[1]*10/8
             + input[2]*10/8
             - input[3]*4/8
             - input[4]*4/8
             + input[5]*10/8
             - input[6]*10/8
             + input[7]*4/8;

  output[7] =  input[0]*2/8 
             - input[1]*6/8
             + input[2]*9/8
             - input[3]*11/8
             + input[4]*11/8
             - input[5]*9/8
             + input[6]*6/8
             - input[7]*2/8;                        
}