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

void av1_fdct8(int32_t *input, int32_t *output) {
  const int32_t size = 8;
  const int32_t *cospi;
  int8_t cos_bit = 13;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[8];

  // stage 1;
  stage++;
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
  stage++;
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
  stage++;
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
  stage++;
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
  stage++;
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
    bf1[2] = (input[2]>>1) + input[6];
    bf1[1] = input[5] - input[3] - input[7] - input[7]>>1;
    bf1[3] = input[7] + input[1] - input[3] - input[3]>>1;
    bf1[5] = input[7] + input[5] + input[1] + input[5]>>1;
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
