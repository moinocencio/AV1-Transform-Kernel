/*
 * Copyright (c) 2016, Alliance for Open Media. All rights reserved
 *
 * This source code is subject to the terms of the BSD 2 Clause License and
 * the Alliance for Open Media Patent License 1.0. If the BSD 2 Clause License
 * was not distributed with this source code in the LICENSE file, you can
 * obtain it at www.aomedia.org/license/software. If the Alliance for Open
 * Media Patent License 1.0 was not distributed with this source code in the
 * PATENTS file, you can obtain it at www.aomedia.org/license/patent.
 */

#include <stdlib.h>
#include "av1/encoder/av1_fwd_txfm1d.h"

#if CONFIG_COEFFICIENT_RANGE_CHECKING
void range_check_func(int32_t stage, const int32_t *input, const int32_t *buf,
                      int32_t size, int8_t bit);

#define range_check(stage, input, buf, size, bit) \
  range_check_func(stage, input, buf, size, bit)
#else  // CONFIG_COEFFICIENT_RANGE_CHECKING

#define range_check(stage, input, buf, size, bit) \
  {                                               \
    (void)stage;                                  \
    (void)input;                                  \
    (void)buf;                                    \
    (void)size;                                   \
    (void)bit;                                    \
  }
#endif  // CONFIG_COEFFICIENT_RANGE_CHECKING

void av1_fdct4_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                   const int8_t *stage_range) {
  /*                    
  const int32_t size = 4;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[4];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

  // stage 1;
  stage++;
  bf1 = output;
  bf1[0] = input[0] + input[3];
  bf1[1] = input[1] + input[2];
  bf1[2] = -input[2] + input[1];
  bf1[3] = -input[3] + input[0];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 2
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(-cospi[32], bf0[1], cospi[32], bf0[0], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[48], bf0[3], -cospi[16], bf0[2], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 3
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[2];
  bf1[2] = bf0[1];
  bf1[3] = bf0[3];
  range_check(stage, input, bf1, size, stage_range[stage]);
  */
  output[0] =  ((512 * input[0])>>(10)) + ((512 * input[1])>>(10)) + ((512 * input[2])>>(10)) + ((512 * input[3])>>(10));
  output[1] =  ((669 * input[0])>>(10)) + ((277 * input[1])>>(10)) - ((277 * input[2])>>(10)) - ((669 * input[3])>>(10));
  output[2] =  ((512 * input[0])>>(10)) - ((512 * input[1])>>(10)) - ((512 * input[2])>>(10)) + ((512 * input[3])>>(10));
  output[3] =  ((277 * input[0])>>(10)) - ((669 * input[1])>>(10)) + ((669 * input[2])>>(10)) - ((277 * input[3])>>(10));
}

void av1_fdct8_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                   const int8_t *stage_range) {
  /*                     
  const int32_t size = 8;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[8];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

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
  range_check(stage, input, bf1, size, stage_range[stage]);

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
  range_check(stage, input, bf1, size, stage_range[stage]);

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
  range_check(stage, input, bf1, size, stage_range[stage]);

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
  range_check(stage, input, bf1, size, stage_range[stage]);

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
  range_check(stage, input, bf1, size, stage_range[stage]);
  */
  output[0] = ((362 * input[0])>>(10)) + ((362 * input[1])>>(10)) + ((362 * input[2])>>(10)) + ((362 * input[3])>>(10)) + ((362 * input[4])>>(10)) + ((362 * input[5])>>(10)) + ((362 * input[6])>>(10)) + ((362 * input[7])>>(10));
  output[1] = ((502 * input[0])>>(10)) + ((426 * input[1])>>(10)) + ((284 * input[2])>>(10)) + ((100 * input[3])>>(10)) - ((100 * input[4])>>(10)) - ((284 * input[5])>>(10)) - ((426 * input[6])>>(10)) - ((502 * input[7])>>(10));
  output[2] = ((473 * input[0])>>(10)) + ((196 * input[1])>>(10)) - ((196 * input[2])>>(10)) - ((473 * input[3])>>(10)) - ((473 * input[4])>>(10)) - ((196 * input[5])>>(10)) + ((196 * input[6])>>(10)) + ((473 * input[7])>>(10));
  output[3] = ((426 * input[0])>>(10)) - ((100 * input[1])>>(10)) - ((502 * input[2])>>(10)) - ((284 * input[3])>>(10)) + ((284 * input[4])>>(10)) + ((502 * input[5])>>(10)) + ((100 * input[6])>>(10)) - ((426 * input[7])>>(10));
  output[4] = ((362 * input[0])>>(10)) - ((362 * input[1])>>(10)) - ((362 * input[2])>>(10)) + ((362 * input[3])>>(10)) + ((362 * input[4])>>(10)) - ((362 * input[5])>>(10)) - ((362 * input[6])>>(10)) + ((362 * input[7])>>(10));
  output[5] = ((284 * input[0])>>(10)) - ((502 * input[1])>>(10)) + ((100 * input[2])>>(10)) + ((426 * input[3])>>(10)) - ((426 * input[4])>>(10)) - ((100 * input[5])>>(10)) + ((502 * input[6])>>(10)) - ((284 * input[7])>>(10));
  output[6] = ((196 * input[0])>>(10)) - ((473 * input[1])>>(10)) + ((473 * input[2])>>(10)) - ((196 * input[3])>>(10)) - ((196 * input[4])>>(10)) + ((473 * input[5])>>(10)) - ((473 * input[6])>>(10)) + ((196 * input[7])>>(10));
  output[7] = ((100 * input[0])>>(10)) - ((284 * input[1])>>(10)) + ((426 * input[2])>>(10)) - ((502 * input[3])>>(10)) + ((502 * input[4])>>(10)) - ((426 * input[5])>>(10)) + ((284 * input[6])>>(10)) - ((100 * input[7])>>(10));
}

void av1_fdct16_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                    const int8_t *stage_range) {
  /*
  const int32_t size = 16;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[16];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

  // stage 1;
  stage++;
  bf1 = output;
  bf1[0] = input[0] + input[15];
  bf1[1] = input[1] + input[14];
  bf1[2] = input[2] + input[13];
  bf1[3] = input[3] + input[12];
  bf1[4] = input[4] + input[11];
  bf1[5] = input[5] + input[10];
  bf1[6] = input[6] + input[9];
  bf1[7] = input[7] + input[8];
  bf1[8] = -input[8] + input[7];
  bf1[9] = -input[9] + input[6];
  bf1[10] = -input[10] + input[5];
  bf1[11] = -input[11] + input[4];
  bf1[12] = -input[12] + input[3];
  bf1[13] = -input[13] + input[2];
  bf1[14] = -input[14] + input[1];
  bf1[15] = -input[15] + input[0];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 2
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0] + bf0[7];
  bf1[1] = bf0[1] + bf0[6];
  bf1[2] = bf0[2] + bf0[5];
  bf1[3] = bf0[3] + bf0[4];
  bf1[4] = -bf0[4] + bf0[3];
  bf1[5] = -bf0[5] + bf0[2];
  bf1[6] = -bf0[6] + bf0[1];
  bf1[7] = -bf0[7] + bf0[0];
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = half_btf(-cospi[32], bf0[10], cospi[32], bf0[13], cos_bit);
  bf1[11] = half_btf(-cospi[32], bf0[11], cospi[32], bf0[12], cos_bit);
  bf1[12] = half_btf(cospi[32], bf0[12], cospi[32], bf0[11], cos_bit);
  bf1[13] = half_btf(cospi[32], bf0[13], cospi[32], bf0[10], cos_bit);
  bf1[14] = bf0[14];
  bf1[15] = bf0[15];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 3
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[3];
  bf1[1] = bf0[1] + bf0[2];
  bf1[2] = -bf0[2] + bf0[1];
  bf1[3] = -bf0[3] + bf0[0];
  bf1[4] = bf0[4];
  bf1[5] = half_btf(-cospi[32], bf0[5], cospi[32], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[32], bf0[6], cospi[32], bf0[5], cos_bit);
  bf1[7] = bf0[7];
  bf1[8] = bf0[8] + bf0[11];
  bf1[9] = bf0[9] + bf0[10];
  bf1[10] = -bf0[10] + bf0[9];
  bf1[11] = -bf0[11] + bf0[8];
  bf1[12] = -bf0[12] + bf0[15];
  bf1[13] = -bf0[13] + bf0[14];
  bf1[14] = bf0[14] + bf0[13];
  bf1[15] = bf0[15] + bf0[12];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 4
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(-cospi[32], bf0[1], cospi[32], bf0[0], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[48], bf0[3], -cospi[16], bf0[2], cos_bit);
  bf1[4] = bf0[4] + bf0[5];
  bf1[5] = -bf0[5] + bf0[4];
  bf1[6] = -bf0[6] + bf0[7];
  bf1[7] = bf0[7] + bf0[6];
  bf1[8] = bf0[8];
  bf1[9] = half_btf(-cospi[16], bf0[9], cospi[48], bf0[14], cos_bit);
  bf1[10] = half_btf(-cospi[48], bf0[10], -cospi[16], bf0[13], cos_bit);
  bf1[11] = bf0[11];
  bf1[12] = bf0[12];
  bf1[13] = half_btf(cospi[48], bf0[13], -cospi[16], bf0[10], cos_bit);
  bf1[14] = half_btf(cospi[16], bf0[14], cospi[48], bf0[9], cos_bit);
  bf1[15] = bf0[15];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 5
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = half_btf(cospi[56], bf0[4], cospi[8], bf0[7], cos_bit);
  bf1[5] = half_btf(cospi[24], bf0[5], cospi[40], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[24], bf0[6], -cospi[40], bf0[5], cos_bit);
  bf1[7] = half_btf(cospi[56], bf0[7], -cospi[8], bf0[4], cos_bit);
  bf1[8] = bf0[8] + bf0[9];
  bf1[9] = -bf0[9] + bf0[8];
  bf1[10] = -bf0[10] + bf0[11];
  bf1[11] = bf0[11] + bf0[10];
  bf1[12] = bf0[12] + bf0[13];
  bf1[13] = -bf0[13] + bf0[12];
  bf1[14] = -bf0[14] + bf0[15];
  bf1[15] = bf0[15] + bf0[14];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 6
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = half_btf(cospi[60], bf0[8], cospi[4], bf0[15], cos_bit);
  bf1[9] = half_btf(cospi[28], bf0[9], cospi[36], bf0[14], cos_bit);
  bf1[10] = half_btf(cospi[44], bf0[10], cospi[20], bf0[13], cos_bit);
  bf1[11] = half_btf(cospi[12], bf0[11], cospi[52], bf0[12], cos_bit);
  bf1[12] = half_btf(cospi[12], bf0[12], -cospi[52], bf0[11], cos_bit);
  bf1[13] = half_btf(cospi[44], bf0[13], -cospi[20], bf0[10], cos_bit);
  bf1[14] = half_btf(cospi[28], bf0[14], -cospi[36], bf0[9], cos_bit);
  bf1[15] = half_btf(cospi[60], bf0[15], -cospi[4], bf0[8], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 7
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[8];
  bf1[2] = bf0[4];
  bf1[3] = bf0[12];
  bf1[4] = bf0[2];
  bf1[5] = bf0[10];
  bf1[6] = bf0[6];
  bf1[7] = bf0[14];
  bf1[8] = bf0[1];
  bf1[9] = bf0[9];
  bf1[10] = bf0[5];
  bf1[11] = bf0[13];
  bf1[12] = bf0[3];
  bf1[13] = bf0[11];
  bf1[14] = bf0[7];
  bf1[15] = bf0[15];
  range_check(stage, input, bf1, size, stage_range[stage]);
  */
  output[0] = ((256 * input[0])>>(10)) + ((256 * input[1])>>(10)) + ((256 * input[2])>>(10)) + ((256 * input[3])>>(10)) + ((256 * input[4])>>(10)) + ((256 * input[5])>>(10)) + ((256 * input[6])>>(10)) + ((256 * input[7])>>(10)) + ((256 * input[8])>>(10)) + ((256 * input[9])>>(10)) + ((256 * input[10])>>(10)) + ((256 * input[11])>>(10)) + ((256 * input[12])>>(10)) + ((256 * input[13])>>(10)) + ((256 * input[14])>>(10)) + ((256 * input[15])>>(10));
  output[1] = ((360 * input[0])>>(10)) + ((346 * input[1])>>(10)) + ((319 * input[2])>>(10)) + ((280 * input[3])>>(10)) + ((230 * input[4])>>(10)) + ((171 * input[5])>>(10)) + ((105 * input[6])>>(10)) + ((35 * input[7])>>(10)) - ((35 * input[8])>>(10)) - ((105 * input[9])>>(10)) - ((171 * input[10])>>(10)) - ((230 * input[11])>>(10)) - ((280 * input[12])>>(10)) - ((319 * input[13])>>(10)) - ((346 * input[14])>>(10)) - ((360 * input[15])>>(10));
  output[2] = ((355 * input[0])>>(10)) + ((301 * input[1])>>(10)) + ((201 * input[2])>>(10)) + ((71 * input[3])>>(10)) - ((71 * input[4])>>(10)) - ((201 * input[5])>>(10)) - ((301 * input[6])>>(10)) - ((355 * input[7])>>(10)) - ((355 * input[8])>>(10)) - ((301 * input[9])>>(10)) - ((201 * input[10])>>(10)) - ((71 * input[11])>>(10)) + ((71 * input[12])>>(10)) + ((201 * input[13])>>(10)) + ((301 * input[14])>>(10)) + ((355 * input[15])>>(10));
  output[3] = ((346 * input[0])>>(10)) + ((230 * input[1])>>(10)) + ((35 * input[2])>>(10)) - ((171 * input[3])>>(10)) - ((319 * input[4])>>(10)) - ((360 * input[5])>>(10)) - ((280 * input[6])>>(10)) - ((105 * input[7])>>(10)) + ((105 * input[8])>>(10)) + ((280 * input[9])>>(10)) + ((360 * input[10])>>(10)) + ((319 * input[11])>>(10)) + ((171 * input[12])>>(10)) - ((35 * input[13])>>(10)) - ((230 * input[14])>>(10)) - ((346 * input[15])>>(10));
  output[4] = ((334 * input[0])>>(10)) + ((139 * input[1])>>(10)) - ((139 * input[2])>>(10)) - ((334 * input[3])>>(10)) - ((334 * input[4])>>(10)) - ((139 * input[5])>>(10)) + ((139 * input[6])>>(10)) + ((334 * input[7])>>(10)) + ((334 * input[8])>>(10)) + ((139 * input[9])>>(10)) - ((139 * input[10])>>(10)) - ((334 * input[11])>>(10)) - ((334 * input[12])>>(10)) - ((139 * input[13])>>(10)) + ((139 * input[14])>>(10)) + ((334 * input[15])>>(10));
  output[5] = ((319 * input[0])>>(10)) + ((35 * input[1])>>(10)) - ((280 * input[2])>>(10)) - ((346 * input[3])>>(10)) - ((105 * input[4])>>(10)) + ((230 * input[5])>>(10)) + ((360 * input[6])>>(10)) + ((171 * input[7])>>(10)) - ((171 * input[8])>>(10)) - ((360 * input[9])>>(10)) - ((230 * input[10])>>(10)) + ((105 * input[11])>>(10)) + ((346 * input[12])>>(10)) + ((280 * input[13])>>(10)) - ((35 * input[14])>>(10)) - ((319 * input[15])>>(10));
  output[6] = ((301 * input[0])>>(10)) - ((71 * input[1])>>(10)) - ((355 * input[2])>>(10)) - ((201 * input[3])>>(10)) + ((201 * input[4])>>(10)) + ((355 * input[5])>>(10)) + ((71 * input[6])>>(10)) - ((301 * input[7])>>(10)) - ((301 * input[8])>>(10)) + ((71 * input[9])>>(10)) + ((355 * input[10])>>(10)) + ((201 * input[11])>>(10)) - ((201 * input[12])>>(10)) - ((355 * input[13])>>(10)) - ((71 * input[14])>>(10)) + ((301 * input[15])>>(10));
  output[7] = ((280 * input[0])>>(10)) - ((171 * input[1])>>(10)) - ((346 * input[2])>>(10)) + ((35 * input[3])>>(10)) + ((360 * input[4])>>(10)) + ((105 * input[5])>>(10)) - ((319 * input[6])>>(10)) - ((230 * input[7])>>(10)) + ((230 * input[8])>>(10)) + ((319 * input[9])>>(10)) - ((105 * input[10])>>(10)) - ((360 * input[11])>>(10)) - ((35 * input[12])>>(10)) + ((346 * input[13])>>(10)) + ((171 * input[14])>>(10)) - ((280 * input[15])>>(10));
  output[8] = ((256 * input[0])>>(10)) - ((256 * input[1])>>(10)) - ((256 * input[2])>>(10)) + ((256 * input[3])>>(10)) + ((256 * input[4])>>(10)) - ((256 * input[5])>>(10)) - ((256 * input[6])>>(10)) + ((256 * input[7])>>(10)) + ((256 * input[8])>>(10)) - ((256 * input[9])>>(10)) - ((256 * input[10])>>(10)) + ((256 * input[11])>>(10)) + ((256 * input[12])>>(10)) - ((256 * input[13])>>(10)) - ((256 * input[14])>>(10)) + ((256 * input[15])>>(10));
  output[9] = ((230 * input[0])>>(10)) - ((319 * input[1])>>(10)) - ((105 * input[2])>>(10)) + ((360 * input[3])>>(10)) - ((35 * input[4])>>(10)) - ((346 * input[5])>>(10)) + ((171 * input[6])>>(10)) + ((280 * input[7])>>(10)) - ((280 * input[8])>>(10)) - ((171 * input[9])>>(10)) + ((346 * input[10])>>(10)) + ((35 * input[11])>>(10)) - ((360 * input[12])>>(10)) + ((105 * input[13])>>(10)) + ((319 * input[14])>>(10)) - ((230 * input[15])>>(10));
  output[10] = ((201 * input[0])>>(10)) - ((355 * input[1])>>(10)) + ((71 * input[2])>>(10)) + ((301 * input[3])>>(10)) - ((301 * input[4])>>(10)) - ((71 * input[5])>>(10)) + ((355 * input[6])>>(10)) - ((201 * input[7])>>(10)) - ((201 * input[8])>>(10)) + ((355 * input[9])>>(10)) - ((71 * input[10])>>(10)) - ((301 * input[11])>>(10)) + ((301 * input[12])>>(10)) + ((71 * input[13])>>(10)) - ((355 * input[14])>>(10)) + ((201 * input[15])>>(10));
  output[11] = ((171 * input[0])>>(10)) - ((360 * input[1])>>(10)) + ((230 * input[2])>>(10)) + ((105 * input[3])>>(10)) - ((346 * input[4])>>(10)) + ((280 * input[5])>>(10)) + ((35 * input[6])>>(10)) - ((319 * input[7])>>(10)) + ((319 * input[8])>>(10)) - ((35 * input[9])>>(10)) - ((280 * input[10])>>(10)) + ((346 * input[11])>>(10)) - ((105 * input[12])>>(10)) - ((230 * input[13])>>(10)) + ((360 * input[14])>>(10)) - ((171 * input[15])>>(10));
  output[12] = ((139 * input[0])>>(10)) - ((334 * input[1])>>(10)) + ((334 * input[2])>>(10)) - ((139 * input[3])>>(10)) - ((139 * input[4])>>(10)) + ((334 * input[5])>>(10)) - ((334 * input[6])>>(10)) + ((139 * input[7])>>(10)) + ((139 * input[8])>>(10)) - ((334 * input[9])>>(10)) + ((334 * input[10])>>(10)) - ((139 * input[11])>>(10)) - ((139 * input[12])>>(10)) + ((334 * input[13])>>(10)) - ((334 * input[14])>>(10)) + ((139 * input[15])>>(10));
  output[13] = ((105 * input[0])>>(10)) - ((280 * input[1])>>(10)) + ((360 * input[2])>>(10)) - ((319 * input[3])>>(10)) + ((171 * input[4])>>(10)) + ((35 * input[5])>>(10)) - ((230 * input[6])>>(10)) + ((346 * input[7])>>(10)) - ((346 * input[8])>>(10)) + ((230 * input[9])>>(10)) - ((35 * input[10])>>(10)) - ((171 * input[11])>>(10)) + ((319 * input[12])>>(10)) - ((360 * input[13])>>(10)) + ((280 * input[14])>>(10)) - ((105 * input[15])>>(10));
  output[14] = ((71 * input[0])>>(10)) - ((201 * input[1])>>(10)) + ((301 * input[2])>>(10)) - ((355 * input[3])>>(10)) + ((355 * input[4])>>(10)) - ((301 * input[5])>>(10)) + ((201 * input[6])>>(10)) - ((71 * input[7])>>(10)) - ((71 * input[8])>>(10)) + ((201 * input[9])>>(10)) - ((301 * input[10])>>(10)) + ((355 * input[11])>>(10)) - ((355 * input[12])>>(10)) + ((301 * input[13])>>(10)) - ((201 * input[14])>>(10)) + ((71 * input[15])>>(10));
  output[15] = ((35 * input[0])>>(10)) - ((105 * input[1])>>(10)) + ((171 * input[2])>>(10)) - ((230 * input[3])>>(10)) + ((280 * input[4])>>(10)) - ((319 * input[5])>>(10)) + ((346 * input[6])>>(10)) - ((360 * input[7])>>(10)) + ((360 * input[8])>>(10)) - ((346 * input[9])>>(10)) + ((319 * input[10])>>(10)) - ((280 * input[11])>>(10)) + ((230 * input[12])>>(10)) - ((171 * input[13])>>(10)) + ((105 * input[14])>>(10)) - ((35 * input[15])>>(10));
}

void av1_fdct32_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                    const int8_t *stage_range) {
  const int32_t size = 32;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[32];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

  // stage 1;
  stage++;
  bf1 = output;
  bf1[0] = input[0] + input[31];
  bf1[1] = input[1] + input[30];
  bf1[2] = input[2] + input[29];
  bf1[3] = input[3] + input[28];
  bf1[4] = input[4] + input[27];
  bf1[5] = input[5] + input[26];
  bf1[6] = input[6] + input[25];
  bf1[7] = input[7] + input[24];
  bf1[8] = input[8] + input[23];
  bf1[9] = input[9] + input[22];
  bf1[10] = input[10] + input[21];
  bf1[11] = input[11] + input[20];
  bf1[12] = input[12] + input[19];
  bf1[13] = input[13] + input[18];
  bf1[14] = input[14] + input[17];
  bf1[15] = input[15] + input[16];
  bf1[16] = -input[16] + input[15];
  bf1[17] = -input[17] + input[14];
  bf1[18] = -input[18] + input[13];
  bf1[19] = -input[19] + input[12];
  bf1[20] = -input[20] + input[11];
  bf1[21] = -input[21] + input[10];
  bf1[22] = -input[22] + input[9];
  bf1[23] = -input[23] + input[8];
  bf1[24] = -input[24] + input[7];
  bf1[25] = -input[25] + input[6];
  bf1[26] = -input[26] + input[5];
  bf1[27] = -input[27] + input[4];
  bf1[28] = -input[28] + input[3];
  bf1[29] = -input[29] + input[2];
  bf1[30] = -input[30] + input[1];
  bf1[31] = -input[31] + input[0];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 2
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0] + bf0[15];
  bf1[1] = bf0[1] + bf0[14];
  bf1[2] = bf0[2] + bf0[13];
  bf1[3] = bf0[3] + bf0[12];
  bf1[4] = bf0[4] + bf0[11];
  bf1[5] = bf0[5] + bf0[10];
  bf1[6] = bf0[6] + bf0[9];
  bf1[7] = bf0[7] + bf0[8];
  bf1[8] = -bf0[8] + bf0[7];
  bf1[9] = -bf0[9] + bf0[6];
  bf1[10] = -bf0[10] + bf0[5];
  bf1[11] = -bf0[11] + bf0[4];
  bf1[12] = -bf0[12] + bf0[3];
  bf1[13] = -bf0[13] + bf0[2];
  bf1[14] = -bf0[14] + bf0[1];
  bf1[15] = -bf0[15] + bf0[0];
  bf1[16] = bf0[16];
  bf1[17] = bf0[17];
  bf1[18] = bf0[18];
  bf1[19] = bf0[19];
  bf1[20] = half_btf(-cospi[32], bf0[20], cospi[32], bf0[27], cos_bit);
  bf1[21] = half_btf(-cospi[32], bf0[21], cospi[32], bf0[26], cos_bit);
  bf1[22] = half_btf(-cospi[32], bf0[22], cospi[32], bf0[25], cos_bit);
  bf1[23] = half_btf(-cospi[32], bf0[23], cospi[32], bf0[24], cos_bit);
  bf1[24] = half_btf(cospi[32], bf0[24], cospi[32], bf0[23], cos_bit);
  bf1[25] = half_btf(cospi[32], bf0[25], cospi[32], bf0[22], cos_bit);
  bf1[26] = half_btf(cospi[32], bf0[26], cospi[32], bf0[21], cos_bit);
  bf1[27] = half_btf(cospi[32], bf0[27], cospi[32], bf0[20], cos_bit);
  bf1[28] = bf0[28];
  bf1[29] = bf0[29];
  bf1[30] = bf0[30];
  bf1[31] = bf0[31];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 3
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[7];
  bf1[1] = bf0[1] + bf0[6];
  bf1[2] = bf0[2] + bf0[5];
  bf1[3] = bf0[3] + bf0[4];
  bf1[4] = -bf0[4] + bf0[3];
  bf1[5] = -bf0[5] + bf0[2];
  bf1[6] = -bf0[6] + bf0[1];
  bf1[7] = -bf0[7] + bf0[0];
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = half_btf(-cospi[32], bf0[10], cospi[32], bf0[13], cos_bit);
  bf1[11] = half_btf(-cospi[32], bf0[11], cospi[32], bf0[12], cos_bit);
  bf1[12] = half_btf(cospi[32], bf0[12], cospi[32], bf0[11], cos_bit);
  bf1[13] = half_btf(cospi[32], bf0[13], cospi[32], bf0[10], cos_bit);
  bf1[14] = bf0[14];
  bf1[15] = bf0[15];
  bf1[16] = bf0[16] + bf0[23];
  bf1[17] = bf0[17] + bf0[22];
  bf1[18] = bf0[18] + bf0[21];
  bf1[19] = bf0[19] + bf0[20];
  bf1[20] = -bf0[20] + bf0[19];
  bf1[21] = -bf0[21] + bf0[18];
  bf1[22] = -bf0[22] + bf0[17];
  bf1[23] = -bf0[23] + bf0[16];
  bf1[24] = -bf0[24] + bf0[31];
  bf1[25] = -bf0[25] + bf0[30];
  bf1[26] = -bf0[26] + bf0[29];
  bf1[27] = -bf0[27] + bf0[28];
  bf1[28] = bf0[28] + bf0[27];
  bf1[29] = bf0[29] + bf0[26];
  bf1[30] = bf0[30] + bf0[25];
  bf1[31] = bf0[31] + bf0[24];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 4
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
  bf1[8] = bf0[8] + bf0[11];
  bf1[9] = bf0[9] + bf0[10];
  bf1[10] = -bf0[10] + bf0[9];
  bf1[11] = -bf0[11] + bf0[8];
  bf1[12] = -bf0[12] + bf0[15];
  bf1[13] = -bf0[13] + bf0[14];
  bf1[14] = bf0[14] + bf0[13];
  bf1[15] = bf0[15] + bf0[12];
  bf1[16] = bf0[16];
  bf1[17] = bf0[17];
  bf1[18] = half_btf(-cospi[16], bf0[18], cospi[48], bf0[29], cos_bit);
  bf1[19] = half_btf(-cospi[16], bf0[19], cospi[48], bf0[28], cos_bit);
  bf1[20] = half_btf(-cospi[48], bf0[20], -cospi[16], bf0[27], cos_bit);
  bf1[21] = half_btf(-cospi[48], bf0[21], -cospi[16], bf0[26], cos_bit);
  bf1[22] = bf0[22];
  bf1[23] = bf0[23];
  bf1[24] = bf0[24];
  bf1[25] = bf0[25];
  bf1[26] = half_btf(cospi[48], bf0[26], -cospi[16], bf0[21], cos_bit);
  bf1[27] = half_btf(cospi[48], bf0[27], -cospi[16], bf0[20], cos_bit);
  bf1[28] = half_btf(cospi[16], bf0[28], cospi[48], bf0[19], cos_bit);
  bf1[29] = half_btf(cospi[16], bf0[29], cospi[48], bf0[18], cos_bit);
  bf1[30] = bf0[30];
  bf1[31] = bf0[31];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 5
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
  bf1[8] = bf0[8];
  bf1[9] = half_btf(-cospi[16], bf0[9], cospi[48], bf0[14], cos_bit);
  bf1[10] = half_btf(-cospi[48], bf0[10], -cospi[16], bf0[13], cos_bit);
  bf1[11] = bf0[11];
  bf1[12] = bf0[12];
  bf1[13] = half_btf(cospi[48], bf0[13], -cospi[16], bf0[10], cos_bit);
  bf1[14] = half_btf(cospi[16], bf0[14], cospi[48], bf0[9], cos_bit);
  bf1[15] = bf0[15];
  bf1[16] = bf0[16] + bf0[19];
  bf1[17] = bf0[17] + bf0[18];
  bf1[18] = -bf0[18] + bf0[17];
  bf1[19] = -bf0[19] + bf0[16];
  bf1[20] = -bf0[20] + bf0[23];
  bf1[21] = -bf0[21] + bf0[22];
  bf1[22] = bf0[22] + bf0[21];
  bf1[23] = bf0[23] + bf0[20];
  bf1[24] = bf0[24] + bf0[27];
  bf1[25] = bf0[25] + bf0[26];
  bf1[26] = -bf0[26] + bf0[25];
  bf1[27] = -bf0[27] + bf0[24];
  bf1[28] = -bf0[28] + bf0[31];
  bf1[29] = -bf0[29] + bf0[30];
  bf1[30] = bf0[30] + bf0[29];
  bf1[31] = bf0[31] + bf0[28];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 6
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
  bf1[8] = bf0[8] + bf0[9];
  bf1[9] = -bf0[9] + bf0[8];
  bf1[10] = -bf0[10] + bf0[11];
  bf1[11] = bf0[11] + bf0[10];
  bf1[12] = bf0[12] + bf0[13];
  bf1[13] = -bf0[13] + bf0[12];
  bf1[14] = -bf0[14] + bf0[15];
  bf1[15] = bf0[15] + bf0[14];
  bf1[16] = bf0[16];
  bf1[17] = half_btf(-cospi[8], bf0[17], cospi[56], bf0[30], cos_bit);
  bf1[18] = half_btf(-cospi[56], bf0[18], -cospi[8], bf0[29], cos_bit);
  bf1[19] = bf0[19];
  bf1[20] = bf0[20];
  bf1[21] = half_btf(-cospi[40], bf0[21], cospi[24], bf0[26], cos_bit);
  bf1[22] = half_btf(-cospi[24], bf0[22], -cospi[40], bf0[25], cos_bit);
  bf1[23] = bf0[23];
  bf1[24] = bf0[24];
  bf1[25] = half_btf(cospi[24], bf0[25], -cospi[40], bf0[22], cos_bit);
  bf1[26] = half_btf(cospi[40], bf0[26], cospi[24], bf0[21], cos_bit);
  bf1[27] = bf0[27];
  bf1[28] = bf0[28];
  bf1[29] = half_btf(cospi[56], bf0[29], -cospi[8], bf0[18], cos_bit);
  bf1[30] = half_btf(cospi[8], bf0[30], cospi[56], bf0[17], cos_bit);
  bf1[31] = bf0[31];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 7
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = half_btf(cospi[60], bf0[8], cospi[4], bf0[15], cos_bit);
  bf1[9] = half_btf(cospi[28], bf0[9], cospi[36], bf0[14], cos_bit);
  bf1[10] = half_btf(cospi[44], bf0[10], cospi[20], bf0[13], cos_bit);
  bf1[11] = half_btf(cospi[12], bf0[11], cospi[52], bf0[12], cos_bit);
  bf1[12] = half_btf(cospi[12], bf0[12], -cospi[52], bf0[11], cos_bit);
  bf1[13] = half_btf(cospi[44], bf0[13], -cospi[20], bf0[10], cos_bit);
  bf1[14] = half_btf(cospi[28], bf0[14], -cospi[36], bf0[9], cos_bit);
  bf1[15] = half_btf(cospi[60], bf0[15], -cospi[4], bf0[8], cos_bit);
  bf1[16] = bf0[16] + bf0[17];
  bf1[17] = -bf0[17] + bf0[16];
  bf1[18] = -bf0[18] + bf0[19];
  bf1[19] = bf0[19] + bf0[18];
  bf1[20] = bf0[20] + bf0[21];
  bf1[21] = -bf0[21] + bf0[20];
  bf1[22] = -bf0[22] + bf0[23];
  bf1[23] = bf0[23] + bf0[22];
  bf1[24] = bf0[24] + bf0[25];
  bf1[25] = -bf0[25] + bf0[24];
  bf1[26] = -bf0[26] + bf0[27];
  bf1[27] = bf0[27] + bf0[26];
  bf1[28] = bf0[28] + bf0[29];
  bf1[29] = -bf0[29] + bf0[28];
  bf1[30] = -bf0[30] + bf0[31];
  bf1[31] = bf0[31] + bf0[30];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 8
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = bf0[10];
  bf1[11] = bf0[11];
  bf1[12] = bf0[12];
  bf1[13] = bf0[13];
  bf1[14] = bf0[14];
  bf1[15] = bf0[15];
  bf1[16] = half_btf(cospi[62], bf0[16], cospi[2], bf0[31], cos_bit);
  bf1[17] = half_btf(cospi[30], bf0[17], cospi[34], bf0[30], cos_bit);
  bf1[18] = half_btf(cospi[46], bf0[18], cospi[18], bf0[29], cos_bit);
  bf1[19] = half_btf(cospi[14], bf0[19], cospi[50], bf0[28], cos_bit);
  bf1[20] = half_btf(cospi[54], bf0[20], cospi[10], bf0[27], cos_bit);
  bf1[21] = half_btf(cospi[22], bf0[21], cospi[42], bf0[26], cos_bit);
  bf1[22] = half_btf(cospi[38], bf0[22], cospi[26], bf0[25], cos_bit);
  bf1[23] = half_btf(cospi[6], bf0[23], cospi[58], bf0[24], cos_bit);
  bf1[24] = half_btf(cospi[6], bf0[24], -cospi[58], bf0[23], cos_bit);
  bf1[25] = half_btf(cospi[38], bf0[25], -cospi[26], bf0[22], cos_bit);
  bf1[26] = half_btf(cospi[22], bf0[26], -cospi[42], bf0[21], cos_bit);
  bf1[27] = half_btf(cospi[54], bf0[27], -cospi[10], bf0[20], cos_bit);
  bf1[28] = half_btf(cospi[14], bf0[28], -cospi[50], bf0[19], cos_bit);
  bf1[29] = half_btf(cospi[46], bf0[29], -cospi[18], bf0[18], cos_bit);
  bf1[30] = half_btf(cospi[30], bf0[30], -cospi[34], bf0[17], cos_bit);
  bf1[31] = half_btf(cospi[62], bf0[31], -cospi[2], bf0[16], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 9
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[16];
  bf1[2] = bf0[8];
  bf1[3] = bf0[24];
  bf1[4] = bf0[4];
  bf1[5] = bf0[20];
  bf1[6] = bf0[12];
  bf1[7] = bf0[28];
  bf1[8] = bf0[2];
  bf1[9] = bf0[18];
  bf1[10] = bf0[10];
  bf1[11] = bf0[26];
  bf1[12] = bf0[6];
  bf1[13] = bf0[22];
  bf1[14] = bf0[14];
  bf1[15] = bf0[30];
  bf1[16] = bf0[1];
  bf1[17] = bf0[17];
  bf1[18] = bf0[9];
  bf1[19] = bf0[25];
  bf1[20] = bf0[5];
  bf1[21] = bf0[21];
  bf1[22] = bf0[13];
  bf1[23] = bf0[29];
  bf1[24] = bf0[3];
  bf1[25] = bf0[19];
  bf1[26] = bf0[11];
  bf1[27] = bf0[27];
  bf1[28] = bf0[7];
  bf1[29] = bf0[23];
  bf1[30] = bf0[15];
  bf1[31] = bf0[31];
  range_check(stage, input, bf1, size, stage_range[stage]);
  /*  
  output[0] = ((181 * input[0])>>(10)) + ((181 * input[1])>>(10)) + ((181 * input[2])>>(10)) + ((181 * input[3])>>(10)) + ((181 * input[4])>>(10)) + ((181 * input[5])>>(10)) + ((181 * input[6])>>(10)) + ((181 * input[7])>>(10)) + ((181 * input[8])>>(10)) + ((181 * input[9])>>(10)) + ((181 * input[10])>>(10)) + ((181 * input[11])>>(10)) + ((181 * input[12])>>(10)) + ((181 * input[13])>>(10)) + ((181 * input[14])>>(10)) + ((181 * input[15])>>(10)) + ((181 * input[16])>>(10)) + ((181 * input[17])>>(10)) + ((181 * input[18])>>(10)) + ((181 * input[19])>>(10)) + ((181 * input[20])>>(10)) + ((181 * input[21])>>(10)) + ((181 * input[22])>>(10)) + ((181 * input[23])>>(10)) + ((181 * input[24])>>(10)) + ((181 * input[25])>>(10)) + ((181 * input[26])>>(10)) + ((181 * input[27])>>(10)) + ((181 * input[28])>>(10)) + ((181 * input[29])>>(10)) + ((181 * input[30])>>(10)) + ((181 * input[31])>>(10));
  output[1] = ((256 * input[0])>>(10)) + ((253 * input[1])>>(10)) + ((248 * input[2])>>(10)) + ((241 * input[3])>>(10)) + ((231 * input[4])>>(10)) + ((220 * input[5])>>(10)) + ((206 * input[6])>>(10)) + ((190 * input[7])>>(10)) + ((172 * input[8])>>(10)) + ((152 * input[9])>>(10)) + ((132 * input[10])>>(10)) + ((109 * input[11])>>(10)) + ((86 * input[12])>>(10)) + ((62 * input[13])>>(10)) + ((38 * input[14])>>(10)) + ((13 * input[15])>>(10)) - ((13 * input[16])>>(10)) - ((38 * input[17])>>(10)) - ((62 * input[18])>>(10)) - ((86 * input[19])>>(10)) - ((109 * input[20])>>(10)) - ((132 * input[21])>>(10)) - ((152 * input[22])>>(10)) - ((172 * input[23])>>(10)) - ((190 * input[24])>>(10)) - ((206 * input[25])>>(10)) - ((220 * input[26])>>(10)) - ((231 * input[27])>>(10)) - ((241 * input[28])>>(10)) - ((248 * input[29])>>(10)) - ((253 * input[30])>>(10)) - ((256 * input[31])>>(10));
  output[2] = ((255 * input[0])>>(10)) + ((245 * input[1])>>(10)) + ((226 * input[2])>>(10)) + ((198 * input[3])>>(10)) + ((162 * input[4])>>(10)) + ((121 * input[5])>>(10)) + ((74 * input[6])>>(10)) + ((25 * input[7])>>(10)) - ((25 * input[8])>>(10)) - ((74 * input[9])>>(10)) - ((121 * input[10])>>(10)) - ((162 * input[11])>>(10)) - ((198 * input[12])>>(10)) - ((226 * input[13])>>(10)) - ((245 * input[14])>>(10)) - ((255 * input[15])>>(10)) - ((255 * input[16])>>(10)) - ((245 * input[17])>>(10)) - ((226 * input[18])>>(10)) - ((198 * input[19])>>(10)) - ((162 * input[20])>>(10)) - ((121 * input[21])>>(10)) - ((74 * input[22])>>(10)) - ((25 * input[23])>>(10)) + ((25 * input[24])>>(10)) + ((74 * input[25])>>(10)) + ((121 * input[26])>>(10)) + ((162 * input[27])>>(10)) + ((198 * input[28])>>(10)) + ((226 * input[29])>>(10)) + ((245 * input[30])>>(10)) + ((255 * input[31])>>(10));
  output[3] = ((253 * input[0])>>(10)) + ((231 * input[1])>>(10)) + ((190 * input[2])>>(10)) + ((132 * input[3])>>(10)) + ((62 * input[4])>>(10)) - ((13 * input[5])>>(10)) - ((86 * input[6])>>(10)) - ((152 * input[7])>>(10)) - ((206 * input[8])>>(10)) - ((241 * input[9])>>(10)) - ((256 * input[10])>>(10)) - ((248 * input[11])>>(10)) - ((220 * input[12])>>(10)) - ((172 * input[13])>>(10)) - ((109 * input[14])>>(10)) - ((38 * input[15])>>(10)) + ((38 * input[16])>>(10)) + ((109 * input[17])>>(10)) + ((172 * input[18])>>(10)) + ((220 * input[19])>>(10)) + ((248 * input[20])>>(10)) + ((256 * input[21])>>(10)) + ((241 * input[22])>>(10)) + ((206 * input[23])>>(10)) + ((152 * input[24])>>(10)) + ((86 * input[25])>>(10)) + ((13 * input[26])>>(10)) - ((62 * input[27])>>(10)) - ((132 * input[28])>>(10)) - ((190 * input[29])>>(10)) - ((231 * input[30])>>(10)) - ((253 * input[31])>>(10));
  output[4] = ((251 * input[0])>>(10)) + ((213 * input[1])>>(10)) + ((142 * input[2])>>(10)) + ((50 * input[3])>>(10)) - ((50 * input[4])>>(10)) - ((142 * input[5])>>(10)) - ((213 * input[6])>>(10)) - ((251 * input[7])>>(10)) - ((251 * input[8])>>(10)) - ((213 * input[9])>>(10)) - ((142 * input[10])>>(10)) - ((50 * input[11])>>(10)) + ((50 * input[12])>>(10)) + ((142 * input[13])>>(10)) + ((213 * input[14])>>(10)) + ((251 * input[15])>>(10)) + ((251 * input[16])>>(10)) + ((213 * input[17])>>(10)) + ((142 * input[18])>>(10)) + ((50 * input[19])>>(10)) - ((50 * input[20])>>(10)) - ((142 * input[21])>>(10)) - ((213 * input[22])>>(10)) - ((251 * input[23])>>(10)) - ((251 * input[24])>>(10)) - ((213 * input[25])>>(10)) - ((142 * input[26])>>(10)) - ((50 * input[27])>>(10)) + ((50 * input[28])>>(10)) + ((142 * input[29])>>(10)) + ((213 * input[30])>>(10)) + ((251 * input[31])>>(10));
  output[5] = ((248 * input[0])>>(10)) + ((190 * input[1])>>(10)) + ((86 * input[2])>>(10)) - ((38 * input[3])>>(10)) - ((152 * input[4])>>(10)) - ((231 * input[5])>>(10)) - ((256 * input[6])>>(10)) - ((220 * input[7])>>(10)) - ((132 * input[8])>>(10)) - ((13 * input[9])>>(10)) + ((109 * input[10])>>(10)) + ((206 * input[11])>>(10)) + ((253 * input[12])>>(10)) + ((241 * input[13])>>(10)) + ((172 * input[14])>>(10)) + ((62 * input[15])>>(10)) - ((62 * input[16])>>(10)) - ((172 * input[17])>>(10)) - ((241 * input[18])>>(10)) - ((253 * input[19])>>(10)) - ((206 * input[20])>>(10)) - ((109 * input[21])>>(10)) + ((13 * input[22])>>(10)) + ((132 * input[23])>>(10)) + ((220 * input[24])>>(10)) + ((256 * input[25])>>(10)) + ((231 * input[26])>>(10)) + ((152 * input[27])>>(10)) + ((38 * input[28])>>(10)) - ((86 * input[29])>>(10)) - ((190 * input[30])>>(10)) - ((248 * input[31])>>(10));
  output[6] = ((245 * input[0])>>(10)) + ((162 * input[1])>>(10)) + ((25 * input[2])>>(10)) - ((121 * input[3])>>(10)) - ((226 * input[4])>>(10)) - ((255 * input[5])>>(10)) - ((198 * input[6])>>(10)) - ((74 * input[7])>>(10)) + ((74 * input[8])>>(10)) + ((198 * input[9])>>(10)) + ((255 * input[10])>>(10)) + ((226 * input[11])>>(10)) + ((121 * input[12])>>(10)) - ((25 * input[13])>>(10)) - ((162 * input[14])>>(10)) - ((245 * input[15])>>(10)) - ((245 * input[16])>>(10)) - ((162 * input[17])>>(10)) - ((25 * input[18])>>(10)) + ((121 * input[19])>>(10)) + ((226 * input[20])>>(10)) + ((255 * input[21])>>(10)) + ((198 * input[22])>>(10)) + ((74 * input[23])>>(10)) - ((74 * input[24])>>(10)) - ((198 * input[25])>>(10)) - ((255 * input[26])>>(10)) - ((226 * input[27])>>(10)) - ((121 * input[28])>>(10)) + ((25 * input[29])>>(10)) + ((162 * input[30])>>(10)) + ((245 * input[31])>>(10));
  output[7] = ((241 * input[0])>>(10)) + ((132 * input[1])>>(10)) - ((38 * input[2])>>(10)) - ((190 * input[3])>>(10)) - ((256 * input[4])>>(10)) - ((206 * input[5])>>(10)) - ((62 * input[6])>>(10)) + ((109 * input[7])>>(10)) + ((231 * input[8])>>(10)) + ((248 * input[9])>>(10)) + ((152 * input[10])>>(10)) - ((13 * input[11])>>(10)) - ((172 * input[12])>>(10)) - ((253 * input[13])>>(10)) - ((220 * input[14])>>(10)) - ((86 * input[15])>>(10)) + ((86 * input[16])>>(10)) + ((220 * input[17])>>(10)) + ((253 * input[18])>>(10)) + ((172 * input[19])>>(10)) + ((13 * input[20])>>(10)) - ((152 * input[21])>>(10)) - ((248 * input[22])>>(10)) - ((231 * input[23])>>(10)) - ((109 * input[24])>>(10)) + ((62 * input[25])>>(10)) + ((206 * input[26])>>(10)) + ((256 * input[27])>>(10)) + ((190 * input[28])>>(10)) + ((38 * input[29])>>(10)) - ((132 * input[30])>>(10)) - ((241 * input[31])>>(10));
  output[8] = ((237 * input[0])>>(10)) + ((98 * input[1])>>(10)) - ((98 * input[2])>>(10)) - ((237 * input[3])>>(10)) - ((237 * input[4])>>(10)) - ((98 * input[5])>>(10)) + ((98 * input[6])>>(10)) + ((237 * input[7])>>(10)) + ((237 * input[8])>>(10)) + ((98 * input[9])>>(10)) - ((98 * input[10])>>(10)) - ((237 * input[11])>>(10)) - ((237 * input[12])>>(10)) - ((98 * input[13])>>(10)) + ((98 * input[14])>>(10)) + ((237 * input[15])>>(10)) + ((237 * input[16])>>(10)) + ((98 * input[17])>>(10)) - ((98 * input[18])>>(10)) - ((237 * input[19])>>(10)) - ((237 * input[20])>>(10)) - ((98 * input[21])>>(10)) + ((98 * input[22])>>(10)) + ((237 * input[23])>>(10)) + ((237 * input[24])>>(10)) + ((98 * input[25])>>(10)) - ((98 * input[26])>>(10)) - ((237 * input[27])>>(10)) - ((237 * input[28])>>(10)) - ((98 * input[29])>>(10)) + ((98 * input[30])>>(10)) + ((237 * input[31])>>(10));
  output[9] = ((231 * input[0])>>(10)) + ((62 * input[1])>>(10)) - ((152 * input[2])>>(10)) - ((256 * input[3])>>(10)) - ((172 * input[4])>>(10)) + ((38 * input[5])>>(10)) + ((220 * input[6])>>(10)) + ((241 * input[7])>>(10)) + ((86 * input[8])>>(10)) - ((132 * input[9])>>(10)) - ((253 * input[10])>>(10)) - ((190 * input[11])>>(10)) + ((13 * input[12])>>(10)) + ((206 * input[13])>>(10)) + ((248 * input[14])>>(10)) + ((109 * input[15])>>(10)) - ((109 * input[16])>>(10)) - ((248 * input[17])>>(10)) - ((206 * input[18])>>(10)) - ((13 * input[19])>>(10)) + ((190 * input[20])>>(10)) + ((253 * input[21])>>(10)) + ((132 * input[22])>>(10)) - ((86 * input[23])>>(10)) - ((241 * input[24])>>(10)) - ((220 * input[25])>>(10)) - ((38 * input[26])>>(10)) + ((172 * input[27])>>(10)) + ((256 * input[28])>>(10)) + ((152 * input[29])>>(10)) - ((62 * input[30])>>(10)) - ((231 * input[31])>>(10));
  output[10] = ((226 * input[0])>>(10)) + ((25 * input[1])>>(10)) - ((198 * input[2])>>(10)) - ((245 * input[3])>>(10)) - ((74 * input[4])>>(10)) + ((162 * input[5])>>(10)) + ((255 * input[6])>>(10)) + ((121 * input[7])>>(10)) - ((121 * input[8])>>(10)) - ((255 * input[9])>>(10)) - ((162 * input[10])>>(10)) + ((74 * input[11])>>(10)) + ((245 * input[12])>>(10)) + ((198 * input[13])>>(10)) - ((25 * input[14])>>(10)) - ((226 * input[15])>>(10)) - ((226 * input[16])>>(10)) - ((25 * input[17])>>(10)) + ((198 * input[18])>>(10)) + ((245 * input[19])>>(10)) + ((74 * input[20])>>(10)) - ((162 * input[21])>>(10)) - ((255 * input[22])>>(10)) - ((121 * input[23])>>(10)) + ((121 * input[24])>>(10)) + ((255 * input[25])>>(10)) + ((162 * input[26])>>(10)) - ((74 * input[27])>>(10)) - ((245 * input[28])>>(10)) - ((198 * input[29])>>(10)) + ((25 * input[30])>>(10)) + ((226 * input[31])>>(10));
  output[11] = ((220 * input[0])>>(10)) - ((13 * input[1])>>(10)) - ((231 * input[2])>>(10)) - ((206 * input[3])>>(10)) + ((38 * input[4])>>(10)) + ((241 * input[5])>>(10)) + ((190 * input[6])>>(10)) - ((62 * input[7])>>(10)) - ((248 * input[8])>>(10)) - ((172 * input[9])>>(10)) + ((86 * input[10])>>(10)) + ((253 * input[11])>>(10)) + ((152 * input[12])>>(10)) - ((109 * input[13])>>(10)) - ((256 * input[14])>>(10)) - ((132 * input[15])>>(10)) + ((132 * input[16])>>(10)) + ((256 * input[17])>>(10)) + ((109 * input[18])>>(10)) - ((152 * input[19])>>(10)) - ((253 * input[20])>>(10)) - ((86 * input[21])>>(10)) + ((172 * input[22])>>(10)) + ((248 * input[23])>>(10)) + ((62 * input[24])>>(10)) - ((190 * input[25])>>(10)) - ((241 * input[26])>>(10)) - ((38 * input[27])>>(10)) + ((206 * input[28])>>(10)) + ((231 * input[29])>>(10)) + ((13 * input[30])>>(10)) - ((220 * input[31])>>(10));
  output[12] = ((213 * input[0])>>(10)) - ((50 * input[1])>>(10)) - ((251 * input[2])>>(10)) - ((142 * input[3])>>(10)) + ((142 * input[4])>>(10)) + ((251 * input[5])>>(10)) + ((50 * input[6])>>(10)) - ((213 * input[7])>>(10)) - ((213 * input[8])>>(10)) + ((50 * input[9])>>(10)) + ((251 * input[10])>>(10)) + ((142 * input[11])>>(10)) - ((142 * input[12])>>(10)) - ((251 * input[13])>>(10)) - ((50 * input[14])>>(10)) + ((213 * input[15])>>(10)) + ((213 * input[16])>>(10)) - ((50 * input[17])>>(10)) - ((251 * input[18])>>(10)) - ((142 * input[19])>>(10)) + ((142 * input[20])>>(10)) + ((251 * input[21])>>(10)) + ((50 * input[22])>>(10)) - ((213 * input[23])>>(10)) - ((213 * input[24])>>(10)) + ((50 * input[25])>>(10)) + ((251 * input[26])>>(10)) + ((142 * input[27])>>(10)) - ((142 * input[28])>>(10)) - ((251 * input[29])>>(10)) - ((50 * input[30])>>(10)) + ((213 * input[31])>>(10));
  output[13] = ((206 * input[0])>>(10)) - ((86 * input[1])>>(10)) - ((256 * input[2])>>(10)) - ((62 * input[3])>>(10)) + ((220 * input[4])>>(10)) + ((190 * input[5])>>(10)) - ((109 * input[6])>>(10)) - ((253 * input[7])>>(10)) - ((38 * input[8])>>(10)) + ((231 * input[9])>>(10)) + ((172 * input[10])>>(10)) - ((132 * input[11])>>(10)) - ((248 * input[12])>>(10)) - ((13 * input[13])>>(10)) + ((241 * input[14])>>(10)) + ((152 * input[15])>>(10)) - ((152 * input[16])>>(10)) - ((241 * input[17])>>(10)) + ((13 * input[18])>>(10)) + ((248 * input[19])>>(10)) + ((132 * input[20])>>(10)) - ((172 * input[21])>>(10)) - ((231 * input[22])>>(10)) + ((38 * input[23])>>(10)) + ((253 * input[24])>>(10)) + ((109 * input[25])>>(10)) - ((190 * input[26])>>(10)) - ((220 * input[27])>>(10)) + ((62 * input[28])>>(10)) + ((256 * input[29])>>(10)) + ((86 * input[30])>>(10)) - ((206 * input[31])>>(10));
  output[14] = ((198 * input[0])>>(10)) - ((121 * input[1])>>(10)) - ((245 * input[2])>>(10)) + ((25 * input[3])>>(10)) + ((255 * input[4])>>(10)) + ((74 * input[5])>>(10)) - ((226 * input[6])>>(10)) - ((162 * input[7])>>(10)) + ((162 * input[8])>>(10)) + ((226 * input[9])>>(10)) - ((74 * input[10])>>(10)) - ((255 * input[11])>>(10)) - ((25 * input[12])>>(10)) + ((245 * input[13])>>(10)) + ((121 * input[14])>>(10)) - ((198 * input[15])>>(10)) - ((198 * input[16])>>(10)) + ((121 * input[17])>>(10)) + ((245 * input[18])>>(10)) - ((25 * input[19])>>(10)) - ((255 * input[20])>>(10)) - ((74 * input[21])>>(10)) + ((226 * input[22])>>(10)) + ((162 * input[23])>>(10)) - ((162 * input[24])>>(10)) - ((226 * input[25])>>(10)) + ((74 * input[26])>>(10)) + ((255 * input[27])>>(10)) + ((25 * input[28])>>(10)) - ((245 * input[29])>>(10)) - ((121 * input[30])>>(10)) + ((198 * input[31])>>(10));
  output[15] = ((190 * input[0])>>(10)) - ((152 * input[1])>>(10)) - ((220 * input[2])>>(10)) + ((109 * input[3])>>(10)) + ((241 * input[4])>>(10)) - ((62 * input[5])>>(10)) - ((253 * input[6])>>(10)) + ((13 * input[7])>>(10)) + ((256 * input[8])>>(10)) + ((38 * input[9])>>(10)) - ((248 * input[10])>>(10)) - ((86 * input[11])>>(10)) + ((231 * input[12])>>(10)) + ((132 * input[13])>>(10)) - ((206 * input[14])>>(10)) - ((172 * input[15])>>(10)) + ((172 * input[16])>>(10)) + ((206 * input[17])>>(10)) - ((132 * input[18])>>(10)) - ((231 * input[19])>>(10)) + ((86 * input[20])>>(10)) + ((248 * input[21])>>(10)) - ((38 * input[22])>>(10)) - ((256 * input[23])>>(10)) - ((13 * input[24])>>(10)) + ((253 * input[25])>>(10)) + ((62 * input[26])>>(10)) - ((241 * input[27])>>(10)) - ((109 * input[28])>>(10)) + ((220 * input[29])>>(10)) + ((152 * input[30])>>(10)) - ((190 * input[31])>>(10));
  output[16] = ((181 * input[0])>>(10)) - ((181 * input[1])>>(10)) - ((181 * input[2])>>(10)) + ((181 * input[3])>>(10)) + ((181 * input[4])>>(10)) - ((181 * input[5])>>(10)) - ((181 * input[6])>>(10)) + ((181 * input[7])>>(10)) + ((181 * input[8])>>(10)) - ((181 * input[9])>>(10)) - ((181 * input[10])>>(10)) + ((181 * input[11])>>(10)) + ((181 * input[12])>>(10)) - ((181 * input[13])>>(10)) - ((181 * input[14])>>(10)) + ((181 * input[15])>>(10)) + ((181 * input[16])>>(10)) - ((181 * input[17])>>(10)) - ((181 * input[18])>>(10)) + ((181 * input[19])>>(10)) + ((181 * input[20])>>(10)) - ((181 * input[21])>>(10)) - ((181 * input[22])>>(10)) + ((181 * input[23])>>(10)) + ((181 * input[24])>>(10)) - ((181 * input[25])>>(10)) - ((181 * input[26])>>(10)) + ((181 * input[27])>>(10)) + ((181 * input[28])>>(10)) - ((181 * input[29])>>(10)) - ((181 * input[30])>>(10)) + ((181 * input[31])>>(10));
  output[17] = ((172 * input[0])>>(10)) - ((206 * input[1])>>(10)) - ((132 * input[2])>>(10)) + ((231 * input[3])>>(10)) + ((86 * input[4])>>(10)) - ((248 * input[5])>>(10)) - ((38 * input[6])>>(10)) + ((256 * input[7])>>(10)) - ((13 * input[8])>>(10)) - ((253 * input[9])>>(10)) + ((62 * input[10])>>(10)) + ((241 * input[11])>>(10)) - ((109 * input[12])>>(10)) - ((220 * input[13])>>(10)) + ((152 * input[14])>>(10)) + ((190 * input[15])>>(10)) - ((190 * input[16])>>(10)) - ((152 * input[17])>>(10)) + ((220 * input[18])>>(10)) + ((109 * input[19])>>(10)) - ((241 * input[20])>>(10)) - ((62 * input[21])>>(10)) + ((253 * input[22])>>(10)) + ((13 * input[23])>>(10)) - ((256 * input[24])>>(10)) + ((38 * input[25])>>(10)) + ((248 * input[26])>>(10)) - ((86 * input[27])>>(10)) - ((231 * input[28])>>(10)) + ((132 * input[29])>>(10)) + ((206 * input[30])>>(10)) - ((172 * input[31])>>(10));
  output[18] = ((162 * input[0])>>(10)) - ((226 * input[1])>>(10)) - ((74 * input[2])>>(10)) + ((255 * input[3])>>(10)) - ((25 * input[4])>>(10)) - ((245 * input[5])>>(10)) + ((121 * input[6])>>(10)) + ((198 * input[7])>>(10)) - ((198 * input[8])>>(10)) - ((121 * input[9])>>(10)) + ((245 * input[10])>>(10)) + ((25 * input[11])>>(10)) - ((255 * input[12])>>(10)) + ((74 * input[13])>>(10)) + ((226 * input[14])>>(10)) - ((162 * input[15])>>(10)) - ((162 * input[16])>>(10)) + ((226 * input[17])>>(10)) + ((74 * input[18])>>(10)) - ((255 * input[19])>>(10)) + ((25 * input[20])>>(10)) + ((245 * input[21])>>(10)) - ((121 * input[22])>>(10)) - ((198 * input[23])>>(10)) + ((198 * input[24])>>(10)) + ((121 * input[25])>>(10)) - ((245 * input[26])>>(10)) - ((25 * input[27])>>(10)) + ((255 * input[28])>>(10)) - ((74 * input[29])>>(10)) - ((226 * input[30])>>(10)) + ((162 * input[31])>>(10));
  output[19] = ((152 * input[0])>>(10)) - ((241 * input[1])>>(10)) - ((13 * input[2])>>(10)) + ((248 * input[3])>>(10)) - ((132 * input[4])>>(10)) - ((172 * input[5])>>(10)) + ((231 * input[6])>>(10)) + ((38 * input[7])>>(10)) - ((253 * input[8])>>(10)) + ((109 * input[9])>>(10)) + ((190 * input[10])>>(10)) - ((220 * input[11])>>(10)) - ((62 * input[12])>>(10)) + ((256 * input[13])>>(10)) - ((86 * input[14])>>(10)) - ((206 * input[15])>>(10)) + ((206 * input[16])>>(10)) + ((86 * input[17])>>(10)) - ((256 * input[18])>>(10)) + ((62 * input[19])>>(10)) + ((220 * input[20])>>(10)) - ((190 * input[21])>>(10)) - ((109 * input[22])>>(10)) + ((253 * input[23])>>(10)) - ((38 * input[24])>>(10)) - ((231 * input[25])>>(10)) + ((172 * input[26])>>(10)) + ((132 * input[27])>>(10)) - ((248 * input[28])>>(10)) + ((13 * input[29])>>(10)) + ((241 * input[30])>>(10)) - ((152 * input[31])>>(10));
  output[20] = ((142 * input[0])>>(10)) - ((251 * input[1])>>(10)) + ((50 * input[2])>>(10)) + ((213 * input[3])>>(10)) - ((213 * input[4])>>(10)) - ((50 * input[5])>>(10)) + ((251 * input[6])>>(10)) - ((142 * input[7])>>(10)) - ((142 * input[8])>>(10)) + ((251 * input[9])>>(10)) - ((50 * input[10])>>(10)) - ((213 * input[11])>>(10)) + ((213 * input[12])>>(10)) + ((50 * input[13])>>(10)) - ((251 * input[14])>>(10)) + ((142 * input[15])>>(10)) + ((142 * input[16])>>(10)) - ((251 * input[17])>>(10)) + ((50 * input[18])>>(10)) + ((213 * input[19])>>(10)) - ((213 * input[20])>>(10)) - ((50 * input[21])>>(10)) + ((251 * input[22])>>(10)) - ((142 * input[23])>>(10)) - ((142 * input[24])>>(10)) + ((251 * input[25])>>(10)) - ((50 * input[26])>>(10)) - ((213 * input[27])>>(10)) + ((213 * input[28])>>(10)) + ((50 * input[29])>>(10)) - ((251 * input[30])>>(10)) + ((142 * input[31])>>(10));
  output[21] = ((132 * input[0])>>(10)) - ((256 * input[1])>>(10)) + ((109 * input[2])>>(10)) + ((152 * input[3])>>(10)) - ((253 * input[4])>>(10)) + ((86 * input[5])>>(10)) + ((172 * input[6])>>(10)) - ((248 * input[7])>>(10)) + ((62 * input[8])>>(10)) + ((190 * input[9])>>(10)) - ((241 * input[10])>>(10)) + ((38 * input[11])>>(10)) + ((206 * input[12])>>(10)) - ((231 * input[13])>>(10)) + ((13 * input[14])>>(10)) + ((220 * input[15])>>(10)) - ((220 * input[16])>>(10)) - ((13 * input[17])>>(10)) + ((231 * input[18])>>(10)) - ((206 * input[19])>>(10)) - ((38 * input[20])>>(10)) + ((241 * input[21])>>(10)) - ((190 * input[22])>>(10)) - ((62 * input[23])>>(10)) + ((248 * input[24])>>(10)) - ((172 * input[25])>>(10)) - ((86 * input[26])>>(10)) + ((253 * input[27])>>(10)) - ((152 * input[28])>>(10)) - ((109 * input[29])>>(10)) + ((256 * input[30])>>(10)) - ((132 * input[31])>>(10));
  output[22] = ((121 * input[0])>>(10)) - ((255 * input[1])>>(10)) + ((162 * input[2])>>(10)) + ((74 * input[3])>>(10)) - ((245 * input[4])>>(10)) + ((198 * input[5])>>(10)) + ((25 * input[6])>>(10)) - ((226 * input[7])>>(10)) + ((226 * input[8])>>(10)) - ((25 * input[9])>>(10)) - ((198 * input[10])>>(10)) + ((245 * input[11])>>(10)) - ((74 * input[12])>>(10)) - ((162 * input[13])>>(10)) + ((255 * input[14])>>(10)) - ((121 * input[15])>>(10)) - ((121 * input[16])>>(10)) + ((255 * input[17])>>(10)) - ((162 * input[18])>>(10)) - ((74 * input[19])>>(10)) + ((245 * input[20])>>(10)) - ((198 * input[21])>>(10)) - ((25 * input[22])>>(10)) + ((226 * input[23])>>(10)) - ((226 * input[24])>>(10)) + ((25 * input[25])>>(10)) + ((198 * input[26])>>(10)) - ((245 * input[27])>>(10)) + ((74 * input[28])>>(10)) + ((162 * input[29])>>(10)) - ((255 * input[30])>>(10)) + ((121 * input[31])>>(10));
  output[23] = ((109 * input[0])>>(10)) - ((248 * input[1])>>(10)) + ((206 * input[2])>>(10)) - ((13 * input[3])>>(10)) - ((190 * input[4])>>(10)) + ((253 * input[5])>>(10)) - ((132 * input[6])>>(10)) - ((86 * input[7])>>(10)) + ((241 * input[8])>>(10)) - ((220 * input[9])>>(10)) + ((38 * input[10])>>(10)) + ((172 * input[11])>>(10)) - ((256 * input[12])>>(10)) + ((152 * input[13])>>(10)) + ((62 * input[14])>>(10)) - ((231 * input[15])>>(10)) + ((231 * input[16])>>(10)) - ((62 * input[17])>>(10)) - ((152 * input[18])>>(10)) + ((256 * input[19])>>(10)) - ((172 * input[20])>>(10)) - ((38 * input[21])>>(10)) + ((220 * input[22])>>(10)) - ((241 * input[23])>>(10)) + ((86 * input[24])>>(10)) + ((132 * input[25])>>(10)) - ((253 * input[26])>>(10)) + ((190 * input[27])>>(10)) + ((13 * input[28])>>(10)) - ((206 * input[29])>>(10)) + ((248 * input[30])>>(10)) - ((109 * input[31])>>(10));
  output[24] = ((98 * input[0])>>(10)) - ((237 * input[1])>>(10)) + ((237 * input[2])>>(10)) - ((98 * input[3])>>(10)) - ((98 * input[4])>>(10)) + ((237 * input[5])>>(10)) - ((237 * input[6])>>(10)) + ((98 * input[7])>>(10)) + ((98 * input[8])>>(10)) - ((237 * input[9])>>(10)) + ((237 * input[10])>>(10)) - ((98 * input[11])>>(10)) - ((98 * input[12])>>(10)) + ((237 * input[13])>>(10)) - ((237 * input[14])>>(10)) + ((98 * input[15])>>(10)) + ((98 * input[16])>>(10)) - ((237 * input[17])>>(10)) + ((237 * input[18])>>(10)) - ((98 * input[19])>>(10)) - ((98 * input[20])>>(10)) + ((237 * input[21])>>(10)) - ((237 * input[22])>>(10)) + ((98 * input[23])>>(10)) + ((98 * input[24])>>(10)) - ((237 * input[25])>>(10)) + ((237 * input[26])>>(10)) - ((98 * input[27])>>(10)) - ((98 * input[28])>>(10)) + ((237 * input[29])>>(10)) - ((237 * input[30])>>(10)) + ((98 * input[31])>>(10));
  output[25] = ((86 * input[0])>>(10)) - ((220 * input[1])>>(10)) + ((253 * input[2])>>(10)) - ((172 * input[3])>>(10)) + ((13 * input[4])>>(10)) + ((152 * input[5])>>(10)) - ((248 * input[6])>>(10)) + ((231 * input[7])>>(10)) - ((109 * input[8])>>(10)) - ((62 * input[9])>>(10)) + ((206 * input[10])>>(10)) - ((256 * input[11])>>(10)) + ((190 * input[12])>>(10)) - ((38 * input[13])>>(10)) - ((132 * input[14])>>(10)) + ((241 * input[15])>>(10)) - ((241 * input[16])>>(10)) + ((132 * input[17])>>(10)) + ((38 * input[18])>>(10)) - ((190 * input[19])>>(10)) + ((256 * input[20])>>(10)) - ((206 * input[21])>>(10)) + ((62 * input[22])>>(10)) + ((109 * input[23])>>(10)) - ((231 * input[24])>>(10)) + ((248 * input[25])>>(10)) - ((152 * input[26])>>(10)) - ((13 * input[27])>>(10)) + ((172 * input[28])>>(10)) - ((253 * input[29])>>(10)) + ((220 * input[30])>>(10)) - ((86 * input[31])>>(10));
  output[26] = ((74 * input[0])>>(10)) - ((198 * input[1])>>(10)) + ((255 * input[2])>>(10)) - ((226 * input[3])>>(10)) + ((121 * input[4])>>(10)) + ((25 * input[5])>>(10)) - ((162 * input[6])>>(10)) + ((245 * input[7])>>(10)) - ((245 * input[8])>>(10)) + ((162 * input[9])>>(10)) - ((25 * input[10])>>(10)) - ((121 * input[11])>>(10)) + ((226 * input[12])>>(10)) - ((255 * input[13])>>(10)) + ((198 * input[14])>>(10)) - ((74 * input[15])>>(10)) - ((74 * input[16])>>(10)) + ((198 * input[17])>>(10)) - ((255 * input[18])>>(10)) + ((226 * input[19])>>(10)) - ((121 * input[20])>>(10)) - ((25 * input[21])>>(10)) + ((162 * input[22])>>(10)) - ((245 * input[23])>>(10)) + ((245 * input[24])>>(10)) - ((162 * input[25])>>(10)) + ((25 * input[26])>>(10)) + ((121 * input[27])>>(10)) - ((226 * input[28])>>(10)) + ((255 * input[29])>>(10)) - ((198 * input[30])>>(10)) + ((74 * input[31])>>(10));
  output[27] = ((62 * input[0])>>(10)) - ((172 * input[1])>>(10)) + ((241 * input[2])>>(10)) - ((253 * input[3])>>(10)) + ((206 * input[4])>>(10)) - ((109 * input[5])>>(10)) - ((13 * input[6])>>(10)) + ((132 * input[7])>>(10)) - ((220 * input[8])>>(10)) + ((256 * input[9])>>(10)) - ((231 * input[10])>>(10)) + ((152 * input[11])>>(10)) - ((38 * input[12])>>(10)) - ((86 * input[13])>>(10)) + ((190 * input[14])>>(10)) - ((248 * input[15])>>(10)) + ((248 * input[16])>>(10)) - ((190 * input[17])>>(10)) + ((86 * input[18])>>(10)) + ((38 * input[19])>>(10)) - ((152 * input[20])>>(10)) + ((231 * input[21])>>(10)) - ((256 * input[22])>>(10)) + ((220 * input[23])>>(10)) - ((132 * input[24])>>(10)) + ((13 * input[25])>>(10)) + ((109 * input[26])>>(10)) - ((206 * input[27])>>(10)) + ((253 * input[28])>>(10)) - ((241 * input[29])>>(10)) + ((172 * input[30])>>(10)) - ((62 * input[31])>>(10));
  output[28] = ((50 * input[0])>>(10)) - ((142 * input[1])>>(10)) + ((213 * input[2])>>(10)) - ((251 * input[3])>>(10)) + ((251 * input[4])>>(10)) - ((213 * input[5])>>(10)) + ((142 * input[6])>>(10)) - ((50 * input[7])>>(10)) - ((50 * input[8])>>(10)) + ((142 * input[9])>>(10)) - ((213 * input[10])>>(10)) + ((251 * input[11])>>(10)) - ((251 * input[12])>>(10)) + ((213 * input[13])>>(10)) - ((142 * input[14])>>(10)) + ((50 * input[15])>>(10)) + ((50 * input[16])>>(10)) - ((142 * input[17])>>(10)) + ((213 * input[18])>>(10)) - ((251 * input[19])>>(10)) + ((251 * input[20])>>(10)) - ((213 * input[21])>>(10)) + ((142 * input[22])>>(10)) - ((50 * input[23])>>(10)) - ((50 * input[24])>>(10)) + ((142 * input[25])>>(10)) - ((213 * input[26])>>(10)) + ((251 * input[27])>>(10)) - ((251 * input[28])>>(10)) + ((213 * input[29])>>(10)) - ((142 * input[30])>>(10)) + ((50 * input[31])>>(10));
  output[29] = ((38 * input[0])>>(10)) - ((109 * input[1])>>(10)) + ((172 * input[2])>>(10)) - ((220 * input[3])>>(10)) + ((248 * input[4])>>(10)) - ((256 * input[5])>>(10)) + ((241 * input[6])>>(10)) - ((206 * input[7])>>(10)) + ((152 * input[8])>>(10)) - ((86 * input[9])>>(10)) + ((13 * input[10])>>(10)) + ((62 * input[11])>>(10)) - ((132 * input[12])>>(10)) + ((190 * input[13])>>(10)) - ((231 * input[14])>>(10)) + ((253 * input[15])>>(10)) - ((253 * input[16])>>(10)) + ((231 * input[17])>>(10)) - ((190 * input[18])>>(10)) + ((132 * input[19])>>(10)) - ((62 * input[20])>>(10)) - ((13 * input[21])>>(10)) + ((86 * input[22])>>(10)) - ((152 * input[23])>>(10)) + ((206 * input[24])>>(10)) - ((241 * input[25])>>(10)) + ((256 * input[26])>>(10)) - ((248 * input[27])>>(10)) + ((220 * input[28])>>(10)) - ((172 * input[29])>>(10)) + ((109 * input[30])>>(10)) - ((38 * input[31])>>(10));
  output[30] = ((25 * input[0])>>(10)) - ((74 * input[1])>>(10)) + ((121 * input[2])>>(10)) - ((162 * input[3])>>(10)) + ((198 * input[4])>>(10)) - ((226 * input[5])>>(10)) + ((245 * input[6])>>(10)) - ((255 * input[7])>>(10)) + ((255 * input[8])>>(10)) - ((245 * input[9])>>(10)) + ((226 * input[10])>>(10)) - ((198 * input[11])>>(10)) + ((162 * input[12])>>(10)) - ((121 * input[13])>>(10)) + ((74 * input[14])>>(10)) - ((25 * input[15])>>(10)) - ((25 * input[16])>>(10)) + ((74 * input[17])>>(10)) - ((121 * input[18])>>(10)) + ((162 * input[19])>>(10)) - ((198 * input[20])>>(10)) + ((226 * input[21])>>(10)) - ((245 * input[22])>>(10)) + ((255 * input[23])>>(10)) - ((255 * input[24])>>(10)) + ((245 * input[25])>>(10)) - ((226 * input[26])>>(10)) + ((198 * input[27])>>(10)) - ((162 * input[28])>>(10)) + ((121 * input[29])>>(10)) - ((74 * input[30])>>(10)) + ((25 * input[31])>>(10));
  output[31] = ((13 * input[0])>>(10)) - ((38 * input[1])>>(10)) + ((62 * input[2])>>(10)) - ((86 * input[3])>>(10)) + ((109 * input[4])>>(10)) - ((132 * input[5])>>(10)) + ((152 * input[6])>>(10)) - ((172 * input[7])>>(10)) + ((190 * input[8])>>(10)) - ((206 * input[9])>>(10)) + ((220 * input[10])>>(10)) - ((231 * input[11])>>(10)) + ((241 * input[12])>>(10)) - ((248 * input[13])>>(10)) + ((253 * input[14])>>(10)) - ((256 * input[15])>>(10)) + ((256 * input[16])>>(10)) - ((253 * input[17])>>(10)) + ((248 * input[18])>>(10)) - ((241 * input[19])>>(10)) + ((231 * input[20])>>(10)) - ((220 * input[21])>>(10)) + ((206 * input[22])>>(10)) - ((190 * input[23])>>(10)) + ((172 * input[24])>>(10)) - ((152 * input[25])>>(10)) + ((132 * input[26])>>(10)) - ((109 * input[27])>>(10)) + ((86 * input[28])>>(10)) - ((62 * input[29])>>(10)) + ((38 * input[30])>>(10)) - ((13 * input[31])>>(10));
  */
}

void av1_fadst4_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                    const int8_t *stage_range) {
  int bit = cos_bit;
  const int32_t *sinpi = sinpi_arr(bit);
  int32_t x0, x1, x2, x3;
  int32_t s0, s1, s2, s3, s4, s5, s6, s7;

  // stage 0
  range_check(0, input, input, 4, stage_range[0]);
  x0 = input[0];
  x1 = input[1];
  x2 = input[2];
  x3 = input[3];

  if (!(x0 | x1 | x2 | x3)) {
    output[0] = output[1] = output[2] = output[3] = 0;
    return;
  }

  // stage 1
  s0 = range_check_value(sinpi[1] * x0, bit + stage_range[1]);
  s1 = range_check_value(sinpi[4] * x0, bit + stage_range[1]);
  s2 = range_check_value(sinpi[2] * x1, bit + stage_range[1]);
  s3 = range_check_value(sinpi[1] * x1, bit + stage_range[1]);
  s4 = range_check_value(sinpi[3] * x2, bit + stage_range[1]);
  s5 = range_check_value(sinpi[4] * x3, bit + stage_range[1]);
  s6 = range_check_value(sinpi[2] * x3, bit + stage_range[1]);
  s7 = range_check_value(x0 + x1, stage_range[1]);

  // stage 2
  s7 = range_check_value(s7 - x3, stage_range[2]);

  // stage 3
  x0 = range_check_value(s0 + s2, bit + stage_range[3]);
  x1 = range_check_value(sinpi[3] * s7, bit + stage_range[3]);
  x2 = range_check_value(s1 - s3, bit + stage_range[3]);
  x3 = range_check_value(s4, bit + stage_range[3]);

  // stage 4
  x0 = range_check_value(x0 + s5, bit + stage_range[4]);
  x2 = range_check_value(x2 + s6, bit + stage_range[4]);

  // stage 5
  s0 = range_check_value(x0 + x3, bit + stage_range[5]);
  s1 = range_check_value(x1, bit + stage_range[5]);
  s2 = range_check_value(x2 - x3, bit + stage_range[5]);
  s3 = range_check_value(x2 - x0, bit + stage_range[5]);

  // stage 6
  s3 = range_check_value(s3 + x3, bit + stage_range[6]);

  // 1-D transform scaling factor is sqrt(2).
  output[0] = round_shift(s0, bit);
  output[1] = round_shift(s1, bit);
  output[2] = round_shift(s2, bit);
  output[3] = round_shift(s3, bit);
  range_check(6, input, output, 4, stage_range[6]);
}

void av1_fadst8_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                    const int8_t *stage_range) {
  const int32_t size = 8;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[8];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

  // stage 1;
  stage++;
  assert(output != input);
  bf1 = output;
  bf1[0] = input[0];
  bf1[1] = -input[7];
  bf1[2] = -input[3];
  bf1[3] = input[4];
  bf1[4] = -input[1];
  bf1[5] = input[6];
  bf1[6] = input[2];
  bf1[7] = -input[5];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 2
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = half_btf(cospi[32], bf0[2], cospi[32], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[32], bf0[2], -cospi[32], bf0[3], cos_bit);
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = half_btf(cospi[32], bf0[6], cospi[32], bf0[7], cos_bit);
  bf1[7] = half_btf(cospi[32], bf0[6], -cospi[32], bf0[7], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 3
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[2];
  bf1[1] = bf0[1] + bf0[3];
  bf1[2] = bf0[0] - bf0[2];
  bf1[3] = bf0[1] - bf0[3];
  bf1[4] = bf0[4] + bf0[6];
  bf1[5] = bf0[5] + bf0[7];
  bf1[6] = bf0[4] - bf0[6];
  bf1[7] = bf0[5] - bf0[7];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 4
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = half_btf(cospi[16], bf0[4], cospi[48], bf0[5], cos_bit);
  bf1[5] = half_btf(cospi[48], bf0[4], -cospi[16], bf0[5], cos_bit);
  bf1[6] = half_btf(-cospi[48], bf0[6], cospi[16], bf0[7], cos_bit);
  bf1[7] = half_btf(cospi[16], bf0[6], cospi[48], bf0[7], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 5
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[4];
  bf1[1] = bf0[1] + bf0[5];
  bf1[2] = bf0[2] + bf0[6];
  bf1[3] = bf0[3] + bf0[7];
  bf1[4] = bf0[0] - bf0[4];
  bf1[5] = bf0[1] - bf0[5];
  bf1[6] = bf0[2] - bf0[6];
  bf1[7] = bf0[3] - bf0[7];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 6
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[4], bf0[0], cospi[60], bf0[1], cos_bit);
  bf1[1] = half_btf(cospi[60], bf0[0], -cospi[4], bf0[1], cos_bit);
  bf1[2] = half_btf(cospi[20], bf0[2], cospi[44], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[44], bf0[2], -cospi[20], bf0[3], cos_bit);
  bf1[4] = half_btf(cospi[36], bf0[4], cospi[28], bf0[5], cos_bit);
  bf1[5] = half_btf(cospi[28], bf0[4], -cospi[36], bf0[5], cos_bit);
  bf1[6] = half_btf(cospi[52], bf0[6], cospi[12], bf0[7], cos_bit);
  bf1[7] = half_btf(cospi[12], bf0[6], -cospi[52], bf0[7], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 7
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[1];
  bf1[1] = bf0[6];
  bf1[2] = bf0[3];
  bf1[3] = bf0[4];
  bf1[4] = bf0[5];
  bf1[5] = bf0[2];
  bf1[6] = bf0[7];
  bf1[7] = bf0[0];
  range_check(stage, input, bf1, size, stage_range[stage]);
}

void av1_fadst16_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                     const int8_t *stage_range) {
  const int32_t size = 16;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[16];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

  // stage 1;
  stage++;
  assert(output != input);
  bf1 = output;
  bf1[0] = input[0];
  bf1[1] = -input[15];
  bf1[2] = -input[7];
  bf1[3] = input[8];
  bf1[4] = -input[3];
  bf1[5] = input[12];
  bf1[6] = input[4];
  bf1[7] = -input[11];
  bf1[8] = -input[1];
  bf1[9] = input[14];
  bf1[10] = input[6];
  bf1[11] = -input[9];
  bf1[12] = input[2];
  bf1[13] = -input[13];
  bf1[14] = -input[5];
  bf1[15] = input[10];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 2
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = half_btf(cospi[32], bf0[2], cospi[32], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[32], bf0[2], -cospi[32], bf0[3], cos_bit);
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = half_btf(cospi[32], bf0[6], cospi[32], bf0[7], cos_bit);
  bf1[7] = half_btf(cospi[32], bf0[6], -cospi[32], bf0[7], cos_bit);
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = half_btf(cospi[32], bf0[10], cospi[32], bf0[11], cos_bit);
  bf1[11] = half_btf(cospi[32], bf0[10], -cospi[32], bf0[11], cos_bit);
  bf1[12] = bf0[12];
  bf1[13] = bf0[13];
  bf1[14] = half_btf(cospi[32], bf0[14], cospi[32], bf0[15], cos_bit);
  bf1[15] = half_btf(cospi[32], bf0[14], -cospi[32], bf0[15], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 3
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[2];
  bf1[1] = bf0[1] + bf0[3];
  bf1[2] = bf0[0] - bf0[2];
  bf1[3] = bf0[1] - bf0[3];
  bf1[4] = bf0[4] + bf0[6];
  bf1[5] = bf0[5] + bf0[7];
  bf1[6] = bf0[4] - bf0[6];
  bf1[7] = bf0[5] - bf0[7];
  bf1[8] = bf0[8] + bf0[10];
  bf1[9] = bf0[9] + bf0[11];
  bf1[10] = bf0[8] - bf0[10];
  bf1[11] = bf0[9] - bf0[11];
  bf1[12] = bf0[12] + bf0[14];
  bf1[13] = bf0[13] + bf0[15];
  bf1[14] = bf0[12] - bf0[14];
  bf1[15] = bf0[13] - bf0[15];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 4
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = half_btf(cospi[16], bf0[4], cospi[48], bf0[5], cos_bit);
  bf1[5] = half_btf(cospi[48], bf0[4], -cospi[16], bf0[5], cos_bit);
  bf1[6] = half_btf(-cospi[48], bf0[6], cospi[16], bf0[7], cos_bit);
  bf1[7] = half_btf(cospi[16], bf0[6], cospi[48], bf0[7], cos_bit);
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = bf0[10];
  bf1[11] = bf0[11];
  bf1[12] = half_btf(cospi[16], bf0[12], cospi[48], bf0[13], cos_bit);
  bf1[13] = half_btf(cospi[48], bf0[12], -cospi[16], bf0[13], cos_bit);
  bf1[14] = half_btf(-cospi[48], bf0[14], cospi[16], bf0[15], cos_bit);
  bf1[15] = half_btf(cospi[16], bf0[14], cospi[48], bf0[15], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 5
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[4];
  bf1[1] = bf0[1] + bf0[5];
  bf1[2] = bf0[2] + bf0[6];
  bf1[3] = bf0[3] + bf0[7];
  bf1[4] = bf0[0] - bf0[4];
  bf1[5] = bf0[1] - bf0[5];
  bf1[6] = bf0[2] - bf0[6];
  bf1[7] = bf0[3] - bf0[7];
  bf1[8] = bf0[8] + bf0[12];
  bf1[9] = bf0[9] + bf0[13];
  bf1[10] = bf0[10] + bf0[14];
  bf1[11] = bf0[11] + bf0[15];
  bf1[12] = bf0[8] - bf0[12];
  bf1[13] = bf0[9] - bf0[13];
  bf1[14] = bf0[10] - bf0[14];
  bf1[15] = bf0[11] - bf0[15];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 6
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = half_btf(cospi[8], bf0[8], cospi[56], bf0[9], cos_bit);
  bf1[9] = half_btf(cospi[56], bf0[8], -cospi[8], bf0[9], cos_bit);
  bf1[10] = half_btf(cospi[40], bf0[10], cospi[24], bf0[11], cos_bit);
  bf1[11] = half_btf(cospi[24], bf0[10], -cospi[40], bf0[11], cos_bit);
  bf1[12] = half_btf(-cospi[56], bf0[12], cospi[8], bf0[13], cos_bit);
  bf1[13] = half_btf(cospi[8], bf0[12], cospi[56], bf0[13], cos_bit);
  bf1[14] = half_btf(-cospi[24], bf0[14], cospi[40], bf0[15], cos_bit);
  bf1[15] = half_btf(cospi[40], bf0[14], cospi[24], bf0[15], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 7
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[8];
  bf1[1] = bf0[1] + bf0[9];
  bf1[2] = bf0[2] + bf0[10];
  bf1[3] = bf0[3] + bf0[11];
  bf1[4] = bf0[4] + bf0[12];
  bf1[5] = bf0[5] + bf0[13];
  bf1[6] = bf0[6] + bf0[14];
  bf1[7] = bf0[7] + bf0[15];
  bf1[8] = bf0[0] - bf0[8];
  bf1[9] = bf0[1] - bf0[9];
  bf1[10] = bf0[2] - bf0[10];
  bf1[11] = bf0[3] - bf0[11];
  bf1[12] = bf0[4] - bf0[12];
  bf1[13] = bf0[5] - bf0[13];
  bf1[14] = bf0[6] - bf0[14];
  bf1[15] = bf0[7] - bf0[15];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 8
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[2], bf0[0], cospi[62], bf0[1], cos_bit);
  bf1[1] = half_btf(cospi[62], bf0[0], -cospi[2], bf0[1], cos_bit);
  bf1[2] = half_btf(cospi[10], bf0[2], cospi[54], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[54], bf0[2], -cospi[10], bf0[3], cos_bit);
  bf1[4] = half_btf(cospi[18], bf0[4], cospi[46], bf0[5], cos_bit);
  bf1[5] = half_btf(cospi[46], bf0[4], -cospi[18], bf0[5], cos_bit);
  bf1[6] = half_btf(cospi[26], bf0[6], cospi[38], bf0[7], cos_bit);
  bf1[7] = half_btf(cospi[38], bf0[6], -cospi[26], bf0[7], cos_bit);
  bf1[8] = half_btf(cospi[34], bf0[8], cospi[30], bf0[9], cos_bit);
  bf1[9] = half_btf(cospi[30], bf0[8], -cospi[34], bf0[9], cos_bit);
  bf1[10] = half_btf(cospi[42], bf0[10], cospi[22], bf0[11], cos_bit);
  bf1[11] = half_btf(cospi[22], bf0[10], -cospi[42], bf0[11], cos_bit);
  bf1[12] = half_btf(cospi[50], bf0[12], cospi[14], bf0[13], cos_bit);
  bf1[13] = half_btf(cospi[14], bf0[12], -cospi[50], bf0[13], cos_bit);
  bf1[14] = half_btf(cospi[58], bf0[14], cospi[6], bf0[15], cos_bit);
  bf1[15] = half_btf(cospi[6], bf0[14], -cospi[58], bf0[15], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 9
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[1];
  bf1[1] = bf0[14];
  bf1[2] = bf0[3];
  bf1[3] = bf0[12];
  bf1[4] = bf0[5];
  bf1[5] = bf0[10];
  bf1[6] = bf0[7];
  bf1[7] = bf0[8];
  bf1[8] = bf0[9];
  bf1[9] = bf0[6];
  bf1[10] = bf0[11];
  bf1[11] = bf0[4];
  bf1[12] = bf0[13];
  bf1[13] = bf0[2];
  bf1[14] = bf0[15];
  bf1[15] = bf0[0];
  range_check(stage, input, bf1, size, stage_range[stage]);
}

void av1_fidentity4_c(const int32_t *input, int32_t *output, int8_t cos_bit,
                      const int8_t *stage_range) {
  (void)cos_bit;
  for (int i = 0; i < 4; ++i)
    output[i] = round_shift((int64_t)input[i] * NewSqrt2, NewSqrt2Bits);
  assert(stage_range[0] + NewSqrt2Bits <= 32);
  range_check(0, input, output, 4, stage_range[0]);
}

void av1_fidentity8_c(const int32_t *input, int32_t *output, int8_t cos_bit,
                      const int8_t *stage_range) {
  (void)cos_bit;
  for (int i = 0; i < 8; ++i) output[i] = input[i] * 2;
  range_check(0, input, output, 8, stage_range[0]);
}

void av1_fidentity16_c(const int32_t *input, int32_t *output, int8_t cos_bit,
                       const int8_t *stage_range) {
  (void)cos_bit;
  for (int i = 0; i < 16; ++i)
    output[i] = round_shift((int64_t)input[i] * 2 * NewSqrt2, NewSqrt2Bits);
  assert(stage_range[0] + NewSqrt2Bits <= 32);
  range_check(0, input, output, 16, stage_range[0]);
}

void av1_fidentity32_c(const int32_t *input, int32_t *output, int8_t cos_bit,
                       const int8_t *stage_range) {
  (void)cos_bit;
  for (int i = 0; i < 32; ++i) output[i] = input[i] * 4;
  range_check(0, input, output, 32, stage_range[0]);
}

void av1_fdct64_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                    const int8_t *stage_range) {
  const int32_t size = 64;
  const int32_t *cospi;

  int32_t stage = 0;
  int32_t *bf0, *bf1;
  int32_t step[64];

  // stage 0;
  range_check(stage, input, input, size, stage_range[stage]);

  // stage 1;
  stage++;
  bf1 = output;
  bf1[0] = input[0] + input[63];
  bf1[1] = input[1] + input[62];
  bf1[2] = input[2] + input[61];
  bf1[3] = input[3] + input[60];
  bf1[4] = input[4] + input[59];
  bf1[5] = input[5] + input[58];
  bf1[6] = input[6] + input[57];
  bf1[7] = input[7] + input[56];
  bf1[8] = input[8] + input[55];
  bf1[9] = input[9] + input[54];
  bf1[10] = input[10] + input[53];
  bf1[11] = input[11] + input[52];
  bf1[12] = input[12] + input[51];
  bf1[13] = input[13] + input[50];
  bf1[14] = input[14] + input[49];
  bf1[15] = input[15] + input[48];
  bf1[16] = input[16] + input[47];
  bf1[17] = input[17] + input[46];
  bf1[18] = input[18] + input[45];
  bf1[19] = input[19] + input[44];
  bf1[20] = input[20] + input[43];
  bf1[21] = input[21] + input[42];
  bf1[22] = input[22] + input[41];
  bf1[23] = input[23] + input[40];
  bf1[24] = input[24] + input[39];
  bf1[25] = input[25] + input[38];
  bf1[26] = input[26] + input[37];
  bf1[27] = input[27] + input[36];
  bf1[28] = input[28] + input[35];
  bf1[29] = input[29] + input[34];
  bf1[30] = input[30] + input[33];
  bf1[31] = input[31] + input[32];
  bf1[32] = -input[32] + input[31];
  bf1[33] = -input[33] + input[30];
  bf1[34] = -input[34] + input[29];
  bf1[35] = -input[35] + input[28];
  bf1[36] = -input[36] + input[27];
  bf1[37] = -input[37] + input[26];
  bf1[38] = -input[38] + input[25];
  bf1[39] = -input[39] + input[24];
  bf1[40] = -input[40] + input[23];
  bf1[41] = -input[41] + input[22];
  bf1[42] = -input[42] + input[21];
  bf1[43] = -input[43] + input[20];
  bf1[44] = -input[44] + input[19];
  bf1[45] = -input[45] + input[18];
  bf1[46] = -input[46] + input[17];
  bf1[47] = -input[47] + input[16];
  bf1[48] = -input[48] + input[15];
  bf1[49] = -input[49] + input[14];
  bf1[50] = -input[50] + input[13];
  bf1[51] = -input[51] + input[12];
  bf1[52] = -input[52] + input[11];
  bf1[53] = -input[53] + input[10];
  bf1[54] = -input[54] + input[9];
  bf1[55] = -input[55] + input[8];
  bf1[56] = -input[56] + input[7];
  bf1[57] = -input[57] + input[6];
  bf1[58] = -input[58] + input[5];
  bf1[59] = -input[59] + input[4];
  bf1[60] = -input[60] + input[3];
  bf1[61] = -input[61] + input[2];
  bf1[62] = -input[62] + input[1];
  bf1[63] = -input[63] + input[0];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 2
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0] + bf0[31];
  bf1[1] = bf0[1] + bf0[30];
  bf1[2] = bf0[2] + bf0[29];
  bf1[3] = bf0[3] + bf0[28];
  bf1[4] = bf0[4] + bf0[27];
  bf1[5] = bf0[5] + bf0[26];
  bf1[6] = bf0[6] + bf0[25];
  bf1[7] = bf0[7] + bf0[24];
  bf1[8] = bf0[8] + bf0[23];
  bf1[9] = bf0[9] + bf0[22];
  bf1[10] = bf0[10] + bf0[21];
  bf1[11] = bf0[11] + bf0[20];
  bf1[12] = bf0[12] + bf0[19];
  bf1[13] = bf0[13] + bf0[18];
  bf1[14] = bf0[14] + bf0[17];
  bf1[15] = bf0[15] + bf0[16];
  bf1[16] = -bf0[16] + bf0[15];
  bf1[17] = -bf0[17] + bf0[14];
  bf1[18] = -bf0[18] + bf0[13];
  bf1[19] = -bf0[19] + bf0[12];
  bf1[20] = -bf0[20] + bf0[11];
  bf1[21] = -bf0[21] + bf0[10];
  bf1[22] = -bf0[22] + bf0[9];
  bf1[23] = -bf0[23] + bf0[8];
  bf1[24] = -bf0[24] + bf0[7];
  bf1[25] = -bf0[25] + bf0[6];
  bf1[26] = -bf0[26] + bf0[5];
  bf1[27] = -bf0[27] + bf0[4];
  bf1[28] = -bf0[28] + bf0[3];
  bf1[29] = -bf0[29] + bf0[2];
  bf1[30] = -bf0[30] + bf0[1];
  bf1[31] = -bf0[31] + bf0[0];
  bf1[32] = bf0[32];
  bf1[33] = bf0[33];
  bf1[34] = bf0[34];
  bf1[35] = bf0[35];
  bf1[36] = bf0[36];
  bf1[37] = bf0[37];
  bf1[38] = bf0[38];
  bf1[39] = bf0[39];
  bf1[40] = half_btf(-cospi[32], bf0[40], cospi[32], bf0[55], cos_bit);
  bf1[41] = half_btf(-cospi[32], bf0[41], cospi[32], bf0[54], cos_bit);
  bf1[42] = half_btf(-cospi[32], bf0[42], cospi[32], bf0[53], cos_bit);
  bf1[43] = half_btf(-cospi[32], bf0[43], cospi[32], bf0[52], cos_bit);
  bf1[44] = half_btf(-cospi[32], bf0[44], cospi[32], bf0[51], cos_bit);
  bf1[45] = half_btf(-cospi[32], bf0[45], cospi[32], bf0[50], cos_bit);
  bf1[46] = half_btf(-cospi[32], bf0[46], cospi[32], bf0[49], cos_bit);
  bf1[47] = half_btf(-cospi[32], bf0[47], cospi[32], bf0[48], cos_bit);
  bf1[48] = half_btf(cospi[32], bf0[48], cospi[32], bf0[47], cos_bit);
  bf1[49] = half_btf(cospi[32], bf0[49], cospi[32], bf0[46], cos_bit);
  bf1[50] = half_btf(cospi[32], bf0[50], cospi[32], bf0[45], cos_bit);
  bf1[51] = half_btf(cospi[32], bf0[51], cospi[32], bf0[44], cos_bit);
  bf1[52] = half_btf(cospi[32], bf0[52], cospi[32], bf0[43], cos_bit);
  bf1[53] = half_btf(cospi[32], bf0[53], cospi[32], bf0[42], cos_bit);
  bf1[54] = half_btf(cospi[32], bf0[54], cospi[32], bf0[41], cos_bit);
  bf1[55] = half_btf(cospi[32], bf0[55], cospi[32], bf0[40], cos_bit);
  bf1[56] = bf0[56];
  bf1[57] = bf0[57];
  bf1[58] = bf0[58];
  bf1[59] = bf0[59];
  bf1[60] = bf0[60];
  bf1[61] = bf0[61];
  bf1[62] = bf0[62];
  bf1[63] = bf0[63];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 3
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[15];
  bf1[1] = bf0[1] + bf0[14];
  bf1[2] = bf0[2] + bf0[13];
  bf1[3] = bf0[3] + bf0[12];
  bf1[4] = bf0[4] + bf0[11];
  bf1[5] = bf0[5] + bf0[10];
  bf1[6] = bf0[6] + bf0[9];
  bf1[7] = bf0[7] + bf0[8];
  bf1[8] = -bf0[8] + bf0[7];
  bf1[9] = -bf0[9] + bf0[6];
  bf1[10] = -bf0[10] + bf0[5];
  bf1[11] = -bf0[11] + bf0[4];
  bf1[12] = -bf0[12] + bf0[3];
  bf1[13] = -bf0[13] + bf0[2];
  bf1[14] = -bf0[14] + bf0[1];
  bf1[15] = -bf0[15] + bf0[0];
  bf1[16] = bf0[16];
  bf1[17] = bf0[17];
  bf1[18] = bf0[18];
  bf1[19] = bf0[19];
  bf1[20] = half_btf(-cospi[32], bf0[20], cospi[32], bf0[27], cos_bit);
  bf1[21] = half_btf(-cospi[32], bf0[21], cospi[32], bf0[26], cos_bit);
  bf1[22] = half_btf(-cospi[32], bf0[22], cospi[32], bf0[25], cos_bit);
  bf1[23] = half_btf(-cospi[32], bf0[23], cospi[32], bf0[24], cos_bit);
  bf1[24] = half_btf(cospi[32], bf0[24], cospi[32], bf0[23], cos_bit);
  bf1[25] = half_btf(cospi[32], bf0[25], cospi[32], bf0[22], cos_bit);
  bf1[26] = half_btf(cospi[32], bf0[26], cospi[32], bf0[21], cos_bit);
  bf1[27] = half_btf(cospi[32], bf0[27], cospi[32], bf0[20], cos_bit);
  bf1[28] = bf0[28];
  bf1[29] = bf0[29];
  bf1[30] = bf0[30];
  bf1[31] = bf0[31];
  bf1[32] = bf0[32] + bf0[47];
  bf1[33] = bf0[33] + bf0[46];
  bf1[34] = bf0[34] + bf0[45];
  bf1[35] = bf0[35] + bf0[44];
  bf1[36] = bf0[36] + bf0[43];
  bf1[37] = bf0[37] + bf0[42];
  bf1[38] = bf0[38] + bf0[41];
  bf1[39] = bf0[39] + bf0[40];
  bf1[40] = -bf0[40] + bf0[39];
  bf1[41] = -bf0[41] + bf0[38];
  bf1[42] = -bf0[42] + bf0[37];
  bf1[43] = -bf0[43] + bf0[36];
  bf1[44] = -bf0[44] + bf0[35];
  bf1[45] = -bf0[45] + bf0[34];
  bf1[46] = -bf0[46] + bf0[33];
  bf1[47] = -bf0[47] + bf0[32];
  bf1[48] = -bf0[48] + bf0[63];
  bf1[49] = -bf0[49] + bf0[62];
  bf1[50] = -bf0[50] + bf0[61];
  bf1[51] = -bf0[51] + bf0[60];
  bf1[52] = -bf0[52] + bf0[59];
  bf1[53] = -bf0[53] + bf0[58];
  bf1[54] = -bf0[54] + bf0[57];
  bf1[55] = -bf0[55] + bf0[56];
  bf1[56] = bf0[56] + bf0[55];
  bf1[57] = bf0[57] + bf0[54];
  bf1[58] = bf0[58] + bf0[53];
  bf1[59] = bf0[59] + bf0[52];
  bf1[60] = bf0[60] + bf0[51];
  bf1[61] = bf0[61] + bf0[50];
  bf1[62] = bf0[62] + bf0[49];
  bf1[63] = bf0[63] + bf0[48];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 4
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0] + bf0[7];
  bf1[1] = bf0[1] + bf0[6];
  bf1[2] = bf0[2] + bf0[5];
  bf1[3] = bf0[3] + bf0[4];
  bf1[4] = -bf0[4] + bf0[3];
  bf1[5] = -bf0[5] + bf0[2];
  bf1[6] = -bf0[6] + bf0[1];
  bf1[7] = -bf0[7] + bf0[0];
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = half_btf(-cospi[32], bf0[10], cospi[32], bf0[13], cos_bit);
  bf1[11] = half_btf(-cospi[32], bf0[11], cospi[32], bf0[12], cos_bit);
  bf1[12] = half_btf(cospi[32], bf0[12], cospi[32], bf0[11], cos_bit);
  bf1[13] = half_btf(cospi[32], bf0[13], cospi[32], bf0[10], cos_bit);
  bf1[14] = bf0[14];
  bf1[15] = bf0[15];
  bf1[16] = bf0[16] + bf0[23];
  bf1[17] = bf0[17] + bf0[22];
  bf1[18] = bf0[18] + bf0[21];
  bf1[19] = bf0[19] + bf0[20];
  bf1[20] = -bf0[20] + bf0[19];
  bf1[21] = -bf0[21] + bf0[18];
  bf1[22] = -bf0[22] + bf0[17];
  bf1[23] = -bf0[23] + bf0[16];
  bf1[24] = -bf0[24] + bf0[31];
  bf1[25] = -bf0[25] + bf0[30];
  bf1[26] = -bf0[26] + bf0[29];
  bf1[27] = -bf0[27] + bf0[28];
  bf1[28] = bf0[28] + bf0[27];
  bf1[29] = bf0[29] + bf0[26];
  bf1[30] = bf0[30] + bf0[25];
  bf1[31] = bf0[31] + bf0[24];
  bf1[32] = bf0[32];
  bf1[33] = bf0[33];
  bf1[34] = bf0[34];
  bf1[35] = bf0[35];
  bf1[36] = half_btf(-cospi[16], bf0[36], cospi[48], bf0[59], cos_bit);
  bf1[37] = half_btf(-cospi[16], bf0[37], cospi[48], bf0[58], cos_bit);
  bf1[38] = half_btf(-cospi[16], bf0[38], cospi[48], bf0[57], cos_bit);
  bf1[39] = half_btf(-cospi[16], bf0[39], cospi[48], bf0[56], cos_bit);
  bf1[40] = half_btf(-cospi[48], bf0[40], -cospi[16], bf0[55], cos_bit);
  bf1[41] = half_btf(-cospi[48], bf0[41], -cospi[16], bf0[54], cos_bit);
  bf1[42] = half_btf(-cospi[48], bf0[42], -cospi[16], bf0[53], cos_bit);
  bf1[43] = half_btf(-cospi[48], bf0[43], -cospi[16], bf0[52], cos_bit);
  bf1[44] = bf0[44];
  bf1[45] = bf0[45];
  bf1[46] = bf0[46];
  bf1[47] = bf0[47];
  bf1[48] = bf0[48];
  bf1[49] = bf0[49];
  bf1[50] = bf0[50];
  bf1[51] = bf0[51];
  bf1[52] = half_btf(cospi[48], bf0[52], -cospi[16], bf0[43], cos_bit);
  bf1[53] = half_btf(cospi[48], bf0[53], -cospi[16], bf0[42], cos_bit);
  bf1[54] = half_btf(cospi[48], bf0[54], -cospi[16], bf0[41], cos_bit);
  bf1[55] = half_btf(cospi[48], bf0[55], -cospi[16], bf0[40], cos_bit);
  bf1[56] = half_btf(cospi[16], bf0[56], cospi[48], bf0[39], cos_bit);
  bf1[57] = half_btf(cospi[16], bf0[57], cospi[48], bf0[38], cos_bit);
  bf1[58] = half_btf(cospi[16], bf0[58], cospi[48], bf0[37], cos_bit);
  bf1[59] = half_btf(cospi[16], bf0[59], cospi[48], bf0[36], cos_bit);
  bf1[60] = bf0[60];
  bf1[61] = bf0[61];
  bf1[62] = bf0[62];
  bf1[63] = bf0[63];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 5
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0] + bf0[3];
  bf1[1] = bf0[1] + bf0[2];
  bf1[2] = -bf0[2] + bf0[1];
  bf1[3] = -bf0[3] + bf0[0];
  bf1[4] = bf0[4];
  bf1[5] = half_btf(-cospi[32], bf0[5], cospi[32], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[32], bf0[6], cospi[32], bf0[5], cos_bit);
  bf1[7] = bf0[7];
  bf1[8] = bf0[8] + bf0[11];
  bf1[9] = bf0[9] + bf0[10];
  bf1[10] = -bf0[10] + bf0[9];
  bf1[11] = -bf0[11] + bf0[8];
  bf1[12] = -bf0[12] + bf0[15];
  bf1[13] = -bf0[13] + bf0[14];
  bf1[14] = bf0[14] + bf0[13];
  bf1[15] = bf0[15] + bf0[12];
  bf1[16] = bf0[16];
  bf1[17] = bf0[17];
  bf1[18] = half_btf(-cospi[16], bf0[18], cospi[48], bf0[29], cos_bit);
  bf1[19] = half_btf(-cospi[16], bf0[19], cospi[48], bf0[28], cos_bit);
  bf1[20] = half_btf(-cospi[48], bf0[20], -cospi[16], bf0[27], cos_bit);
  bf1[21] = half_btf(-cospi[48], bf0[21], -cospi[16], bf0[26], cos_bit);
  bf1[22] = bf0[22];
  bf1[23] = bf0[23];
  bf1[24] = bf0[24];
  bf1[25] = bf0[25];
  bf1[26] = half_btf(cospi[48], bf0[26], -cospi[16], bf0[21], cos_bit);
  bf1[27] = half_btf(cospi[48], bf0[27], -cospi[16], bf0[20], cos_bit);
  bf1[28] = half_btf(cospi[16], bf0[28], cospi[48], bf0[19], cos_bit);
  bf1[29] = half_btf(cospi[16], bf0[29], cospi[48], bf0[18], cos_bit);
  bf1[30] = bf0[30];
  bf1[31] = bf0[31];
  bf1[32] = bf0[32] + bf0[39];
  bf1[33] = bf0[33] + bf0[38];
  bf1[34] = bf0[34] + bf0[37];
  bf1[35] = bf0[35] + bf0[36];
  bf1[36] = -bf0[36] + bf0[35];
  bf1[37] = -bf0[37] + bf0[34];
  bf1[38] = -bf0[38] + bf0[33];
  bf1[39] = -bf0[39] + bf0[32];
  bf1[40] = -bf0[40] + bf0[47];
  bf1[41] = -bf0[41] + bf0[46];
  bf1[42] = -bf0[42] + bf0[45];
  bf1[43] = -bf0[43] + bf0[44];
  bf1[44] = bf0[44] + bf0[43];
  bf1[45] = bf0[45] + bf0[42];
  bf1[46] = bf0[46] + bf0[41];
  bf1[47] = bf0[47] + bf0[40];
  bf1[48] = bf0[48] + bf0[55];
  bf1[49] = bf0[49] + bf0[54];
  bf1[50] = bf0[50] + bf0[53];
  bf1[51] = bf0[51] + bf0[52];
  bf1[52] = -bf0[52] + bf0[51];
  bf1[53] = -bf0[53] + bf0[50];
  bf1[54] = -bf0[54] + bf0[49];
  bf1[55] = -bf0[55] + bf0[48];
  bf1[56] = -bf0[56] + bf0[63];
  bf1[57] = -bf0[57] + bf0[62];
  bf1[58] = -bf0[58] + bf0[61];
  bf1[59] = -bf0[59] + bf0[60];
  bf1[60] = bf0[60] + bf0[59];
  bf1[61] = bf0[61] + bf0[58];
  bf1[62] = bf0[62] + bf0[57];
  bf1[63] = bf0[63] + bf0[56];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 6
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = half_btf(cospi[32], bf0[0], cospi[32], bf0[1], cos_bit);
  bf1[1] = half_btf(-cospi[32], bf0[1], cospi[32], bf0[0], cos_bit);
  bf1[2] = half_btf(cospi[48], bf0[2], cospi[16], bf0[3], cos_bit);
  bf1[3] = half_btf(cospi[48], bf0[3], -cospi[16], bf0[2], cos_bit);
  bf1[4] = bf0[4] + bf0[5];
  bf1[5] = -bf0[5] + bf0[4];
  bf1[6] = -bf0[6] + bf0[7];
  bf1[7] = bf0[7] + bf0[6];
  bf1[8] = bf0[8];
  bf1[9] = half_btf(-cospi[16], bf0[9], cospi[48], bf0[14], cos_bit);
  bf1[10] = half_btf(-cospi[48], bf0[10], -cospi[16], bf0[13], cos_bit);
  bf1[11] = bf0[11];
  bf1[12] = bf0[12];
  bf1[13] = half_btf(cospi[48], bf0[13], -cospi[16], bf0[10], cos_bit);
  bf1[14] = half_btf(cospi[16], bf0[14], cospi[48], bf0[9], cos_bit);
  bf1[15] = bf0[15];
  bf1[16] = bf0[16] + bf0[19];
  bf1[17] = bf0[17] + bf0[18];
  bf1[18] = -bf0[18] + bf0[17];
  bf1[19] = -bf0[19] + bf0[16];
  bf1[20] = -bf0[20] + bf0[23];
  bf1[21] = -bf0[21] + bf0[22];
  bf1[22] = bf0[22] + bf0[21];
  bf1[23] = bf0[23] + bf0[20];
  bf1[24] = bf0[24] + bf0[27];
  bf1[25] = bf0[25] + bf0[26];
  bf1[26] = -bf0[26] + bf0[25];
  bf1[27] = -bf0[27] + bf0[24];
  bf1[28] = -bf0[28] + bf0[31];
  bf1[29] = -bf0[29] + bf0[30];
  bf1[30] = bf0[30] + bf0[29];
  bf1[31] = bf0[31] + bf0[28];
  bf1[32] = bf0[32];
  bf1[33] = bf0[33];
  bf1[34] = half_btf(-cospi[8], bf0[34], cospi[56], bf0[61], cos_bit);
  bf1[35] = half_btf(-cospi[8], bf0[35], cospi[56], bf0[60], cos_bit);
  bf1[36] = half_btf(-cospi[56], bf0[36], -cospi[8], bf0[59], cos_bit);
  bf1[37] = half_btf(-cospi[56], bf0[37], -cospi[8], bf0[58], cos_bit);
  bf1[38] = bf0[38];
  bf1[39] = bf0[39];
  bf1[40] = bf0[40];
  bf1[41] = bf0[41];
  bf1[42] = half_btf(-cospi[40], bf0[42], cospi[24], bf0[53], cos_bit);
  bf1[43] = half_btf(-cospi[40], bf0[43], cospi[24], bf0[52], cos_bit);
  bf1[44] = half_btf(-cospi[24], bf0[44], -cospi[40], bf0[51], cos_bit);
  bf1[45] = half_btf(-cospi[24], bf0[45], -cospi[40], bf0[50], cos_bit);
  bf1[46] = bf0[46];
  bf1[47] = bf0[47];
  bf1[48] = bf0[48];
  bf1[49] = bf0[49];
  bf1[50] = half_btf(cospi[24], bf0[50], -cospi[40], bf0[45], cos_bit);
  bf1[51] = half_btf(cospi[24], bf0[51], -cospi[40], bf0[44], cos_bit);
  bf1[52] = half_btf(cospi[40], bf0[52], cospi[24], bf0[43], cos_bit);
  bf1[53] = half_btf(cospi[40], bf0[53], cospi[24], bf0[42], cos_bit);
  bf1[54] = bf0[54];
  bf1[55] = bf0[55];
  bf1[56] = bf0[56];
  bf1[57] = bf0[57];
  bf1[58] = half_btf(cospi[56], bf0[58], -cospi[8], bf0[37], cos_bit);
  bf1[59] = half_btf(cospi[56], bf0[59], -cospi[8], bf0[36], cos_bit);
  bf1[60] = half_btf(cospi[8], bf0[60], cospi[56], bf0[35], cos_bit);
  bf1[61] = half_btf(cospi[8], bf0[61], cospi[56], bf0[34], cos_bit);
  bf1[62] = bf0[62];
  bf1[63] = bf0[63];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 7
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = half_btf(cospi[56], bf0[4], cospi[8], bf0[7], cos_bit);
  bf1[5] = half_btf(cospi[24], bf0[5], cospi[40], bf0[6], cos_bit);
  bf1[6] = half_btf(cospi[24], bf0[6], -cospi[40], bf0[5], cos_bit);
  bf1[7] = half_btf(cospi[56], bf0[7], -cospi[8], bf0[4], cos_bit);
  bf1[8] = bf0[8] + bf0[9];
  bf1[9] = -bf0[9] + bf0[8];
  bf1[10] = -bf0[10] + bf0[11];
  bf1[11] = bf0[11] + bf0[10];
  bf1[12] = bf0[12] + bf0[13];
  bf1[13] = -bf0[13] + bf0[12];
  bf1[14] = -bf0[14] + bf0[15];
  bf1[15] = bf0[15] + bf0[14];
  bf1[16] = bf0[16];
  bf1[17] = half_btf(-cospi[8], bf0[17], cospi[56], bf0[30], cos_bit);
  bf1[18] = half_btf(-cospi[56], bf0[18], -cospi[8], bf0[29], cos_bit);
  bf1[19] = bf0[19];
  bf1[20] = bf0[20];
  bf1[21] = half_btf(-cospi[40], bf0[21], cospi[24], bf0[26], cos_bit);
  bf1[22] = half_btf(-cospi[24], bf0[22], -cospi[40], bf0[25], cos_bit);
  bf1[23] = bf0[23];
  bf1[24] = bf0[24];
  bf1[25] = half_btf(cospi[24], bf0[25], -cospi[40], bf0[22], cos_bit);
  bf1[26] = half_btf(cospi[40], bf0[26], cospi[24], bf0[21], cos_bit);
  bf1[27] = bf0[27];
  bf1[28] = bf0[28];
  bf1[29] = half_btf(cospi[56], bf0[29], -cospi[8], bf0[18], cos_bit);
  bf1[30] = half_btf(cospi[8], bf0[30], cospi[56], bf0[17], cos_bit);
  bf1[31] = bf0[31];
  bf1[32] = bf0[32] + bf0[35];
  bf1[33] = bf0[33] + bf0[34];
  bf1[34] = -bf0[34] + bf0[33];
  bf1[35] = -bf0[35] + bf0[32];
  bf1[36] = -bf0[36] + bf0[39];
  bf1[37] = -bf0[37] + bf0[38];
  bf1[38] = bf0[38] + bf0[37];
  bf1[39] = bf0[39] + bf0[36];
  bf1[40] = bf0[40] + bf0[43];
  bf1[41] = bf0[41] + bf0[42];
  bf1[42] = -bf0[42] + bf0[41];
  bf1[43] = -bf0[43] + bf0[40];
  bf1[44] = -bf0[44] + bf0[47];
  bf1[45] = -bf0[45] + bf0[46];
  bf1[46] = bf0[46] + bf0[45];
  bf1[47] = bf0[47] + bf0[44];
  bf1[48] = bf0[48] + bf0[51];
  bf1[49] = bf0[49] + bf0[50];
  bf1[50] = -bf0[50] + bf0[49];
  bf1[51] = -bf0[51] + bf0[48];
  bf1[52] = -bf0[52] + bf0[55];
  bf1[53] = -bf0[53] + bf0[54];
  bf1[54] = bf0[54] + bf0[53];
  bf1[55] = bf0[55] + bf0[52];
  bf1[56] = bf0[56] + bf0[59];
  bf1[57] = bf0[57] + bf0[58];
  bf1[58] = -bf0[58] + bf0[57];
  bf1[59] = -bf0[59] + bf0[56];
  bf1[60] = -bf0[60] + bf0[63];
  bf1[61] = -bf0[61] + bf0[62];
  bf1[62] = bf0[62] + bf0[61];
  bf1[63] = bf0[63] + bf0[60];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 8
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = half_btf(cospi[60], bf0[8], cospi[4], bf0[15], cos_bit);
  bf1[9] = half_btf(cospi[28], bf0[9], cospi[36], bf0[14], cos_bit);
  bf1[10] = half_btf(cospi[44], bf0[10], cospi[20], bf0[13], cos_bit);
  bf1[11] = half_btf(cospi[12], bf0[11], cospi[52], bf0[12], cos_bit);
  bf1[12] = half_btf(cospi[12], bf0[12], -cospi[52], bf0[11], cos_bit);
  bf1[13] = half_btf(cospi[44], bf0[13], -cospi[20], bf0[10], cos_bit);
  bf1[14] = half_btf(cospi[28], bf0[14], -cospi[36], bf0[9], cos_bit);
  bf1[15] = half_btf(cospi[60], bf0[15], -cospi[4], bf0[8], cos_bit);
  bf1[16] = bf0[16] + bf0[17];
  bf1[17] = -bf0[17] + bf0[16];
  bf1[18] = -bf0[18] + bf0[19];
  bf1[19] = bf0[19] + bf0[18];
  bf1[20] = bf0[20] + bf0[21];
  bf1[21] = -bf0[21] + bf0[20];
  bf1[22] = -bf0[22] + bf0[23];
  bf1[23] = bf0[23] + bf0[22];
  bf1[24] = bf0[24] + bf0[25];
  bf1[25] = -bf0[25] + bf0[24];
  bf1[26] = -bf0[26] + bf0[27];
  bf1[27] = bf0[27] + bf0[26];
  bf1[28] = bf0[28] + bf0[29];
  bf1[29] = -bf0[29] + bf0[28];
  bf1[30] = -bf0[30] + bf0[31];
  bf1[31] = bf0[31] + bf0[30];
  bf1[32] = bf0[32];
  bf1[33] = half_btf(-cospi[4], bf0[33], cospi[60], bf0[62], cos_bit);
  bf1[34] = half_btf(-cospi[60], bf0[34], -cospi[4], bf0[61], cos_bit);
  bf1[35] = bf0[35];
  bf1[36] = bf0[36];
  bf1[37] = half_btf(-cospi[36], bf0[37], cospi[28], bf0[58], cos_bit);
  bf1[38] = half_btf(-cospi[28], bf0[38], -cospi[36], bf0[57], cos_bit);
  bf1[39] = bf0[39];
  bf1[40] = bf0[40];
  bf1[41] = half_btf(-cospi[20], bf0[41], cospi[44], bf0[54], cos_bit);
  bf1[42] = half_btf(-cospi[44], bf0[42], -cospi[20], bf0[53], cos_bit);
  bf1[43] = bf0[43];
  bf1[44] = bf0[44];
  bf1[45] = half_btf(-cospi[52], bf0[45], cospi[12], bf0[50], cos_bit);
  bf1[46] = half_btf(-cospi[12], bf0[46], -cospi[52], bf0[49], cos_bit);
  bf1[47] = bf0[47];
  bf1[48] = bf0[48];
  bf1[49] = half_btf(cospi[12], bf0[49], -cospi[52], bf0[46], cos_bit);
  bf1[50] = half_btf(cospi[52], bf0[50], cospi[12], bf0[45], cos_bit);
  bf1[51] = bf0[51];
  bf1[52] = bf0[52];
  bf1[53] = half_btf(cospi[44], bf0[53], -cospi[20], bf0[42], cos_bit);
  bf1[54] = half_btf(cospi[20], bf0[54], cospi[44], bf0[41], cos_bit);
  bf1[55] = bf0[55];
  bf1[56] = bf0[56];
  bf1[57] = half_btf(cospi[28], bf0[57], -cospi[36], bf0[38], cos_bit);
  bf1[58] = half_btf(cospi[36], bf0[58], cospi[28], bf0[37], cos_bit);
  bf1[59] = bf0[59];
  bf1[60] = bf0[60];
  bf1[61] = half_btf(cospi[60], bf0[61], -cospi[4], bf0[34], cos_bit);
  bf1[62] = half_btf(cospi[4], bf0[62], cospi[60], bf0[33], cos_bit);
  bf1[63] = bf0[63];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 9
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = bf0[10];
  bf1[11] = bf0[11];
  bf1[12] = bf0[12];
  bf1[13] = bf0[13];
  bf1[14] = bf0[14];
  bf1[15] = bf0[15];
  bf1[16] = half_btf(cospi[62], bf0[16], cospi[2], bf0[31], cos_bit);
  bf1[17] = half_btf(cospi[30], bf0[17], cospi[34], bf0[30], cos_bit);
  bf1[18] = half_btf(cospi[46], bf0[18], cospi[18], bf0[29], cos_bit);
  bf1[19] = half_btf(cospi[14], bf0[19], cospi[50], bf0[28], cos_bit);
  bf1[20] = half_btf(cospi[54], bf0[20], cospi[10], bf0[27], cos_bit);
  bf1[21] = half_btf(cospi[22], bf0[21], cospi[42], bf0[26], cos_bit);
  bf1[22] = half_btf(cospi[38], bf0[22], cospi[26], bf0[25], cos_bit);
  bf1[23] = half_btf(cospi[6], bf0[23], cospi[58], bf0[24], cos_bit);
  bf1[24] = half_btf(cospi[6], bf0[24], -cospi[58], bf0[23], cos_bit);
  bf1[25] = half_btf(cospi[38], bf0[25], -cospi[26], bf0[22], cos_bit);
  bf1[26] = half_btf(cospi[22], bf0[26], -cospi[42], bf0[21], cos_bit);
  bf1[27] = half_btf(cospi[54], bf0[27], -cospi[10], bf0[20], cos_bit);
  bf1[28] = half_btf(cospi[14], bf0[28], -cospi[50], bf0[19], cos_bit);
  bf1[29] = half_btf(cospi[46], bf0[29], -cospi[18], bf0[18], cos_bit);
  bf1[30] = half_btf(cospi[30], bf0[30], -cospi[34], bf0[17], cos_bit);
  bf1[31] = half_btf(cospi[62], bf0[31], -cospi[2], bf0[16], cos_bit);
  bf1[32] = bf0[32] + bf0[33];
  bf1[33] = -bf0[33] + bf0[32];
  bf1[34] = -bf0[34] + bf0[35];
  bf1[35] = bf0[35] + bf0[34];
  bf1[36] = bf0[36] + bf0[37];
  bf1[37] = -bf0[37] + bf0[36];
  bf1[38] = -bf0[38] + bf0[39];
  bf1[39] = bf0[39] + bf0[38];
  bf1[40] = bf0[40] + bf0[41];
  bf1[41] = -bf0[41] + bf0[40];
  bf1[42] = -bf0[42] + bf0[43];
  bf1[43] = bf0[43] + bf0[42];
  bf1[44] = bf0[44] + bf0[45];
  bf1[45] = -bf0[45] + bf0[44];
  bf1[46] = -bf0[46] + bf0[47];
  bf1[47] = bf0[47] + bf0[46];
  bf1[48] = bf0[48] + bf0[49];
  bf1[49] = -bf0[49] + bf0[48];
  bf1[50] = -bf0[50] + bf0[51];
  bf1[51] = bf0[51] + bf0[50];
  bf1[52] = bf0[52] + bf0[53];
  bf1[53] = -bf0[53] + bf0[52];
  bf1[54] = -bf0[54] + bf0[55];
  bf1[55] = bf0[55] + bf0[54];
  bf1[56] = bf0[56] + bf0[57];
  bf1[57] = -bf0[57] + bf0[56];
  bf1[58] = -bf0[58] + bf0[59];
  bf1[59] = bf0[59] + bf0[58];
  bf1[60] = bf0[60] + bf0[61];
  bf1[61] = -bf0[61] + bf0[60];
  bf1[62] = -bf0[62] + bf0[63];
  bf1[63] = bf0[63] + bf0[62];
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 10
  stage++;
  cospi = cospi_arr(cos_bit);
  bf0 = output;
  bf1 = step;
  bf1[0] = bf0[0];
  bf1[1] = bf0[1];
  bf1[2] = bf0[2];
  bf1[3] = bf0[3];
  bf1[4] = bf0[4];
  bf1[5] = bf0[5];
  bf1[6] = bf0[6];
  bf1[7] = bf0[7];
  bf1[8] = bf0[8];
  bf1[9] = bf0[9];
  bf1[10] = bf0[10];
  bf1[11] = bf0[11];
  bf1[12] = bf0[12];
  bf1[13] = bf0[13];
  bf1[14] = bf0[14];
  bf1[15] = bf0[15];
  bf1[16] = bf0[16];
  bf1[17] = bf0[17];
  bf1[18] = bf0[18];
  bf1[19] = bf0[19];
  bf1[20] = bf0[20];
  bf1[21] = bf0[21];
  bf1[22] = bf0[22];
  bf1[23] = bf0[23];
  bf1[24] = bf0[24];
  bf1[25] = bf0[25];
  bf1[26] = bf0[26];
  bf1[27] = bf0[27];
  bf1[28] = bf0[28];
  bf1[29] = bf0[29];
  bf1[30] = bf0[30];
  bf1[31] = bf0[31];
  bf1[32] = half_btf(cospi[63], bf0[32], cospi[1], bf0[63], cos_bit);
  bf1[33] = half_btf(cospi[31], bf0[33], cospi[33], bf0[62], cos_bit);
  bf1[34] = half_btf(cospi[47], bf0[34], cospi[17], bf0[61], cos_bit);
  bf1[35] = half_btf(cospi[15], bf0[35], cospi[49], bf0[60], cos_bit);
  bf1[36] = half_btf(cospi[55], bf0[36], cospi[9], bf0[59], cos_bit);
  bf1[37] = half_btf(cospi[23], bf0[37], cospi[41], bf0[58], cos_bit);
  bf1[38] = half_btf(cospi[39], bf0[38], cospi[25], bf0[57], cos_bit);
  bf1[39] = half_btf(cospi[7], bf0[39], cospi[57], bf0[56], cos_bit);
  bf1[40] = half_btf(cospi[59], bf0[40], cospi[5], bf0[55], cos_bit);
  bf1[41] = half_btf(cospi[27], bf0[41], cospi[37], bf0[54], cos_bit);
  bf1[42] = half_btf(cospi[43], bf0[42], cospi[21], bf0[53], cos_bit);
  bf1[43] = half_btf(cospi[11], bf0[43], cospi[53], bf0[52], cos_bit);
  bf1[44] = half_btf(cospi[51], bf0[44], cospi[13], bf0[51], cos_bit);
  bf1[45] = half_btf(cospi[19], bf0[45], cospi[45], bf0[50], cos_bit);
  bf1[46] = half_btf(cospi[35], bf0[46], cospi[29], bf0[49], cos_bit);
  bf1[47] = half_btf(cospi[3], bf0[47], cospi[61], bf0[48], cos_bit);
  bf1[48] = half_btf(cospi[3], bf0[48], -cospi[61], bf0[47], cos_bit);
  bf1[49] = half_btf(cospi[35], bf0[49], -cospi[29], bf0[46], cos_bit);
  bf1[50] = half_btf(cospi[19], bf0[50], -cospi[45], bf0[45], cos_bit);
  bf1[51] = half_btf(cospi[51], bf0[51], -cospi[13], bf0[44], cos_bit);
  bf1[52] = half_btf(cospi[11], bf0[52], -cospi[53], bf0[43], cos_bit);
  bf1[53] = half_btf(cospi[43], bf0[53], -cospi[21], bf0[42], cos_bit);
  bf1[54] = half_btf(cospi[27], bf0[54], -cospi[37], bf0[41], cos_bit);
  bf1[55] = half_btf(cospi[59], bf0[55], -cospi[5], bf0[40], cos_bit);
  bf1[56] = half_btf(cospi[7], bf0[56], -cospi[57], bf0[39], cos_bit);
  bf1[57] = half_btf(cospi[39], bf0[57], -cospi[25], bf0[38], cos_bit);
  bf1[58] = half_btf(cospi[23], bf0[58], -cospi[41], bf0[37], cos_bit);
  bf1[59] = half_btf(cospi[55], bf0[59], -cospi[9], bf0[36], cos_bit);
  bf1[60] = half_btf(cospi[15], bf0[60], -cospi[49], bf0[35], cos_bit);
  bf1[61] = half_btf(cospi[47], bf0[61], -cospi[17], bf0[34], cos_bit);
  bf1[62] = half_btf(cospi[31], bf0[62], -cospi[33], bf0[33], cos_bit);
  bf1[63] = half_btf(cospi[63], bf0[63], -cospi[1], bf0[32], cos_bit);
  range_check(stage, input, bf1, size, stage_range[stage]);

  // stage 11
  stage++;
  bf0 = step;
  bf1 = output;
  bf1[0] = bf0[0];
  bf1[1] = bf0[32];
  bf1[2] = bf0[16];
  bf1[3] = bf0[48];
  bf1[4] = bf0[8];
  bf1[5] = bf0[40];
  bf1[6] = bf0[24];
  bf1[7] = bf0[56];
  bf1[8] = bf0[4];
  bf1[9] = bf0[36];
  bf1[10] = bf0[20];
  bf1[11] = bf0[52];
  bf1[12] = bf0[12];
  bf1[13] = bf0[44];
  bf1[14] = bf0[28];
  bf1[15] = bf0[60];
  bf1[16] = bf0[2];
  bf1[17] = bf0[34];
  bf1[18] = bf0[18];
  bf1[19] = bf0[50];
  bf1[20] = bf0[10];
  bf1[21] = bf0[42];
  bf1[22] = bf0[26];
  bf1[23] = bf0[58];
  bf1[24] = bf0[6];
  bf1[25] = bf0[38];
  bf1[26] = bf0[22];
  bf1[27] = bf0[54];
  bf1[28] = bf0[14];
  bf1[29] = bf0[46];
  bf1[30] = bf0[30];
  bf1[31] = bf0[62];
  bf1[32] = bf0[1];
  bf1[33] = bf0[33];
  bf1[34] = bf0[17];
  bf1[35] = bf0[49];
  bf1[36] = bf0[9];
  bf1[37] = bf0[41];
  bf1[38] = bf0[25];
  bf1[39] = bf0[57];
  bf1[40] = bf0[5];
  bf1[41] = bf0[37];
  bf1[42] = bf0[21];
  bf1[43] = bf0[53];
  bf1[44] = bf0[13];
  bf1[45] = bf0[45];
  bf1[46] = bf0[29];
  bf1[47] = bf0[61];
  bf1[48] = bf0[3];
  bf1[49] = bf0[35];
  bf1[50] = bf0[19];
  bf1[51] = bf0[51];
  bf1[52] = bf0[11];
  bf1[53] = bf0[43];
  bf1[54] = bf0[27];
  bf1[55] = bf0[59];
  bf1[56] = bf0[7];
  bf1[57] = bf0[39];
  bf1[58] = bf0[23];
  bf1[59] = bf0[55];
  bf1[60] = bf0[15];
  bf1[61] = bf0[47];
  bf1[62] = bf0[31];
  bf1[63] = bf0[63];
  range_check(stage, input, bf1, size, stage_range[stage]);
  /*  
  output[0] =  + ((128 * input[0])>>(10)) + ((128 * input[1])>>(10)) + ((128 * input[2])>>(10)) + ((128 * input[3])>>(10)) + ((128 * input[4])>>(10)) + ((128 * input[5])>>(10)) + ((128 * input[6])>>(10)) + ((128 * input[7])>>(10)) + ((128 * input[8])>>(10)) + ((128 * input[9])>>(10)) + ((128 * input[10])>>(10)) + ((128 * input[11])>>(10)) + ((128 * input[12])>>(10)) + ((128 * input[13])>>(10)) + ((128 * input[14])>>(10)) + ((128 * input[15])>>(10)) + ((128 * input[16])>>(10)) + ((128 * input[17])>>(10)) + ((128 * input[18])>>(10)) + ((128 * input[19])>>(10)) + ((128 * input[20])>>(10)) + ((128 * input[21])>>(10)) + ((128 * input[22])>>(10)) + ((128 * input[23])>>(10)) + ((128 * input[24])>>(10)) + ((128 * input[25])>>(10)) + ((128 * input[26])>>(10)) + ((128 * input[27])>>(10)) + ((128 * input[28])>>(10)) + ((128 * input[29])>>(10)) + ((128 * input[30])>>(10)) + ((128 * input[31])>>(10)) + ((128 * input[32])>>(10)) + ((128 * input[33])>>(10)) + ((128 * input[34])>>(10)) + ((128 * input[35])>>(10)) + ((128 * input[36])>>(10)) + ((128 * input[37])>>(10)) + ((128 * input[38])>>(10)) + ((128 * input[39])>>(10)) + ((128 * input[40])>>(10)) + ((128 * input[41])>>(10)) + ((128 * input[42])>>(10)) + ((128 * input[43])>>(10)) + ((128 * input[44])>>(10)) + ((128 * input[45])>>(10)) + ((128 * input[46])>>(10)) + ((128 * input[47])>>(10)) + ((128 * input[48])>>(10)) + ((128 * input[49])>>(10)) + ((128 * input[50])>>(10)) + ((128 * input[51])>>(10)) + ((128 * input[52])>>(10)) + ((128 * input[53])>>(10)) + ((128 * input[54])>>(10)) + ((128 * input[55])>>(10)) + ((128 * input[56])>>(10)) + ((128 * input[57])>>(10)) + ((128 * input[58])>>(10)) + ((128 * input[59])>>(10)) + ((128 * input[60])>>(10)) + ((128 * input[61])>>(10)) + ((128 * input[62])>>(10)) + ((128 * input[63])>>(10));
  output[1] =  + ((181 * input[0])>>(10)) + ((181 * input[1])>>(10)) + ((180 * input[2])>>(10)) + ((178 * input[3])>>(10)) + ((177 * input[4])>>(10)) + ((174 * input[5])>>(10)) + ((172 * input[6])>>(10)) + ((169 * input[7])>>(10)) + ((165 * input[8])>>(10)) + ((162 * input[9])>>(10)) + ((158 * input[10])>>(10)) + ((153 * input[11])>>(10)) + ((148 * input[12])>>(10)) + ((143 * input[13])>>(10)) + ((137 * input[14])>>(10)) + ((131 * input[15])>>(10)) + ((125 * input[16])>>(10)) + ((118 * input[17])>>(10)) + ((111 * input[18])>>(10)) + ((104 * input[19])>>(10)) + ((97 * input[20])>>(10)) + ((89 * input[21])>>(10)) + ((81 * input[22])>>(10)) + ((73 * input[23])>>(10)) + ((65 * input[24])>>(10)) + ((57 * input[25])>>(10)) + ((48 * input[26])>>(10)) + ((40 * input[27])>>(10)) + ((31 * input[28])>>(10)) + ((22 * input[29])>>(10)) + ((13 * input[30])>>(10)) + ((4 * input[31])>>(10)) - ((4 * input[32])>>(10)) - ((13 * input[33])>>(10)) - ((22 * input[34])>>(10)) - ((31 * input[35])>>(10)) - ((40 * input[36])>>(10)) - ((48 * input[37])>>(10)) - ((57 * input[38])>>(10)) - ((65 * input[39])>>(10)) - ((73 * input[40])>>(10)) - ((81 * input[41])>>(10)) - ((89 * input[42])>>(10)) - ((97 * input[43])>>(10)) - ((104 * input[44])>>(10)) - ((111 * input[45])>>(10)) - ((118 * input[46])>>(10)) - ((125 * input[47])>>(10)) - ((131 * input[48])>>(10)) - ((137 * input[49])>>(10)) - ((143 * input[50])>>(10)) - ((148 * input[51])>>(10)) - ((153 * input[52])>>(10)) - ((158 * input[53])>>(10)) - ((162 * input[54])>>(10)) - ((165 * input[55])>>(10)) - ((169 * input[56])>>(10)) - ((172 * input[57])>>(10)) - ((174 * input[58])>>(10)) - ((177 * input[59])>>(10)) - ((178 * input[60])>>(10)) - ((180 * input[61])>>(10)) - ((181 * input[62])>>(10)) - ((181 * input[63])>>(10));
  output[2] =  + ((181 * input[0])>>(10)) + ((179 * input[1])>>(10)) + ((176 * input[2])>>(10)) + ((170 * input[3])>>(10)) + ((164 * input[4])>>(10)) + ((155 * input[5])>>(10)) + ((145 * input[6])>>(10)) + ((134 * input[7])>>(10)) + ((122 * input[8])>>(10)) + ((108 * input[9])>>(10)) + ((93 * input[10])>>(10)) + ((77 * input[11])>>(10)) + ((61 * input[12])>>(10)) + ((44 * input[13])>>(10)) + ((27 * input[14])>>(10)) + ((9 * input[15])>>(10)) - ((9 * input[16])>>(10)) - ((27 * input[17])>>(10)) - ((44 * input[18])>>(10)) - ((61 * input[19])>>(10)) - ((77 * input[20])>>(10)) - ((93 * input[21])>>(10)) - ((108 * input[22])>>(10)) - ((122 * input[23])>>(10)) - ((134 * input[24])>>(10)) - ((145 * input[25])>>(10)) - ((155 * input[26])>>(10)) - ((164 * input[27])>>(10)) - ((170 * input[28])>>(10)) - ((176 * input[29])>>(10)) - ((179 * input[30])>>(10)) - ((181 * input[31])>>(10)) - ((181 * input[32])>>(10)) - ((179 * input[33])>>(10)) - ((176 * input[34])>>(10)) - ((170 * input[35])>>(10)) - ((164 * input[36])>>(10)) - ((155 * input[37])>>(10)) - ((145 * input[38])>>(10)) - ((134 * input[39])>>(10)) - ((122 * input[40])>>(10)) - ((108 * input[41])>>(10)) - ((93 * input[42])>>(10)) - ((77 * input[43])>>(10)) - ((61 * input[44])>>(10)) - ((44 * input[45])>>(10)) - ((27 * input[46])>>(10)) - ((9 * input[47])>>(10)) + ((9 * input[48])>>(10)) + ((27 * input[49])>>(10)) + ((44 * input[50])>>(10)) + ((61 * input[51])>>(10)) + ((77 * input[52])>>(10)) + ((93 * input[53])>>(10)) + ((108 * input[54])>>(10)) + ((122 * input[55])>>(10)) + ((134 * input[56])>>(10)) + ((145 * input[57])>>(10)) + ((155 * input[58])>>(10)) + ((164 * input[59])>>(10)) + ((170 * input[60])>>(10)) + ((176 * input[61])>>(10)) + ((179 * input[62])>>(10)) + ((181 * input[63])>>(10));
  output[3] =  + ((181 * input[0])>>(10)) + ((177 * input[1])>>(10)) + ((169 * input[2])>>(10)) + ((158 * input[3])>>(10)) + ((143 * input[4])>>(10)) + ((125 * input[5])>>(10)) + ((104 * input[6])>>(10)) + ((81 * input[7])>>(10)) + ((57 * input[8])>>(10)) + ((31 * input[9])>>(10)) + ((4 * input[10])>>(10)) - ((22 * input[11])>>(10)) - ((48 * input[12])>>(10)) - ((73 * input[13])>>(10)) - ((97 * input[14])>>(10)) - ((118 * input[15])>>(10)) - ((137 * input[16])>>(10)) - ((153 * input[17])>>(10)) - ((165 * input[18])>>(10)) - ((174 * input[19])>>(10)) - ((180 * input[20])>>(10)) - ((181 * input[21])>>(10)) - ((178 * input[22])>>(10)) - ((172 * input[23])>>(10)) - ((162 * input[24])>>(10)) - ((148 * input[25])>>(10)) - ((131 * input[26])>>(10)) - ((111 * input[27])>>(10)) - ((89 * input[28])>>(10)) - ((65 * input[29])>>(10)) - ((40 * input[30])>>(10)) - ((13 * input[31])>>(10)) + ((13 * input[32])>>(10)) + ((40 * input[33])>>(10)) + ((65 * input[34])>>(10)) + ((89 * input[35])>>(10)) + ((111 * input[36])>>(10)) + ((131 * input[37])>>(10)) + ((148 * input[38])>>(10)) + ((162 * input[39])>>(10)) + ((172 * input[40])>>(10)) + ((178 * input[41])>>(10)) + ((181 * input[42])>>(10)) + ((180 * input[43])>>(10)) + ((174 * input[44])>>(10)) + ((165 * input[45])>>(10)) + ((153 * input[46])>>(10)) + ((137 * input[47])>>(10)) + ((118 * input[48])>>(10)) + ((97 * input[49])>>(10)) + ((73 * input[50])>>(10)) + ((48 * input[51])>>(10)) + ((22 * input[52])>>(10)) - ((4 * input[53])>>(10)) - ((31 * input[54])>>(10)) - ((57 * input[55])>>(10)) - ((81 * input[56])>>(10)) - ((104 * input[57])>>(10)) - ((125 * input[58])>>(10)) - ((143 * input[59])>>(10)) - ((158 * input[60])>>(10)) - ((169 * input[61])>>(10)) - ((177 * input[62])>>(10)) - ((181 * input[63])>>(10));
  output[4] =  + ((180 * input[0])>>(10)) + ((173 * input[1])>>(10)) + ((160 * input[2])>>(10)) + ((140 * input[3])>>(10)) + ((115 * input[4])>>(10)) + ((85 * input[5])>>(10)) + ((53 * input[6])>>(10)) + ((18 * input[7])>>(10)) - ((18 * input[8])>>(10)) - ((53 * input[9])>>(10)) - ((85 * input[10])>>(10)) - ((115 * input[11])>>(10)) - ((140 * input[12])>>(10)) - ((160 * input[13])>>(10)) - ((173 * input[14])>>(10)) - ((180 * input[15])>>(10)) - ((180 * input[16])>>(10)) - ((173 * input[17])>>(10)) - ((160 * input[18])>>(10)) - ((140 * input[19])>>(10)) - ((115 * input[20])>>(10)) - ((85 * input[21])>>(10)) - ((53 * input[22])>>(10)) - ((18 * input[23])>>(10)) + ((18 * input[24])>>(10)) + ((53 * input[25])>>(10)) + ((85 * input[26])>>(10)) + ((115 * input[27])>>(10)) + ((140 * input[28])>>(10)) + ((160 * input[29])>>(10)) + ((173 * input[30])>>(10)) + ((180 * input[31])>>(10)) + ((180 * input[32])>>(10)) + ((173 * input[33])>>(10)) + ((160 * input[34])>>(10)) + ((140 * input[35])>>(10)) + ((115 * input[36])>>(10)) + ((85 * input[37])>>(10)) + ((53 * input[38])>>(10)) + ((18 * input[39])>>(10)) - ((18 * input[40])>>(10)) - ((53 * input[41])>>(10)) - ((85 * input[42])>>(10)) - ((115 * input[43])>>(10)) - ((140 * input[44])>>(10)) - ((160 * input[45])>>(10)) - ((173 * input[46])>>(10)) - ((180 * input[47])>>(10)) - ((180 * input[48])>>(10)) - ((173 * input[49])>>(10)) - ((160 * input[50])>>(10)) - ((140 * input[51])>>(10)) - ((115 * input[52])>>(10)) - ((85 * input[53])>>(10)) - ((53 * input[54])>>(10)) - ((18 * input[55])>>(10)) + ((18 * input[56])>>(10)) + ((53 * input[57])>>(10)) + ((85 * input[58])>>(10)) + ((115 * input[59])>>(10)) + ((140 * input[60])>>(10)) + ((160 * input[61])>>(10)) + ((173 * input[62])>>(10)) + ((180 * input[63])>>(10));
  output[5] =  + ((180 * input[0])>>(10)) + ((169 * input[1])>>(10)) + ((148 * input[2])>>(10)) + ((118 * input[3])>>(10)) + ((81 * input[4])>>(10)) + ((40 * input[5])>>(10)) - ((4 * input[6])>>(10)) - ((48 * input[7])>>(10)) - ((89 * input[8])>>(10)) - ((125 * input[9])>>(10)) - ((153 * input[10])>>(10)) - ((172 * input[11])>>(10)) - ((181 * input[12])>>(10)) - ((178 * input[13])>>(10)) - ((165 * input[14])>>(10)) - ((143 * input[15])>>(10)) - ((111 * input[16])>>(10)) - ((73 * input[17])>>(10)) - ((31 * input[18])>>(10)) + ((13 * input[19])>>(10)) + ((57 * input[20])>>(10)) + ((97 * input[21])>>(10)) + ((131 * input[22])>>(10)) + ((158 * input[23])>>(10)) + ((174 * input[24])>>(10)) + ((181 * input[25])>>(10)) + ((177 * input[26])>>(10)) + ((162 * input[27])>>(10)) + ((137 * input[28])>>(10)) + ((104 * input[29])>>(10)) + ((65 * input[30])>>(10)) + ((22 * input[31])>>(10)) - ((22 * input[32])>>(10)) - ((65 * input[33])>>(10)) - ((104 * input[34])>>(10)) - ((137 * input[35])>>(10)) - ((162 * input[36])>>(10)) - ((177 * input[37])>>(10)) - ((181 * input[38])>>(10)) - ((174 * input[39])>>(10)) - ((158 * input[40])>>(10)) - ((131 * input[41])>>(10)) - ((97 * input[42])>>(10)) - ((57 * input[43])>>(10)) - ((13 * input[44])>>(10)) + ((31 * input[45])>>(10)) + ((73 * input[46])>>(10)) + ((111 * input[47])>>(10)) + ((143 * input[48])>>(10)) + ((165 * input[49])>>(10)) + ((178 * input[50])>>(10)) + ((181 * input[51])>>(10)) + ((172 * input[52])>>(10)) + ((153 * input[53])>>(10)) + ((125 * input[54])>>(10)) + ((89 * input[55])>>(10)) + ((48 * input[56])>>(10)) + ((4 * input[57])>>(10)) - ((40 * input[58])>>(10)) - ((81 * input[59])>>(10)) - ((118 * input[60])>>(10)) - ((148 * input[61])>>(10)) - ((169 * input[62])>>(10)) - ((180 * input[63])>>(10));
  output[6] =  + ((179 * input[0])>>(10)) + ((164 * input[1])>>(10)) + ((134 * input[2])>>(10)) + ((93 * input[3])>>(10)) + ((44 * input[4])>>(10)) - ((9 * input[5])>>(10)) - ((61 * input[6])>>(10)) - ((108 * input[7])>>(10)) - ((145 * input[8])>>(10)) - ((170 * input[9])>>(10)) - ((181 * input[10])>>(10)) - ((176 * input[11])>>(10)) - ((155 * input[12])>>(10)) - ((122 * input[13])>>(10)) - ((77 * input[14])>>(10)) - ((27 * input[15])>>(10)) + ((27 * input[16])>>(10)) + ((77 * input[17])>>(10)) + ((122 * input[18])>>(10)) + ((155 * input[19])>>(10)) + ((176 * input[20])>>(10)) + ((181 * input[21])>>(10)) + ((170 * input[22])>>(10)) + ((145 * input[23])>>(10)) + ((108 * input[24])>>(10)) + ((61 * input[25])>>(10)) + ((9 * input[26])>>(10)) - ((44 * input[27])>>(10)) - ((93 * input[28])>>(10)) - ((134 * input[29])>>(10)) - ((164 * input[30])>>(10)) - ((179 * input[31])>>(10)) - ((179 * input[32])>>(10)) - ((164 * input[33])>>(10)) - ((134 * input[34])>>(10)) - ((93 * input[35])>>(10)) - ((44 * input[36])>>(10)) + ((9 * input[37])>>(10)) + ((61 * input[38])>>(10)) + ((108 * input[39])>>(10)) + ((145 * input[40])>>(10)) + ((170 * input[41])>>(10)) + ((181 * input[42])>>(10)) + ((176 * input[43])>>(10)) + ((155 * input[44])>>(10)) + ((122 * input[45])>>(10)) + ((77 * input[46])>>(10)) + ((27 * input[47])>>(10)) - ((27 * input[48])>>(10)) - ((77 * input[49])>>(10)) - ((122 * input[50])>>(10)) - ((155 * input[51])>>(10)) - ((176 * input[52])>>(10)) - ((181 * input[53])>>(10)) - ((170 * input[54])>>(10)) - ((145 * input[55])>>(10)) - ((108 * input[56])>>(10)) - ((61 * input[57])>>(10)) - ((9 * input[58])>>(10)) + ((44 * input[59])>>(10)) + ((93 * input[60])>>(10)) + ((134 * input[61])>>(10)) + ((164 * input[62])>>(10)) + ((179 * input[63])>>(10));
  output[7] =  + ((178 * input[0])>>(10)) + ((158 * input[1])>>(10)) + ((118 * input[2])>>(10)) + ((65 * input[3])>>(10)) + ((4 * input[4])>>(10)) - ((57 * input[5])>>(10)) - ((111 * input[6])>>(10)) - ((153 * input[7])>>(10)) - ((177 * input[8])>>(10)) - ((180 * input[9])>>(10)) - ((162 * input[10])>>(10)) - ((125 * input[11])>>(10)) - ((73 * input[12])>>(10)) - ((13 * input[13])>>(10)) + ((48 * input[14])>>(10)) + ((104 * input[15])>>(10)) + ((148 * input[16])>>(10)) + ((174 * input[17])>>(10)) + ((181 * input[18])>>(10)) + ((165 * input[19])>>(10)) + ((131 * input[20])>>(10)) + ((81 * input[21])>>(10)) + ((22 * input[22])>>(10)) - ((40 * input[23])>>(10)) - ((97 * input[24])>>(10)) - ((143 * input[25])>>(10)) - ((172 * input[26])>>(10)) - ((181 * input[27])>>(10)) - ((169 * input[28])>>(10)) - ((137 * input[29])>>(10)) - ((89 * input[30])>>(10)) - ((31 * input[31])>>(10)) + ((31 * input[32])>>(10)) + ((89 * input[33])>>(10)) + ((137 * input[34])>>(10)) + ((169 * input[35])>>(10)) + ((181 * input[36])>>(10)) + ((172 * input[37])>>(10)) + ((143 * input[38])>>(10)) + ((97 * input[39])>>(10)) + ((40 * input[40])>>(10)) - ((22 * input[41])>>(10)) - ((81 * input[42])>>(10)) - ((131 * input[43])>>(10)) - ((165 * input[44])>>(10)) - ((181 * input[45])>>(10)) - ((174 * input[46])>>(10)) - ((148 * input[47])>>(10)) - ((104 * input[48])>>(10)) - ((48 * input[49])>>(10)) + ((13 * input[50])>>(10)) + ((73 * input[51])>>(10)) + ((125 * input[52])>>(10)) + ((162 * input[53])>>(10)) + ((180 * input[54])>>(10)) + ((177 * input[55])>>(10)) + ((153 * input[56])>>(10)) + ((111 * input[57])>>(10)) + ((57 * input[58])>>(10)) - ((4 * input[59])>>(10)) - ((65 * input[60])>>(10)) - ((118 * input[61])>>(10)) - ((158 * input[62])>>(10)) - ((178 * input[63])>>(10));
  output[8] =  + ((178 * input[0])>>(10)) + ((151 * input[1])>>(10)) + ((101 * input[2])>>(10)) + ((35 * input[3])>>(10)) - ((35 * input[4])>>(10)) - ((101 * input[5])>>(10)) - ((151 * input[6])>>(10)) - ((178 * input[7])>>(10)) - ((178 * input[8])>>(10)) - ((151 * input[9])>>(10)) - ((101 * input[10])>>(10)) - ((35 * input[11])>>(10)) + ((35 * input[12])>>(10)) + ((101 * input[13])>>(10)) + ((151 * input[14])>>(10)) + ((178 * input[15])>>(10)) + ((178 * input[16])>>(10)) + ((151 * input[17])>>(10)) + ((101 * input[18])>>(10)) + ((35 * input[19])>>(10)) - ((35 * input[20])>>(10)) - ((101 * input[21])>>(10)) - ((151 * input[22])>>(10)) - ((178 * input[23])>>(10)) - ((178 * input[24])>>(10)) - ((151 * input[25])>>(10)) - ((101 * input[26])>>(10)) - ((35 * input[27])>>(10)) + ((35 * input[28])>>(10)) + ((101 * input[29])>>(10)) + ((151 * input[30])>>(10)) + ((178 * input[31])>>(10)) + ((178 * input[32])>>(10)) + ((151 * input[33])>>(10)) + ((101 * input[34])>>(10)) + ((35 * input[35])>>(10)) - ((35 * input[36])>>(10)) - ((101 * input[37])>>(10)) - ((151 * input[38])>>(10)) - ((178 * input[39])>>(10)) - ((178 * input[40])>>(10)) - ((151 * input[41])>>(10)) - ((101 * input[42])>>(10)) - ((35 * input[43])>>(10)) + ((35 * input[44])>>(10)) + ((101 * input[45])>>(10)) + ((151 * input[46])>>(10)) + ((178 * input[47])>>(10)) + ((178 * input[48])>>(10)) + ((151 * input[49])>>(10)) + ((101 * input[50])>>(10)) + ((35 * input[51])>>(10)) - ((35 * input[52])>>(10)) - ((101 * input[53])>>(10)) - ((151 * input[54])>>(10)) - ((178 * input[55])>>(10)) - ((178 * input[56])>>(10)) - ((151 * input[57])>>(10)) - ((101 * input[58])>>(10)) - ((35 * input[59])>>(10)) + ((35 * input[60])>>(10)) + ((101 * input[61])>>(10)) + ((151 * input[62])>>(10)) + ((178 * input[63])>>(10));
  output[9] =  + ((177 * input[0])>>(10)) + ((143 * input[1])>>(10)) + ((81 * input[2])>>(10)) + ((4 * input[3])>>(10)) - ((73 * input[4])>>(10)) - ((137 * input[5])>>(10)) - ((174 * input[6])>>(10)) - ((178 * input[7])>>(10)) - ((148 * input[8])>>(10)) - ((89 * input[9])>>(10)) - ((13 * input[10])>>(10)) + ((65 * input[11])>>(10)) + ((131 * input[12])>>(10)) + ((172 * input[13])>>(10)) + ((180 * input[14])>>(10)) + ((153 * input[15])>>(10)) + ((97 * input[16])>>(10)) + ((22 * input[17])>>(10)) - ((57 * input[18])>>(10)) - ((125 * input[19])>>(10)) - ((169 * input[20])>>(10)) - ((181 * input[21])>>(10)) - ((158 * input[22])>>(10)) - ((104 * input[23])>>(10)) - ((31 * input[24])>>(10)) + ((48 * input[25])>>(10)) + ((118 * input[26])>>(10)) + ((165 * input[27])>>(10)) + ((181 * input[28])>>(10)) + ((162 * input[29])>>(10)) + ((111 * input[30])>>(10)) + ((40 * input[31])>>(10)) - ((40 * input[32])>>(10)) - ((111 * input[33])>>(10)) - ((162 * input[34])>>(10)) - ((181 * input[35])>>(10)) - ((165 * input[36])>>(10)) - ((118 * input[37])>>(10)) - ((48 * input[38])>>(10)) + ((31 * input[39])>>(10)) + ((104 * input[40])>>(10)) + ((158 * input[41])>>(10)) + ((181 * input[42])>>(10)) + ((169 * input[43])>>(10)) + ((125 * input[44])>>(10)) + ((57 * input[45])>>(10)) - ((22 * input[46])>>(10)) - ((97 * input[47])>>(10)) - ((153 * input[48])>>(10)) - ((180 * input[49])>>(10)) - ((172 * input[50])>>(10)) - ((131 * input[51])>>(10)) - ((65 * input[52])>>(10)) + ((13 * input[53])>>(10)) + ((89 * input[54])>>(10)) + ((148 * input[55])>>(10)) + ((178 * input[56])>>(10)) + ((174 * input[57])>>(10)) + ((137 * input[58])>>(10)) + ((73 * input[59])>>(10)) - ((4 * input[60])>>(10)) - ((81 * input[61])>>(10)) - ((143 * input[62])>>(10)) - ((177 * input[63])>>(10));
  output[10] =  + ((176 * input[0])>>(10)) + ((134 * input[1])>>(10)) + ((61 * input[2])>>(10)) - ((27 * input[3])>>(10)) - ((108 * input[4])>>(10)) - ((164 * input[5])>>(10)) - ((181 * input[6])>>(10)) - ((155 * input[7])>>(10)) - ((93 * input[8])>>(10)) - ((9 * input[9])>>(10)) + ((77 * input[10])>>(10)) + ((145 * input[11])>>(10)) + ((179 * input[12])>>(10)) + ((170 * input[13])>>(10)) + ((122 * input[14])>>(10)) + ((44 * input[15])>>(10)) - ((44 * input[16])>>(10)) - ((122 * input[17])>>(10)) - ((170 * input[18])>>(10)) - ((179 * input[19])>>(10)) - ((145 * input[20])>>(10)) - ((77 * input[21])>>(10)) + ((9 * input[22])>>(10)) + ((93 * input[23])>>(10)) + ((155 * input[24])>>(10)) + ((181 * input[25])>>(10)) + ((164 * input[26])>>(10)) + ((108 * input[27])>>(10)) + ((27 * input[28])>>(10)) - ((61 * input[29])>>(10)) - ((134 * input[30])>>(10)) - ((176 * input[31])>>(10)) - ((176 * input[32])>>(10)) - ((134 * input[33])>>(10)) - ((61 * input[34])>>(10)) + ((27 * input[35])>>(10)) + ((108 * input[36])>>(10)) + ((164 * input[37])>>(10)) + ((181 * input[38])>>(10)) + ((155 * input[39])>>(10)) + ((93 * input[40])>>(10)) + ((9 * input[41])>>(10)) - ((77 * input[42])>>(10)) - ((145 * input[43])>>(10)) - ((179 * input[44])>>(10)) - ((170 * input[45])>>(10)) - ((122 * input[46])>>(10)) - ((44 * input[47])>>(10)) + ((44 * input[48])>>(10)) + ((122 * input[49])>>(10)) + ((170 * input[50])>>(10)) + ((179 * input[51])>>(10)) + ((145 * input[52])>>(10)) + ((77 * input[53])>>(10)) - ((9 * input[54])>>(10)) - ((93 * input[55])>>(10)) - ((155 * input[56])>>(10)) - ((181 * input[57])>>(10)) - ((164 * input[58])>>(10)) - ((108 * input[59])>>(10)) - ((27 * input[60])>>(10)) + ((61 * input[61])>>(10)) + ((134 * input[62])>>(10)) + ((176 * input[63])>>(10));
  output[11] =  + ((174 * input[0])>>(10)) + ((125 * input[1])>>(10)) + ((40 * input[2])>>(10)) - ((57 * input[3])>>(10)) - ((137 * input[4])>>(10)) - ((178 * input[5])>>(10)) - ((169 * input[6])>>(10)) - ((111 * input[7])>>(10)) - ((22 * input[8])>>(10)) + ((73 * input[9])>>(10)) + ((148 * input[10])>>(10)) + ((181 * input[11])>>(10)) + ((162 * input[12])>>(10)) + ((97 * input[13])>>(10)) + ((4 * input[14])>>(10)) - ((89 * input[15])>>(10)) - ((158 * input[16])>>(10)) - ((181 * input[17])>>(10)) - ((153 * input[18])>>(10)) - ((81 * input[19])>>(10)) + ((13 * input[20])>>(10)) + ((104 * input[21])>>(10)) + ((165 * input[22])>>(10)) + ((180 * input[23])>>(10)) + ((143 * input[24])>>(10)) + ((65 * input[25])>>(10)) - ((31 * input[26])>>(10)) - ((118 * input[27])>>(10)) - ((172 * input[28])>>(10)) - ((177 * input[29])>>(10)) - ((131 * input[30])>>(10)) - ((48 * input[31])>>(10)) + ((48 * input[32])>>(10)) + ((131 * input[33])>>(10)) + ((177 * input[34])>>(10)) + ((172 * input[35])>>(10)) + ((118 * input[36])>>(10)) + ((31 * input[37])>>(10)) - ((65 * input[38])>>(10)) - ((143 * input[39])>>(10)) - ((180 * input[40])>>(10)) - ((165 * input[41])>>(10)) - ((104 * input[42])>>(10)) - ((13 * input[43])>>(10)) + ((81 * input[44])>>(10)) + ((153 * input[45])>>(10)) + ((181 * input[46])>>(10)) + ((158 * input[47])>>(10)) + ((89 * input[48])>>(10)) - ((4 * input[49])>>(10)) - ((97 * input[50])>>(10)) - ((162 * input[51])>>(10)) - ((181 * input[52])>>(10)) - ((148 * input[53])>>(10)) - ((73 * input[54])>>(10)) + ((22 * input[55])>>(10)) + ((111 * input[56])>>(10)) + ((169 * input[57])>>(10)) + ((178 * input[58])>>(10)) + ((137 * input[59])>>(10)) + ((57 * input[60])>>(10)) - ((40 * input[61])>>(10)) - ((125 * input[62])>>(10)) - ((174 * input[63])>>(10));
  output[12] =  + ((173 * input[0])>>(10)) + ((115 * input[1])>>(10)) + ((18 * input[2])>>(10)) - ((85 * input[3])>>(10)) - ((160 * input[4])>>(10)) - ((180 * input[5])>>(10)) - ((140 * input[6])>>(10)) - ((53 * input[7])>>(10)) + ((53 * input[8])>>(10)) + ((140 * input[9])>>(10)) + ((180 * input[10])>>(10)) + ((160 * input[11])>>(10)) + ((85 * input[12])>>(10)) - ((18 * input[13])>>(10)) - ((115 * input[14])>>(10)) - ((173 * input[15])>>(10)) - ((173 * input[16])>>(10)) - ((115 * input[17])>>(10)) - ((18 * input[18])>>(10)) + ((85 * input[19])>>(10)) + ((160 * input[20])>>(10)) + ((180 * input[21])>>(10)) + ((140 * input[22])>>(10)) + ((53 * input[23])>>(10)) - ((53 * input[24])>>(10)) - ((140 * input[25])>>(10)) - ((180 * input[26])>>(10)) - ((160 * input[27])>>(10)) - ((85 * input[28])>>(10)) + ((18 * input[29])>>(10)) + ((115 * input[30])>>(10)) + ((173 * input[31])>>(10)) + ((173 * input[32])>>(10)) + ((115 * input[33])>>(10)) + ((18 * input[34])>>(10)) - ((85 * input[35])>>(10)) - ((160 * input[36])>>(10)) - ((180 * input[37])>>(10)) - ((140 * input[38])>>(10)) - ((53 * input[39])>>(10)) + ((53 * input[40])>>(10)) + ((140 * input[41])>>(10)) + ((180 * input[42])>>(10)) + ((160 * input[43])>>(10)) + ((85 * input[44])>>(10)) - ((18 * input[45])>>(10)) - ((115 * input[46])>>(10)) - ((173 * input[47])>>(10)) - ((173 * input[48])>>(10)) - ((115 * input[49])>>(10)) - ((18 * input[50])>>(10)) + ((85 * input[51])>>(10)) + ((160 * input[52])>>(10)) + ((180 * input[53])>>(10)) + ((140 * input[54])>>(10)) + ((53 * input[55])>>(10)) - ((53 * input[56])>>(10)) - ((140 * input[57])>>(10)) - ((180 * input[58])>>(10)) - ((160 * input[59])>>(10)) - ((85 * input[60])>>(10)) + ((18 * input[61])>>(10)) + ((115 * input[62])>>(10)) + ((173 * input[63])>>(10));
  output[13] =  + ((172 * input[0])>>(10)) + ((104 * input[1])>>(10)) - ((4 * input[2])>>(10)) - ((111 * input[3])>>(10)) - ((174 * input[4])>>(10)) - ((169 * input[5])>>(10)) - ((97 * input[6])>>(10)) + ((13 * input[7])>>(10)) + ((118 * input[8])>>(10)) + ((177 * input[9])>>(10)) + ((165 * input[10])>>(10)) + ((89 * input[11])>>(10)) - ((22 * input[12])>>(10)) - ((125 * input[13])>>(10)) - ((178 * input[14])>>(10)) - ((162 * input[15])>>(10)) - ((81 * input[16])>>(10)) + ((31 * input[17])>>(10)) + ((131 * input[18])>>(10)) + ((180 * input[19])>>(10)) + ((158 * input[20])>>(10)) + ((73 * input[21])>>(10)) - ((40 * input[22])>>(10)) - ((137 * input[23])>>(10)) - ((181 * input[24])>>(10)) - ((153 * input[25])>>(10)) - ((65 * input[26])>>(10)) + ((48 * input[27])>>(10)) + ((143 * input[28])>>(10)) + ((181 * input[29])>>(10)) + ((148 * input[30])>>(10)) + ((57 * input[31])>>(10)) - ((57 * input[32])>>(10)) - ((148 * input[33])>>(10)) - ((181 * input[34])>>(10)) - ((143 * input[35])>>(10)) - ((48 * input[36])>>(10)) + ((65 * input[37])>>(10)) + ((153 * input[38])>>(10)) + ((181 * input[39])>>(10)) + ((137 * input[40])>>(10)) + ((40 * input[41])>>(10)) - ((73 * input[42])>>(10)) - ((158 * input[43])>>(10)) - ((180 * input[44])>>(10)) - ((131 * input[45])>>(10)) - ((31 * input[46])>>(10)) + ((81 * input[47])>>(10)) + ((162 * input[48])>>(10)) + ((178 * input[49])>>(10)) + ((125 * input[50])>>(10)) + ((22 * input[51])>>(10)) - ((89 * input[52])>>(10)) - ((165 * input[53])>>(10)) - ((177 * input[54])>>(10)) - ((118 * input[55])>>(10)) - ((13 * input[56])>>(10)) + ((97 * input[57])>>(10)) + ((169 * input[58])>>(10)) + ((174 * input[59])>>(10)) + ((111 * input[60])>>(10)) + ((4 * input[61])>>(10)) - ((104 * input[62])>>(10)) - ((172 * input[63])>>(10));
  output[14] =  + ((170 * input[0])>>(10)) + ((93 * input[1])>>(10)) - ((27 * input[2])>>(10)) - ((134 * input[3])>>(10)) - ((181 * input[4])>>(10)) - ((145 * input[5])>>(10)) - ((44 * input[6])>>(10)) + ((77 * input[7])>>(10)) + ((164 * input[8])>>(10)) + ((176 * input[9])>>(10)) + ((108 * input[10])>>(10)) - ((9 * input[11])>>(10)) - ((122 * input[12])>>(10)) - ((179 * input[13])>>(10)) - ((155 * input[14])>>(10)) - ((61 * input[15])>>(10)) + ((61 * input[16])>>(10)) + ((155 * input[17])>>(10)) + ((179 * input[18])>>(10)) + ((122 * input[19])>>(10)) + ((9 * input[20])>>(10)) - ((108 * input[21])>>(10)) - ((176 * input[22])>>(10)) - ((164 * input[23])>>(10)) - ((77 * input[24])>>(10)) + ((44 * input[25])>>(10)) + ((145 * input[26])>>(10)) + ((181 * input[27])>>(10)) + ((134 * input[28])>>(10)) + ((27 * input[29])>>(10)) - ((93 * input[30])>>(10)) - ((170 * input[31])>>(10)) - ((170 * input[32])>>(10)) - ((93 * input[33])>>(10)) + ((27 * input[34])>>(10)) + ((134 * input[35])>>(10)) + ((181 * input[36])>>(10)) + ((145 * input[37])>>(10)) + ((44 * input[38])>>(10)) - ((77 * input[39])>>(10)) - ((164 * input[40])>>(10)) - ((176 * input[41])>>(10)) - ((108 * input[42])>>(10)) + ((9 * input[43])>>(10)) + ((122 * input[44])>>(10)) + ((179 * input[45])>>(10)) + ((155 * input[46])>>(10)) + ((61 * input[47])>>(10)) - ((61 * input[48])>>(10)) - ((155 * input[49])>>(10)) - ((179 * input[50])>>(10)) - ((122 * input[51])>>(10)) - ((9 * input[52])>>(10)) + ((108 * input[53])>>(10)) + ((176 * input[54])>>(10)) + ((164 * input[55])>>(10)) + ((77 * input[56])>>(10)) - ((44 * input[57])>>(10)) - ((145 * input[58])>>(10)) - ((181 * input[59])>>(10)) - ((134 * input[60])>>(10)) - ((27 * input[61])>>(10)) + ((93 * input[62])>>(10)) + ((170 * input[63])>>(10));
  output[15] =  + ((169 * input[0])>>(10)) + ((81 * input[1])>>(10)) - ((48 * input[2])>>(10)) - ((153 * input[3])>>(10)) - ((178 * input[4])>>(10)) - ((111 * input[5])>>(10)) + ((13 * input[6])>>(10)) + ((131 * input[7])>>(10)) + ((181 * input[8])>>(10)) + ((137 * input[9])>>(10)) + ((22 * input[10])>>(10)) - ((104 * input[11])>>(10)) - ((177 * input[12])>>(10)) - ((158 * input[13])>>(10)) - ((57 * input[14])>>(10)) + ((73 * input[15])>>(10)) + ((165 * input[16])>>(10)) + ((172 * input[17])>>(10)) + ((89 * input[18])>>(10)) - ((40 * input[19])>>(10)) - ((148 * input[20])>>(10)) - ((180 * input[21])>>(10)) - ((118 * input[22])>>(10)) + ((4 * input[23])>>(10)) + ((125 * input[24])>>(10)) + ((181 * input[25])>>(10)) + ((143 * input[26])>>(10)) + ((31 * input[27])>>(10)) - ((97 * input[28])>>(10)) - ((174 * input[29])>>(10)) - ((162 * input[30])>>(10)) - ((65 * input[31])>>(10)) + ((65 * input[32])>>(10)) + ((162 * input[33])>>(10)) + ((174 * input[34])>>(10)) + ((97 * input[35])>>(10)) - ((31 * input[36])>>(10)) - ((143 * input[37])>>(10)) - ((181 * input[38])>>(10)) - ((125 * input[39])>>(10)) - ((4 * input[40])>>(10)) + ((118 * input[41])>>(10)) + ((180 * input[42])>>(10)) + ((148 * input[43])>>(10)) + ((40 * input[44])>>(10)) - ((89 * input[45])>>(10)) - ((172 * input[46])>>(10)) - ((165 * input[47])>>(10)) - ((73 * input[48])>>(10)) + ((57 * input[49])>>(10)) + ((158 * input[50])>>(10)) + ((177 * input[51])>>(10)) + ((104 * input[52])>>(10)) - ((22 * input[53])>>(10)) - ((137 * input[54])>>(10)) - ((181 * input[55])>>(10)) - ((131 * input[56])>>(10)) - ((13 * input[57])>>(10)) + ((111 * input[58])>>(10)) + ((178 * input[59])>>(10)) + ((153 * input[60])>>(10)) + ((48 * input[61])>>(10)) - ((81 * input[62])>>(10)) - ((169 * input[63])>>(10));
  output[16] =  + ((167 * input[0])>>(10)) + ((69 * input[1])>>(10)) - ((69 * input[2])>>(10)) - ((167 * input[3])>>(10)) - ((167 * input[4])>>(10)) - ((69 * input[5])>>(10)) + ((69 * input[6])>>(10)) + ((167 * input[7])>>(10)) + ((167 * input[8])>>(10)) + ((69 * input[9])>>(10)) - ((69 * input[10])>>(10)) - ((167 * input[11])>>(10)) - ((167 * input[12])>>(10)) - ((69 * input[13])>>(10)) + ((69 * input[14])>>(10)) + ((167 * input[15])>>(10)) + ((167 * input[16])>>(10)) + ((69 * input[17])>>(10)) - ((69 * input[18])>>(10)) - ((167 * input[19])>>(10)) - ((167 * input[20])>>(10)) - ((69 * input[21])>>(10)) + ((69 * input[22])>>(10)) + ((167 * input[23])>>(10)) + ((167 * input[24])>>(10)) + ((69 * input[25])>>(10)) - ((69 * input[26])>>(10)) - ((167 * input[27])>>(10)) - ((167 * input[28])>>(10)) - ((69 * input[29])>>(10)) + ((69 * input[30])>>(10)) + ((167 * input[31])>>(10)) + ((167 * input[32])>>(10)) + ((69 * input[33])>>(10)) - ((69 * input[34])>>(10)) - ((167 * input[35])>>(10)) - ((167 * input[36])>>(10)) - ((69 * input[37])>>(10)) + ((69 * input[38])>>(10)) + ((167 * input[39])>>(10)) + ((167 * input[40])>>(10)) + ((69 * input[41])>>(10)) - ((69 * input[42])>>(10)) - ((167 * input[43])>>(10)) - ((167 * input[44])>>(10)) - ((69 * input[45])>>(10)) + ((69 * input[46])>>(10)) + ((167 * input[47])>>(10)) + ((167 * input[48])>>(10)) + ((69 * input[49])>>(10)) - ((69 * input[50])>>(10)) - ((167 * input[51])>>(10)) - ((167 * input[52])>>(10)) - ((69 * input[53])>>(10)) + ((69 * input[54])>>(10)) + ((167 * input[55])>>(10)) + ((167 * input[56])>>(10)) + ((69 * input[57])>>(10)) - ((69 * input[58])>>(10)) - ((167 * input[59])>>(10)) - ((167 * input[60])>>(10)) - ((69 * input[61])>>(10)) + ((69 * input[62])>>(10)) + ((167 * input[63])>>(10));
  output[17] =  + ((165 * input[0])>>(10)) + ((57 * input[1])>>(10)) - ((89 * input[2])>>(10)) - ((177 * input[3])>>(10)) - ((148 * input[4])>>(10)) - ((22 * input[5])>>(10)) + ((118 * input[6])>>(10)) + ((181 * input[7])>>(10)) + ((125 * input[8])>>(10)) - ((13 * input[9])>>(10)) - ((143 * input[10])>>(10)) - ((178 * input[11])>>(10)) - ((97 * input[12])>>(10)) + ((48 * input[13])>>(10)) + ((162 * input[14])>>(10)) + ((169 * input[15])>>(10)) + ((65 * input[16])>>(10)) - ((81 * input[17])>>(10)) - ((174 * input[18])>>(10)) - ((153 * input[19])>>(10)) - ((31 * input[20])>>(10)) + ((111 * input[21])>>(10)) + ((181 * input[22])>>(10)) + ((131 * input[23])>>(10)) - ((4 * input[24])>>(10)) - ((137 * input[25])>>(10)) - ((180 * input[26])>>(10)) - ((104 * input[27])>>(10)) + ((40 * input[28])>>(10)) + ((158 * input[29])>>(10)) + ((172 * input[30])>>(10)) + ((73 * input[31])>>(10)) - ((73 * input[32])>>(10)) - ((172 * input[33])>>(10)) - ((158 * input[34])>>(10)) - ((40 * input[35])>>(10)) + ((104 * input[36])>>(10)) + ((180 * input[37])>>(10)) + ((137 * input[38])>>(10)) + ((4 * input[39])>>(10)) - ((131 * input[40])>>(10)) - ((181 * input[41])>>(10)) - ((111 * input[42])>>(10)) + ((31 * input[43])>>(10)) + ((153 * input[44])>>(10)) + ((174 * input[45])>>(10)) + ((81 * input[46])>>(10)) - ((65 * input[47])>>(10)) - ((169 * input[48])>>(10)) - ((162 * input[49])>>(10)) - ((48 * input[50])>>(10)) + ((97 * input[51])>>(10)) + ((178 * input[52])>>(10)) + ((143 * input[53])>>(10)) + ((13 * input[54])>>(10)) - ((125 * input[55])>>(10)) - ((181 * input[56])>>(10)) - ((118 * input[57])>>(10)) + ((22 * input[58])>>(10)) + ((148 * input[59])>>(10)) + ((177 * input[60])>>(10)) + ((89 * input[61])>>(10)) - ((57 * input[62])>>(10)) - ((165 * input[63])>>(10));
  output[18] =  + ((164 * input[0])>>(10)) + ((44 * input[1])>>(10)) - ((108 * input[2])>>(10)) - ((181 * input[3])>>(10)) - ((122 * input[4])>>(10)) + ((27 * input[5])>>(10)) + ((155 * input[6])>>(10)) + ((170 * input[7])>>(10)) + ((61 * input[8])>>(10)) - ((93 * input[9])>>(10)) - ((179 * input[10])>>(10)) - ((134 * input[11])>>(10)) + ((9 * input[12])>>(10)) + ((145 * input[13])>>(10)) + ((176 * input[14])>>(10)) + ((77 * input[15])>>(10)) - ((77 * input[16])>>(10)) - ((176 * input[17])>>(10)) - ((145 * input[18])>>(10)) - ((9 * input[19])>>(10)) + ((134 * input[20])>>(10)) + ((179 * input[21])>>(10)) + ((93 * input[22])>>(10)) - ((61 * input[23])>>(10)) - ((170 * input[24])>>(10)) - ((155 * input[25])>>(10)) - ((27 * input[26])>>(10)) + ((122 * input[27])>>(10)) + ((181 * input[28])>>(10)) + ((108 * input[29])>>(10)) - ((44 * input[30])>>(10)) - ((164 * input[31])>>(10)) - ((164 * input[32])>>(10)) - ((44 * input[33])>>(10)) + ((108 * input[34])>>(10)) + ((181 * input[35])>>(10)) + ((122 * input[36])>>(10)) - ((27 * input[37])>>(10)) - ((155 * input[38])>>(10)) - ((170 * input[39])>>(10)) - ((61 * input[40])>>(10)) + ((93 * input[41])>>(10)) + ((179 * input[42])>>(10)) + ((134 * input[43])>>(10)) - ((9 * input[44])>>(10)) - ((145 * input[45])>>(10)) - ((176 * input[46])>>(10)) - ((77 * input[47])>>(10)) + ((77 * input[48])>>(10)) + ((176 * input[49])>>(10)) + ((145 * input[50])>>(10)) + ((9 * input[51])>>(10)) - ((134 * input[52])>>(10)) - ((179 * input[53])>>(10)) - ((93 * input[54])>>(10)) + ((61 * input[55])>>(10)) + ((170 * input[56])>>(10)) + ((155 * input[57])>>(10)) + ((27 * input[58])>>(10)) - ((122 * input[59])>>(10)) - ((181 * input[60])>>(10)) - ((108 * input[61])>>(10)) + ((44 * input[62])>>(10)) + ((164 * input[63])>>(10));
  output[19] =  + ((162 * input[0])>>(10)) + ((31 * input[1])>>(10)) - ((125 * input[2])>>(10)) - ((180 * input[3])>>(10)) - ((89 * input[4])>>(10)) + ((73 * input[5])>>(10)) + ((177 * input[6])>>(10)) + ((137 * input[7])>>(10)) - ((13 * input[8])>>(10)) - ((153 * input[9])>>(10)) - ((169 * input[10])>>(10)) - ((48 * input[11])>>(10)) + ((111 * input[12])>>(10)) + ((181 * input[13])>>(10)) + ((104 * input[14])>>(10)) - ((57 * input[15])>>(10)) - ((172 * input[16])>>(10)) - ((148 * input[17])>>(10)) - ((4 * input[18])>>(10)) + ((143 * input[19])>>(10)) + ((174 * input[20])>>(10)) + ((65 * input[21])>>(10)) - ((97 * input[22])>>(10)) - ((181 * input[23])>>(10)) - ((118 * input[24])>>(10)) + ((40 * input[25])>>(10)) + ((165 * input[26])>>(10)) + ((158 * input[27])>>(10)) + ((22 * input[28])>>(10)) - ((131 * input[29])>>(10)) - ((178 * input[30])>>(10)) - ((81 * input[31])>>(10)) + ((81 * input[32])>>(10)) + ((178 * input[33])>>(10)) + ((131 * input[34])>>(10)) - ((22 * input[35])>>(10)) - ((158 * input[36])>>(10)) - ((165 * input[37])>>(10)) - ((40 * input[38])>>(10)) + ((118 * input[39])>>(10)) + ((181 * input[40])>>(10)) + ((97 * input[41])>>(10)) - ((65 * input[42])>>(10)) - ((174 * input[43])>>(10)) - ((143 * input[44])>>(10)) + ((4 * input[45])>>(10)) + ((148 * input[46])>>(10)) + ((172 * input[47])>>(10)) + ((57 * input[48])>>(10)) - ((104 * input[49])>>(10)) - ((181 * input[50])>>(10)) - ((111 * input[51])>>(10)) + ((48 * input[52])>>(10)) + ((169 * input[53])>>(10)) + ((153 * input[54])>>(10)) + ((13 * input[55])>>(10)) - ((137 * input[56])>>(10)) - ((177 * input[57])>>(10)) - ((73 * input[58])>>(10)) + ((89 * input[59])>>(10)) + ((180 * input[60])>>(10)) + ((125 * input[61])>>(10)) - ((31 * input[62])>>(10)) - ((162 * input[63])>>(10));
  output[20] =  + ((160 * input[0])>>(10)) + ((18 * input[1])>>(10)) - ((140 * input[2])>>(10)) - ((173 * input[3])>>(10)) - ((53 * input[4])>>(10)) + ((115 * input[5])>>(10)) + ((180 * input[6])>>(10)) + ((85 * input[7])>>(10)) - ((85 * input[8])>>(10)) - ((180 * input[9])>>(10)) - ((115 * input[10])>>(10)) + ((53 * input[11])>>(10)) + ((173 * input[12])>>(10)) + ((140 * input[13])>>(10)) - ((18 * input[14])>>(10)) - ((160 * input[15])>>(10)) - ((160 * input[16])>>(10)) - ((18 * input[17])>>(10)) + ((140 * input[18])>>(10)) + ((173 * input[19])>>(10)) + ((53 * input[20])>>(10)) - ((115 * input[21])>>(10)) - ((180 * input[22])>>(10)) - ((85 * input[23])>>(10)) + ((85 * input[24])>>(10)) + ((180 * input[25])>>(10)) + ((115 * input[26])>>(10)) - ((53 * input[27])>>(10)) - ((173 * input[28])>>(10)) - ((140 * input[29])>>(10)) + ((18 * input[30])>>(10)) + ((160 * input[31])>>(10)) + ((160 * input[32])>>(10)) + ((18 * input[33])>>(10)) - ((140 * input[34])>>(10)) - ((173 * input[35])>>(10)) - ((53 * input[36])>>(10)) + ((115 * input[37])>>(10)) + ((180 * input[38])>>(10)) + ((85 * input[39])>>(10)) - ((85 * input[40])>>(10)) - ((180 * input[41])>>(10)) - ((115 * input[42])>>(10)) + ((53 * input[43])>>(10)) + ((173 * input[44])>>(10)) + ((140 * input[45])>>(10)) - ((18 * input[46])>>(10)) - ((160 * input[47])>>(10)) - ((160 * input[48])>>(10)) - ((18 * input[49])>>(10)) + ((140 * input[50])>>(10)) + ((173 * input[51])>>(10)) + ((53 * input[52])>>(10)) - ((115 * input[53])>>(10)) - ((180 * input[54])>>(10)) - ((85 * input[55])>>(10)) + ((85 * input[56])>>(10)) + ((180 * input[57])>>(10)) + ((115 * input[58])>>(10)) - ((53 * input[59])>>(10)) - ((173 * input[60])>>(10)) - ((140 * input[61])>>(10)) + ((18 * input[62])>>(10)) + ((160 * input[63])>>(10));
  output[21] =  + ((158 * input[0])>>(10)) + ((4 * input[1])>>(10)) - ((153 * input[2])>>(10)) - ((162 * input[3])>>(10)) - ((13 * input[4])>>(10)) + ((148 * input[5])>>(10)) + ((165 * input[6])>>(10)) + ((22 * input[7])>>(10)) - ((143 * input[8])>>(10)) - ((169 * input[9])>>(10)) - ((31 * input[10])>>(10)) + ((137 * input[11])>>(10)) + ((172 * input[12])>>(10)) + ((40 * input[13])>>(10)) - ((131 * input[14])>>(10)) - ((174 * input[15])>>(10)) - ((48 * input[16])>>(10)) + ((125 * input[17])>>(10)) + ((177 * input[18])>>(10)) + ((57 * input[19])>>(10)) - ((118 * input[20])>>(10)) - ((178 * input[21])>>(10)) - ((65 * input[22])>>(10)) + ((111 * input[23])>>(10)) + ((180 * input[24])>>(10)) + ((73 * input[25])>>(10)) - ((104 * input[26])>>(10)) - ((181 * input[27])>>(10)) - ((81 * input[28])>>(10)) + ((97 * input[29])>>(10)) + ((181 * input[30])>>(10)) + ((89 * input[31])>>(10)) - ((89 * input[32])>>(10)) - ((181 * input[33])>>(10)) - ((97 * input[34])>>(10)) + ((81 * input[35])>>(10)) + ((181 * input[36])>>(10)) + ((104 * input[37])>>(10)) - ((73 * input[38])>>(10)) - ((180 * input[39])>>(10)) - ((111 * input[40])>>(10)) + ((65 * input[41])>>(10)) + ((178 * input[42])>>(10)) + ((118 * input[43])>>(10)) - ((57 * input[44])>>(10)) - ((177 * input[45])>>(10)) - ((125 * input[46])>>(10)) + ((48 * input[47])>>(10)) + ((174 * input[48])>>(10)) + ((131 * input[49])>>(10)) - ((40 * input[50])>>(10)) - ((172 * input[51])>>(10)) - ((137 * input[52])>>(10)) + ((31 * input[53])>>(10)) + ((169 * input[54])>>(10)) + ((143 * input[55])>>(10)) - ((22 * input[56])>>(10)) - ((165 * input[57])>>(10)) - ((148 * input[58])>>(10)) + ((13 * input[59])>>(10)) + ((162 * input[60])>>(10)) + ((153 * input[61])>>(10)) - ((4 * input[62])>>(10)) - ((158 * input[63])>>(10));
  output[22] =  + ((155 * input[0])>>(10)) - ((9 * input[1])>>(10)) - ((164 * input[2])>>(10)) - ((145 * input[3])>>(10)) + ((27 * input[4])>>(10)) + ((170 * input[5])>>(10)) + ((134 * input[6])>>(10)) - ((44 * input[7])>>(10)) - ((176 * input[8])>>(10)) - ((122 * input[9])>>(10)) + ((61 * input[10])>>(10)) + ((179 * input[11])>>(10)) + ((108 * input[12])>>(10)) - ((77 * input[13])>>(10)) - ((181 * input[14])>>(10)) - ((93 * input[15])>>(10)) + ((93 * input[16])>>(10)) + ((181 * input[17])>>(10)) + ((77 * input[18])>>(10)) - ((108 * input[19])>>(10)) - ((179 * input[20])>>(10)) - ((61 * input[21])>>(10)) + ((122 * input[22])>>(10)) + ((176 * input[23])>>(10)) + ((44 * input[24])>>(10)) - ((134 * input[25])>>(10)) - ((170 * input[26])>>(10)) - ((27 * input[27])>>(10)) + ((145 * input[28])>>(10)) + ((164 * input[29])>>(10)) + ((9 * input[30])>>(10)) - ((155 * input[31])>>(10)) - ((155 * input[32])>>(10)) + ((9 * input[33])>>(10)) + ((164 * input[34])>>(10)) + ((145 * input[35])>>(10)) - ((27 * input[36])>>(10)) - ((170 * input[37])>>(10)) - ((134 * input[38])>>(10)) + ((44 * input[39])>>(10)) + ((176 * input[40])>>(10)) + ((122 * input[41])>>(10)) - ((61 * input[42])>>(10)) - ((179 * input[43])>>(10)) - ((108 * input[44])>>(10)) + ((77 * input[45])>>(10)) + ((181 * input[46])>>(10)) + ((93 * input[47])>>(10)) - ((93 * input[48])>>(10)) - ((181 * input[49])>>(10)) - ((77 * input[50])>>(10)) + ((108 * input[51])>>(10)) + ((179 * input[52])>>(10)) + ((61 * input[53])>>(10)) - ((122 * input[54])>>(10)) - ((176 * input[55])>>(10)) - ((44 * input[56])>>(10)) + ((134 * input[57])>>(10)) + ((170 * input[58])>>(10)) + ((27 * input[59])>>(10)) - ((145 * input[60])>>(10)) - ((164 * input[61])>>(10)) - ((9 * input[62])>>(10)) + ((155 * input[63])>>(10));
  output[23] =  + ((153 * input[0])>>(10)) - ((22 * input[1])>>(10)) - ((172 * input[2])>>(10)) - ((125 * input[3])>>(10)) + ((65 * input[4])>>(10)) + ((181 * input[5])>>(10)) + ((89 * input[6])>>(10)) - ((104 * input[7])>>(10)) - ((178 * input[8])>>(10)) - ((48 * input[9])>>(10)) + ((137 * input[10])>>(10)) + ((165 * input[11])>>(10)) + ((4 * input[12])>>(10)) - ((162 * input[13])>>(10)) - ((143 * input[14])>>(10)) + ((40 * input[15])>>(10)) + ((177 * input[16])>>(10)) + ((111 * input[17])>>(10)) - ((81 * input[18])>>(10)) - ((181 * input[19])>>(10)) - ((73 * input[20])>>(10)) + ((118 * input[21])>>(10)) + ((174 * input[22])>>(10)) + ((31 * input[23])>>(10)) - ((148 * input[24])>>(10)) - ((158 * input[25])>>(10)) + ((13 * input[26])>>(10)) + ((169 * input[27])>>(10)) + ((131 * input[28])>>(10)) - ((57 * input[29])>>(10)) - ((180 * input[30])>>(10)) - ((97 * input[31])>>(10)) + ((97 * input[32])>>(10)) + ((180 * input[33])>>(10)) + ((57 * input[34])>>(10)) - ((131 * input[35])>>(10)) - ((169 * input[36])>>(10)) - ((13 * input[37])>>(10)) + ((158 * input[38])>>(10)) + ((148 * input[39])>>(10)) - ((31 * input[40])>>(10)) - ((174 * input[41])>>(10)) - ((118 * input[42])>>(10)) + ((73 * input[43])>>(10)) + ((181 * input[44])>>(10)) + ((81 * input[45])>>(10)) - ((111 * input[46])>>(10)) - ((177 * input[47])>>(10)) - ((40 * input[48])>>(10)) + ((143 * input[49])>>(10)) + ((162 * input[50])>>(10)) - ((4 * input[51])>>(10)) - ((165 * input[52])>>(10)) - ((137 * input[53])>>(10)) + ((48 * input[54])>>(10)) + ((178 * input[55])>>(10)) + ((104 * input[56])>>(10)) - ((89 * input[57])>>(10)) - ((181 * input[58])>>(10)) - ((65 * input[59])>>(10)) + ((125 * input[60])>>(10)) + ((172 * input[61])>>(10)) + ((22 * input[62])>>(10)) - ((153 * input[63])>>(10));
  output[24] =  + ((151 * input[0])>>(10)) - ((35 * input[1])>>(10)) - ((178 * input[2])>>(10)) - ((101 * input[3])>>(10)) + ((101 * input[4])>>(10)) + ((178 * input[5])>>(10)) + ((35 * input[6])>>(10)) - ((151 * input[7])>>(10)) - ((151 * input[8])>>(10)) + ((35 * input[9])>>(10)) + ((178 * input[10])>>(10)) + ((101 * input[11])>>(10)) - ((101 * input[12])>>(10)) - ((178 * input[13])>>(10)) - ((35 * input[14])>>(10)) + ((151 * input[15])>>(10)) + ((151 * input[16])>>(10)) - ((35 * input[17])>>(10)) - ((178 * input[18])>>(10)) - ((101 * input[19])>>(10)) + ((101 * input[20])>>(10)) + ((178 * input[21])>>(10)) + ((35 * input[22])>>(10)) - ((151 * input[23])>>(10)) - ((151 * input[24])>>(10)) + ((35 * input[25])>>(10)) + ((178 * input[26])>>(10)) + ((101 * input[27])>>(10)) - ((101 * input[28])>>(10)) - ((178 * input[29])>>(10)) - ((35 * input[30])>>(10)) + ((151 * input[31])>>(10)) + ((151 * input[32])>>(10)) - ((35 * input[33])>>(10)) - ((178 * input[34])>>(10)) - ((101 * input[35])>>(10)) + ((101 * input[36])>>(10)) + ((178 * input[37])>>(10)) + ((35 * input[38])>>(10)) - ((151 * input[39])>>(10)) - ((151 * input[40])>>(10)) + ((35 * input[41])>>(10)) + ((178 * input[42])>>(10)) + ((101 * input[43])>>(10)) - ((101 * input[44])>>(10)) - ((178 * input[45])>>(10)) - ((35 * input[46])>>(10)) + ((151 * input[47])>>(10)) + ((151 * input[48])>>(10)) - ((35 * input[49])>>(10)) - ((178 * input[50])>>(10)) - ((101 * input[51])>>(10)) + ((101 * input[52])>>(10)) + ((178 * input[53])>>(10)) + ((35 * input[54])>>(10)) - ((151 * input[55])>>(10)) - ((151 * input[56])>>(10)) + ((35 * input[57])>>(10)) + ((178 * input[58])>>(10)) + ((101 * input[59])>>(10)) - ((101 * input[60])>>(10)) - ((178 * input[61])>>(10)) - ((35 * input[62])>>(10)) + ((151 * input[63])>>(10));
  output[25] =  + ((148 * input[0])>>(10)) - ((48 * input[1])>>(10)) - ((181 * input[2])>>(10)) - ((73 * input[3])>>(10)) + ((131 * input[4])>>(10)) + ((162 * input[5])>>(10)) - ((22 * input[6])>>(10)) - ((177 * input[7])>>(10)) - ((97 * input[8])>>(10)) + ((111 * input[9])>>(10)) + ((172 * input[10])>>(10)) + ((4 * input[11])>>(10)) - ((169 * input[12])>>(10)) - ((118 * input[13])>>(10)) + ((89 * input[14])>>(10)) + ((178 * input[15])>>(10)) + ((31 * input[16])>>(10)) - ((158 * input[17])>>(10)) - ((137 * input[18])>>(10)) + ((65 * input[19])>>(10)) + ((181 * input[20])>>(10)) + ((57 * input[21])>>(10)) - ((143 * input[22])>>(10)) - ((153 * input[23])>>(10)) + ((40 * input[24])>>(10)) + ((180 * input[25])>>(10)) + ((81 * input[26])>>(10)) - ((125 * input[27])>>(10)) - ((165 * input[28])>>(10)) + ((13 * input[29])>>(10)) + ((174 * input[30])>>(10)) + ((104 * input[31])>>(10)) - ((104 * input[32])>>(10)) - ((174 * input[33])>>(10)) - ((13 * input[34])>>(10)) + ((165 * input[35])>>(10)) + ((125 * input[36])>>(10)) - ((81 * input[37])>>(10)) - ((180 * input[38])>>(10)) - ((40 * input[39])>>(10)) + ((153 * input[40])>>(10)) + ((143 * input[41])>>(10)) - ((57 * input[42])>>(10)) - ((181 * input[43])>>(10)) - ((65 * input[44])>>(10)) + ((137 * input[45])>>(10)) + ((158 * input[46])>>(10)) - ((31 * input[47])>>(10)) - ((178 * input[48])>>(10)) - ((89 * input[49])>>(10)) + ((118 * input[50])>>(10)) + ((169 * input[51])>>(10)) - ((4 * input[52])>>(10)) - ((172 * input[53])>>(10)) - ((111 * input[54])>>(10)) + ((97 * input[55])>>(10)) + ((177 * input[56])>>(10)) + ((22 * input[57])>>(10)) - ((162 * input[58])>>(10)) - ((131 * input[59])>>(10)) + ((73 * input[60])>>(10)) + ((181 * input[61])>>(10)) + ((48 * input[62])>>(10)) - ((148 * input[63])>>(10));
  output[26] =  + ((145 * input[0])>>(10)) - ((61 * input[1])>>(10)) - ((181 * input[2])>>(10)) - ((44 * input[3])>>(10)) + ((155 * input[4])>>(10)) + ((134 * input[5])>>(10)) - ((77 * input[6])>>(10)) - ((179 * input[7])>>(10)) - ((27 * input[8])>>(10)) + ((164 * input[9])>>(10)) + ((122 * input[10])>>(10)) - ((93 * input[11])>>(10)) - ((176 * input[12])>>(10)) - ((9 * input[13])>>(10)) + ((170 * input[14])>>(10)) + ((108 * input[15])>>(10)) - ((108 * input[16])>>(10)) - ((170 * input[17])>>(10)) + ((9 * input[18])>>(10)) + ((176 * input[19])>>(10)) + ((93 * input[20])>>(10)) - ((122 * input[21])>>(10)) - ((164 * input[22])>>(10)) + ((27 * input[23])>>(10)) + ((179 * input[24])>>(10)) + ((77 * input[25])>>(10)) - ((134 * input[26])>>(10)) - ((155 * input[27])>>(10)) + ((44 * input[28])>>(10)) + ((181 * input[29])>>(10)) + ((61 * input[30])>>(10)) - ((145 * input[31])>>(10)) - ((145 * input[32])>>(10)) + ((61 * input[33])>>(10)) + ((181 * input[34])>>(10)) + ((44 * input[35])>>(10)) - ((155 * input[36])>>(10)) - ((134 * input[37])>>(10)) + ((77 * input[38])>>(10)) + ((179 * input[39])>>(10)) + ((27 * input[40])>>(10)) - ((164 * input[41])>>(10)) - ((122 * input[42])>>(10)) + ((93 * input[43])>>(10)) + ((176 * input[44])>>(10)) + ((9 * input[45])>>(10)) - ((170 * input[46])>>(10)) - ((108 * input[47])>>(10)) + ((108 * input[48])>>(10)) + ((170 * input[49])>>(10)) - ((9 * input[50])>>(10)) - ((176 * input[51])>>(10)) - ((93 * input[52])>>(10)) + ((122 * input[53])>>(10)) + ((164 * input[54])>>(10)) - ((27 * input[55])>>(10)) - ((179 * input[56])>>(10)) - ((77 * input[57])>>(10)) + ((134 * input[58])>>(10)) + ((155 * input[59])>>(10)) - ((44 * input[60])>>(10)) - ((181 * input[61])>>(10)) - ((61 * input[62])>>(10)) + ((145 * input[63])>>(10));
  output[27] =  + ((143 * input[0])>>(10)) - ((73 * input[1])>>(10)) - ((178 * input[2])>>(10)) - ((13 * input[3])>>(10)) + ((172 * input[4])>>(10)) + ((97 * input[5])>>(10)) - ((125 * input[6])>>(10)) - ((158 * input[7])>>(10)) + ((48 * input[8])>>(10)) + ((181 * input[9])>>(10)) + ((40 * input[10])>>(10)) - ((162 * input[11])>>(10)) - ((118 * input[12])>>(10)) + ((104 * input[13])>>(10)) + ((169 * input[14])>>(10)) - ((22 * input[15])>>(10)) - ((180 * input[16])>>(10)) - ((65 * input[17])>>(10)) + ((148 * input[18])>>(10)) + ((137 * input[19])>>(10)) - ((81 * input[20])>>(10)) - ((177 * input[21])>>(10)) - ((4 * input[22])>>(10)) + ((174 * input[23])>>(10)) + ((89 * input[24])>>(10)) - ((131 * input[25])>>(10)) - ((153 * input[26])>>(10)) + ((57 * input[27])>>(10)) + ((181 * input[28])>>(10)) + ((31 * input[29])>>(10)) - ((165 * input[30])>>(10)) - ((111 * input[31])>>(10)) + ((111 * input[32])>>(10)) + ((165 * input[33])>>(10)) - ((31 * input[34])>>(10)) - ((181 * input[35])>>(10)) - ((57 * input[36])>>(10)) + ((153 * input[37])>>(10)) + ((131 * input[38])>>(10)) - ((89 * input[39])>>(10)) - ((174 * input[40])>>(10)) + ((4 * input[41])>>(10)) + ((177 * input[42])>>(10)) + ((81 * input[43])>>(10)) - ((137 * input[44])>>(10)) - ((148 * input[45])>>(10)) + ((65 * input[46])>>(10)) + ((180 * input[47])>>(10)) + ((22 * input[48])>>(10)) - ((169 * input[49])>>(10)) - ((104 * input[50])>>(10)) + ((118 * input[51])>>(10)) + ((162 * input[52])>>(10)) - ((40 * input[53])>>(10)) - ((181 * input[54])>>(10)) - ((48 * input[55])>>(10)) + ((158 * input[56])>>(10)) + ((125 * input[57])>>(10)) - ((97 * input[58])>>(10)) - ((172 * input[59])>>(10)) + ((13 * input[60])>>(10)) + ((178 * input[61])>>(10)) + ((73 * input[62])>>(10)) - ((143 * input[63])>>(10));
  output[28] =  + ((140 * input[0])>>(10)) - ((85 * input[1])>>(10)) - ((173 * input[2])>>(10)) + ((18 * input[3])>>(10)) + ((180 * input[4])>>(10)) + ((53 * input[5])>>(10)) - ((160 * input[6])>>(10)) - ((115 * input[7])>>(10)) + ((115 * input[8])>>(10)) + ((160 * input[9])>>(10)) - ((53 * input[10])>>(10)) - ((180 * input[11])>>(10)) - ((18 * input[12])>>(10)) + ((173 * input[13])>>(10)) + ((85 * input[14])>>(10)) - ((140 * input[15])>>(10)) - ((140 * input[16])>>(10)) + ((85 * input[17])>>(10)) + ((173 * input[18])>>(10)) - ((18 * input[19])>>(10)) - ((180 * input[20])>>(10)) - ((53 * input[21])>>(10)) + ((160 * input[22])>>(10)) + ((115 * input[23])>>(10)) - ((115 * input[24])>>(10)) - ((160 * input[25])>>(10)) + ((53 * input[26])>>(10)) + ((180 * input[27])>>(10)) + ((18 * input[28])>>(10)) - ((173 * input[29])>>(10)) - ((85 * input[30])>>(10)) + ((140 * input[31])>>(10)) + ((140 * input[32])>>(10)) - ((85 * input[33])>>(10)) - ((173 * input[34])>>(10)) + ((18 * input[35])>>(10)) + ((180 * input[36])>>(10)) + ((53 * input[37])>>(10)) - ((160 * input[38])>>(10)) - ((115 * input[39])>>(10)) + ((115 * input[40])>>(10)) + ((160 * input[41])>>(10)) - ((53 * input[42])>>(10)) - ((180 * input[43])>>(10)) - ((18 * input[44])>>(10)) + ((173 * input[45])>>(10)) + ((85 * input[46])>>(10)) - ((140 * input[47])>>(10)) - ((140 * input[48])>>(10)) + ((85 * input[49])>>(10)) + ((173 * input[50])>>(10)) - ((18 * input[51])>>(10)) - ((180 * input[52])>>(10)) - ((53 * input[53])>>(10)) + ((160 * input[54])>>(10)) + ((115 * input[55])>>(10)) - ((115 * input[56])>>(10)) - ((160 * input[57])>>(10)) + ((53 * input[58])>>(10)) + ((180 * input[59])>>(10)) + ((18 * input[60])>>(10)) - ((173 * input[61])>>(10)) - ((85 * input[62])>>(10)) + ((140 * input[63])>>(10));
  output[29] =  + ((137 * input[0])>>(10)) - ((97 * input[1])>>(10)) - ((165 * input[2])>>(10)) + ((48 * input[3])>>(10)) + ((180 * input[4])>>(10)) + ((4 * input[5])>>(10)) - ((178 * input[6])>>(10)) - ((57 * input[7])>>(10)) + ((162 * input[8])>>(10)) + ((104 * input[9])>>(10)) - ((131 * input[10])>>(10)) - ((143 * input[11])>>(10)) + ((89 * input[12])>>(10)) + ((169 * input[13])>>(10)) - ((40 * input[14])>>(10)) - ((181 * input[15])>>(10)) - ((13 * input[16])>>(10)) + ((177 * input[17])>>(10)) + ((65 * input[18])>>(10)) - ((158 * input[19])>>(10)) - ((111 * input[20])>>(10)) + ((125 * input[21])>>(10)) + ((148 * input[22])>>(10)) - ((81 * input[23])>>(10)) - ((172 * input[24])>>(10)) + ((31 * input[25])>>(10)) + ((181 * input[26])>>(10)) + ((22 * input[27])>>(10)) - ((174 * input[28])>>(10)) - ((73 * input[29])>>(10)) + ((153 * input[30])>>(10)) + ((118 * input[31])>>(10)) - ((118 * input[32])>>(10)) - ((153 * input[33])>>(10)) + ((73 * input[34])>>(10)) + ((174 * input[35])>>(10)) - ((22 * input[36])>>(10)) - ((181 * input[37])>>(10)) - ((31 * input[38])>>(10)) + ((172 * input[39])>>(10)) + ((81 * input[40])>>(10)) - ((148 * input[41])>>(10)) - ((125 * input[42])>>(10)) + ((111 * input[43])>>(10)) + ((158 * input[44])>>(10)) - ((65 * input[45])>>(10)) - ((177 * input[46])>>(10)) + ((13 * input[47])>>(10)) + ((181 * input[48])>>(10)) + ((40 * input[49])>>(10)) - ((169 * input[50])>>(10)) - ((89 * input[51])>>(10)) + ((143 * input[52])>>(10)) + ((131 * input[53])>>(10)) - ((104 * input[54])>>(10)) - ((162 * input[55])>>(10)) + ((57 * input[56])>>(10)) + ((178 * input[57])>>(10)) - ((4 * input[58])>>(10)) - ((180 * input[59])>>(10)) - ((48 * input[60])>>(10)) + ((165 * input[61])>>(10)) + ((97 * input[62])>>(10)) - ((137 * input[63])>>(10));
  output[30] =  + ((134 * input[0])>>(10)) - ((108 * input[1])>>(10)) - ((155 * input[2])>>(10)) + ((77 * input[3])>>(10)) + ((170 * input[4])>>(10)) - ((44 * input[5])>>(10)) - ((179 * input[6])>>(10)) + ((9 * input[7])>>(10)) + ((181 * input[8])>>(10)) + ((27 * input[9])>>(10)) - ((176 * input[10])>>(10)) - ((61 * input[11])>>(10)) + ((164 * input[12])>>(10)) + ((93 * input[13])>>(10)) - ((145 * input[14])>>(10)) - ((122 * input[15])>>(10)) + ((122 * input[16])>>(10)) + ((145 * input[17])>>(10)) - ((93 * input[18])>>(10)) - ((164 * input[19])>>(10)) + ((61 * input[20])>>(10)) + ((176 * input[21])>>(10)) - ((27 * input[22])>>(10)) - ((181 * input[23])>>(10)) - ((9 * input[24])>>(10)) + ((179 * input[25])>>(10)) + ((44 * input[26])>>(10)) - ((170 * input[27])>>(10)) - ((77 * input[28])>>(10)) + ((155 * input[29])>>(10)) + ((108 * input[30])>>(10)) - ((134 * input[31])>>(10)) - ((134 * input[32])>>(10)) + ((108 * input[33])>>(10)) + ((155 * input[34])>>(10)) - ((77 * input[35])>>(10)) - ((170 * input[36])>>(10)) + ((44 * input[37])>>(10)) + ((179 * input[38])>>(10)) - ((9 * input[39])>>(10)) - ((181 * input[40])>>(10)) - ((27 * input[41])>>(10)) + ((176 * input[42])>>(10)) + ((61 * input[43])>>(10)) - ((164 * input[44])>>(10)) - ((93 * input[45])>>(10)) + ((145 * input[46])>>(10)) + ((122 * input[47])>>(10)) - ((122 * input[48])>>(10)) - ((145 * input[49])>>(10)) + ((93 * input[50])>>(10)) + ((164 * input[51])>>(10)) - ((61 * input[52])>>(10)) - ((176 * input[53])>>(10)) + ((27 * input[54])>>(10)) + ((181 * input[55])>>(10)) + ((9 * input[56])>>(10)) - ((179 * input[57])>>(10)) - ((44 * input[58])>>(10)) + ((170 * input[59])>>(10)) + ((77 * input[60])>>(10)) - ((155 * input[61])>>(10)) - ((108 * input[62])>>(10)) + ((134 * input[63])>>(10));
  output[31] =  + ((131 * input[0])>>(10)) - ((118 * input[1])>>(10)) - ((143 * input[2])>>(10)) + ((104 * input[3])>>(10)) + ((153 * input[4])>>(10)) - ((89 * input[5])>>(10)) - ((162 * input[6])>>(10)) + ((73 * input[7])>>(10)) + ((169 * input[8])>>(10)) - ((57 * input[9])>>(10)) - ((174 * input[10])>>(10)) + ((40 * input[11])>>(10)) + ((178 * input[12])>>(10)) - ((22 * input[13])>>(10)) - ((181 * input[14])>>(10)) + ((4 * input[15])>>(10)) + ((181 * input[16])>>(10)) + ((13 * input[17])>>(10)) - ((180 * input[18])>>(10)) - ((31 * input[19])>>(10)) + ((177 * input[20])>>(10)) + ((48 * input[21])>>(10)) - ((172 * input[22])>>(10)) - ((65 * input[23])>>(10)) + ((165 * input[24])>>(10)) + ((81 * input[25])>>(10)) - ((158 * input[26])>>(10)) - ((97 * input[27])>>(10)) + ((148 * input[28])>>(10)) + ((111 * input[29])>>(10)) - ((137 * input[30])>>(10)) - ((125 * input[31])>>(10)) + ((125 * input[32])>>(10)) + ((137 * input[33])>>(10)) - ((111 * input[34])>>(10)) - ((148 * input[35])>>(10)) + ((97 * input[36])>>(10)) + ((158 * input[37])>>(10)) - ((81 * input[38])>>(10)) - ((165 * input[39])>>(10)) + ((65 * input[40])>>(10)) + ((172 * input[41])>>(10)) - ((48 * input[42])>>(10)) - ((177 * input[43])>>(10)) + ((31 * input[44])>>(10)) + ((180 * input[45])>>(10)) - ((13 * input[46])>>(10)) - ((181 * input[47])>>(10)) - ((4 * input[48])>>(10)) + ((181 * input[49])>>(10)) + ((22 * input[50])>>(10)) - ((178 * input[51])>>(10)) - ((40 * input[52])>>(10)) + ((174 * input[53])>>(10)) + ((57 * input[54])>>(10)) - ((169 * input[55])>>(10)) - ((73 * input[56])>>(10)) + ((162 * input[57])>>(10)) + ((89 * input[58])>>(10)) - ((153 * input[59])>>(10)) - ((104 * input[60])>>(10)) + ((143 * input[61])>>(10)) + ((118 * input[62])>>(10)) - ((131 * input[63])>>(10));
  output[32] =  + ((128 * input[0])>>(10)) - ((128 * input[1])>>(10)) - ((128 * input[2])>>(10)) + ((128 * input[3])>>(10)) + ((128 * input[4])>>(10)) - ((128 * input[5])>>(10)) - ((128 * input[6])>>(10)) + ((128 * input[7])>>(10)) + ((128 * input[8])>>(10)) - ((128 * input[9])>>(10)) - ((128 * input[10])>>(10)) + ((128 * input[11])>>(10)) + ((128 * input[12])>>(10)) - ((128 * input[13])>>(10)) - ((128 * input[14])>>(10)) + ((128 * input[15])>>(10)) + ((128 * input[16])>>(10)) - ((128 * input[17])>>(10)) - ((128 * input[18])>>(10)) + ((128 * input[19])>>(10)) + ((128 * input[20])>>(10)) - ((128 * input[21])>>(10)) - ((128 * input[22])>>(10)) + ((128 * input[23])>>(10)) + ((128 * input[24])>>(10)) - ((128 * input[25])>>(10)) - ((128 * input[26])>>(10)) + ((128 * input[27])>>(10)) + ((128 * input[28])>>(10)) - ((128 * input[29])>>(10)) - ((128 * input[30])>>(10)) + ((128 * input[31])>>(10)) + ((128 * input[32])>>(10)) - ((128 * input[33])>>(10)) - ((128 * input[34])>>(10)) + ((128 * input[35])>>(10)) + ((128 * input[36])>>(10)) - ((128 * input[37])>>(10)) - ((128 * input[38])>>(10)) + ((128 * input[39])>>(10)) + ((128 * input[40])>>(10)) - ((128 * input[41])>>(10)) - ((128 * input[42])>>(10)) + ((128 * input[43])>>(10)) + ((128 * input[44])>>(10)) - ((128 * input[45])>>(10)) - ((128 * input[46])>>(10)) + ((128 * input[47])>>(10)) + ((128 * input[48])>>(10)) - ((128 * input[49])>>(10)) - ((128 * input[50])>>(10)) + ((128 * input[51])>>(10)) + ((128 * input[52])>>(10)) - ((128 * input[53])>>(10)) - ((128 * input[54])>>(10)) + ((128 * input[55])>>(10)) + ((128 * input[56])>>(10)) - ((128 * input[57])>>(10)) - ((128 * input[58])>>(10)) + ((128 * input[59])>>(10)) + ((128 * input[60])>>(10)) - ((128 * input[61])>>(10)) - ((128 * input[62])>>(10)) + ((128 * input[63])>>(10));
  output[33] =  + ((125 * input[0])>>(10)) - ((137 * input[1])>>(10)) - ((111 * input[2])>>(10)) + ((148 * input[3])>>(10)) + ((97 * input[4])>>(10)) - ((158 * input[5])>>(10)) - ((81 * input[6])>>(10)) + ((165 * input[7])>>(10)) + ((65 * input[8])>>(10)) - ((172 * input[9])>>(10)) - ((48 * input[10])>>(10)) + ((177 * input[11])>>(10)) + ((31 * input[12])>>(10)) - ((180 * input[13])>>(10)) - ((13 * input[14])>>(10)) + ((181 * input[15])>>(10)) - ((4 * input[16])>>(10)) - ((181 * input[17])>>(10)) + ((22 * input[18])>>(10)) + ((178 * input[19])>>(10)) - ((40 * input[20])>>(10)) - ((174 * input[21])>>(10)) + ((57 * input[22])>>(10)) + ((169 * input[23])>>(10)) - ((73 * input[24])>>(10)) - ((162 * input[25])>>(10)) + ((89 * input[26])>>(10)) + ((153 * input[27])>>(10)) - ((104 * input[28])>>(10)) - ((143 * input[29])>>(10)) + ((118 * input[30])>>(10)) + ((131 * input[31])>>(10)) - ((131 * input[32])>>(10)) - ((118 * input[33])>>(10)) + ((143 * input[34])>>(10)) + ((104 * input[35])>>(10)) - ((153 * input[36])>>(10)) - ((89 * input[37])>>(10)) + ((162 * input[38])>>(10)) + ((73 * input[39])>>(10)) - ((169 * input[40])>>(10)) - ((57 * input[41])>>(10)) + ((174 * input[42])>>(10)) + ((40 * input[43])>>(10)) - ((178 * input[44])>>(10)) - ((22 * input[45])>>(10)) + ((181 * input[46])>>(10)) + ((4 * input[47])>>(10)) - ((181 * input[48])>>(10)) + ((13 * input[49])>>(10)) + ((180 * input[50])>>(10)) - ((31 * input[51])>>(10)) - ((177 * input[52])>>(10)) + ((48 * input[53])>>(10)) + ((172 * input[54])>>(10)) - ((65 * input[55])>>(10)) - ((165 * input[56])>>(10)) + ((81 * input[57])>>(10)) + ((158 * input[58])>>(10)) - ((97 * input[59])>>(10)) - ((148 * input[60])>>(10)) + ((111 * input[61])>>(10)) + ((137 * input[62])>>(10)) - ((125 * input[63])>>(10));
  output[34] =  + ((122 * input[0])>>(10)) - ((145 * input[1])>>(10)) - ((93 * input[2])>>(10)) + ((164 * input[3])>>(10)) + ((61 * input[4])>>(10)) - ((176 * input[5])>>(10)) - ((27 * input[6])>>(10)) + ((181 * input[7])>>(10)) - ((9 * input[8])>>(10)) - ((179 * input[9])>>(10)) + ((44 * input[10])>>(10)) + ((170 * input[11])>>(10)) - ((77 * input[12])>>(10)) - ((155 * input[13])>>(10)) + ((108 * input[14])>>(10)) + ((134 * input[15])>>(10)) - ((134 * input[16])>>(10)) - ((108 * input[17])>>(10)) + ((155 * input[18])>>(10)) + ((77 * input[19])>>(10)) - ((170 * input[20])>>(10)) - ((44 * input[21])>>(10)) + ((179 * input[22])>>(10)) + ((9 * input[23])>>(10)) - ((181 * input[24])>>(10)) + ((27 * input[25])>>(10)) + ((176 * input[26])>>(10)) - ((61 * input[27])>>(10)) - ((164 * input[28])>>(10)) + ((93 * input[29])>>(10)) + ((145 * input[30])>>(10)) - ((122 * input[31])>>(10)) - ((122 * input[32])>>(10)) + ((145 * input[33])>>(10)) + ((93 * input[34])>>(10)) - ((164 * input[35])>>(10)) - ((61 * input[36])>>(10)) + ((176 * input[37])>>(10)) + ((27 * input[38])>>(10)) - ((181 * input[39])>>(10)) + ((9 * input[40])>>(10)) + ((179 * input[41])>>(10)) - ((44 * input[42])>>(10)) - ((170 * input[43])>>(10)) + ((77 * input[44])>>(10)) + ((155 * input[45])>>(10)) - ((108 * input[46])>>(10)) - ((134 * input[47])>>(10)) + ((134 * input[48])>>(10)) + ((108 * input[49])>>(10)) - ((155 * input[50])>>(10)) - ((77 * input[51])>>(10)) + ((170 * input[52])>>(10)) + ((44 * input[53])>>(10)) - ((179 * input[54])>>(10)) - ((9 * input[55])>>(10)) + ((181 * input[56])>>(10)) - ((27 * input[57])>>(10)) - ((176 * input[58])>>(10)) + ((61 * input[59])>>(10)) + ((164 * input[60])>>(10)) - ((93 * input[61])>>(10)) - ((145 * input[62])>>(10)) + ((122 * input[63])>>(10));
  output[35] =  + ((118 * input[0])>>(10)) - ((153 * input[1])>>(10)) - ((73 * input[2])>>(10)) + ((174 * input[3])>>(10)) + ((22 * input[4])>>(10)) - ((181 * input[5])>>(10)) + ((31 * input[6])>>(10)) + ((172 * input[7])>>(10)) - ((81 * input[8])>>(10)) - ((148 * input[9])>>(10)) + ((125 * input[10])>>(10)) + ((111 * input[11])>>(10)) - ((158 * input[12])>>(10)) - ((65 * input[13])>>(10)) + ((177 * input[14])>>(10)) + ((13 * input[15])>>(10)) - ((181 * input[16])>>(10)) + ((40 * input[17])>>(10)) + ((169 * input[18])>>(10)) - ((89 * input[19])>>(10)) - ((143 * input[20])>>(10)) + ((131 * input[21])>>(10)) + ((104 * input[22])>>(10)) - ((162 * input[23])>>(10)) - ((57 * input[24])>>(10)) + ((178 * input[25])>>(10)) + ((4 * input[26])>>(10)) - ((180 * input[27])>>(10)) + ((48 * input[28])>>(10)) + ((165 * input[29])>>(10)) - ((97 * input[30])>>(10)) - ((137 * input[31])>>(10)) + ((137 * input[32])>>(10)) + ((97 * input[33])>>(10)) - ((165 * input[34])>>(10)) - ((48 * input[35])>>(10)) + ((180 * input[36])>>(10)) - ((4 * input[37])>>(10)) - ((178 * input[38])>>(10)) + ((57 * input[39])>>(10)) + ((162 * input[40])>>(10)) - ((104 * input[41])>>(10)) - ((131 * input[42])>>(10)) + ((143 * input[43])>>(10)) + ((89 * input[44])>>(10)) - ((169 * input[45])>>(10)) - ((40 * input[46])>>(10)) + ((181 * input[47])>>(10)) - ((13 * input[48])>>(10)) - ((177 * input[49])>>(10)) + ((65 * input[50])>>(10)) + ((158 * input[51])>>(10)) - ((111 * input[52])>>(10)) - ((125 * input[53])>>(10)) + ((148 * input[54])>>(10)) + ((81 * input[55])>>(10)) - ((172 * input[56])>>(10)) - ((31 * input[57])>>(10)) + ((181 * input[58])>>(10)) - ((22 * input[59])>>(10)) - ((174 * input[60])>>(10)) + ((73 * input[61])>>(10)) + ((153 * input[62])>>(10)) - ((118 * input[63])>>(10));
  output[36] =  + ((115 * input[0])>>(10)) - ((160 * input[1])>>(10)) - ((53 * input[2])>>(10)) + ((180 * input[3])>>(10)) - ((18 * input[4])>>(10)) - ((173 * input[5])>>(10)) + ((85 * input[6])>>(10)) + ((140 * input[7])>>(10)) - ((140 * input[8])>>(10)) - ((85 * input[9])>>(10)) + ((173 * input[10])>>(10)) + ((18 * input[11])>>(10)) - ((180 * input[12])>>(10)) + ((53 * input[13])>>(10)) + ((160 * input[14])>>(10)) - ((115 * input[15])>>(10)) - ((115 * input[16])>>(10)) + ((160 * input[17])>>(10)) + ((53 * input[18])>>(10)) - ((180 * input[19])>>(10)) + ((18 * input[20])>>(10)) + ((173 * input[21])>>(10)) - ((85 * input[22])>>(10)) - ((140 * input[23])>>(10)) + ((140 * input[24])>>(10)) + ((85 * input[25])>>(10)) - ((173 * input[26])>>(10)) - ((18 * input[27])>>(10)) + ((180 * input[28])>>(10)) - ((53 * input[29])>>(10)) - ((160 * input[30])>>(10)) + ((115 * input[31])>>(10)) + ((115 * input[32])>>(10)) - ((160 * input[33])>>(10)) - ((53 * input[34])>>(10)) + ((180 * input[35])>>(10)) - ((18 * input[36])>>(10)) - ((173 * input[37])>>(10)) + ((85 * input[38])>>(10)) + ((140 * input[39])>>(10)) - ((140 * input[40])>>(10)) - ((85 * input[41])>>(10)) + ((173 * input[42])>>(10)) + ((18 * input[43])>>(10)) - ((180 * input[44])>>(10)) + ((53 * input[45])>>(10)) + ((160 * input[46])>>(10)) - ((115 * input[47])>>(10)) - ((115 * input[48])>>(10)) + ((160 * input[49])>>(10)) + ((53 * input[50])>>(10)) - ((180 * input[51])>>(10)) + ((18 * input[52])>>(10)) + ((173 * input[53])>>(10)) - ((85 * input[54])>>(10)) - ((140 * input[55])>>(10)) + ((140 * input[56])>>(10)) + ((85 * input[57])>>(10)) - ((173 * input[58])>>(10)) - ((18 * input[59])>>(10)) + ((180 * input[60])>>(10)) - ((53 * input[61])>>(10)) - ((160 * input[62])>>(10)) + ((115 * input[63])>>(10));
  output[37] =  + ((111 * input[0])>>(10)) - ((165 * input[1])>>(10)) - ((31 * input[2])>>(10)) + ((181 * input[3])>>(10)) - ((57 * input[4])>>(10)) - ((153 * input[5])>>(10)) + ((131 * input[6])>>(10)) + ((89 * input[7])>>(10)) - ((174 * input[8])>>(10)) - ((4 * input[9])>>(10)) + ((177 * input[10])>>(10)) - ((81 * input[11])>>(10)) - ((137 * input[12])>>(10)) + ((148 * input[13])>>(10)) + ((65 * input[14])>>(10)) - ((180 * input[15])>>(10)) + ((22 * input[16])>>(10)) + ((169 * input[17])>>(10)) - ((104 * input[18])>>(10)) - ((118 * input[19])>>(10)) + ((162 * input[20])>>(10)) + ((40 * input[21])>>(10)) - ((181 * input[22])>>(10)) + ((48 * input[23])>>(10)) + ((158 * input[24])>>(10)) - ((125 * input[25])>>(10)) - ((97 * input[26])>>(10)) + ((172 * input[27])>>(10)) + ((13 * input[28])>>(10)) - ((178 * input[29])>>(10)) + ((73 * input[30])>>(10)) + ((143 * input[31])>>(10)) - ((143 * input[32])>>(10)) - ((73 * input[33])>>(10)) + ((178 * input[34])>>(10)) - ((13 * input[35])>>(10)) - ((172 * input[36])>>(10)) + ((97 * input[37])>>(10)) + ((125 * input[38])>>(10)) - ((158 * input[39])>>(10)) - ((48 * input[40])>>(10)) + ((181 * input[41])>>(10)) - ((40 * input[42])>>(10)) - ((162 * input[43])>>(10)) + ((118 * input[44])>>(10)) + ((104 * input[45])>>(10)) - ((169 * input[46])>>(10)) - ((22 * input[47])>>(10)) + ((180 * input[48])>>(10)) - ((65 * input[49])>>(10)) - ((148 * input[50])>>(10)) + ((137 * input[51])>>(10)) + ((81 * input[52])>>(10)) - ((177 * input[53])>>(10)) + ((4 * input[54])>>(10)) + ((174 * input[55])>>(10)) - ((89 * input[56])>>(10)) - ((131 * input[57])>>(10)) + ((153 * input[58])>>(10)) + ((57 * input[59])>>(10)) - ((181 * input[60])>>(10)) + ((31 * input[61])>>(10)) + ((165 * input[62])>>(10)) - ((111 * input[63])>>(10));
  output[38] =  + ((108 * input[0])>>(10)) - ((170 * input[1])>>(10)) - ((9 * input[2])>>(10)) + ((176 * input[3])>>(10)) - ((93 * input[4])>>(10)) - ((122 * input[5])>>(10)) + ((164 * input[6])>>(10)) + ((27 * input[7])>>(10)) - ((179 * input[8])>>(10)) + ((77 * input[9])>>(10)) + ((134 * input[10])>>(10)) - ((155 * input[11])>>(10)) - ((44 * input[12])>>(10)) + ((181 * input[13])>>(10)) - ((61 * input[14])>>(10)) - ((145 * input[15])>>(10)) + ((145 * input[16])>>(10)) + ((61 * input[17])>>(10)) - ((181 * input[18])>>(10)) + ((44 * input[19])>>(10)) + ((155 * input[20])>>(10)) - ((134 * input[21])>>(10)) - ((77 * input[22])>>(10)) + ((179 * input[23])>>(10)) - ((27 * input[24])>>(10)) - ((164 * input[25])>>(10)) + ((122 * input[26])>>(10)) + ((93 * input[27])>>(10)) - ((176 * input[28])>>(10)) + ((9 * input[29])>>(10)) + ((170 * input[30])>>(10)) - ((108 * input[31])>>(10)) - ((108 * input[32])>>(10)) + ((170 * input[33])>>(10)) + ((9 * input[34])>>(10)) - ((176 * input[35])>>(10)) + ((93 * input[36])>>(10)) + ((122 * input[37])>>(10)) - ((164 * input[38])>>(10)) - ((27 * input[39])>>(10)) + ((179 * input[40])>>(10)) - ((77 * input[41])>>(10)) - ((134 * input[42])>>(10)) + ((155 * input[43])>>(10)) + ((44 * input[44])>>(10)) - ((181 * input[45])>>(10)) + ((61 * input[46])>>(10)) + ((145 * input[47])>>(10)) - ((145 * input[48])>>(10)) - ((61 * input[49])>>(10)) + ((181 * input[50])>>(10)) - ((44 * input[51])>>(10)) - ((155 * input[52])>>(10)) + ((134 * input[53])>>(10)) + ((77 * input[54])>>(10)) - ((179 * input[55])>>(10)) + ((27 * input[56])>>(10)) + ((164 * input[57])>>(10)) - ((122 * input[58])>>(10)) - ((93 * input[59])>>(10)) + ((176 * input[60])>>(10)) - ((9 * input[61])>>(10)) - ((170 * input[62])>>(10)) + ((108 * input[63])>>(10));
  output[39] =  + ((104 * input[0])>>(10)) - ((174 * input[1])>>(10)) + ((13 * input[2])>>(10)) + ((165 * input[3])>>(10)) - ((125 * input[4])>>(10)) - ((81 * input[5])>>(10)) + ((180 * input[6])>>(10)) - ((40 * input[7])>>(10)) - ((153 * input[8])>>(10)) + ((143 * input[9])>>(10)) + ((57 * input[10])>>(10)) - ((181 * input[11])>>(10)) + ((65 * input[12])>>(10)) + ((137 * input[13])>>(10)) - ((158 * input[14])>>(10)) - ((31 * input[15])>>(10)) + ((178 * input[16])>>(10)) - ((89 * input[17])>>(10)) - ((118 * input[18])>>(10)) + ((169 * input[19])>>(10)) + ((4 * input[20])>>(10)) - ((172 * input[21])>>(10)) + ((111 * input[22])>>(10)) + ((97 * input[23])>>(10)) - ((177 * input[24])>>(10)) + ((22 * input[25])>>(10)) + ((162 * input[26])>>(10)) - ((131 * input[27])>>(10)) - ((73 * input[28])>>(10)) + ((181 * input[29])>>(10)) - ((48 * input[30])>>(10)) - ((148 * input[31])>>(10)) + ((148 * input[32])>>(10)) + ((48 * input[33])>>(10)) - ((181 * input[34])>>(10)) + ((73 * input[35])>>(10)) + ((131 * input[36])>>(10)) - ((162 * input[37])>>(10)) - ((22 * input[38])>>(10)) + ((177 * input[39])>>(10)) - ((97 * input[40])>>(10)) - ((111 * input[41])>>(10)) + ((172 * input[42])>>(10)) - ((4 * input[43])>>(10)) - ((169 * input[44])>>(10)) + ((118 * input[45])>>(10)) + ((89 * input[46])>>(10)) - ((178 * input[47])>>(10)) + ((31 * input[48])>>(10)) + ((158 * input[49])>>(10)) - ((137 * input[50])>>(10)) - ((65 * input[51])>>(10)) + ((181 * input[52])>>(10)) - ((57 * input[53])>>(10)) - ((143 * input[54])>>(10)) + ((153 * input[55])>>(10)) + ((40 * input[56])>>(10)) - ((180 * input[57])>>(10)) + ((81 * input[58])>>(10)) + ((125 * input[59])>>(10)) - ((165 * input[60])>>(10)) - ((13 * input[61])>>(10)) + ((174 * input[62])>>(10)) - ((104 * input[63])>>(10));
  output[40] =  + ((101 * input[0])>>(10)) - ((178 * input[1])>>(10)) + ((35 * input[2])>>(10)) + ((151 * input[3])>>(10)) - ((151 * input[4])>>(10)) - ((35 * input[5])>>(10)) + ((178 * input[6])>>(10)) - ((101 * input[7])>>(10)) - ((101 * input[8])>>(10)) + ((178 * input[9])>>(10)) - ((35 * input[10])>>(10)) - ((151 * input[11])>>(10)) + ((151 * input[12])>>(10)) + ((35 * input[13])>>(10)) - ((178 * input[14])>>(10)) + ((101 * input[15])>>(10)) + ((101 * input[16])>>(10)) - ((178 * input[17])>>(10)) + ((35 * input[18])>>(10)) + ((151 * input[19])>>(10)) - ((151 * input[20])>>(10)) - ((35 * input[21])>>(10)) + ((178 * input[22])>>(10)) - ((101 * input[23])>>(10)) - ((101 * input[24])>>(10)) + ((178 * input[25])>>(10)) - ((35 * input[26])>>(10)) - ((151 * input[27])>>(10)) + ((151 * input[28])>>(10)) + ((35 * input[29])>>(10)) - ((178 * input[30])>>(10)) + ((101 * input[31])>>(10)) + ((101 * input[32])>>(10)) - ((178 * input[33])>>(10)) + ((35 * input[34])>>(10)) + ((151 * input[35])>>(10)) - ((151 * input[36])>>(10)) - ((35 * input[37])>>(10)) + ((178 * input[38])>>(10)) - ((101 * input[39])>>(10)) - ((101 * input[40])>>(10)) + ((178 * input[41])>>(10)) - ((35 * input[42])>>(10)) - ((151 * input[43])>>(10)) + ((151 * input[44])>>(10)) + ((35 * input[45])>>(10)) - ((178 * input[46])>>(10)) + ((101 * input[47])>>(10)) + ((101 * input[48])>>(10)) - ((178 * input[49])>>(10)) + ((35 * input[50])>>(10)) + ((151 * input[51])>>(10)) - ((151 * input[52])>>(10)) - ((35 * input[53])>>(10)) + ((178 * input[54])>>(10)) - ((101 * input[55])>>(10)) - ((101 * input[56])>>(10)) + ((178 * input[57])>>(10)) - ((35 * input[58])>>(10)) - ((151 * input[59])>>(10)) + ((151 * input[60])>>(10)) + ((35 * input[61])>>(10)) - ((178 * input[62])>>(10)) + ((101 * input[63])>>(10));
  output[41] =  + ((97 * input[0])>>(10)) - ((180 * input[1])>>(10)) + ((57 * input[2])>>(10)) + ((131 * input[3])>>(10)) - ((169 * input[4])>>(10)) + ((13 * input[5])>>(10)) + ((158 * input[6])>>(10)) - ((148 * input[7])>>(10)) - ((31 * input[8])>>(10)) + ((174 * input[9])>>(10)) - ((118 * input[10])>>(10)) - ((73 * input[11])>>(10)) + ((181 * input[12])>>(10)) - ((81 * input[13])>>(10)) - ((111 * input[14])>>(10)) + ((177 * input[15])>>(10)) - ((40 * input[16])>>(10)) - ((143 * input[17])>>(10)) + ((162 * input[18])>>(10)) + ((4 * input[19])>>(10)) - ((165 * input[20])>>(10)) + ((137 * input[21])>>(10)) + ((48 * input[22])>>(10)) - ((178 * input[23])>>(10)) + ((104 * input[24])>>(10)) + ((89 * input[25])>>(10)) - ((181 * input[26])>>(10)) + ((65 * input[27])>>(10)) + ((125 * input[28])>>(10)) - ((172 * input[29])>>(10)) + ((22 * input[30])>>(10)) + ((153 * input[31])>>(10)) - ((153 * input[32])>>(10)) - ((22 * input[33])>>(10)) + ((172 * input[34])>>(10)) - ((125 * input[35])>>(10)) - ((65 * input[36])>>(10)) + ((181 * input[37])>>(10)) - ((89 * input[38])>>(10)) - ((104 * input[39])>>(10)) + ((178 * input[40])>>(10)) - ((48 * input[41])>>(10)) - ((137 * input[42])>>(10)) + ((165 * input[43])>>(10)) - ((4 * input[44])>>(10)) - ((162 * input[45])>>(10)) + ((143 * input[46])>>(10)) + ((40 * input[47])>>(10)) - ((177 * input[48])>>(10)) + ((111 * input[49])>>(10)) + ((81 * input[50])>>(10)) - ((181 * input[51])>>(10)) + ((73 * input[52])>>(10)) + ((118 * input[53])>>(10)) - ((174 * input[54])>>(10)) + ((31 * input[55])>>(10)) + ((148 * input[56])>>(10)) - ((158 * input[57])>>(10)) - ((13 * input[58])>>(10)) + ((169 * input[59])>>(10)) - ((131 * input[60])>>(10)) - ((57 * input[61])>>(10)) + ((180 * input[62])>>(10)) - ((97 * input[63])>>(10));
  output[42] =  + ((93 * input[0])>>(10)) - ((181 * input[1])>>(10)) + ((77 * input[2])>>(10)) + ((108 * input[3])>>(10)) - ((179 * input[4])>>(10)) + ((61 * input[5])>>(10)) + ((122 * input[6])>>(10)) - ((176 * input[7])>>(10)) + ((44 * input[8])>>(10)) + ((134 * input[9])>>(10)) - ((170 * input[10])>>(10)) + ((27 * input[11])>>(10)) + ((145 * input[12])>>(10)) - ((164 * input[13])>>(10)) + ((9 * input[14])>>(10)) + ((155 * input[15])>>(10)) - ((155 * input[16])>>(10)) - ((9 * input[17])>>(10)) + ((164 * input[18])>>(10)) - ((145 * input[19])>>(10)) - ((27 * input[20])>>(10)) + ((170 * input[21])>>(10)) - ((134 * input[22])>>(10)) - ((44 * input[23])>>(10)) + ((176 * input[24])>>(10)) - ((122 * input[25])>>(10)) - ((61 * input[26])>>(10)) + ((179 * input[27])>>(10)) - ((108 * input[28])>>(10)) - ((77 * input[29])>>(10)) + ((181 * input[30])>>(10)) - ((93 * input[31])>>(10)) - ((93 * input[32])>>(10)) + ((181 * input[33])>>(10)) - ((77 * input[34])>>(10)) - ((108 * input[35])>>(10)) + ((179 * input[36])>>(10)) - ((61 * input[37])>>(10)) - ((122 * input[38])>>(10)) + ((176 * input[39])>>(10)) - ((44 * input[40])>>(10)) - ((134 * input[41])>>(10)) + ((170 * input[42])>>(10)) - ((27 * input[43])>>(10)) - ((145 * input[44])>>(10)) + ((164 * input[45])>>(10)) - ((9 * input[46])>>(10)) - ((155 * input[47])>>(10)) + ((155 * input[48])>>(10)) + ((9 * input[49])>>(10)) - ((164 * input[50])>>(10)) + ((145 * input[51])>>(10)) + ((27 * input[52])>>(10)) - ((170 * input[53])>>(10)) + ((134 * input[54])>>(10)) + ((44 * input[55])>>(10)) - ((176 * input[56])>>(10)) + ((122 * input[57])>>(10)) + ((61 * input[58])>>(10)) - ((179 * input[59])>>(10)) + ((108 * input[60])>>(10)) + ((77 * input[61])>>(10)) - ((181 * input[62])>>(10)) + ((93 * input[63])>>(10));
  output[43] =  + ((89 * input[0])>>(10)) - ((181 * input[1])>>(10)) + ((97 * input[2])>>(10)) + ((81 * input[3])>>(10)) - ((181 * input[4])>>(10)) + ((104 * input[5])>>(10)) + ((73 * input[6])>>(10)) - ((180 * input[7])>>(10)) + ((111 * input[8])>>(10)) + ((65 * input[9])>>(10)) - ((178 * input[10])>>(10)) + ((118 * input[11])>>(10)) + ((57 * input[12])>>(10)) - ((177 * input[13])>>(10)) + ((125 * input[14])>>(10)) + ((48 * input[15])>>(10)) - ((174 * input[16])>>(10)) + ((131 * input[17])>>(10)) + ((40 * input[18])>>(10)) - ((172 * input[19])>>(10)) + ((137 * input[20])>>(10)) + ((31 * input[21])>>(10)) - ((169 * input[22])>>(10)) + ((143 * input[23])>>(10)) + ((22 * input[24])>>(10)) - ((165 * input[25])>>(10)) + ((148 * input[26])>>(10)) + ((13 * input[27])>>(10)) - ((162 * input[28])>>(10)) + ((153 * input[29])>>(10)) + ((4 * input[30])>>(10)) - ((158 * input[31])>>(10)) + ((158 * input[32])>>(10)) - ((4 * input[33])>>(10)) - ((153 * input[34])>>(10)) + ((162 * input[35])>>(10)) - ((13 * input[36])>>(10)) - ((148 * input[37])>>(10)) + ((165 * input[38])>>(10)) - ((22 * input[39])>>(10)) - ((143 * input[40])>>(10)) + ((169 * input[41])>>(10)) - ((31 * input[42])>>(10)) - ((137 * input[43])>>(10)) + ((172 * input[44])>>(10)) - ((40 * input[45])>>(10)) - ((131 * input[46])>>(10)) + ((174 * input[47])>>(10)) - ((48 * input[48])>>(10)) - ((125 * input[49])>>(10)) + ((177 * input[50])>>(10)) - ((57 * input[51])>>(10)) - ((118 * input[52])>>(10)) + ((178 * input[53])>>(10)) - ((65 * input[54])>>(10)) - ((111 * input[55])>>(10)) + ((180 * input[56])>>(10)) - ((73 * input[57])>>(10)) - ((104 * input[58])>>(10)) + ((181 * input[59])>>(10)) - ((81 * input[60])>>(10)) - ((97 * input[61])>>(10)) + ((181 * input[62])>>(10)) - ((89 * input[63])>>(10));
  output[44] =  + ((85 * input[0])>>(10)) - ((180 * input[1])>>(10)) + ((115 * input[2])>>(10)) + ((53 * input[3])>>(10)) - ((173 * input[4])>>(10)) + ((140 * input[5])>>(10)) + ((18 * input[6])>>(10)) - ((160 * input[7])>>(10)) + ((160 * input[8])>>(10)) - ((18 * input[9])>>(10)) - ((140 * input[10])>>(10)) + ((173 * input[11])>>(10)) - ((53 * input[12])>>(10)) - ((115 * input[13])>>(10)) + ((180 * input[14])>>(10)) - ((85 * input[15])>>(10)) - ((85 * input[16])>>(10)) + ((180 * input[17])>>(10)) - ((115 * input[18])>>(10)) - ((53 * input[19])>>(10)) + ((173 * input[20])>>(10)) - ((140 * input[21])>>(10)) - ((18 * input[22])>>(10)) + ((160 * input[23])>>(10)) - ((160 * input[24])>>(10)) + ((18 * input[25])>>(10)) + ((140 * input[26])>>(10)) - ((173 * input[27])>>(10)) + ((53 * input[28])>>(10)) + ((115 * input[29])>>(10)) - ((180 * input[30])>>(10)) + ((85 * input[31])>>(10)) + ((85 * input[32])>>(10)) - ((180 * input[33])>>(10)) + ((115 * input[34])>>(10)) + ((53 * input[35])>>(10)) - ((173 * input[36])>>(10)) + ((140 * input[37])>>(10)) + ((18 * input[38])>>(10)) - ((160 * input[39])>>(10)) + ((160 * input[40])>>(10)) - ((18 * input[41])>>(10)) - ((140 * input[42])>>(10)) + ((173 * input[43])>>(10)) - ((53 * input[44])>>(10)) - ((115 * input[45])>>(10)) + ((180 * input[46])>>(10)) - ((85 * input[47])>>(10)) - ((85 * input[48])>>(10)) + ((180 * input[49])>>(10)) - ((115 * input[50])>>(10)) - ((53 * input[51])>>(10)) + ((173 * input[52])>>(10)) - ((140 * input[53])>>(10)) - ((18 * input[54])>>(10)) + ((160 * input[55])>>(10)) - ((160 * input[56])>>(10)) + ((18 * input[57])>>(10)) + ((140 * input[58])>>(10)) - ((173 * input[59])>>(10)) + ((53 * input[60])>>(10)) + ((115 * input[61])>>(10)) - ((180 * input[62])>>(10)) + ((85 * input[63])>>(10));
  output[45] =  + ((81 * input[0])>>(10)) - ((178 * input[1])>>(10)) + ((131 * input[2])>>(10)) + ((22 * input[3])>>(10)) - ((158 * input[4])>>(10)) + ((165 * input[5])>>(10)) - ((40 * input[6])>>(10)) - ((118 * input[7])>>(10)) + ((181 * input[8])>>(10)) - ((97 * input[9])>>(10)) - ((65 * input[10])>>(10)) + ((174 * input[11])>>(10)) - ((143 * input[12])>>(10)) - ((4 * input[13])>>(10)) + ((148 * input[14])>>(10)) - ((172 * input[15])>>(10)) + ((57 * input[16])>>(10)) + ((104 * input[17])>>(10)) - ((181 * input[18])>>(10)) + ((111 * input[19])>>(10)) + ((48 * input[20])>>(10)) - ((169 * input[21])>>(10)) + ((153 * input[22])>>(10)) - ((13 * input[23])>>(10)) - ((137 * input[24])>>(10)) + ((177 * input[25])>>(10)) - ((73 * input[26])>>(10)) - ((89 * input[27])>>(10)) + ((180 * input[28])>>(10)) - ((125 * input[29])>>(10)) - ((31 * input[30])>>(10)) + ((162 * input[31])>>(10)) - ((162 * input[32])>>(10)) + ((31 * input[33])>>(10)) + ((125 * input[34])>>(10)) - ((180 * input[35])>>(10)) + ((89 * input[36])>>(10)) + ((73 * input[37])>>(10)) - ((177 * input[38])>>(10)) + ((137 * input[39])>>(10)) + ((13 * input[40])>>(10)) - ((153 * input[41])>>(10)) + ((169 * input[42])>>(10)) - ((48 * input[43])>>(10)) - ((111 * input[44])>>(10)) + ((181 * input[45])>>(10)) - ((104 * input[46])>>(10)) - ((57 * input[47])>>(10)) + ((172 * input[48])>>(10)) - ((148 * input[49])>>(10)) + ((4 * input[50])>>(10)) + ((143 * input[51])>>(10)) - ((174 * input[52])>>(10)) + ((65 * input[53])>>(10)) + ((97 * input[54])>>(10)) - ((181 * input[55])>>(10)) + ((118 * input[56])>>(10)) + ((40 * input[57])>>(10)) - ((165 * input[58])>>(10)) + ((158 * input[59])>>(10)) - ((22 * input[60])>>(10)) - ((131 * input[61])>>(10)) + ((178 * input[62])>>(10)) - ((81 * input[63])>>(10));
  output[46] =  + ((77 * input[0])>>(10)) - ((176 * input[1])>>(10)) + ((145 * input[2])>>(10)) - ((9 * input[3])>>(10)) - ((134 * input[4])>>(10)) + ((179 * input[5])>>(10)) - ((93 * input[6])>>(10)) - ((61 * input[7])>>(10)) + ((170 * input[8])>>(10)) - ((155 * input[9])>>(10)) + ((27 * input[10])>>(10)) + ((122 * input[11])>>(10)) - ((181 * input[12])>>(10)) + ((108 * input[13])>>(10)) + ((44 * input[14])>>(10)) - ((164 * input[15])>>(10)) + ((164 * input[16])>>(10)) - ((44 * input[17])>>(10)) - ((108 * input[18])>>(10)) + ((181 * input[19])>>(10)) - ((122 * input[20])>>(10)) - ((27 * input[21])>>(10)) + ((155 * input[22])>>(10)) - ((170 * input[23])>>(10)) + ((61 * input[24])>>(10)) + ((93 * input[25])>>(10)) - ((179 * input[26])>>(10)) + ((134 * input[27])>>(10)) + ((9 * input[28])>>(10)) - ((145 * input[29])>>(10)) + ((176 * input[30])>>(10)) - ((77 * input[31])>>(10)) - ((77 * input[32])>>(10)) + ((176 * input[33])>>(10)) - ((145 * input[34])>>(10)) + ((9 * input[35])>>(10)) + ((134 * input[36])>>(10)) - ((179 * input[37])>>(10)) + ((93 * input[38])>>(10)) + ((61 * input[39])>>(10)) - ((170 * input[40])>>(10)) + ((155 * input[41])>>(10)) - ((27 * input[42])>>(10)) - ((122 * input[43])>>(10)) + ((181 * input[44])>>(10)) - ((108 * input[45])>>(10)) - ((44 * input[46])>>(10)) + ((164 * input[47])>>(10)) - ((164 * input[48])>>(10)) + ((44 * input[49])>>(10)) + ((108 * input[50])>>(10)) - ((181 * input[51])>>(10)) + ((122 * input[52])>>(10)) + ((27 * input[53])>>(10)) - ((155 * input[54])>>(10)) + ((170 * input[55])>>(10)) - ((61 * input[56])>>(10)) - ((93 * input[57])>>(10)) + ((179 * input[58])>>(10)) - ((134 * input[59])>>(10)) - ((9 * input[60])>>(10)) + ((145 * input[61])>>(10)) - ((176 * input[62])>>(10)) + ((77 * input[63])>>(10));
  output[47] =  + ((73 * input[0])>>(10)) - ((172 * input[1])>>(10)) + ((158 * input[2])>>(10)) - ((40 * input[3])>>(10)) - ((104 * input[4])>>(10)) + ((180 * input[5])>>(10)) - ((137 * input[6])>>(10)) + ((4 * input[7])>>(10)) + ((131 * input[8])>>(10)) - ((181 * input[9])>>(10)) + ((111 * input[10])>>(10)) + ((31 * input[11])>>(10)) - ((153 * input[12])>>(10)) + ((174 * input[13])>>(10)) - ((81 * input[14])>>(10)) - ((65 * input[15])>>(10)) + ((169 * input[16])>>(10)) - ((162 * input[17])>>(10)) + ((48 * input[18])>>(10)) + ((97 * input[19])>>(10)) - ((178 * input[20])>>(10)) + ((143 * input[21])>>(10)) - ((13 * input[22])>>(10)) - ((125 * input[23])>>(10)) + ((181 * input[24])>>(10)) - ((118 * input[25])>>(10)) - ((22 * input[26])>>(10)) + ((148 * input[27])>>(10)) - ((177 * input[28])>>(10)) + ((89 * input[29])>>(10)) + ((57 * input[30])>>(10)) - ((165 * input[31])>>(10)) + ((165 * input[32])>>(10)) - ((57 * input[33])>>(10)) - ((89 * input[34])>>(10)) + ((177 * input[35])>>(10)) - ((148 * input[36])>>(10)) + ((22 * input[37])>>(10)) + ((118 * input[38])>>(10)) - ((181 * input[39])>>(10)) + ((125 * input[40])>>(10)) + ((13 * input[41])>>(10)) - ((143 * input[42])>>(10)) + ((178 * input[43])>>(10)) - ((97 * input[44])>>(10)) - ((48 * input[45])>>(10)) + ((162 * input[46])>>(10)) - ((169 * input[47])>>(10)) + ((65 * input[48])>>(10)) + ((81 * input[49])>>(10)) - ((174 * input[50])>>(10)) + ((153 * input[51])>>(10)) - ((31 * input[52])>>(10)) - ((111 * input[53])>>(10)) + ((181 * input[54])>>(10)) - ((131 * input[55])>>(10)) - ((4 * input[56])>>(10)) + ((137 * input[57])>>(10)) - ((180 * input[58])>>(10)) + ((104 * input[59])>>(10)) + ((40 * input[60])>>(10)) - ((158 * input[61])>>(10)) + ((172 * input[62])>>(10)) - ((73 * input[63])>>(10));
  output[48] =  + ((69 * input[0])>>(10)) - ((167 * input[1])>>(10)) + ((167 * input[2])>>(10)) - ((69 * input[3])>>(10)) - ((69 * input[4])>>(10)) + ((167 * input[5])>>(10)) - ((167 * input[6])>>(10)) + ((69 * input[7])>>(10)) + ((69 * input[8])>>(10)) - ((167 * input[9])>>(10)) + ((167 * input[10])>>(10)) - ((69 * input[11])>>(10)) - ((69 * input[12])>>(10)) + ((167 * input[13])>>(10)) - ((167 * input[14])>>(10)) + ((69 * input[15])>>(10)) + ((69 * input[16])>>(10)) - ((167 * input[17])>>(10)) + ((167 * input[18])>>(10)) - ((69 * input[19])>>(10)) - ((69 * input[20])>>(10)) + ((167 * input[21])>>(10)) - ((167 * input[22])>>(10)) + ((69 * input[23])>>(10)) + ((69 * input[24])>>(10)) - ((167 * input[25])>>(10)) + ((167 * input[26])>>(10)) - ((69 * input[27])>>(10)) - ((69 * input[28])>>(10)) + ((167 * input[29])>>(10)) - ((167 * input[30])>>(10)) + ((69 * input[31])>>(10)) + ((69 * input[32])>>(10)) - ((167 * input[33])>>(10)) + ((167 * input[34])>>(10)) - ((69 * input[35])>>(10)) - ((69 * input[36])>>(10)) + ((167 * input[37])>>(10)) - ((167 * input[38])>>(10)) + ((69 * input[39])>>(10)) + ((69 * input[40])>>(10)) - ((167 * input[41])>>(10)) + ((167 * input[42])>>(10)) - ((69 * input[43])>>(10)) - ((69 * input[44])>>(10)) + ((167 * input[45])>>(10)) - ((167 * input[46])>>(10)) + ((69 * input[47])>>(10)) + ((69 * input[48])>>(10)) - ((167 * input[49])>>(10)) + ((167 * input[50])>>(10)) - ((69 * input[51])>>(10)) - ((69 * input[52])>>(10)) + ((167 * input[53])>>(10)) - ((167 * input[54])>>(10)) + ((69 * input[55])>>(10)) + ((69 * input[56])>>(10)) - ((167 * input[57])>>(10)) + ((167 * input[58])>>(10)) - ((69 * input[59])>>(10)) - ((69 * input[60])>>(10)) + ((167 * input[61])>>(10)) - ((167 * input[62])>>(10)) + ((69 * input[63])>>(10));
  output[49] =  + ((65 * input[0])>>(10)) - ((162 * input[1])>>(10)) + ((174 * input[2])>>(10)) - ((97 * input[3])>>(10)) - ((31 * input[4])>>(10)) + ((143 * input[5])>>(10)) - ((181 * input[6])>>(10)) + ((125 * input[7])>>(10)) - ((4 * input[8])>>(10)) - ((118 * input[9])>>(10)) + ((180 * input[10])>>(10)) - ((148 * input[11])>>(10)) + ((40 * input[12])>>(10)) + ((89 * input[13])>>(10)) - ((172 * input[14])>>(10)) + ((165 * input[15])>>(10)) - ((73 * input[16])>>(10)) - ((57 * input[17])>>(10)) + ((158 * input[18])>>(10)) - ((177 * input[19])>>(10)) + ((104 * input[20])>>(10)) + ((22 * input[21])>>(10)) - ((137 * input[22])>>(10)) + ((181 * input[23])>>(10)) - ((131 * input[24])>>(10)) + ((13 * input[25])>>(10)) + ((111 * input[26])>>(10)) - ((178 * input[27])>>(10)) + ((153 * input[28])>>(10)) - ((48 * input[29])>>(10)) - ((81 * input[30])>>(10)) + ((169 * input[31])>>(10)) - ((169 * input[32])>>(10)) + ((81 * input[33])>>(10)) + ((48 * input[34])>>(10)) - ((153 * input[35])>>(10)) + ((178 * input[36])>>(10)) - ((111 * input[37])>>(10)) - ((13 * input[38])>>(10)) + ((131 * input[39])>>(10)) - ((181 * input[40])>>(10)) + ((137 * input[41])>>(10)) - ((22 * input[42])>>(10)) - ((104 * input[43])>>(10)) + ((177 * input[44])>>(10)) - ((158 * input[45])>>(10)) + ((57 * input[46])>>(10)) + ((73 * input[47])>>(10)) - ((165 * input[48])>>(10)) + ((172 * input[49])>>(10)) - ((89 * input[50])>>(10)) - ((40 * input[51])>>(10)) + ((148 * input[52])>>(10)) - ((180 * input[53])>>(10)) + ((118 * input[54])>>(10)) + ((4 * input[55])>>(10)) - ((125 * input[56])>>(10)) + ((181 * input[57])>>(10)) - ((143 * input[58])>>(10)) + ((31 * input[59])>>(10)) + ((97 * input[60])>>(10)) - ((174 * input[61])>>(10)) + ((162 * input[62])>>(10)) - ((65 * input[63])>>(10));
  output[50] =  + ((61 * input[0])>>(10)) - ((155 * input[1])>>(10)) + ((179 * input[2])>>(10)) - ((122 * input[3])>>(10)) + ((9 * input[4])>>(10)) + ((108 * input[5])>>(10)) - ((176 * input[6])>>(10)) + ((164 * input[7])>>(10)) - ((77 * input[8])>>(10)) - ((44 * input[9])>>(10)) + ((145 * input[10])>>(10)) - ((181 * input[11])>>(10)) + ((134 * input[12])>>(10)) - ((27 * input[13])>>(10)) - ((93 * input[14])>>(10)) + ((170 * input[15])>>(10)) - ((170 * input[16])>>(10)) + ((93 * input[17])>>(10)) + ((27 * input[18])>>(10)) - ((134 * input[19])>>(10)) + ((181 * input[20])>>(10)) - ((145 * input[21])>>(10)) + ((44 * input[22])>>(10)) + ((77 * input[23])>>(10)) - ((164 * input[24])>>(10)) + ((176 * input[25])>>(10)) - ((108 * input[26])>>(10)) - ((9 * input[27])>>(10)) + ((122 * input[28])>>(10)) - ((179 * input[29])>>(10)) + ((155 * input[30])>>(10)) - ((61 * input[31])>>(10)) - ((61 * input[32])>>(10)) + ((155 * input[33])>>(10)) - ((179 * input[34])>>(10)) + ((122 * input[35])>>(10)) - ((9 * input[36])>>(10)) - ((108 * input[37])>>(10)) + ((176 * input[38])>>(10)) - ((164 * input[39])>>(10)) + ((77 * input[40])>>(10)) + ((44 * input[41])>>(10)) - ((145 * input[42])>>(10)) + ((181 * input[43])>>(10)) - ((134 * input[44])>>(10)) + ((27 * input[45])>>(10)) + ((93 * input[46])>>(10)) - ((170 * input[47])>>(10)) + ((170 * input[48])>>(10)) - ((93 * input[49])>>(10)) - ((27 * input[50])>>(10)) + ((134 * input[51])>>(10)) - ((181 * input[52])>>(10)) + ((145 * input[53])>>(10)) - ((44 * input[54])>>(10)) - ((77 * input[55])>>(10)) + ((164 * input[56])>>(10)) - ((176 * input[57])>>(10)) + ((108 * input[58])>>(10)) + ((9 * input[59])>>(10)) - ((122 * input[60])>>(10)) + ((179 * input[61])>>(10)) - ((155 * input[62])>>(10)) + ((61 * input[63])>>(10));
  output[51] =  + ((57 * input[0])>>(10)) - ((148 * input[1])>>(10)) + ((181 * input[2])>>(10)) - ((143 * input[3])>>(10)) + ((48 * input[4])>>(10)) + ((65 * input[5])>>(10)) - ((153 * input[6])>>(10)) + ((181 * input[7])>>(10)) - ((137 * input[8])>>(10)) + ((40 * input[9])>>(10)) + ((73 * input[10])>>(10)) - ((158 * input[11])>>(10)) + ((180 * input[12])>>(10)) - ((131 * input[13])>>(10)) + ((31 * input[14])>>(10)) + ((81 * input[15])>>(10)) - ((162 * input[16])>>(10)) + ((178 * input[17])>>(10)) - ((125 * input[18])>>(10)) + ((22 * input[19])>>(10)) + ((89 * input[20])>>(10)) - ((165 * input[21])>>(10)) + ((177 * input[22])>>(10)) - ((118 * input[23])>>(10)) + ((13 * input[24])>>(10)) + ((97 * input[25])>>(10)) - ((169 * input[26])>>(10)) + ((174 * input[27])>>(10)) - ((111 * input[28])>>(10)) + ((4 * input[29])>>(10)) + ((104 * input[30])>>(10)) - ((172 * input[31])>>(10)) + ((172 * input[32])>>(10)) - ((104 * input[33])>>(10)) - ((4 * input[34])>>(10)) + ((111 * input[35])>>(10)) - ((174 * input[36])>>(10)) + ((169 * input[37])>>(10)) - ((97 * input[38])>>(10)) - ((13 * input[39])>>(10)) + ((118 * input[40])>>(10)) - ((177 * input[41])>>(10)) + ((165 * input[42])>>(10)) - ((89 * input[43])>>(10)) - ((22 * input[44])>>(10)) + ((125 * input[45])>>(10)) - ((178 * input[46])>>(10)) + ((162 * input[47])>>(10)) - ((81 * input[48])>>(10)) - ((31 * input[49])>>(10)) + ((131 * input[50])>>(10)) - ((180 * input[51])>>(10)) + ((158 * input[52])>>(10)) - ((73 * input[53])>>(10)) - ((40 * input[54])>>(10)) + ((137 * input[55])>>(10)) - ((181 * input[56])>>(10)) + ((153 * input[57])>>(10)) - ((65 * input[58])>>(10)) - ((48 * input[59])>>(10)) + ((143 * input[60])>>(10)) - ((181 * input[61])>>(10)) + ((148 * input[62])>>(10)) - ((57 * input[63])>>(10));
  output[52] =  + ((53 * input[0])>>(10)) - ((140 * input[1])>>(10)) + ((180 * input[2])>>(10)) - ((160 * input[3])>>(10)) + ((85 * input[4])>>(10)) + ((18 * input[5])>>(10)) - ((115 * input[6])>>(10)) + ((173 * input[7])>>(10)) - ((173 * input[8])>>(10)) + ((115 * input[9])>>(10)) - ((18 * input[10])>>(10)) - ((85 * input[11])>>(10)) + ((160 * input[12])>>(10)) - ((180 * input[13])>>(10)) + ((140 * input[14])>>(10)) - ((53 * input[15])>>(10)) - ((53 * input[16])>>(10)) + ((140 * input[17])>>(10)) - ((180 * input[18])>>(10)) + ((160 * input[19])>>(10)) - ((85 * input[20])>>(10)) - ((18 * input[21])>>(10)) + ((115 * input[22])>>(10)) - ((173 * input[23])>>(10)) + ((173 * input[24])>>(10)) - ((115 * input[25])>>(10)) + ((18 * input[26])>>(10)) + ((85 * input[27])>>(10)) - ((160 * input[28])>>(10)) + ((180 * input[29])>>(10)) - ((140 * input[30])>>(10)) + ((53 * input[31])>>(10)) + ((53 * input[32])>>(10)) - ((140 * input[33])>>(10)) + ((180 * input[34])>>(10)) - ((160 * input[35])>>(10)) + ((85 * input[36])>>(10)) + ((18 * input[37])>>(10)) - ((115 * input[38])>>(10)) + ((173 * input[39])>>(10)) - ((173 * input[40])>>(10)) + ((115 * input[41])>>(10)) - ((18 * input[42])>>(10)) - ((85 * input[43])>>(10)) + ((160 * input[44])>>(10)) - ((180 * input[45])>>(10)) + ((140 * input[46])>>(10)) - ((53 * input[47])>>(10)) - ((53 * input[48])>>(10)) + ((140 * input[49])>>(10)) - ((180 * input[50])>>(10)) + ((160 * input[51])>>(10)) - ((85 * input[52])>>(10)) - ((18 * input[53])>>(10)) + ((115 * input[54])>>(10)) - ((173 * input[55])>>(10)) + ((173 * input[56])>>(10)) - ((115 * input[57])>>(10)) + ((18 * input[58])>>(10)) + ((85 * input[59])>>(10)) - ((160 * input[60])>>(10)) + ((180 * input[61])>>(10)) - ((140 * input[62])>>(10)) + ((53 * input[63])>>(10));
  output[53] =  + ((48 * input[0])>>(10)) - ((131 * input[1])>>(10)) + ((177 * input[2])>>(10)) - ((172 * input[3])>>(10)) + ((118 * input[4])>>(10)) - ((31 * input[5])>>(10)) - ((65 * input[6])>>(10)) + ((143 * input[7])>>(10)) - ((180 * input[8])>>(10)) + ((165 * input[9])>>(10)) - ((104 * input[10])>>(10)) + ((13 * input[11])>>(10)) + ((81 * input[12])>>(10)) - ((153 * input[13])>>(10)) + ((181 * input[14])>>(10)) - ((158 * input[15])>>(10)) + ((89 * input[16])>>(10)) + ((4 * input[17])>>(10)) - ((97 * input[18])>>(10)) + ((162 * input[19])>>(10)) - ((181 * input[20])>>(10)) + ((148 * input[21])>>(10)) - ((73 * input[22])>>(10)) - ((22 * input[23])>>(10)) + ((111 * input[24])>>(10)) - ((169 * input[25])>>(10)) + ((178 * input[26])>>(10)) - ((137 * input[27])>>(10)) + ((57 * input[28])>>(10)) + ((40 * input[29])>>(10)) - ((125 * input[30])>>(10)) + ((174 * input[31])>>(10)) - ((174 * input[32])>>(10)) + ((125 * input[33])>>(10)) - ((40 * input[34])>>(10)) - ((57 * input[35])>>(10)) + ((137 * input[36])>>(10)) - ((178 * input[37])>>(10)) + ((169 * input[38])>>(10)) - ((111 * input[39])>>(10)) + ((22 * input[40])>>(10)) + ((73 * input[41])>>(10)) - ((148 * input[42])>>(10)) + ((181 * input[43])>>(10)) - ((162 * input[44])>>(10)) + ((97 * input[45])>>(10)) - ((4 * input[46])>>(10)) - ((89 * input[47])>>(10)) + ((158 * input[48])>>(10)) - ((181 * input[49])>>(10)) + ((153 * input[50])>>(10)) - ((81 * input[51])>>(10)) - ((13 * input[52])>>(10)) + ((104 * input[53])>>(10)) - ((165 * input[54])>>(10)) + ((180 * input[55])>>(10)) - ((143 * input[56])>>(10)) + ((65 * input[57])>>(10)) + ((31 * input[58])>>(10)) - ((118 * input[59])>>(10)) + ((172 * input[60])>>(10)) - ((177 * input[61])>>(10)) + ((131 * input[62])>>(10)) - ((48 * input[63])>>(10));
  output[54] =  + ((44 * input[0])>>(10)) - ((122 * input[1])>>(10)) + ((170 * input[2])>>(10)) - ((179 * input[3])>>(10)) + ((145 * input[4])>>(10)) - ((77 * input[5])>>(10)) - ((9 * input[6])>>(10)) + ((93 * input[7])>>(10)) - ((155 * input[8])>>(10)) + ((181 * input[9])>>(10)) - ((164 * input[10])>>(10)) + ((108 * input[11])>>(10)) - ((27 * input[12])>>(10)) - ((61 * input[13])>>(10)) + ((134 * input[14])>>(10)) - ((176 * input[15])>>(10)) + ((176 * input[16])>>(10)) - ((134 * input[17])>>(10)) + ((61 * input[18])>>(10)) + ((27 * input[19])>>(10)) - ((108 * input[20])>>(10)) + ((164 * input[21])>>(10)) - ((181 * input[22])>>(10)) + ((155 * input[23])>>(10)) - ((93 * input[24])>>(10)) + ((9 * input[25])>>(10)) + ((77 * input[26])>>(10)) - ((145 * input[27])>>(10)) + ((179 * input[28])>>(10)) - ((170 * input[29])>>(10)) + ((122 * input[30])>>(10)) - ((44 * input[31])>>(10)) - ((44 * input[32])>>(10)) + ((122 * input[33])>>(10)) - ((170 * input[34])>>(10)) + ((179 * input[35])>>(10)) - ((145 * input[36])>>(10)) + ((77 * input[37])>>(10)) + ((9 * input[38])>>(10)) - ((93 * input[39])>>(10)) + ((155 * input[40])>>(10)) - ((181 * input[41])>>(10)) + ((164 * input[42])>>(10)) - ((108 * input[43])>>(10)) + ((27 * input[44])>>(10)) + ((61 * input[45])>>(10)) - ((134 * input[46])>>(10)) + ((176 * input[47])>>(10)) - ((176 * input[48])>>(10)) + ((134 * input[49])>>(10)) - ((61 * input[50])>>(10)) - ((27 * input[51])>>(10)) + ((108 * input[52])>>(10)) - ((164 * input[53])>>(10)) + ((181 * input[54])>>(10)) - ((155 * input[55])>>(10)) + ((93 * input[56])>>(10)) - ((9 * input[57])>>(10)) - ((77 * input[58])>>(10)) + ((145 * input[59])>>(10)) - ((179 * input[60])>>(10)) + ((170 * input[61])>>(10)) - ((122 * input[62])>>(10)) + ((44 * input[63])>>(10));
  output[55] =  + ((40 * input[0])>>(10)) - ((111 * input[1])>>(10)) + ((162 * input[2])>>(10)) - ((181 * input[3])>>(10)) + ((165 * input[4])>>(10)) - ((118 * input[5])>>(10)) + ((48 * input[6])>>(10)) + ((31 * input[7])>>(10)) - ((104 * input[8])>>(10)) + ((158 * input[9])>>(10)) - ((181 * input[10])>>(10)) + ((169 * input[11])>>(10)) - ((125 * input[12])>>(10)) + ((57 * input[13])>>(10)) + ((22 * input[14])>>(10)) - ((97 * input[15])>>(10)) + ((153 * input[16])>>(10)) - ((180 * input[17])>>(10)) + ((172 * input[18])>>(10)) - ((131 * input[19])>>(10)) + ((65 * input[20])>>(10)) + ((13 * input[21])>>(10)) - ((89 * input[22])>>(10)) + ((148 * input[23])>>(10)) - ((178 * input[24])>>(10)) + ((174 * input[25])>>(10)) - ((137 * input[26])>>(10)) + ((73 * input[27])>>(10)) + ((4 * input[28])>>(10)) - ((81 * input[29])>>(10)) + ((143 * input[30])>>(10)) - ((177 * input[31])>>(10)) + ((177 * input[32])>>(10)) - ((143 * input[33])>>(10)) + ((81 * input[34])>>(10)) - ((4 * input[35])>>(10)) - ((73 * input[36])>>(10)) + ((137 * input[37])>>(10)) - ((174 * input[38])>>(10)) + ((178 * input[39])>>(10)) - ((148 * input[40])>>(10)) + ((89 * input[41])>>(10)) - ((13 * input[42])>>(10)) - ((65 * input[43])>>(10)) + ((131 * input[44])>>(10)) - ((172 * input[45])>>(10)) + ((180 * input[46])>>(10)) - ((153 * input[47])>>(10)) + ((97 * input[48])>>(10)) - ((22 * input[49])>>(10)) - ((57 * input[50])>>(10)) + ((125 * input[51])>>(10)) - ((169 * input[52])>>(10)) + ((181 * input[53])>>(10)) - ((158 * input[54])>>(10)) + ((104 * input[55])>>(10)) - ((31 * input[56])>>(10)) - ((48 * input[57])>>(10)) + ((118 * input[58])>>(10)) - ((165 * input[59])>>(10)) + ((181 * input[60])>>(10)) - ((162 * input[61])>>(10)) + ((111 * input[62])>>(10)) - ((40 * input[63])>>(10));
  output[56] =  + ((35 * input[0])>>(10)) - ((101 * input[1])>>(10)) + ((151 * input[2])>>(10)) - ((178 * input[3])>>(10)) + ((178 * input[4])>>(10)) - ((151 * input[5])>>(10)) + ((101 * input[6])>>(10)) - ((35 * input[7])>>(10)) - ((35 * input[8])>>(10)) + ((101 * input[9])>>(10)) - ((151 * input[10])>>(10)) + ((178 * input[11])>>(10)) - ((178 * input[12])>>(10)) + ((151 * input[13])>>(10)) - ((101 * input[14])>>(10)) + ((35 * input[15])>>(10)) + ((35 * input[16])>>(10)) - ((101 * input[17])>>(10)) + ((151 * input[18])>>(10)) - ((178 * input[19])>>(10)) + ((178 * input[20])>>(10)) - ((151 * input[21])>>(10)) + ((101 * input[22])>>(10)) - ((35 * input[23])>>(10)) - ((35 * input[24])>>(10)) + ((101 * input[25])>>(10)) - ((151 * input[26])>>(10)) + ((178 * input[27])>>(10)) - ((178 * input[28])>>(10)) + ((151 * input[29])>>(10)) - ((101 * input[30])>>(10)) + ((35 * input[31])>>(10)) + ((35 * input[32])>>(10)) - ((101 * input[33])>>(10)) + ((151 * input[34])>>(10)) - ((178 * input[35])>>(10)) + ((178 * input[36])>>(10)) - ((151 * input[37])>>(10)) + ((101 * input[38])>>(10)) - ((35 * input[39])>>(10)) - ((35 * input[40])>>(10)) + ((101 * input[41])>>(10)) - ((151 * input[42])>>(10)) + ((178 * input[43])>>(10)) - ((178 * input[44])>>(10)) + ((151 * input[45])>>(10)) - ((101 * input[46])>>(10)) + ((35 * input[47])>>(10)) + ((35 * input[48])>>(10)) - ((101 * input[49])>>(10)) + ((151 * input[50])>>(10)) - ((178 * input[51])>>(10)) + ((178 * input[52])>>(10)) - ((151 * input[53])>>(10)) + ((101 * input[54])>>(10)) - ((35 * input[55])>>(10)) - ((35 * input[56])>>(10)) + ((101 * input[57])>>(10)) - ((151 * input[58])>>(10)) + ((178 * input[59])>>(10)) - ((178 * input[60])>>(10)) + ((151 * input[61])>>(10)) - ((101 * input[62])>>(10)) + ((35 * input[63])>>(10));
  output[57] =  + ((31 * input[0])>>(10)) - ((89 * input[1])>>(10)) + ((137 * input[2])>>(10)) - ((169 * input[3])>>(10)) + ((181 * input[4])>>(10)) - ((172 * input[5])>>(10)) + ((143 * input[6])>>(10)) - ((97 * input[7])>>(10)) + ((40 * input[8])>>(10)) + ((22 * input[9])>>(10)) - ((81 * input[10])>>(10)) + ((131 * input[11])>>(10)) - ((165 * input[12])>>(10)) + ((181 * input[13])>>(10)) - ((174 * input[14])>>(10)) + ((148 * input[15])>>(10)) - ((104 * input[16])>>(10)) + ((48 * input[17])>>(10)) + ((13 * input[18])>>(10)) - ((73 * input[19])>>(10)) + ((125 * input[20])>>(10)) - ((162 * input[21])>>(10)) + ((180 * input[22])>>(10)) - ((177 * input[23])>>(10)) + ((153 * input[24])>>(10)) - ((111 * input[25])>>(10)) + ((57 * input[26])>>(10)) + ((4 * input[27])>>(10)) - ((65 * input[28])>>(10)) + ((118 * input[29])>>(10)) - ((158 * input[30])>>(10)) + ((178 * input[31])>>(10)) - ((178 * input[32])>>(10)) + ((158 * input[33])>>(10)) - ((118 * input[34])>>(10)) + ((65 * input[35])>>(10)) - ((4 * input[36])>>(10)) - ((57 * input[37])>>(10)) + ((111 * input[38])>>(10)) - ((153 * input[39])>>(10)) + ((177 * input[40])>>(10)) - ((180 * input[41])>>(10)) + ((162 * input[42])>>(10)) - ((125 * input[43])>>(10)) + ((73 * input[44])>>(10)) - ((13 * input[45])>>(10)) - ((48 * input[46])>>(10)) + ((104 * input[47])>>(10)) - ((148 * input[48])>>(10)) + ((174 * input[49])>>(10)) - ((181 * input[50])>>(10)) + ((165 * input[51])>>(10)) - ((131 * input[52])>>(10)) + ((81 * input[53])>>(10)) - ((22 * input[54])>>(10)) - ((40 * input[55])>>(10)) + ((97 * input[56])>>(10)) - ((143 * input[57])>>(10)) + ((172 * input[58])>>(10)) - ((181 * input[59])>>(10)) + ((169 * input[60])>>(10)) - ((137 * input[61])>>(10)) + ((89 * input[62])>>(10)) - ((31 * input[63])>>(10));
  output[58] =  + ((27 * input[0])>>(10)) - ((77 * input[1])>>(10)) + ((122 * input[2])>>(10)) - ((155 * input[3])>>(10)) + ((176 * input[4])>>(10)) - ((181 * input[5])>>(10)) + ((170 * input[6])>>(10)) - ((145 * input[7])>>(10)) + ((108 * input[8])>>(10)) - ((61 * input[9])>>(10)) + ((9 * input[10])>>(10)) + ((44 * input[11])>>(10)) - ((93 * input[12])>>(10)) + ((134 * input[13])>>(10)) - ((164 * input[14])>>(10)) + ((179 * input[15])>>(10)) - ((179 * input[16])>>(10)) + ((164 * input[17])>>(10)) - ((134 * input[18])>>(10)) + ((93 * input[19])>>(10)) - ((44 * input[20])>>(10)) - ((9 * input[21])>>(10)) + ((61 * input[22])>>(10)) - ((108 * input[23])>>(10)) + ((145 * input[24])>>(10)) - ((170 * input[25])>>(10)) + ((181 * input[26])>>(10)) - ((176 * input[27])>>(10)) + ((155 * input[28])>>(10)) - ((122 * input[29])>>(10)) + ((77 * input[30])>>(10)) - ((27 * input[31])>>(10)) - ((27 * input[32])>>(10)) + ((77 * input[33])>>(10)) - ((122 * input[34])>>(10)) + ((155 * input[35])>>(10)) - ((176 * input[36])>>(10)) + ((181 * input[37])>>(10)) - ((170 * input[38])>>(10)) + ((145 * input[39])>>(10)) - ((108 * input[40])>>(10)) + ((61 * input[41])>>(10)) - ((9 * input[42])>>(10)) - ((44 * input[43])>>(10)) + ((93 * input[44])>>(10)) - ((134 * input[45])>>(10)) + ((164 * input[46])>>(10)) - ((179 * input[47])>>(10)) + ((179 * input[48])>>(10)) - ((164 * input[49])>>(10)) + ((134 * input[50])>>(10)) - ((93 * input[51])>>(10)) + ((44 * input[52])>>(10)) + ((9 * input[53])>>(10)) - ((61 * input[54])>>(10)) + ((108 * input[55])>>(10)) - ((145 * input[56])>>(10)) + ((170 * input[57])>>(10)) - ((181 * input[58])>>(10)) + ((176 * input[59])>>(10)) - ((155 * input[60])>>(10)) + ((122 * input[61])>>(10)) - ((77 * input[62])>>(10)) + ((27 * input[63])>>(10));
  output[59] =  + ((22 * input[0])>>(10)) - ((65 * input[1])>>(10)) + ((104 * input[2])>>(10)) - ((137 * input[3])>>(10)) + ((162 * input[4])>>(10)) - ((177 * input[5])>>(10)) + ((181 * input[6])>>(10)) - ((174 * input[7])>>(10)) + ((158 * input[8])>>(10)) - ((131 * input[9])>>(10)) + ((97 * input[10])>>(10)) - ((57 * input[11])>>(10)) + ((13 * input[12])>>(10)) + ((31 * input[13])>>(10)) - ((73 * input[14])>>(10)) + ((111 * input[15])>>(10)) - ((143 * input[16])>>(10)) + ((165 * input[17])>>(10)) - ((178 * input[18])>>(10)) + ((181 * input[19])>>(10)) - ((172 * input[20])>>(10)) + ((153 * input[21])>>(10)) - ((125 * input[22])>>(10)) + ((89 * input[23])>>(10)) - ((48 * input[24])>>(10)) + ((4 * input[25])>>(10)) + ((40 * input[26])>>(10)) - ((81 * input[27])>>(10)) + ((118 * input[28])>>(10)) - ((148 * input[29])>>(10)) + ((169 * input[30])>>(10)) - ((180 * input[31])>>(10)) + ((180 * input[32])>>(10)) - ((169 * input[33])>>(10)) + ((148 * input[34])>>(10)) - ((118 * input[35])>>(10)) + ((81 * input[36])>>(10)) - ((40 * input[37])>>(10)) - ((4 * input[38])>>(10)) + ((48 * input[39])>>(10)) - ((89 * input[40])>>(10)) + ((125 * input[41])>>(10)) - ((153 * input[42])>>(10)) + ((172 * input[43])>>(10)) - ((181 * input[44])>>(10)) + ((178 * input[45])>>(10)) - ((165 * input[46])>>(10)) + ((143 * input[47])>>(10)) - ((111 * input[48])>>(10)) + ((73 * input[49])>>(10)) - ((31 * input[50])>>(10)) - ((13 * input[51])>>(10)) + ((57 * input[52])>>(10)) - ((97 * input[53])>>(10)) + ((131 * input[54])>>(10)) - ((158 * input[55])>>(10)) + ((174 * input[56])>>(10)) - ((181 * input[57])>>(10)) + ((177 * input[58])>>(10)) - ((162 * input[59])>>(10)) + ((137 * input[60])>>(10)) - ((104 * input[61])>>(10)) + ((65 * input[62])>>(10)) - ((22 * input[63])>>(10));
  output[60] =  + ((18 * input[0])>>(10)) - ((53 * input[1])>>(10)) + ((85 * input[2])>>(10)) - ((115 * input[3])>>(10)) + ((140 * input[4])>>(10)) - ((160 * input[5])>>(10)) + ((173 * input[6])>>(10)) - ((180 * input[7])>>(10)) + ((180 * input[8])>>(10)) - ((173 * input[9])>>(10)) + ((160 * input[10])>>(10)) - ((140 * input[11])>>(10)) + ((115 * input[12])>>(10)) - ((85 * input[13])>>(10)) + ((53 * input[14])>>(10)) - ((18 * input[15])>>(10)) - ((18 * input[16])>>(10)) + ((53 * input[17])>>(10)) - ((85 * input[18])>>(10)) + ((115 * input[19])>>(10)) - ((140 * input[20])>>(10)) + ((160 * input[21])>>(10)) - ((173 * input[22])>>(10)) + ((180 * input[23])>>(10)) - ((180 * input[24])>>(10)) + ((173 * input[25])>>(10)) - ((160 * input[26])>>(10)) + ((140 * input[27])>>(10)) - ((115 * input[28])>>(10)) + ((85 * input[29])>>(10)) - ((53 * input[30])>>(10)) + ((18 * input[31])>>(10)) + ((18 * input[32])>>(10)) - ((53 * input[33])>>(10)) + ((85 * input[34])>>(10)) - ((115 * input[35])>>(10)) + ((140 * input[36])>>(10)) - ((160 * input[37])>>(10)) + ((173 * input[38])>>(10)) - ((180 * input[39])>>(10)) + ((180 * input[40])>>(10)) - ((173 * input[41])>>(10)) + ((160 * input[42])>>(10)) - ((140 * input[43])>>(10)) + ((115 * input[44])>>(10)) - ((85 * input[45])>>(10)) + ((53 * input[46])>>(10)) - ((18 * input[47])>>(10)) - ((18 * input[48])>>(10)) + ((53 * input[49])>>(10)) - ((85 * input[50])>>(10)) + ((115 * input[51])>>(10)) - ((140 * input[52])>>(10)) + ((160 * input[53])>>(10)) - ((173 * input[54])>>(10)) + ((180 * input[55])>>(10)) - ((180 * input[56])>>(10)) + ((173 * input[57])>>(10)) - ((160 * input[58])>>(10)) + ((140 * input[59])>>(10)) - ((115 * input[60])>>(10)) + ((85 * input[61])>>(10)) - ((53 * input[62])>>(10)) + ((18 * input[63])>>(10));
  output[61] =  + ((13 * input[0])>>(10)) - ((40 * input[1])>>(10)) + ((65 * input[2])>>(10)) - ((89 * input[3])>>(10)) + ((111 * input[4])>>(10)) - ((131 * input[5])>>(10)) + ((148 * input[6])>>(10)) - ((162 * input[7])>>(10)) + ((172 * input[8])>>(10)) - ((178 * input[9])>>(10)) + ((181 * input[10])>>(10)) - ((180 * input[11])>>(10)) + ((174 * input[12])>>(10)) - ((165 * input[13])>>(10)) + ((153 * input[14])>>(10)) - ((137 * input[15])>>(10)) + ((118 * input[16])>>(10)) - ((97 * input[17])>>(10)) + ((73 * input[18])>>(10)) - ((48 * input[19])>>(10)) + ((22 * input[20])>>(10)) + ((4 * input[21])>>(10)) - ((31 * input[22])>>(10)) + ((57 * input[23])>>(10)) - ((81 * input[24])>>(10)) + ((104 * input[25])>>(10)) - ((125 * input[26])>>(10)) + ((143 * input[27])>>(10)) - ((158 * input[28])>>(10)) + ((169 * input[29])>>(10)) - ((177 * input[30])>>(10)) + ((181 * input[31])>>(10)) - ((181 * input[32])>>(10)) + ((177 * input[33])>>(10)) - ((169 * input[34])>>(10)) + ((158 * input[35])>>(10)) - ((143 * input[36])>>(10)) + ((125 * input[37])>>(10)) - ((104 * input[38])>>(10)) + ((81 * input[39])>>(10)) - ((57 * input[40])>>(10)) + ((31 * input[41])>>(10)) - ((4 * input[42])>>(10)) - ((22 * input[43])>>(10)) + ((48 * input[44])>>(10)) - ((73 * input[45])>>(10)) + ((97 * input[46])>>(10)) - ((118 * input[47])>>(10)) + ((137 * input[48])>>(10)) - ((153 * input[49])>>(10)) + ((165 * input[50])>>(10)) - ((174 * input[51])>>(10)) + ((180 * input[52])>>(10)) - ((181 * input[53])>>(10)) + ((178 * input[54])>>(10)) - ((172 * input[55])>>(10)) + ((162 * input[56])>>(10)) - ((148 * input[57])>>(10)) + ((131 * input[58])>>(10)) - ((111 * input[59])>>(10)) + ((89 * input[60])>>(10)) - ((65 * input[61])>>(10)) + ((40 * input[62])>>(10)) - ((13 * input[63])>>(10));
  output[62] =  + ((9 * input[0])>>(10)) - ((27 * input[1])>>(10)) + ((44 * input[2])>>(10)) - ((61 * input[3])>>(10)) + ((77 * input[4])>>(10)) - ((93 * input[5])>>(10)) + ((108 * input[6])>>(10)) - ((122 * input[7])>>(10)) + ((134 * input[8])>>(10)) - ((145 * input[9])>>(10)) + ((155 * input[10])>>(10)) - ((164 * input[11])>>(10)) + ((170 * input[12])>>(10)) - ((176 * input[13])>>(10)) + ((179 * input[14])>>(10)) - ((181 * input[15])>>(10)) + ((181 * input[16])>>(10)) - ((179 * input[17])>>(10)) + ((176 * input[18])>>(10)) - ((170 * input[19])>>(10)) + ((164 * input[20])>>(10)) - ((155 * input[21])>>(10)) + ((145 * input[22])>>(10)) - ((134 * input[23])>>(10)) + ((122 * input[24])>>(10)) - ((108 * input[25])>>(10)) + ((93 * input[26])>>(10)) - ((77 * input[27])>>(10)) + ((61 * input[28])>>(10)) - ((44 * input[29])>>(10)) + ((27 * input[30])>>(10)) - ((9 * input[31])>>(10)) - ((9 * input[32])>>(10)) + ((27 * input[33])>>(10)) - ((44 * input[34])>>(10)) + ((61 * input[35])>>(10)) - ((77 * input[36])>>(10)) + ((93 * input[37])>>(10)) - ((108 * input[38])>>(10)) + ((122 * input[39])>>(10)) - ((134 * input[40])>>(10)) + ((145 * input[41])>>(10)) - ((155 * input[42])>>(10)) + ((164 * input[43])>>(10)) - ((170 * input[44])>>(10)) + ((176 * input[45])>>(10)) - ((179 * input[46])>>(10)) + ((181 * input[47])>>(10)) - ((181 * input[48])>>(10)) + ((179 * input[49])>>(10)) - ((176 * input[50])>>(10)) + ((170 * input[51])>>(10)) - ((164 * input[52])>>(10)) + ((155 * input[53])>>(10)) - ((145 * input[54])>>(10)) + ((134 * input[55])>>(10)) - ((122 * input[56])>>(10)) + ((108 * input[57])>>(10)) - ((93 * input[58])>>(10)) + ((77 * input[59])>>(10)) - ((61 * input[60])>>(10)) + ((44 * input[61])>>(10)) - ((27 * input[62])>>(10)) + ((9 * input[63])>>(10));
  output[63] =  + ((4 * input[0])>>(10)) - ((13 * input[1])>>(10)) + ((22 * input[2])>>(10)) - ((31 * input[3])>>(10)) + ((40 * input[4])>>(10)) - ((48 * input[5])>>(10)) + ((57 * input[6])>>(10)) - ((65 * input[7])>>(10)) + ((73 * input[8])>>(10)) - ((81 * input[9])>>(10)) + ((89 * input[10])>>(10)) - ((97 * input[11])>>(10)) + ((104 * input[12])>>(10)) - ((111 * input[13])>>(10)) + ((118 * input[14])>>(10)) - ((125 * input[15])>>(10)) + ((131 * input[16])>>(10)) - ((137 * input[17])>>(10)) + ((143 * input[18])>>(10)) - ((148 * input[19])>>(10)) + ((153 * input[20])>>(10)) - ((158 * input[21])>>(10)) + ((162 * input[22])>>(10)) - ((165 * input[23])>>(10)) + ((169 * input[24])>>(10)) - ((172 * input[25])>>(10)) + ((174 * input[26])>>(10)) - ((177 * input[27])>>(10)) + ((178 * input[28])>>(10)) - ((180 * input[29])>>(10)) + ((181 * input[30])>>(10)) - ((181 * input[31])>>(10)) + ((181 * input[32])>>(10)) - ((181 * input[33])>>(10)) + ((180 * input[34])>>(10)) - ((178 * input[35])>>(10)) + ((177 * input[36])>>(10)) - ((174 * input[37])>>(10)) + ((172 * input[38])>>(10)) - ((169 * input[39])>>(10)) + ((165 * input[40])>>(10)) - ((162 * input[41])>>(10)) + ((158 * input[42])>>(10)) - ((153 * input[43])>>(10)) + ((148 * input[44])>>(10)) - ((143 * input[45])>>(10)) + ((137 * input[46])>>(10)) - ((131 * input[47])>>(10)) + ((125 * input[48])>>(10)) - ((118 * input[49])>>(10)) + ((111 * input[50])>>(10)) - ((104 * input[51])>>(10)) + ((97 * input[52])>>(10)) - ((89 * input[53])>>(10)) + ((81 * input[54])>>(10)) - ((73 * input[55])>>(10)) + ((65 * input[56])>>(10)) - ((57 * input[57])>>(10)) + ((48 * input[58])>>(10)) - ((40 * input[59])>>(10)) + ((31 * input[60])>>(10)) - ((22 * input[61])>>(10)) + ((13 * input[62])>>(10)) - ((4 * input[63])>>(10));
  */
}
