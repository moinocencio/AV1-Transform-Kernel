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
  output[0] = (4 * input[0]>>(2)) + (4 * input[1]>>(2)) + (4 * input[2]>>(2)) + (4 * input[3]>>(2));
  output[1] = (5 * input[0]>>(2)) + (2 * input[1]>>(2)) - (2 * input[2]>>(2)) - (5 * input[3]>>(2));
  output[2] = (4 * input[0]>>(2)) - (4 * input[1]>>(2)) - (4 * input[2]>>(2)) + (4 * input[3]>>(2));
  output[3] = (2 * input[0]>>(2)) - (5 * input[1]>>(2)) + (5 * input[2]>>(2)) - (2 * input[3]>>(2));
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
  output[0] = (8 * input[0]>>(3)) + (8 * input[1]>>(3)) + (8 * input[2]>>(3)) + (8 * input[3]>>(3)) + (8 * input[4]>>(3)) + (8 * input[5]>>(3)) + (8 * input[6]>>(3)) + (8 * input[7]>>(3));
  output[1] = (11 * input[0]>>(3)) + (9 * input[1]>>(3)) + (6 * input[2]>>(3)) + (2 * input[3]>>(3)) - (2 * input[4]>>(3)) - (6 * input[5]>>(3)) - (9 * input[6]>>(3)) - (11 * input[7]>>(3));
  output[2] = (10 * input[0]>>(3)) + (4 * input[1]>>(3)) - (4 * input[2]>>(3)) - (10 * input[3]>>(3)) - (10 * input[4]>>(3)) - (4 * input[5]>>(3)) + (4 * input[6]>>(3)) + (10 * input[7]>>(3));
  output[3] = (9 * input[0]>>(3)) - (2 * input[1]>>(3)) - (11 * input[2]>>(3)) - (6 * input[3]>>(3)) + (6 * input[4]>>(3)) + (11 * input[5]>>(3)) + (2 * input[6]>>(3)) - (9 * input[7]>>(3));
  output[4] = (8 * input[0]>>(3)) - (8 * input[1]>>(3)) - (8 * input[2]>>(3)) + (8 * input[3]>>(3)) + (8 * input[4]>>(3)) - (8 * input[5]>>(3)) - (8 * input[6]>>(3)) + (8 * input[7]>>(3));
  output[5] = (6 * input[0]>>(3)) - (11 * input[1]>>(3)) + (2 * input[2]>>(3)) + (9 * input[3]>>(3)) - (9 * input[4]>>(3)) - (2 * input[5]>>(3)) + (11 * input[6]>>(3)) - (6 * input[7]>>(3));
  output[6] = (4 * input[0]>>(3)) - (10 * input[1]>>(3)) + (10 * input[2]>>(3)) - (4 * input[3]>>(3)) - (4 * input[4]>>(3)) + (10 * input[5]>>(3)) - (10 * input[6]>>(3)) + (4 * input[7]>>(3));
  output[7] = (2 * input[0]>>(3)) - (6 * input[1]>>(3)) + (9 * input[2]>>(3)) - (11 * input[3]>>(3)) + (11 * input[4]>>(3)) - (9 * input[5]>>(3)) + (6 * input[6]>>(3)) - (2 * input[7]>>(3));

   
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
  output[0] = (16 * input[0]>>(4)) + (16 * input[1]>>(4)) + (16 * input[2]>>(4)) + (16 * input[3]>>(4)) + (16 * input[4]>>(4)) + (16 * input[5]>>(4)) + (16 * input[6]>>(4)) + (16 * input[7]>>(4)) + (16 * input[8]>>(4)) + (16 * input[9]>>(4)) + (16 * input[10]>>(4)) + (16 * input[11]>>(4)) + (16 * input[12]>>(4)) + (16 * input[13]>>(4)) + (16 * input[14]>>(4)) + (16 * input[15]>>(4));
  output[1] = (23 * input[0]>>(4)) + (22 * input[1]>>(4)) + (20 * input[2]>>(4)) + (17 * input[3]>>(4)) + (14 * input[4]>>(4)) + (11 * input[5]>>(4)) + (7 * input[6]>>(4)) + (2 * input[7]>>(4)) - (2 * input[8]>>(4)) - (7 * input[9]>>(4)) - (11 * input[10]>>(4)) - (14 * input[11]>>(4)) - (17 * input[12]>>(4)) - (20 * input[13]>>(4)) - (22 * input[14]>>(4)) - (23 * input[15]>>(4));
  output[2] = (22 * input[0]>>(4)) + (19 * input[1]>>(4)) + (13 * input[2]>>(4)) + (4 * input[3]>>(4)) - (4 * input[4]>>(4)) - (13 * input[5]>>(4)) - (19 * input[6]>>(4)) - (22 * input[7]>>(4)) - (22 * input[8]>>(4)) - (19 * input[9]>>(4)) - (13 * input[10]>>(4)) - (4 * input[11]>>(4)) + (4 * input[12]>>(4)) + (13 * input[13]>>(4)) + (19 * input[14]>>(4)) + (22 * input[15]>>(4));
  output[3] = (22 * input[0]>>(4)) + (14 * input[1]>>(4)) + (2 * input[2]>>(4)) - (11 * input[3]>>(4)) - (20 * input[4]>>(4)) - (23 * input[5]>>(4)) - (17 * input[6]>>(4)) - (7 * input[7]>>(4)) + (7 * input[8]>>(4)) + (17 * input[9]>>(4)) + (23 * input[10]>>(4)) + (20 * input[11]>>(4)) + (11 * input[12]>>(4)) - (2 * input[13]>>(4)) - (14 * input[14]>>(4)) - (22 * input[15]>>(4));
  output[4] = (21 * input[0]>>(4)) + (9 * input[1]>>(4)) - (9 * input[2]>>(4)) - (21 * input[3]>>(4)) - (21 * input[4]>>(4)) - (9 * input[5]>>(4)) + (9 * input[6]>>(4)) + (21 * input[7]>>(4)) + (21 * input[8]>>(4)) + (9 * input[9]>>(4)) - (9 * input[10]>>(4)) - (21 * input[11]>>(4)) - (21 * input[12]>>(4)) - (9 * input[13]>>(4)) + (9 * input[14]>>(4)) + (21 * input[15]>>(4));
  output[5] = (20 * input[0]>>(4)) + (2 * input[1]>>(4)) - (17 * input[2]>>(4)) - (22 * input[3]>>(4)) - (7 * input[4]>>(4)) + (14 * input[5]>>(4)) + (23 * input[6]>>(4)) + (11 * input[7]>>(4)) - (11 * input[8]>>(4)) - (23 * input[9]>>(4)) - (14 * input[10]>>(4)) + (7 * input[11]>>(4)) + (22 * input[12]>>(4)) + (17 * input[13]>>(4)) - (2 * input[14]>>(4)) - (20 * input[15]>>(4));
  output[6] = (19 * input[0]>>(4)) - (4 * input[1]>>(4)) - (22 * input[2]>>(4)) - (13 * input[3]>>(4)) + (13 * input[4]>>(4)) + (22 * input[5]>>(4)) + (4 * input[6]>>(4)) - (19 * input[7]>>(4)) - (19 * input[8]>>(4)) + (4 * input[9]>>(4)) + (22 * input[10]>>(4)) + (13 * input[11]>>(4)) - (13 * input[12]>>(4)) - (22 * input[13]>>(4)) - (4 * input[14]>>(4)) + (19 * input[15]>>(4));
  output[7] = (17 * input[0]>>(4)) - (11 * input[1]>>(4)) - (22 * input[2]>>(4)) + (2 * input[3]>>(4)) + (23 * input[4]>>(4)) + (7 * input[5]>>(4)) - (20 * input[6]>>(4)) - (14 * input[7]>>(4)) + (14 * input[8]>>(4)) + (20 * input[9]>>(4)) - (7 * input[10]>>(4)) - (23 * input[11]>>(4)) - (2 * input[12]>>(4)) + (22 * input[13]>>(4)) + (11 * input[14]>>(4)) - (17 * input[15]>>(4));
  output[8] = (16 * input[0]>>(4)) - (16 * input[1]>>(4)) - (16 * input[2]>>(4)) + (16 * input[3]>>(4)) + (16 * input[4]>>(4)) - (16 * input[5]>>(4)) - (16 * input[6]>>(4)) + (16 * input[7]>>(4)) + (16 * input[8]>>(4)) - (16 * input[9]>>(4)) - (16 * input[10]>>(4)) + (16 * input[11]>>(4)) + (16 * input[12]>>(4)) - (16 * input[13]>>(4)) - (16 * input[14]>>(4)) + (16 * input[15]>>(4));
  output[9] = (14 * input[0]>>(4)) - (20 * input[1]>>(4)) - (7 * input[2]>>(4)) + (23 * input[3]>>(4)) - (2 * input[4]>>(4)) - (22 * input[5]>>(4)) + (11 * input[6]>>(4)) + (17 * input[7]>>(4)) - (17 * input[8]>>(4)) - (11 * input[9]>>(4)) + (22 * input[10]>>(4)) + (2 * input[11]>>(4)) - (23 * input[12]>>(4)) + (7 * input[13]>>(4)) + (20 * input[14]>>(4)) - (14 * input[15]>>(4));
  output[10] = (13 * input[0]>>(4)) - (22 * input[1]>>(4)) + (4 * input[2]>>(4)) + (19 * input[3]>>(4)) - (19 * input[4]>>(4)) - (4 * input[5]>>(4)) + (22 * input[6]>>(4)) - (13 * input[7]>>(4)) - (13 * input[8]>>(4)) + (22 * input[9]>>(4)) - (4 * input[10]>>(4)) - (19 * input[11]>>(4)) + (19 * input[12]>>(4)) + (4 * input[13]>>(4)) - (22 * input[14]>>(4)) + (13 * input[15]>>(4));
  output[11] = (11 * input[0]>>(4)) - (23 * input[1]>>(4)) + (14 * input[2]>>(4)) + (7 * input[3]>>(4)) - (22 * input[4]>>(4)) + (17 * input[5]>>(4)) + (2 * input[6]>>(4)) - (20 * input[7]>>(4)) + (20 * input[8]>>(4)) - (2 * input[9]>>(4)) - (17 * input[10]>>(4)) + (22 * input[11]>>(4)) - (7 * input[12]>>(4)) - (14 * input[13]>>(4)) + (23 * input[14]>>(4)) - (11 * input[15]>>(4));
  output[12] = (9 * input[0]>>(4)) - (21 * input[1]>>(4)) + (21 * input[2]>>(4)) - (9 * input[3]>>(4)) - (9 * input[4]>>(4)) + (21 * input[5]>>(4)) - (21 * input[6]>>(4)) + (9 * input[7]>>(4)) + (9 * input[8]>>(4)) - (21 * input[9]>>(4)) + (21 * input[10]>>(4)) - (9 * input[11]>>(4)) - (9 * input[12]>>(4)) + (21 * input[13]>>(4)) - (21 * input[14]>>(4)) + (9 * input[15]>>(4));
  output[13] = (7 * input[0]>>(4)) - (17 * input[1]>>(4)) + (23 * input[2]>>(4)) - (20 * input[3]>>(4)) + (11 * input[4]>>(4)) + (2 * input[5]>>(4)) - (14 * input[6]>>(4)) + (22 * input[7]>>(4)) - (22 * input[8]>>(4)) + (14 * input[9]>>(4)) - (2 * input[10]>>(4)) - (11 * input[11]>>(4)) + (20 * input[12]>>(4)) - (23 * input[13]>>(4)) + (17 * input[14]>>(4)) - (7 * input[15]>>(4));
  output[14] = (4 * input[0]>>(4)) - (13 * input[1]>>(4)) + (19 * input[2]>>(4)) - (22 * input[3]>>(4)) + (22 * input[4]>>(4)) - (19 * input[5]>>(4)) + (13 * input[6]>>(4)) - (4 * input[7]>>(4)) - (4 * input[8]>>(4)) + (13 * input[9]>>(4)) - (19 * input[10]>>(4)) + (22 * input[11]>>(4)) - (22 * input[12]>>(4)) + (19 * input[13]>>(4)) - (13 * input[14]>>(4)) + (4 * input[15]>>(4));
  output[15] = (2 * input[0]>>(4)) - (7 * input[1]>>(4)) + (11 * input[2]>>(4)) - (14 * input[3]>>(4)) + (17 * input[4]>>(4)) - (20 * input[5]>>(4)) + (22 * input[6]>>(4)) - (23 * input[7]>>(4)) + (23 * input[8]>>(4)) - (22 * input[9]>>(4)) + (20 * input[10]>>(4)) - (17 * input[11]>>(4)) + (14 * input[12]>>(4)) - (11 * input[13]>>(4)) + (7 * input[14]>>(4)) - (2 * input[15]>>(4));
}

void av1_fdct32_new(const int32_t *input, int32_t *output, int8_t cos_bit,
                    const int8_t *stage_range) {
  /*  
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
  */
  output[0] = (32 * input[0]>>(5)) + (32 * input[1]>>(5)) + (32 * input[2]>>(5)) + (32 * input[3]>>(5)) + (32 * input[4]>>(5)) + (32 * input[5]>>(5)) + (32 * input[6]>>(5)) + (32 * input[7]>>(5)) + (32 * input[8]>>(5)) + (32 * input[9]>>(5)) + (32 * input[10]>>(5)) + (32 * input[11]>>(5)) + (32 * input[12]>>(5)) + (32 * input[13]>>(5)) + (32 * input[14]>>(5)) + (32 * input[15]>>(5)) + (32 * input[16]>>(5)) + (32 * input[17]>>(5)) + (32 * input[18]>>(5)) + (32 * input[19]>>(5)) + (32 * input[20]>>(5)) + (32 * input[21]>>(5)) + (32 * input[22]>>(5)) + (32 * input[23]>>(5)) + (32 * input[24]>>(5)) + (32 * input[25]>>(5)) + (32 * input[26]>>(5)) + (32 * input[27]>>(5)) + (32 * input[28]>>(5)) + (32 * input[29]>>(5)) + (32 * input[30]>>(5)) + (32 * input[31]>>(5));
  output[1] = (45 * input[0]>>(5)) + (45 * input[1]>>(5)) + (44 * input[2]>>(5)) + (43 * input[3]>>(5)) + (41 * input[4]>>(5)) + (39 * input[5]>>(5)) + (36 * input[6]>>(5)) + (34 * input[7]>>(5)) + (30 * input[8]>>(5)) + (27 * input[9]>>(5)) + (23 * input[10]>>(5)) + (19 * input[11]>>(5)) + (15 * input[12]>>(5)) + (11 * input[13]>>(5)) + (7 * input[14]>>(5)) + (2 * input[15]>>(5)) - (2 * input[16]>>(5)) - (7 * input[17]>>(5)) - (11 * input[18]>>(5)) - (15 * input[19]>>(5)) - (19 * input[20]>>(5)) - (23 * input[21]>>(5)) - (27 * input[22]>>(5)) - (30 * input[23]>>(5)) - (34 * input[24]>>(5)) - (36 * input[25]>>(5)) - (39 * input[26]>>(5)) - (41 * input[27]>>(5)) - (43 * input[28]>>(5)) - (44 * input[29]>>(5)) - (45 * input[30]>>(5)) - (45 * input[31]>>(5));
  output[2] = (45 * input[0]>>(5)) + (43 * input[1]>>(5)) + (40 * input[2]>>(5)) + (35 * input[3]>>(5)) + (29 * input[4]>>(5)) + (21 * input[5]>>(5)) + (13 * input[6]>>(5)) + (4 * input[7]>>(5)) - (4 * input[8]>>(5)) - (13 * input[9]>>(5)) - (21 * input[10]>>(5)) - (29 * input[11]>>(5)) - (35 * input[12]>>(5)) - (40 * input[13]>>(5)) - (43 * input[14]>>(5)) - (45 * input[15]>>(5)) - (45 * input[16]>>(5)) - (43 * input[17]>>(5)) - (40 * input[18]>>(5)) - (35 * input[19]>>(5)) - (29 * input[20]>>(5)) - (21 * input[21]>>(5)) - (13 * input[22]>>(5)) - (4 * input[23]>>(5)) + (4 * input[24]>>(5)) + (13 * input[25]>>(5)) + (21 * input[26]>>(5)) + (29 * input[27]>>(5)) + (35 * input[28]>>(5)) + (40 * input[29]>>(5)) + (43 * input[30]>>(5)) + (45 * input[31]>>(5));
  output[3] = (45 * input[0]>>(5)) + (41 * input[1]>>(5)) + (34 * input[2]>>(5)) + (23 * input[3]>>(5)) + (11 * input[4]>>(5)) - (2 * input[5]>>(5)) - (15 * input[6]>>(5)) - (27 * input[7]>>(5)) - (36 * input[8]>>(5)) - (43 * input[9]>>(5)) - (45 * input[10]>>(5)) - (44 * input[11]>>(5)) - (39 * input[12]>>(5)) - (30 * input[13]>>(5)) - (19 * input[14]>>(5)) - (7 * input[15]>>(5)) + (7 * input[16]>>(5)) + (19 * input[17]>>(5)) + (30 * input[18]>>(5)) + (39 * input[19]>>(5)) + (44 * input[20]>>(5)) + (45 * input[21]>>(5)) + (43 * input[22]>>(5)) + (36 * input[23]>>(5)) + (27 * input[24]>>(5)) + (15 * input[25]>>(5)) + (2 * input[26]>>(5)) - (11 * input[27]>>(5)) - (23 * input[28]>>(5)) - (34 * input[29]>>(5)) - (41 * input[30]>>(5)) - (45 * input[31]>>(5));
  output[4] = (44 * input[0]>>(5)) + (38 * input[1]>>(5)) + (25 * input[2]>>(5)) + (9 * input[3]>>(5)) - (9 * input[4]>>(5)) - (25 * input[5]>>(5)) - (38 * input[6]>>(5)) - (44 * input[7]>>(5)) - (44 * input[8]>>(5)) - (38 * input[9]>>(5)) - (25 * input[10]>>(5)) - (9 * input[11]>>(5)) + (9 * input[12]>>(5)) + (25 * input[13]>>(5)) + (38 * input[14]>>(5)) + (44 * input[15]>>(5)) + (44 * input[16]>>(5)) + (38 * input[17]>>(5)) + (25 * input[18]>>(5)) + (9 * input[19]>>(5)) - (9 * input[20]>>(5)) - (25 * input[21]>>(5)) - (38 * input[22]>>(5)) - (44 * input[23]>>(5)) - (44 * input[24]>>(5)) - (38 * input[25]>>(5)) - (25 * input[26]>>(5)) - (9 * input[27]>>(5)) + (9 * input[28]>>(5)) + (25 * input[29]>>(5)) + (38 * input[30]>>(5)) + (44 * input[31]>>(5));
  output[5] = (44 * input[0]>>(5)) + (34 * input[1]>>(5)) + (15 * input[2]>>(5)) - (7 * input[3]>>(5)) - (27 * input[4]>>(5)) - (41 * input[5]>>(5)) - (45 * input[6]>>(5)) - (39 * input[7]>>(5)) - (23 * input[8]>>(5)) - (2 * input[9]>>(5)) + (19 * input[10]>>(5)) + (36 * input[11]>>(5)) + (45 * input[12]>>(5)) + (43 * input[13]>>(5)) + (30 * input[14]>>(5)) + (11 * input[15]>>(5)) - (11 * input[16]>>(5)) - (30 * input[17]>>(5)) - (43 * input[18]>>(5)) - (45 * input[19]>>(5)) - (36 * input[20]>>(5)) - (19 * input[21]>>(5)) + (2 * input[22]>>(5)) + (23 * input[23]>>(5)) + (39 * input[24]>>(5)) + (45 * input[25]>>(5)) + (41 * input[26]>>(5)) + (27 * input[27]>>(5)) + (7 * input[28]>>(5)) - (15 * input[29]>>(5)) - (34 * input[30]>>(5)) - (44 * input[31]>>(5));
  output[6] = (43 * input[0]>>(5)) + (29 * input[1]>>(5)) + (4 * input[2]>>(5)) - (21 * input[3]>>(5)) - (40 * input[4]>>(5)) - (45 * input[5]>>(5)) - (35 * input[6]>>(5)) - (13 * input[7]>>(5)) + (13 * input[8]>>(5)) + (35 * input[9]>>(5)) + (45 * input[10]>>(5)) + (40 * input[11]>>(5)) + (21 * input[12]>>(5)) - (4 * input[13]>>(5)) - (29 * input[14]>>(5)) - (43 * input[15]>>(5)) - (43 * input[16]>>(5)) - (29 * input[17]>>(5)) - (4 * input[18]>>(5)) + (21 * input[19]>>(5)) + (40 * input[20]>>(5)) + (45 * input[21]>>(5)) + (35 * input[22]>>(5)) + (13 * input[23]>>(5)) - (13 * input[24]>>(5)) - (35 * input[25]>>(5)) - (45 * input[26]>>(5)) - (40 * input[27]>>(5)) - (21 * input[28]>>(5)) + (4 * input[29]>>(5)) + (29 * input[30]>>(5)) + (43 * input[31]>>(5));
  output[7] = (43 * input[0]>>(5)) + (23 * input[1]>>(5)) - (7 * input[2]>>(5)) - (34 * input[3]>>(5)) - (45 * input[4]>>(5)) - (36 * input[5]>>(5)) - (11 * input[6]>>(5)) + (19 * input[7]>>(5)) + (41 * input[8]>>(5)) + (44 * input[9]>>(5)) + (27 * input[10]>>(5)) - (2 * input[11]>>(5)) - (30 * input[12]>>(5)) - (45 * input[13]>>(5)) - (39 * input[14]>>(5)) - (15 * input[15]>>(5)) + (15 * input[16]>>(5)) + (39 * input[17]>>(5)) + (45 * input[18]>>(5)) + (30 * input[19]>>(5)) + (2 * input[20]>>(5)) - (27 * input[21]>>(5)) - (44 * input[22]>>(5)) - (41 * input[23]>>(5)) - (19 * input[24]>>(5)) + (11 * input[25]>>(5)) + (36 * input[26]>>(5)) + (45 * input[27]>>(5)) + (34 * input[28]>>(5)) + (7 * input[29]>>(5)) - (23 * input[30]>>(5)) - (43 * input[31]>>(5));
  output[8] = (42 * input[0]>>(5)) + (17 * input[1]>>(5)) - (17 * input[2]>>(5)) - (42 * input[3]>>(5)) - (42 * input[4]>>(5)) - (17 * input[5]>>(5)) + (17 * input[6]>>(5)) + (42 * input[7]>>(5)) + (42 * input[8]>>(5)) + (17 * input[9]>>(5)) - (17 * input[10]>>(5)) - (42 * input[11]>>(5)) - (42 * input[12]>>(5)) - (17 * input[13]>>(5)) + (17 * input[14]>>(5)) + (42 * input[15]>>(5)) + (42 * input[16]>>(5)) + (17 * input[17]>>(5)) - (17 * input[18]>>(5)) - (42 * input[19]>>(5)) - (42 * input[20]>>(5)) - (17 * input[21]>>(5)) + (17 * input[22]>>(5)) + (42 * input[23]>>(5)) + (42 * input[24]>>(5)) + (17 * input[25]>>(5)) - (17 * input[26]>>(5)) - (42 * input[27]>>(5)) - (42 * input[28]>>(5)) - (17 * input[29]>>(5)) + (17 * input[30]>>(5)) + (42 * input[31]>>(5));
  output[9] = (41 * input[0]>>(5)) + (11 * input[1]>>(5)) - (27 * input[2]>>(5)) - (45 * input[3]>>(5)) - (30 * input[4]>>(5)) + (7 * input[5]>>(5)) + (39 * input[6]>>(5)) + (43 * input[7]>>(5)) + (15 * input[8]>>(5)) - (23 * input[9]>>(5)) - (45 * input[10]>>(5)) - (34 * input[11]>>(5)) + (2 * input[12]>>(5)) + (36 * input[13]>>(5)) + (44 * input[14]>>(5)) + (19 * input[15]>>(5)) - (19 * input[16]>>(5)) - (44 * input[17]>>(5)) - (36 * input[18]>>(5)) - (2 * input[19]>>(5)) + (34 * input[20]>>(5)) + (45 * input[21]>>(5)) + (23 * input[22]>>(5)) - (15 * input[23]>>(5)) - (43 * input[24]>>(5)) - (39 * input[25]>>(5)) - (7 * input[26]>>(5)) + (30 * input[27]>>(5)) + (45 * input[28]>>(5)) + (27 * input[29]>>(5)) - (11 * input[30]>>(5)) - (41 * input[31]>>(5));
  output[10] = (40 * input[0]>>(5)) + (4 * input[1]>>(5)) - (35 * input[2]>>(5)) - (43 * input[3]>>(5)) - (13 * input[4]>>(5)) + (29 * input[5]>>(5)) + (45 * input[6]>>(5)) + (21 * input[7]>>(5)) - (21 * input[8]>>(5)) - (45 * input[9]>>(5)) - (29 * input[10]>>(5)) + (13 * input[11]>>(5)) + (43 * input[12]>>(5)) + (35 * input[13]>>(5)) - (4 * input[14]>>(5)) - (40 * input[15]>>(5)) - (40 * input[16]>>(5)) - (4 * input[17]>>(5)) + (35 * input[18]>>(5)) + (43 * input[19]>>(5)) + (13 * input[20]>>(5)) - (29 * input[21]>>(5)) - (45 * input[22]>>(5)) - (21 * input[23]>>(5)) + (21 * input[24]>>(5)) + (45 * input[25]>>(5)) + (29 * input[26]>>(5)) - (13 * input[27]>>(5)) - (43 * input[28]>>(5)) - (35 * input[29]>>(5)) + (4 * input[30]>>(5)) + (40 * input[31]>>(5));
  output[11] = (39 * input[0]>>(5)) - (2 * input[1]>>(5)) - (41 * input[2]>>(5)) - (36 * input[3]>>(5)) + (7 * input[4]>>(5)) + (43 * input[5]>>(5)) + (34 * input[6]>>(5)) - (11 * input[7]>>(5)) - (44 * input[8]>>(5)) - (30 * input[9]>>(5)) + (15 * input[10]>>(5)) + (45 * input[11]>>(5)) + (27 * input[12]>>(5)) - (19 * input[13]>>(5)) - (45 * input[14]>>(5)) - (23 * input[15]>>(5)) + (23 * input[16]>>(5)) + (45 * input[17]>>(5)) + (19 * input[18]>>(5)) - (27 * input[19]>>(5)) - (45 * input[20]>>(5)) - (15 * input[21]>>(5)) + (30 * input[22]>>(5)) + (44 * input[23]>>(5)) + (11 * input[24]>>(5)) - (34 * input[25]>>(5)) - (43 * input[26]>>(5)) - (7 * input[27]>>(5)) + (36 * input[28]>>(5)) + (41 * input[29]>>(5)) + (2 * input[30]>>(5)) - (39 * input[31]>>(5));
  output[12] = (38 * input[0]>>(5)) - (9 * input[1]>>(5)) - (44 * input[2]>>(5)) - (25 * input[3]>>(5)) + (25 * input[4]>>(5)) + (44 * input[5]>>(5)) + (9 * input[6]>>(5)) - (38 * input[7]>>(5)) - (38 * input[8]>>(5)) + (9 * input[9]>>(5)) + (44 * input[10]>>(5)) + (25 * input[11]>>(5)) - (25 * input[12]>>(5)) - (44 * input[13]>>(5)) - (9 * input[14]>>(5)) + (38 * input[15]>>(5)) + (38 * input[16]>>(5)) - (9 * input[17]>>(5)) - (44 * input[18]>>(5)) - (25 * input[19]>>(5)) + (25 * input[20]>>(5)) + (44 * input[21]>>(5)) + (9 * input[22]>>(5)) - (38 * input[23]>>(5)) - (38 * input[24]>>(5)) + (9 * input[25]>>(5)) + (44 * input[26]>>(5)) + (25 * input[27]>>(5)) - (25 * input[28]>>(5)) - (44 * input[29]>>(5)) - (9 * input[30]>>(5)) + (38 * input[31]>>(5));
  output[13] = (36 * input[0]>>(5)) - (15 * input[1]>>(5)) - (45 * input[2]>>(5)) - (11 * input[3]>>(5)) + (39 * input[4]>>(5)) + (34 * input[5]>>(5)) - (19 * input[6]>>(5)) - (45 * input[7]>>(5)) - (7 * input[8]>>(5)) + (41 * input[9]>>(5)) + (30 * input[10]>>(5)) - (23 * input[11]>>(5)) - (44 * input[12]>>(5)) - (2 * input[13]>>(5)) + (43 * input[14]>>(5)) + (27 * input[15]>>(5)) - (27 * input[16]>>(5)) - (43 * input[17]>>(5)) + (2 * input[18]>>(5)) + (44 * input[19]>>(5)) + (23 * input[20]>>(5)) - (30 * input[21]>>(5)) - (41 * input[22]>>(5)) + (7 * input[23]>>(5)) + (45 * input[24]>>(5)) + (19 * input[25]>>(5)) - (34 * input[26]>>(5)) - (39 * input[27]>>(5)) + (11 * input[28]>>(5)) + (45 * input[29]>>(5)) + (15 * input[30]>>(5)) - (36 * input[31]>>(5));
  output[14] = (35 * input[0]>>(5)) - (21 * input[1]>>(5)) - (43 * input[2]>>(5)) + (4 * input[3]>>(5)) + (45 * input[4]>>(5)) + (13 * input[5]>>(5)) - (40 * input[6]>>(5)) - (29 * input[7]>>(5)) + (29 * input[8]>>(5)) + (40 * input[9]>>(5)) - (13 * input[10]>>(5)) - (45 * input[11]>>(5)) - (4 * input[12]>>(5)) + (43 * input[13]>>(5)) + (21 * input[14]>>(5)) - (35 * input[15]>>(5)) - (35 * input[16]>>(5)) + (21 * input[17]>>(5)) + (43 * input[18]>>(5)) - (4 * input[19]>>(5)) - (45 * input[20]>>(5)) - (13 * input[21]>>(5)) + (40 * input[22]>>(5)) + (29 * input[23]>>(5)) - (29 * input[24]>>(5)) - (40 * input[25]>>(5)) + (13 * input[26]>>(5)) + (45 * input[27]>>(5)) + (4 * input[28]>>(5)) - (43 * input[29]>>(5)) - (21 * input[30]>>(5)) + (35 * input[31]>>(5));
  output[15] = (34 * input[0]>>(5)) - (27 * input[1]>>(5)) - (39 * input[2]>>(5)) + (19 * input[3]>>(5)) + (43 * input[4]>>(5)) - (11 * input[5]>>(5)) - (45 * input[6]>>(5)) + (2 * input[7]>>(5)) + (45 * input[8]>>(5)) + (7 * input[9]>>(5)) - (44 * input[10]>>(5)) - (15 * input[11]>>(5)) + (41 * input[12]>>(5)) + (23 * input[13]>>(5)) - (36 * input[14]>>(5)) - (30 * input[15]>>(5)) + (30 * input[16]>>(5)) + (36 * input[17]>>(5)) - (23 * input[18]>>(5)) - (41 * input[19]>>(5)) + (15 * input[20]>>(5)) + (44 * input[21]>>(5)) - (7 * input[22]>>(5)) - (45 * input[23]>>(5)) - (2 * input[24]>>(5)) + (45 * input[25]>>(5)) + (11 * input[26]>>(5)) - (43 * input[27]>>(5)) - (19 * input[28]>>(5)) + (39 * input[29]>>(5)) + (27 * input[30]>>(5)) - (34 * input[31]>>(5));
  output[16] = (32 * input[0]>>(5)) - (32 * input[1]>>(5)) - (32 * input[2]>>(5)) + (32 * input[3]>>(5)) + (32 * input[4]>>(5)) - (32 * input[5]>>(5)) - (32 * input[6]>>(5)) + (32 * input[7]>>(5)) + (32 * input[8]>>(5)) - (32 * input[9]>>(5)) - (32 * input[10]>>(5)) + (32 * input[11]>>(5)) + (32 * input[12]>>(5)) - (32 * input[13]>>(5)) - (32 * input[14]>>(5)) + (32 * input[15]>>(5)) + (32 * input[16]>>(5)) - (32 * input[17]>>(5)) - (32 * input[18]>>(5)) + (32 * input[19]>>(5)) + (32 * input[20]>>(5)) - (32 * input[21]>>(5)) - (32 * input[22]>>(5)) + (32 * input[23]>>(5)) + (32 * input[24]>>(5)) - (32 * input[25]>>(5)) - (32 * input[26]>>(5)) + (32 * input[27]>>(5)) + (32 * input[28]>>(5)) - (32 * input[29]>>(5)) - (32 * input[30]>>(5)) + (32 * input[31]>>(5));
  output[17] = (30 * input[0]>>(5)) - (36 * input[1]>>(5)) - (23 * input[2]>>(5)) + (41 * input[3]>>(5)) + (15 * input[4]>>(5)) - (44 * input[5]>>(5)) - (7 * input[6]>>(5)) + (45 * input[7]>>(5)) - (2 * input[8]>>(5)) - (45 * input[9]>>(5)) + (11 * input[10]>>(5)) + (43 * input[11]>>(5)) - (19 * input[12]>>(5)) - (39 * input[13]>>(5)) + (27 * input[14]>>(5)) + (34 * input[15]>>(5)) - (34 * input[16]>>(5)) - (27 * input[17]>>(5)) + (39 * input[18]>>(5)) + (19 * input[19]>>(5)) - (43 * input[20]>>(5)) - (11 * input[21]>>(5)) + (45 * input[22]>>(5)) + (2 * input[23]>>(5)) - (45 * input[24]>>(5)) + (7 * input[25]>>(5)) + (44 * input[26]>>(5)) - (15 * input[27]>>(5)) - (41 * input[28]>>(5)) + (23 * input[29]>>(5)) + (36 * input[30]>>(5)) - (30 * input[31]>>(5));
  output[18] = (29 * input[0]>>(5)) - (40 * input[1]>>(5)) - (13 * input[2]>>(5)) + (45 * input[3]>>(5)) - (4 * input[4]>>(5)) - (43 * input[5]>>(5)) + (21 * input[6]>>(5)) + (35 * input[7]>>(5)) - (35 * input[8]>>(5)) - (21 * input[9]>>(5)) + (43 * input[10]>>(5)) + (4 * input[11]>>(5)) - (45 * input[12]>>(5)) + (13 * input[13]>>(5)) + (40 * input[14]>>(5)) - (29 * input[15]>>(5)) - (29 * input[16]>>(5)) + (40 * input[17]>>(5)) + (13 * input[18]>>(5)) - (45 * input[19]>>(5)) + (4 * input[20]>>(5)) + (43 * input[21]>>(5)) - (21 * input[22]>>(5)) - (35 * input[23]>>(5)) + (35 * input[24]>>(5)) + (21 * input[25]>>(5)) - (43 * input[26]>>(5)) - (4 * input[27]>>(5)) + (45 * input[28]>>(5)) - (13 * input[29]>>(5)) - (40 * input[30]>>(5)) + (29 * input[31]>>(5));
  output[19] = (27 * input[0]>>(5)) - (43 * input[1]>>(5)) - (2 * input[2]>>(5)) + (44 * input[3]>>(5)) - (23 * input[4]>>(5)) - (30 * input[5]>>(5)) + (41 * input[6]>>(5)) + (7 * input[7]>>(5)) - (45 * input[8]>>(5)) + (19 * input[9]>>(5)) + (34 * input[10]>>(5)) - (39 * input[11]>>(5)) - (11 * input[12]>>(5)) + (45 * input[13]>>(5)) - (15 * input[14]>>(5)) - (36 * input[15]>>(5)) + (36 * input[16]>>(5)) + (15 * input[17]>>(5)) - (45 * input[18]>>(5)) + (11 * input[19]>>(5)) + (39 * input[20]>>(5)) - (34 * input[21]>>(5)) - (19 * input[22]>>(5)) + (45 * input[23]>>(5)) - (7 * input[24]>>(5)) - (41 * input[25]>>(5)) + (30 * input[26]>>(5)) + (23 * input[27]>>(5)) - (44 * input[28]>>(5)) + (2 * input[29]>>(5)) + (43 * input[30]>>(5)) - (27 * input[31]>>(5));
  output[20] = (25 * input[0]>>(5)) - (44 * input[1]>>(5)) + (9 * input[2]>>(5)) + (38 * input[3]>>(5)) - (38 * input[4]>>(5)) - (9 * input[5]>>(5)) + (44 * input[6]>>(5)) - (25 * input[7]>>(5)) - (25 * input[8]>>(5)) + (44 * input[9]>>(5)) - (9 * input[10]>>(5)) - (38 * input[11]>>(5)) + (38 * input[12]>>(5)) + (9 * input[13]>>(5)) - (44 * input[14]>>(5)) + (25 * input[15]>>(5)) + (25 * input[16]>>(5)) - (44 * input[17]>>(5)) + (9 * input[18]>>(5)) + (38 * input[19]>>(5)) - (38 * input[20]>>(5)) - (9 * input[21]>>(5)) + (44 * input[22]>>(5)) - (25 * input[23]>>(5)) - (25 * input[24]>>(5)) + (44 * input[25]>>(5)) - (9 * input[26]>>(5)) - (38 * input[27]>>(5)) + (38 * input[28]>>(5)) + (9 * input[29]>>(5)) - (44 * input[30]>>(5)) + (25 * input[31]>>(5));
  output[21] = (23 * input[0]>>(5)) - (45 * input[1]>>(5)) + (19 * input[2]>>(5)) + (27 * input[3]>>(5)) - (45 * input[4]>>(5)) + (15 * input[5]>>(5)) + (30 * input[6]>>(5)) - (44 * input[7]>>(5)) + (11 * input[8]>>(5)) + (34 * input[9]>>(5)) - (43 * input[10]>>(5)) + (7 * input[11]>>(5)) + (36 * input[12]>>(5)) - (41 * input[13]>>(5)) + (2 * input[14]>>(5)) + (39 * input[15]>>(5)) - (39 * input[16]>>(5)) - (2 * input[17]>>(5)) + (41 * input[18]>>(5)) - (36 * input[19]>>(5)) - (7 * input[20]>>(5)) + (43 * input[21]>>(5)) - (34 * input[22]>>(5)) - (11 * input[23]>>(5)) + (44 * input[24]>>(5)) - (30 * input[25]>>(5)) - (15 * input[26]>>(5)) + (45 * input[27]>>(5)) - (27 * input[28]>>(5)) - (19 * input[29]>>(5)) + (45 * input[30]>>(5)) - (23 * input[31]>>(5));
  output[22] = (21 * input[0]>>(5)) - (45 * input[1]>>(5)) + (29 * input[2]>>(5)) + (13 * input[3]>>(5)) - (43 * input[4]>>(5)) + (35 * input[5]>>(5)) + (4 * input[6]>>(5)) - (40 * input[7]>>(5)) + (40 * input[8]>>(5)) - (4 * input[9]>>(5)) - (35 * input[10]>>(5)) + (43 * input[11]>>(5)) - (13 * input[12]>>(5)) - (29 * input[13]>>(5)) + (45 * input[14]>>(5)) - (21 * input[15]>>(5)) - (21 * input[16]>>(5)) + (45 * input[17]>>(5)) - (29 * input[18]>>(5)) - (13 * input[19]>>(5)) + (43 * input[20]>>(5)) - (35 * input[21]>>(5)) - (4 * input[22]>>(5)) + (40 * input[23]>>(5)) - (40 * input[24]>>(5)) + (4 * input[25]>>(5)) + (35 * input[26]>>(5)) - (43 * input[27]>>(5)) + (13 * input[28]>>(5)) + (29 * input[29]>>(5)) - (45 * input[30]>>(5)) + (21 * input[31]>>(5));
  output[23] = (19 * input[0]>>(5)) - (44 * input[1]>>(5)) + (36 * input[2]>>(5)) - (2 * input[3]>>(5)) - (34 * input[4]>>(5)) + (45 * input[5]>>(5)) - (23 * input[6]>>(5)) - (15 * input[7]>>(5)) + (43 * input[8]>>(5)) - (39 * input[9]>>(5)) + (7 * input[10]>>(5)) + (30 * input[11]>>(5)) - (45 * input[12]>>(5)) + (27 * input[13]>>(5)) + (11 * input[14]>>(5)) - (41 * input[15]>>(5)) + (41 * input[16]>>(5)) - (11 * input[17]>>(5)) - (27 * input[18]>>(5)) + (45 * input[19]>>(5)) - (30 * input[20]>>(5)) - (7 * input[21]>>(5)) + (39 * input[22]>>(5)) - (43 * input[23]>>(5)) + (15 * input[24]>>(5)) + (23 * input[25]>>(5)) - (45 * input[26]>>(5)) + (34 * input[27]>>(5)) + (2 * input[28]>>(5)) - (36 * input[29]>>(5)) + (44 * input[30]>>(5)) - (19 * input[31]>>(5));
  output[24] = (17 * input[0]>>(5)) - (42 * input[1]>>(5)) + (42 * input[2]>>(5)) - (17 * input[3]>>(5)) - (17 * input[4]>>(5)) + (42 * input[5]>>(5)) - (42 * input[6]>>(5)) + (17 * input[7]>>(5)) + (17 * input[8]>>(5)) - (42 * input[9]>>(5)) + (42 * input[10]>>(5)) - (17 * input[11]>>(5)) - (17 * input[12]>>(5)) + (42 * input[13]>>(5)) - (42 * input[14]>>(5)) + (17 * input[15]>>(5)) + (17 * input[16]>>(5)) - (42 * input[17]>>(5)) + (42 * input[18]>>(5)) - (17 * input[19]>>(5)) - (17 * input[20]>>(5)) + (42 * input[21]>>(5)) - (42 * input[22]>>(5)) + (17 * input[23]>>(5)) + (17 * input[24]>>(5)) - (42 * input[25]>>(5)) + (42 * input[26]>>(5)) - (17 * input[27]>>(5)) - (17 * input[28]>>(5)) + (42 * input[29]>>(5)) - (42 * input[30]>>(5)) + (17 * input[31]>>(5));
  output[25] = (15 * input[0]>>(5)) - (39 * input[1]>>(5)) + (45 * input[2]>>(5)) - (30 * input[3]>>(5)) + (2 * input[4]>>(5)) + (27 * input[5]>>(5)) - (44 * input[6]>>(5)) + (41 * input[7]>>(5)) - (19 * input[8]>>(5)) - (11 * input[9]>>(5)) + (36 * input[10]>>(5)) - (45 * input[11]>>(5)) + (34 * input[12]>>(5)) - (7 * input[13]>>(5)) - (23 * input[14]>>(5)) + (43 * input[15]>>(5)) - (43 * input[16]>>(5)) + (23 * input[17]>>(5)) + (7 * input[18]>>(5)) - (34 * input[19]>>(5)) + (45 * input[20]>>(5)) - (36 * input[21]>>(5)) + (11 * input[22]>>(5)) + (19 * input[23]>>(5)) - (41 * input[24]>>(5)) + (44 * input[25]>>(5)) - (27 * input[26]>>(5)) - (2 * input[27]>>(5)) + (30 * input[28]>>(5)) - (45 * input[29]>>(5)) + (39 * input[30]>>(5)) - (15 * input[31]>>(5));
  output[26] = (13 * input[0]>>(5)) - (35 * input[1]>>(5)) + (45 * input[2]>>(5)) - (40 * input[3]>>(5)) + (21 * input[4]>>(5)) + (4 * input[5]>>(5)) - (29 * input[6]>>(5)) + (43 * input[7]>>(5)) - (43 * input[8]>>(5)) + (29 * input[9]>>(5)) - (4 * input[10]>>(5)) - (21 * input[11]>>(5)) + (40 * input[12]>>(5)) - (45 * input[13]>>(5)) + (35 * input[14]>>(5)) - (13 * input[15]>>(5)) - (13 * input[16]>>(5)) + (35 * input[17]>>(5)) - (45 * input[18]>>(5)) + (40 * input[19]>>(5)) - (21 * input[20]>>(5)) - (4 * input[21]>>(5)) + (29 * input[22]>>(5)) - (43 * input[23]>>(5)) + (43 * input[24]>>(5)) - (29 * input[25]>>(5)) + (4 * input[26]>>(5)) + (21 * input[27]>>(5)) - (40 * input[28]>>(5)) + (45 * input[29]>>(5)) - (35 * input[30]>>(5)) + (13 * input[31]>>(5));
  output[27] = (11 * input[0]>>(5)) - (30 * input[1]>>(5)) + (43 * input[2]>>(5)) - (45 * input[3]>>(5)) + (36 * input[4]>>(5)) - (19 * input[5]>>(5)) - (2 * input[6]>>(5)) + (23 * input[7]>>(5)) - (39 * input[8]>>(5)) + (45 * input[9]>>(5)) - (41 * input[10]>>(5)) + (27 * input[11]>>(5)) - (7 * input[12]>>(5)) - (15 * input[13]>>(5)) + (34 * input[14]>>(5)) - (44 * input[15]>>(5)) + (44 * input[16]>>(5)) - (34 * input[17]>>(5)) + (15 * input[18]>>(5)) + (7 * input[19]>>(5)) - (27 * input[20]>>(5)) + (41 * input[21]>>(5)) - (45 * input[22]>>(5)) + (39 * input[23]>>(5)) - (23 * input[24]>>(5)) + (2 * input[25]>>(5)) + (19 * input[26]>>(5)) - (36 * input[27]>>(5)) + (45 * input[28]>>(5)) - (43 * input[29]>>(5)) + (30 * input[30]>>(5)) - (11 * input[31]>>(5));
  output[28] = (9 * input[0]>>(5)) - (25 * input[1]>>(5)) + (38 * input[2]>>(5)) - (44 * input[3]>>(5)) + (44 * input[4]>>(5)) - (38 * input[5]>>(5)) + (25 * input[6]>>(5)) - (9 * input[7]>>(5)) - (9 * input[8]>>(5)) + (25 * input[9]>>(5)) - (38 * input[10]>>(5)) + (44 * input[11]>>(5)) - (44 * input[12]>>(5)) + (38 * input[13]>>(5)) - (25 * input[14]>>(5)) + (9 * input[15]>>(5)) + (9 * input[16]>>(5)) - (25 * input[17]>>(5)) + (38 * input[18]>>(5)) - (44 * input[19]>>(5)) + (44 * input[20]>>(5)) - (38 * input[21]>>(5)) + (25 * input[22]>>(5)) - (9 * input[23]>>(5)) - (9 * input[24]>>(5)) + (25 * input[25]>>(5)) - (38 * input[26]>>(5)) + (44 * input[27]>>(5)) - (44 * input[28]>>(5)) + (38 * input[29]>>(5)) - (25 * input[30]>>(5)) + (9 * input[31]>>(5));
  output[29] = (7 * input[0]>>(5)) - (19 * input[1]>>(5)) + (30 * input[2]>>(5)) - (39 * input[3]>>(5)) + (44 * input[4]>>(5)) - (45 * input[5]>>(5)) + (43 * input[6]>>(5)) - (36 * input[7]>>(5)) + (27 * input[8]>>(5)) - (15 * input[9]>>(5)) + (2 * input[10]>>(5)) + (11 * input[11]>>(5)) - (23 * input[12]>>(5)) + (34 * input[13]>>(5)) - (41 * input[14]>>(5)) + (45 * input[15]>>(5)) - (45 * input[16]>>(5)) + (41 * input[17]>>(5)) - (34 * input[18]>>(5)) + (23 * input[19]>>(5)) - (11 * input[20]>>(5)) - (2 * input[21]>>(5)) + (15 * input[22]>>(5)) - (27 * input[23]>>(5)) + (36 * input[24]>>(5)) - (43 * input[25]>>(5)) + (45 * input[26]>>(5)) - (44 * input[27]>>(5)) + (39 * input[28]>>(5)) - (30 * input[29]>>(5)) + (19 * input[30]>>(5)) - (7 * input[31]>>(5));
  output[30] = (4 * input[0]>>(5)) - (13 * input[1]>>(5)) + (21 * input[2]>>(5)) - (29 * input[3]>>(5)) + (35 * input[4]>>(5)) - (40 * input[5]>>(5)) + (43 * input[6]>>(5)) - (45 * input[7]>>(5)) + (45 * input[8]>>(5)) - (43 * input[9]>>(5)) + (40 * input[10]>>(5)) - (35 * input[11]>>(5)) + (29 * input[12]>>(5)) - (21 * input[13]>>(5)) + (13 * input[14]>>(5)) - (4 * input[15]>>(5)) - (4 * input[16]>>(5)) + (13 * input[17]>>(5)) - (21 * input[18]>>(5)) + (29 * input[19]>>(5)) - (35 * input[20]>>(5)) + (40 * input[21]>>(5)) - (43 * input[22]>>(5)) + (45 * input[23]>>(5)) - (45 * input[24]>>(5)) + (43 * input[25]>>(5)) - (40 * input[26]>>(5)) + (35 * input[27]>>(5)) - (29 * input[28]>>(5)) + (21 * input[29]>>(5)) - (13 * input[30]>>(5)) + (4 * input[31]>>(5));
  output[31] = (2 * input[0]>>(5)) - (7 * input[1]>>(5)) + (11 * input[2]>>(5)) - (15 * input[3]>>(5)) + (19 * input[4]>>(5)) - (23 * input[5]>>(5)) + (27 * input[6]>>(5)) - (30 * input[7]>>(5)) + (34 * input[8]>>(5)) - (36 * input[9]>>(5)) + (39 * input[10]>>(5)) - (41 * input[11]>>(5)) + (43 * input[12]>>(5)) - (44 * input[13]>>(5)) + (45 * input[14]>>(5)) - (45 * input[15]>>(5)) + (45 * input[16]>>(5)) - (45 * input[17]>>(5)) + (44 * input[18]>>(5)) - (43 * input[19]>>(5)) + (41 * input[20]>>(5)) - (39 * input[21]>>(5)) + (36 * input[22]>>(5)) - (34 * input[23]>>(5)) + (30 * input[24]>>(5)) - (27 * input[25]>>(5)) + (23 * input[26]>>(5)) - (19 * input[27]>>(5)) + (15 * input[28]>>(5)) - (11 * input[29]>>(5)) + (7 * input[30]>>(5)) - (2 * input[31]>>(5));
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
}
