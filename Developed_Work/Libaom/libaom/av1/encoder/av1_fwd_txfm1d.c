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
    int32_t *bf0, *bf1;
    bf0 = output;
    bf1 = input;
    bf0[0] = ((181 * bf1[0])>>(8)) + ((181 * bf1[1])>>(8)) + ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8));
    bf0[1] = ((237 * bf1[0])>>(8)) + ((98 * bf1[1])>>(8)) - ((98 * bf1[2])>>(8)) - ((237 * bf1[3])>>(8));
    bf0[2] = ((181 * bf1[0])>>(8)) - ((181 * bf1[1])>>(8)) - ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8));
    bf0[3] = ((98 * bf1[0])>>(8)) - ((237 * bf1[1])>>(8)) + ((237 * bf1[2])>>(8)) - ((98 * bf1[3])>>(8));
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
    int32_t *bf0, *bf1;
    bf0 = output;
    bf1 = input;
    bf0[0] = ((181 * bf1[0])>>(8)) + ((181 * bf1[1])>>(8)) + ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) + ((181 * bf1[5])>>(8)) + ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8));
    bf0[1] = ((251 * bf1[0])>>(8)) + ((213 * bf1[1])>>(8)) + ((142 * bf1[2])>>(8)) + ((50 * bf1[3])>>(8)) - ((50 * bf1[4])>>(8)) - ((142 * bf1[5])>>(8)) - ((213 * bf1[6])>>(8)) - ((251 * bf1[7])>>(8));
    bf0[2] = ((237 * bf1[0])>>(8)) + ((98 * bf1[1])>>(8)) - ((98 * bf1[2])>>(8)) - ((237 * bf1[3])>>(8)) - ((237 * bf1[4])>>(8)) - ((98 * bf1[5])>>(8)) + ((98 * bf1[6])>>(8)) + ((237 * bf1[7])>>(8));
    bf0[3] = ((213 * bf1[0])>>(8)) - ((50 * bf1[1])>>(8)) - ((251 * bf1[2])>>(8)) - ((142 * bf1[3])>>(8)) + ((142 * bf1[4])>>(8)) + ((251 * bf1[5])>>(8)) + ((50 * bf1[6])>>(8)) - ((213 * bf1[7])>>(8));
    bf0[4] = ((181 * bf1[0])>>(8)) - ((181 * bf1[1])>>(8)) - ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) - ((181 * bf1[5])>>(8)) - ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8));
    bf0[5] = ((142 * bf1[0])>>(8)) - ((251 * bf1[1])>>(8)) + ((50 * bf1[2])>>(8)) + ((213 * bf1[3])>>(8)) - ((213 * bf1[4])>>(8)) - ((50 * bf1[5])>>(8)) + ((251 * bf1[6])>>(8)) - ((142 * bf1[7])>>(8));
    bf0[6] = ((98 * bf1[0])>>(8)) - ((237 * bf1[1])>>(8)) + ((237 * bf1[2])>>(8)) - ((98 * bf1[3])>>(8)) - ((98 * bf1[4])>>(8)) + ((237 * bf1[5])>>(8)) - ((237 * bf1[6])>>(8)) + ((98 * bf1[7])>>(8));
    bf0[7] = ((50 * bf1[0])>>(8)) - ((142 * bf1[1])>>(8)) + ((213 * bf1[2])>>(8)) - ((251 * bf1[3])>>(8)) + ((251 * bf1[4])>>(8)) - ((213 * bf1[5])>>(8)) + ((142 * bf1[6])>>(8)) - ((50 * bf1[7])>>(8));
}

void av1_fdct16_new(const int32_t *input, int32_t *output, int8_t cos_bit,
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
    /*
    int32_t *bf0, *bf1;
    bf0 = output;
    bf1 = input;
    bf0[0] = ((181 * bf1[0])>>(8)) + ((181 * bf1[1])>>(8)) + ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) + ((181 * bf1[5])>>(8)) + ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8)) + ((181 * bf1[8])>>(8)) + ((181 * bf1[9])>>(8)) + ((181 * bf1[10])>>(8)) + ((181 * bf1[11])>>(8)) + ((181 * bf1[12])>>(8)) + ((181 * bf1[13])>>(8)) + ((181 * bf1[14])>>(8)) + ((181 * bf1[15])>>(8));
    bf0[1] = ((255 * bf1[0])>>(8)) + ((245 * bf1[1])>>(8)) + ((226 * bf1[2])>>(8)) + ((198 * bf1[3])>>(8)) + ((162 * bf1[4])>>(8)) + ((121 * bf1[5])>>(8)) + ((74 * bf1[6])>>(8)) + ((25 * bf1[7])>>(8)) - ((25 * bf1[8])>>(8)) - ((74 * bf1[9])>>(8)) - ((121 * bf1[10])>>(8)) - ((162 * bf1[11])>>(8)) - ((198 * bf1[12])>>(8)) - ((226 * bf1[13])>>(8)) - ((245 * bf1[14])>>(8)) - ((255 * bf1[15])>>(8));
    bf0[2] = ((251 * bf1[0])>>(8)) + ((213 * bf1[1])>>(8)) + ((142 * bf1[2])>>(8)) + ((50 * bf1[3])>>(8)) - ((50 * bf1[4])>>(8)) - ((142 * bf1[5])>>(8)) - ((213 * bf1[6])>>(8)) - ((251 * bf1[7])>>(8)) - ((251 * bf1[8])>>(8)) - ((213 * bf1[9])>>(8)) - ((142 * bf1[10])>>(8)) - ((50 * bf1[11])>>(8)) + ((50 * bf1[12])>>(8)) + ((142 * bf1[13])>>(8)) + ((213 * bf1[14])>>(8)) + ((251 * bf1[15])>>(8));
    bf0[3] = ((245 * bf1[0])>>(8)) + ((162 * bf1[1])>>(8)) + ((25 * bf1[2])>>(8)) - ((121 * bf1[3])>>(8)) - ((226 * bf1[4])>>(8)) - ((255 * bf1[5])>>(8)) - ((198 * bf1[6])>>(8)) - ((74 * bf1[7])>>(8)) + ((74 * bf1[8])>>(8)) + ((198 * bf1[9])>>(8)) + ((255 * bf1[10])>>(8)) + ((226 * bf1[11])>>(8)) + ((121 * bf1[12])>>(8)) - ((25 * bf1[13])>>(8)) - ((162 * bf1[14])>>(8)) - ((245 * bf1[15])>>(8));
    bf0[4] = ((237 * bf1[0])>>(8)) + ((98 * bf1[1])>>(8)) - ((98 * bf1[2])>>(8)) - ((237 * bf1[3])>>(8)) - ((237 * bf1[4])>>(8)) - ((98 * bf1[5])>>(8)) + ((98 * bf1[6])>>(8)) + ((237 * bf1[7])>>(8)) + ((237 * bf1[8])>>(8)) + ((98 * bf1[9])>>(8)) - ((98 * bf1[10])>>(8)) - ((237 * bf1[11])>>(8)) - ((237 * bf1[12])>>(8)) - ((98 * bf1[13])>>(8)) + ((98 * bf1[14])>>(8)) + ((237 * bf1[15])>>(8));
    bf0[5] = ((226 * bf1[0])>>(8)) + ((25 * bf1[1])>>(8)) - ((198 * bf1[2])>>(8)) - ((245 * bf1[3])>>(8)) - ((74 * bf1[4])>>(8)) + ((162 * bf1[5])>>(8)) + ((255 * bf1[6])>>(8)) + ((121 * bf1[7])>>(8)) - ((121 * bf1[8])>>(8)) - ((255 * bf1[9])>>(8)) - ((162 * bf1[10])>>(8)) + ((74 * bf1[11])>>(8)) + ((245 * bf1[12])>>(8)) + ((198 * bf1[13])>>(8)) - ((25 * bf1[14])>>(8)) - ((226 * bf1[15])>>(8));
    bf0[6] = ((213 * bf1[0])>>(8)) - ((50 * bf1[1])>>(8)) - ((251 * bf1[2])>>(8)) - ((142 * bf1[3])>>(8)) + ((142 * bf1[4])>>(8)) + ((251 * bf1[5])>>(8)) + ((50 * bf1[6])>>(8)) - ((213 * bf1[7])>>(8)) - ((213 * bf1[8])>>(8)) + ((50 * bf1[9])>>(8)) + ((251 * bf1[10])>>(8)) + ((142 * bf1[11])>>(8)) - ((142 * bf1[12])>>(8)) - ((251 * bf1[13])>>(8)) - ((50 * bf1[14])>>(8)) + ((213 * bf1[15])>>(8));
    bf0[7] = ((198 * bf1[0])>>(8)) - ((121 * bf1[1])>>(8)) - ((245 * bf1[2])>>(8)) + ((25 * bf1[3])>>(8)) + ((255 * bf1[4])>>(8)) + ((74 * bf1[5])>>(8)) - ((226 * bf1[6])>>(8)) - ((162 * bf1[7])>>(8)) + ((162 * bf1[8])>>(8)) + ((226 * bf1[9])>>(8)) - ((74 * bf1[10])>>(8)) - ((255 * bf1[11])>>(8)) - ((25 * bf1[12])>>(8)) + ((245 * bf1[13])>>(8)) + ((121 * bf1[14])>>(8)) - ((198 * bf1[15])>>(8));
    bf0[8] = ((181 * bf1[0])>>(8)) - ((181 * bf1[1])>>(8)) - ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) - ((181 * bf1[5])>>(8)) - ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8)) + ((181 * bf1[8])>>(8)) - ((181 * bf1[9])>>(8)) - ((181 * bf1[10])>>(8)) + ((181 * bf1[11])>>(8)) + ((181 * bf1[12])>>(8)) - ((181 * bf1[13])>>(8)) - ((181 * bf1[14])>>(8)) + ((181 * bf1[15])>>(8));
    bf0[9] = ((162 * bf1[0])>>(8)) - ((226 * bf1[1])>>(8)) - ((74 * bf1[2])>>(8)) + ((255 * bf1[3])>>(8)) - ((25 * bf1[4])>>(8)) - ((245 * bf1[5])>>(8)) + ((121 * bf1[6])>>(8)) + ((198 * bf1[7])>>(8)) - ((198 * bf1[8])>>(8)) - ((121 * bf1[9])>>(8)) + ((245 * bf1[10])>>(8)) + ((25 * bf1[11])>>(8)) - ((255 * bf1[12])>>(8)) + ((74 * bf1[13])>>(8)) + ((226 * bf1[14])>>(8)) - ((162 * bf1[15])>>(8));
    bf0[10] = ((142 * bf1[0])>>(8)) - ((251 * bf1[1])>>(8)) + ((50 * bf1[2])>>(8)) + ((213 * bf1[3])>>(8)) - ((213 * bf1[4])>>(8)) - ((50 * bf1[5])>>(8)) + ((251 * bf1[6])>>(8)) - ((142 * bf1[7])>>(8)) - ((142 * bf1[8])>>(8)) + ((251 * bf1[9])>>(8)) - ((50 * bf1[10])>>(8)) - ((213 * bf1[11])>>(8)) + ((213 * bf1[12])>>(8)) + ((50 * bf1[13])>>(8)) - ((251 * bf1[14])>>(8)) + ((142 * bf1[15])>>(8));
    bf0[11] = ((121 * bf1[0])>>(8)) - ((255 * bf1[1])>>(8)) + ((162 * bf1[2])>>(8)) + ((74 * bf1[3])>>(8)) - ((245 * bf1[4])>>(8)) + ((198 * bf1[5])>>(8)) + ((25 * bf1[6])>>(8)) - ((226 * bf1[7])>>(8)) + ((226 * bf1[8])>>(8)) - ((25 * bf1[9])>>(8)) - ((198 * bf1[10])>>(8)) + ((245 * bf1[11])>>(8)) - ((74 * bf1[12])>>(8)) - ((162 * bf1[13])>>(8)) + ((255 * bf1[14])>>(8)) - ((121 * bf1[15])>>(8));
    bf0[12] = ((98 * bf1[0])>>(8)) - ((237 * bf1[1])>>(8)) + ((237 * bf1[2])>>(8)) - ((98 * bf1[3])>>(8)) - ((98 * bf1[4])>>(8)) + ((237 * bf1[5])>>(8)) - ((237 * bf1[6])>>(8)) + ((98 * bf1[7])>>(8)) + ((98 * bf1[8])>>(8)) - ((237 * bf1[9])>>(8)) + ((237 * bf1[10])>>(8)) - ((98 * bf1[11])>>(8)) - ((98 * bf1[12])>>(8)) + ((237 * bf1[13])>>(8)) - ((237 * bf1[14])>>(8)) + ((98 * bf1[15])>>(8));
    bf0[13] = ((74 * bf1[0])>>(8)) - ((198 * bf1[1])>>(8)) + ((255 * bf1[2])>>(8)) - ((226 * bf1[3])>>(8)) + ((121 * bf1[4])>>(8)) + ((25 * bf1[5])>>(8)) - ((162 * bf1[6])>>(8)) + ((245 * bf1[7])>>(8)) - ((245 * bf1[8])>>(8)) + ((162 * bf1[9])>>(8)) - ((25 * bf1[10])>>(8)) - ((121 * bf1[11])>>(8)) + ((226 * bf1[12])>>(8)) - ((255 * bf1[13])>>(8)) + ((198 * bf1[14])>>(8)) - ((74 * bf1[15])>>(8));
    bf0[14] = ((50 * bf1[0])>>(8)) - ((142 * bf1[1])>>(8)) + ((213 * bf1[2])>>(8)) - ((251 * bf1[3])>>(8)) + ((251 * bf1[4])>>(8)) - ((213 * bf1[5])>>(8)) + ((142 * bf1[6])>>(8)) - ((50 * bf1[7])>>(8)) - ((50 * bf1[8])>>(8)) + ((142 * bf1[9])>>(8)) - ((213 * bf1[10])>>(8)) + ((251 * bf1[11])>>(8)) - ((251 * bf1[12])>>(8)) + ((213 * bf1[13])>>(8)) - ((142 * bf1[14])>>(8)) + ((50 * bf1[15])>>(8));
    bf0[15] = ((25 * bf1[0])>>(8)) - ((74 * bf1[1])>>(8)) + ((121 * bf1[2])>>(8)) - ((162 * bf1[3])>>(8)) + ((198 * bf1[4])>>(8)) - ((226 * bf1[5])>>(8)) + ((245 * bf1[6])>>(8)) - ((255 * bf1[7])>>(8)) + ((255 * bf1[8])>>(8)) - ((245 * bf1[9])>>(8)) + ((226 * bf1[10])>>(8)) - ((198 * bf1[11])>>(8)) + ((162 * bf1[12])>>(8)) - ((121 * bf1[13])>>(8)) + ((74 * bf1[14])>>(8)) - ((25 * bf1[15])>>(8));
    */
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
    int32_t *bf0, *bf1;
    bf0 = output;
    bf1 = input;
    bf0[0] = ((181 * bf1[0])>>(8)) + ((181 * bf1[1])>>(8)) + ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) + ((181 * bf1[5])>>(8)) + ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8)) + ((181 * bf1[8])>>(8)) + ((181 * bf1[9])>>(8)) + ((181 * bf1[10])>>(8)) + ((181 * bf1[11])>>(8)) + ((181 * bf1[12])>>(8)) + ((181 * bf1[13])>>(8)) + ((181 * bf1[14])>>(8)) + ((181 * bf1[15])>>(8)) + ((181 * bf1[16])>>(8)) + ((181 * bf1[17])>>(8)) + ((181 * bf1[18])>>(8)) + ((181 * bf1[19])>>(8)) + ((181 * bf1[20])>>(8)) + ((181 * bf1[21])>>(8)) + ((181 * bf1[22])>>(8)) + ((181 * bf1[23])>>(8)) + ((181 * bf1[24])>>(8)) + ((181 * bf1[25])>>(8)) + ((181 * bf1[26])>>(8)) + ((181 * bf1[27])>>(8)) + ((181 * bf1[28])>>(8)) + ((181 * bf1[29])>>(8)) + ((181 * bf1[30])>>(8)) + ((181 * bf1[31])>>(8));
    bf0[1] = ((256 * bf1[0])>>(8)) + ((253 * bf1[1])>>(8)) + ((248 * bf1[2])>>(8)) + ((241 * bf1[3])>>(8)) + ((231 * bf1[4])>>(8)) + ((220 * bf1[5])>>(8)) + ((206 * bf1[6])>>(8)) + ((190 * bf1[7])>>(8)) + ((172 * bf1[8])>>(8)) + ((152 * bf1[9])>>(8)) + ((132 * bf1[10])>>(8)) + ((109 * bf1[11])>>(8)) + ((86 * bf1[12])>>(8)) + ((62 * bf1[13])>>(8)) + ((38 * bf1[14])>>(8)) + ((13 * bf1[15])>>(8)) - ((13 * bf1[16])>>(8)) - ((38 * bf1[17])>>(8)) - ((62 * bf1[18])>>(8)) - ((86 * bf1[19])>>(8)) - ((109 * bf1[20])>>(8)) - ((132 * bf1[21])>>(8)) - ((152 * bf1[22])>>(8)) - ((172 * bf1[23])>>(8)) - ((190 * bf1[24])>>(8)) - ((206 * bf1[25])>>(8)) - ((220 * bf1[26])>>(8)) - ((231 * bf1[27])>>(8)) - ((241 * bf1[28])>>(8)) - ((248 * bf1[29])>>(8)) - ((253 * bf1[30])>>(8)) - ((256 * bf1[31])>>(8));
    bf0[2] = ((255 * bf1[0])>>(8)) + ((245 * bf1[1])>>(8)) + ((226 * bf1[2])>>(8)) + ((198 * bf1[3])>>(8)) + ((162 * bf1[4])>>(8)) + ((121 * bf1[5])>>(8)) + ((74 * bf1[6])>>(8)) + ((25 * bf1[7])>>(8)) - ((25 * bf1[8])>>(8)) - ((74 * bf1[9])>>(8)) - ((121 * bf1[10])>>(8)) - ((162 * bf1[11])>>(8)) - ((198 * bf1[12])>>(8)) - ((226 * bf1[13])>>(8)) - ((245 * bf1[14])>>(8)) - ((255 * bf1[15])>>(8)) - ((255 * bf1[16])>>(8)) - ((245 * bf1[17])>>(8)) - ((226 * bf1[18])>>(8)) - ((198 * bf1[19])>>(8)) - ((162 * bf1[20])>>(8)) - ((121 * bf1[21])>>(8)) - ((74 * bf1[22])>>(8)) - ((25 * bf1[23])>>(8)) + ((25 * bf1[24])>>(8)) + ((74 * bf1[25])>>(8)) + ((121 * bf1[26])>>(8)) + ((162 * bf1[27])>>(8)) + ((198 * bf1[28])>>(8)) + ((226 * bf1[29])>>(8)) + ((245 * bf1[30])>>(8)) + ((255 * bf1[31])>>(8));
    bf0[3] = ((253 * bf1[0])>>(8)) + ((231 * bf1[1])>>(8)) + ((190 * bf1[2])>>(8)) + ((132 * bf1[3])>>(8)) + ((62 * bf1[4])>>(8)) - ((13 * bf1[5])>>(8)) - ((86 * bf1[6])>>(8)) - ((152 * bf1[7])>>(8)) - ((206 * bf1[8])>>(8)) - ((241 * bf1[9])>>(8)) - ((256 * bf1[10])>>(8)) - ((248 * bf1[11])>>(8)) - ((220 * bf1[12])>>(8)) - ((172 * bf1[13])>>(8)) - ((109 * bf1[14])>>(8)) - ((38 * bf1[15])>>(8)) + ((38 * bf1[16])>>(8)) + ((109 * bf1[17])>>(8)) + ((172 * bf1[18])>>(8)) + ((220 * bf1[19])>>(8)) + ((248 * bf1[20])>>(8)) + ((256 * bf1[21])>>(8)) + ((241 * bf1[22])>>(8)) + ((206 * bf1[23])>>(8)) + ((152 * bf1[24])>>(8)) + ((86 * bf1[25])>>(8)) + ((13 * bf1[26])>>(8)) - ((62 * bf1[27])>>(8)) - ((132 * bf1[28])>>(8)) - ((190 * bf1[29])>>(8)) - ((231 * bf1[30])>>(8)) - ((253 * bf1[31])>>(8));
    bf0[4] = ((251 * bf1[0])>>(8)) + ((213 * bf1[1])>>(8)) + ((142 * bf1[2])>>(8)) + ((50 * bf1[3])>>(8)) - ((50 * bf1[4])>>(8)) - ((142 * bf1[5])>>(8)) - ((213 * bf1[6])>>(8)) - ((251 * bf1[7])>>(8)) - ((251 * bf1[8])>>(8)) - ((213 * bf1[9])>>(8)) - ((142 * bf1[10])>>(8)) - ((50 * bf1[11])>>(8)) + ((50 * bf1[12])>>(8)) + ((142 * bf1[13])>>(8)) + ((213 * bf1[14])>>(8)) + ((251 * bf1[15])>>(8)) + ((251 * bf1[16])>>(8)) + ((213 * bf1[17])>>(8)) + ((142 * bf1[18])>>(8)) + ((50 * bf1[19])>>(8)) - ((50 * bf1[20])>>(8)) - ((142 * bf1[21])>>(8)) - ((213 * bf1[22])>>(8)) - ((251 * bf1[23])>>(8)) - ((251 * bf1[24])>>(8)) - ((213 * bf1[25])>>(8)) - ((142 * bf1[26])>>(8)) - ((50 * bf1[27])>>(8)) + ((50 * bf1[28])>>(8)) + ((142 * bf1[29])>>(8)) + ((213 * bf1[30])>>(8)) + ((251 * bf1[31])>>(8));
    bf0[5] = ((248 * bf1[0])>>(8)) + ((190 * bf1[1])>>(8)) + ((86 * bf1[2])>>(8)) - ((38 * bf1[3])>>(8)) - ((152 * bf1[4])>>(8)) - ((231 * bf1[5])>>(8)) - ((256 * bf1[6])>>(8)) - ((220 * bf1[7])>>(8)) - ((132 * bf1[8])>>(8)) - ((13 * bf1[9])>>(8)) + ((109 * bf1[10])>>(8)) + ((206 * bf1[11])>>(8)) + ((253 * bf1[12])>>(8)) + ((241 * bf1[13])>>(8)) + ((172 * bf1[14])>>(8)) + ((62 * bf1[15])>>(8)) - ((62 * bf1[16])>>(8)) - ((172 * bf1[17])>>(8)) - ((241 * bf1[18])>>(8)) - ((253 * bf1[19])>>(8)) - ((206 * bf1[20])>>(8)) - ((109 * bf1[21])>>(8)) + ((13 * bf1[22])>>(8)) + ((132 * bf1[23])>>(8)) + ((220 * bf1[24])>>(8)) + ((256 * bf1[25])>>(8)) + ((231 * bf1[26])>>(8)) + ((152 * bf1[27])>>(8)) + ((38 * bf1[28])>>(8)) - ((86 * bf1[29])>>(8)) - ((190 * bf1[30])>>(8)) - ((248 * bf1[31])>>(8));
    bf0[6] = ((245 * bf1[0])>>(8)) + ((162 * bf1[1])>>(8)) + ((25 * bf1[2])>>(8)) - ((121 * bf1[3])>>(8)) - ((226 * bf1[4])>>(8)) - ((255 * bf1[5])>>(8)) - ((198 * bf1[6])>>(8)) - ((74 * bf1[7])>>(8)) + ((74 * bf1[8])>>(8)) + ((198 * bf1[9])>>(8)) + ((255 * bf1[10])>>(8)) + ((226 * bf1[11])>>(8)) + ((121 * bf1[12])>>(8)) - ((25 * bf1[13])>>(8)) - ((162 * bf1[14])>>(8)) - ((245 * bf1[15])>>(8)) - ((245 * bf1[16])>>(8)) - ((162 * bf1[17])>>(8)) - ((25 * bf1[18])>>(8)) + ((121 * bf1[19])>>(8)) + ((226 * bf1[20])>>(8)) + ((255 * bf1[21])>>(8)) + ((198 * bf1[22])>>(8)) + ((74 * bf1[23])>>(8)) - ((74 * bf1[24])>>(8)) - ((198 * bf1[25])>>(8)) - ((255 * bf1[26])>>(8)) - ((226 * bf1[27])>>(8)) - ((121 * bf1[28])>>(8)) + ((25 * bf1[29])>>(8)) + ((162 * bf1[30])>>(8)) + ((245 * bf1[31])>>(8));
    bf0[7] = ((241 * bf1[0])>>(8)) + ((132 * bf1[1])>>(8)) - ((38 * bf1[2])>>(8)) - ((190 * bf1[3])>>(8)) - ((256 * bf1[4])>>(8)) - ((206 * bf1[5])>>(8)) - ((62 * bf1[6])>>(8)) + ((109 * bf1[7])>>(8)) + ((231 * bf1[8])>>(8)) + ((248 * bf1[9])>>(8)) + ((152 * bf1[10])>>(8)) - ((13 * bf1[11])>>(8)) - ((172 * bf1[12])>>(8)) - ((253 * bf1[13])>>(8)) - ((220 * bf1[14])>>(8)) - ((86 * bf1[15])>>(8)) + ((86 * bf1[16])>>(8)) + ((220 * bf1[17])>>(8)) + ((253 * bf1[18])>>(8)) + ((172 * bf1[19])>>(8)) + ((13 * bf1[20])>>(8)) - ((152 * bf1[21])>>(8)) - ((248 * bf1[22])>>(8)) - ((231 * bf1[23])>>(8)) - ((109 * bf1[24])>>(8)) + ((62 * bf1[25])>>(8)) + ((206 * bf1[26])>>(8)) + ((256 * bf1[27])>>(8)) + ((190 * bf1[28])>>(8)) + ((38 * bf1[29])>>(8)) - ((132 * bf1[30])>>(8)) - ((241 * bf1[31])>>(8));
    bf0[8] = ((237 * bf1[0])>>(8)) + ((98 * bf1[1])>>(8)) - ((98 * bf1[2])>>(8)) - ((237 * bf1[3])>>(8)) - ((237 * bf1[4])>>(8)) - ((98 * bf1[5])>>(8)) + ((98 * bf1[6])>>(8)) + ((237 * bf1[7])>>(8)) + ((237 * bf1[8])>>(8)) + ((98 * bf1[9])>>(8)) - ((98 * bf1[10])>>(8)) - ((237 * bf1[11])>>(8)) - ((237 * bf1[12])>>(8)) - ((98 * bf1[13])>>(8)) + ((98 * bf1[14])>>(8)) + ((237 * bf1[15])>>(8)) + ((237 * bf1[16])>>(8)) + ((98 * bf1[17])>>(8)) - ((98 * bf1[18])>>(8)) - ((237 * bf1[19])>>(8)) - ((237 * bf1[20])>>(8)) - ((98 * bf1[21])>>(8)) + ((98 * bf1[22])>>(8)) + ((237 * bf1[23])>>(8)) + ((237 * bf1[24])>>(8)) + ((98 * bf1[25])>>(8)) - ((98 * bf1[26])>>(8)) - ((237 * bf1[27])>>(8)) - ((237 * bf1[28])>>(8)) - ((98 * bf1[29])>>(8)) + ((98 * bf1[30])>>(8)) + ((237 * bf1[31])>>(8));
    bf0[9] = ((231 * bf1[0])>>(8)) + ((62 * bf1[1])>>(8)) - ((152 * bf1[2])>>(8)) - ((256 * bf1[3])>>(8)) - ((172 * bf1[4])>>(8)) + ((38 * bf1[5])>>(8)) + ((220 * bf1[6])>>(8)) + ((241 * bf1[7])>>(8)) + ((86 * bf1[8])>>(8)) - ((132 * bf1[9])>>(8)) - ((253 * bf1[10])>>(8)) - ((190 * bf1[11])>>(8)) + ((13 * bf1[12])>>(8)) + ((206 * bf1[13])>>(8)) + ((248 * bf1[14])>>(8)) + ((109 * bf1[15])>>(8)) - ((109 * bf1[16])>>(8)) - ((248 * bf1[17])>>(8)) - ((206 * bf1[18])>>(8)) - ((13 * bf1[19])>>(8)) + ((190 * bf1[20])>>(8)) + ((253 * bf1[21])>>(8)) + ((132 * bf1[22])>>(8)) - ((86 * bf1[23])>>(8)) - ((241 * bf1[24])>>(8)) - ((220 * bf1[25])>>(8)) - ((38 * bf1[26])>>(8)) + ((172 * bf1[27])>>(8)) + ((256 * bf1[28])>>(8)) + ((152 * bf1[29])>>(8)) - ((62 * bf1[30])>>(8)) - ((231 * bf1[31])>>(8));
    bf0[10] = ((226 * bf1[0])>>(8)) + ((25 * bf1[1])>>(8)) - ((198 * bf1[2])>>(8)) - ((245 * bf1[3])>>(8)) - ((74 * bf1[4])>>(8)) + ((162 * bf1[5])>>(8)) + ((255 * bf1[6])>>(8)) + ((121 * bf1[7])>>(8)) - ((121 * bf1[8])>>(8)) - ((255 * bf1[9])>>(8)) - ((162 * bf1[10])>>(8)) + ((74 * bf1[11])>>(8)) + ((245 * bf1[12])>>(8)) + ((198 * bf1[13])>>(8)) - ((25 * bf1[14])>>(8)) - ((226 * bf1[15])>>(8)) - ((226 * bf1[16])>>(8)) - ((25 * bf1[17])>>(8)) + ((198 * bf1[18])>>(8)) + ((245 * bf1[19])>>(8)) + ((74 * bf1[20])>>(8)) - ((162 * bf1[21])>>(8)) - ((255 * bf1[22])>>(8)) - ((121 * bf1[23])>>(8)) + ((121 * bf1[24])>>(8)) + ((255 * bf1[25])>>(8)) + ((162 * bf1[26])>>(8)) - ((74 * bf1[27])>>(8)) - ((245 * bf1[28])>>(8)) - ((198 * bf1[29])>>(8)) + ((25 * bf1[30])>>(8)) + ((226 * bf1[31])>>(8));
    bf0[11] = ((220 * bf1[0])>>(8)) - ((13 * bf1[1])>>(8)) - ((231 * bf1[2])>>(8)) - ((206 * bf1[3])>>(8)) + ((38 * bf1[4])>>(8)) + ((241 * bf1[5])>>(8)) + ((190 * bf1[6])>>(8)) - ((62 * bf1[7])>>(8)) - ((248 * bf1[8])>>(8)) - ((172 * bf1[9])>>(8)) + ((86 * bf1[10])>>(8)) + ((253 * bf1[11])>>(8)) + ((152 * bf1[12])>>(8)) - ((109 * bf1[13])>>(8)) - ((256 * bf1[14])>>(8)) - ((132 * bf1[15])>>(8)) + ((132 * bf1[16])>>(8)) + ((256 * bf1[17])>>(8)) + ((109 * bf1[18])>>(8)) - ((152 * bf1[19])>>(8)) - ((253 * bf1[20])>>(8)) - ((86 * bf1[21])>>(8)) + ((172 * bf1[22])>>(8)) + ((248 * bf1[23])>>(8)) + ((62 * bf1[24])>>(8)) - ((190 * bf1[25])>>(8)) - ((241 * bf1[26])>>(8)) - ((38 * bf1[27])>>(8)) + ((206 * bf1[28])>>(8)) + ((231 * bf1[29])>>(8)) + ((13 * bf1[30])>>(8)) - ((220 * bf1[31])>>(8));
    bf0[12] = ((213 * bf1[0])>>(8)) - ((50 * bf1[1])>>(8)) - ((251 * bf1[2])>>(8)) - ((142 * bf1[3])>>(8)) + ((142 * bf1[4])>>(8)) + ((251 * bf1[5])>>(8)) + ((50 * bf1[6])>>(8)) - ((213 * bf1[7])>>(8)) - ((213 * bf1[8])>>(8)) + ((50 * bf1[9])>>(8)) + ((251 * bf1[10])>>(8)) + ((142 * bf1[11])>>(8)) - ((142 * bf1[12])>>(8)) - ((251 * bf1[13])>>(8)) - ((50 * bf1[14])>>(8)) + ((213 * bf1[15])>>(8)) + ((213 * bf1[16])>>(8)) - ((50 * bf1[17])>>(8)) - ((251 * bf1[18])>>(8)) - ((142 * bf1[19])>>(8)) + ((142 * bf1[20])>>(8)) + ((251 * bf1[21])>>(8)) + ((50 * bf1[22])>>(8)) - ((213 * bf1[23])>>(8)) - ((213 * bf1[24])>>(8)) + ((50 * bf1[25])>>(8)) + ((251 * bf1[26])>>(8)) + ((142 * bf1[27])>>(8)) - ((142 * bf1[28])>>(8)) - ((251 * bf1[29])>>(8)) - ((50 * bf1[30])>>(8)) + ((213 * bf1[31])>>(8));
    bf0[13] = ((206 * bf1[0])>>(8)) - ((86 * bf1[1])>>(8)) - ((256 * bf1[2])>>(8)) - ((62 * bf1[3])>>(8)) + ((220 * bf1[4])>>(8)) + ((190 * bf1[5])>>(8)) - ((109 * bf1[6])>>(8)) - ((253 * bf1[7])>>(8)) - ((38 * bf1[8])>>(8)) + ((231 * bf1[9])>>(8)) + ((172 * bf1[10])>>(8)) - ((132 * bf1[11])>>(8)) - ((248 * bf1[12])>>(8)) - ((13 * bf1[13])>>(8)) + ((241 * bf1[14])>>(8)) + ((152 * bf1[15])>>(8)) - ((152 * bf1[16])>>(8)) - ((241 * bf1[17])>>(8)) + ((13 * bf1[18])>>(8)) + ((248 * bf1[19])>>(8)) + ((132 * bf1[20])>>(8)) - ((172 * bf1[21])>>(8)) - ((231 * bf1[22])>>(8)) + ((38 * bf1[23])>>(8)) + ((253 * bf1[24])>>(8)) + ((109 * bf1[25])>>(8)) - ((190 * bf1[26])>>(8)) - ((220 * bf1[27])>>(8)) + ((62 * bf1[28])>>(8)) + ((256 * bf1[29])>>(8)) + ((86 * bf1[30])>>(8)) - ((206 * bf1[31])>>(8));
    bf0[14] = ((198 * bf1[0])>>(8)) - ((121 * bf1[1])>>(8)) - ((245 * bf1[2])>>(8)) + ((25 * bf1[3])>>(8)) + ((255 * bf1[4])>>(8)) + ((74 * bf1[5])>>(8)) - ((226 * bf1[6])>>(8)) - ((162 * bf1[7])>>(8)) + ((162 * bf1[8])>>(8)) + ((226 * bf1[9])>>(8)) - ((74 * bf1[10])>>(8)) - ((255 * bf1[11])>>(8)) - ((25 * bf1[12])>>(8)) + ((245 * bf1[13])>>(8)) + ((121 * bf1[14])>>(8)) - ((198 * bf1[15])>>(8)) - ((198 * bf1[16])>>(8)) + ((121 * bf1[17])>>(8)) + ((245 * bf1[18])>>(8)) - ((25 * bf1[19])>>(8)) - ((255 * bf1[20])>>(8)) - ((74 * bf1[21])>>(8)) + ((226 * bf1[22])>>(8)) + ((162 * bf1[23])>>(8)) - ((162 * bf1[24])>>(8)) - ((226 * bf1[25])>>(8)) + ((74 * bf1[26])>>(8)) + ((255 * bf1[27])>>(8)) + ((25 * bf1[28])>>(8)) - ((245 * bf1[29])>>(8)) - ((121 * bf1[30])>>(8)) + ((198 * bf1[31])>>(8));
    bf0[15] = ((190 * bf1[0])>>(8)) - ((152 * bf1[1])>>(8)) - ((220 * bf1[2])>>(8)) + ((109 * bf1[3])>>(8)) + ((241 * bf1[4])>>(8)) - ((62 * bf1[5])>>(8)) - ((253 * bf1[6])>>(8)) + ((13 * bf1[7])>>(8)) + ((256 * bf1[8])>>(8)) + ((38 * bf1[9])>>(8)) - ((248 * bf1[10])>>(8)) - ((86 * bf1[11])>>(8)) + ((231 * bf1[12])>>(8)) + ((132 * bf1[13])>>(8)) - ((206 * bf1[14])>>(8)) - ((172 * bf1[15])>>(8)) + ((172 * bf1[16])>>(8)) + ((206 * bf1[17])>>(8)) - ((132 * bf1[18])>>(8)) - ((231 * bf1[19])>>(8)) + ((86 * bf1[20])>>(8)) + ((248 * bf1[21])>>(8)) - ((38 * bf1[22])>>(8)) - ((256 * bf1[23])>>(8)) - ((13 * bf1[24])>>(8)) + ((253 * bf1[25])>>(8)) + ((62 * bf1[26])>>(8)) - ((241 * bf1[27])>>(8)) - ((109 * bf1[28])>>(8)) + ((220 * bf1[29])>>(8)) + ((152 * bf1[30])>>(8)) - ((190 * bf1[31])>>(8));
    bf0[16] = ((181 * bf1[0])>>(8)) - ((181 * bf1[1])>>(8)) - ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) - ((181 * bf1[5])>>(8)) - ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8)) + ((181 * bf1[8])>>(8)) - ((181 * bf1[9])>>(8)) - ((181 * bf1[10])>>(8)) + ((181 * bf1[11])>>(8)) + ((181 * bf1[12])>>(8)) - ((181 * bf1[13])>>(8)) - ((181 * bf1[14])>>(8)) + ((181 * bf1[15])>>(8)) + ((181 * bf1[16])>>(8)) - ((181 * bf1[17])>>(8)) - ((181 * bf1[18])>>(8)) + ((181 * bf1[19])>>(8)) + ((181 * bf1[20])>>(8)) - ((181 * bf1[21])>>(8)) - ((181 * bf1[22])>>(8)) + ((181 * bf1[23])>>(8)) + ((181 * bf1[24])>>(8)) - ((181 * bf1[25])>>(8)) - ((181 * bf1[26])>>(8)) + ((181 * bf1[27])>>(8)) + ((181 * bf1[28])>>(8)) - ((181 * bf1[29])>>(8)) - ((181 * bf1[30])>>(8)) + ((181 * bf1[31])>>(8));
    bf0[17] = ((172 * bf1[0])>>(8)) - ((206 * bf1[1])>>(8)) - ((132 * bf1[2])>>(8)) + ((231 * bf1[3])>>(8)) + ((86 * bf1[4])>>(8)) - ((248 * bf1[5])>>(8)) - ((38 * bf1[6])>>(8)) + ((256 * bf1[7])>>(8)) - ((13 * bf1[8])>>(8)) - ((253 * bf1[9])>>(8)) + ((62 * bf1[10])>>(8)) + ((241 * bf1[11])>>(8)) - ((109 * bf1[12])>>(8)) - ((220 * bf1[13])>>(8)) + ((152 * bf1[14])>>(8)) + ((190 * bf1[15])>>(8)) - ((190 * bf1[16])>>(8)) - ((152 * bf1[17])>>(8)) + ((220 * bf1[18])>>(8)) + ((109 * bf1[19])>>(8)) - ((241 * bf1[20])>>(8)) - ((62 * bf1[21])>>(8)) + ((253 * bf1[22])>>(8)) + ((13 * bf1[23])>>(8)) - ((256 * bf1[24])>>(8)) + ((38 * bf1[25])>>(8)) + ((248 * bf1[26])>>(8)) - ((86 * bf1[27])>>(8)) - ((231 * bf1[28])>>(8)) + ((132 * bf1[29])>>(8)) + ((206 * bf1[30])>>(8)) - ((172 * bf1[31])>>(8));
    bf0[18] = ((162 * bf1[0])>>(8)) - ((226 * bf1[1])>>(8)) - ((74 * bf1[2])>>(8)) + ((255 * bf1[3])>>(8)) - ((25 * bf1[4])>>(8)) - ((245 * bf1[5])>>(8)) + ((121 * bf1[6])>>(8)) + ((198 * bf1[7])>>(8)) - ((198 * bf1[8])>>(8)) - ((121 * bf1[9])>>(8)) + ((245 * bf1[10])>>(8)) + ((25 * bf1[11])>>(8)) - ((255 * bf1[12])>>(8)) + ((74 * bf1[13])>>(8)) + ((226 * bf1[14])>>(8)) - ((162 * bf1[15])>>(8)) - ((162 * bf1[16])>>(8)) + ((226 * bf1[17])>>(8)) + ((74 * bf1[18])>>(8)) - ((255 * bf1[19])>>(8)) + ((25 * bf1[20])>>(8)) + ((245 * bf1[21])>>(8)) - ((121 * bf1[22])>>(8)) - ((198 * bf1[23])>>(8)) + ((198 * bf1[24])>>(8)) + ((121 * bf1[25])>>(8)) - ((245 * bf1[26])>>(8)) - ((25 * bf1[27])>>(8)) + ((255 * bf1[28])>>(8)) - ((74 * bf1[29])>>(8)) - ((226 * bf1[30])>>(8)) + ((162 * bf1[31])>>(8));
    bf0[19] = ((152 * bf1[0])>>(8)) - ((241 * bf1[1])>>(8)) - ((13 * bf1[2])>>(8)) + ((248 * bf1[3])>>(8)) - ((132 * bf1[4])>>(8)) - ((172 * bf1[5])>>(8)) + ((231 * bf1[6])>>(8)) + ((38 * bf1[7])>>(8)) - ((253 * bf1[8])>>(8)) + ((109 * bf1[9])>>(8)) + ((190 * bf1[10])>>(8)) - ((220 * bf1[11])>>(8)) - ((62 * bf1[12])>>(8)) + ((256 * bf1[13])>>(8)) - ((86 * bf1[14])>>(8)) - ((206 * bf1[15])>>(8)) + ((206 * bf1[16])>>(8)) + ((86 * bf1[17])>>(8)) - ((256 * bf1[18])>>(8)) + ((62 * bf1[19])>>(8)) + ((220 * bf1[20])>>(8)) - ((190 * bf1[21])>>(8)) - ((109 * bf1[22])>>(8)) + ((253 * bf1[23])>>(8)) - ((38 * bf1[24])>>(8)) - ((231 * bf1[25])>>(8)) + ((172 * bf1[26])>>(8)) + ((132 * bf1[27])>>(8)) - ((248 * bf1[28])>>(8)) + ((13 * bf1[29])>>(8)) + ((241 * bf1[30])>>(8)) - ((152 * bf1[31])>>(8));
    bf0[20] = ((142 * bf1[0])>>(8)) - ((251 * bf1[1])>>(8)) + ((50 * bf1[2])>>(8)) + ((213 * bf1[3])>>(8)) - ((213 * bf1[4])>>(8)) - ((50 * bf1[5])>>(8)) + ((251 * bf1[6])>>(8)) - ((142 * bf1[7])>>(8)) - ((142 * bf1[8])>>(8)) + ((251 * bf1[9])>>(8)) - ((50 * bf1[10])>>(8)) - ((213 * bf1[11])>>(8)) + ((213 * bf1[12])>>(8)) + ((50 * bf1[13])>>(8)) - ((251 * bf1[14])>>(8)) + ((142 * bf1[15])>>(8)) + ((142 * bf1[16])>>(8)) - ((251 * bf1[17])>>(8)) + ((50 * bf1[18])>>(8)) + ((213 * bf1[19])>>(8)) - ((213 * bf1[20])>>(8)) - ((50 * bf1[21])>>(8)) + ((251 * bf1[22])>>(8)) - ((142 * bf1[23])>>(8)) - ((142 * bf1[24])>>(8)) + ((251 * bf1[25])>>(8)) - ((50 * bf1[26])>>(8)) - ((213 * bf1[27])>>(8)) + ((213 * bf1[28])>>(8)) + ((50 * bf1[29])>>(8)) - ((251 * bf1[30])>>(8)) + ((142 * bf1[31])>>(8));
    bf0[21] = ((132 * bf1[0])>>(8)) - ((256 * bf1[1])>>(8)) + ((109 * bf1[2])>>(8)) + ((152 * bf1[3])>>(8)) - ((253 * bf1[4])>>(8)) + ((86 * bf1[5])>>(8)) + ((172 * bf1[6])>>(8)) - ((248 * bf1[7])>>(8)) + ((62 * bf1[8])>>(8)) + ((190 * bf1[9])>>(8)) - ((241 * bf1[10])>>(8)) + ((38 * bf1[11])>>(8)) + ((206 * bf1[12])>>(8)) - ((231 * bf1[13])>>(8)) + ((13 * bf1[14])>>(8)) + ((220 * bf1[15])>>(8)) - ((220 * bf1[16])>>(8)) - ((13 * bf1[17])>>(8)) + ((231 * bf1[18])>>(8)) - ((206 * bf1[19])>>(8)) - ((38 * bf1[20])>>(8)) + ((241 * bf1[21])>>(8)) - ((190 * bf1[22])>>(8)) - ((62 * bf1[23])>>(8)) + ((248 * bf1[24])>>(8)) - ((172 * bf1[25])>>(8)) - ((86 * bf1[26])>>(8)) + ((253 * bf1[27])>>(8)) - ((152 * bf1[28])>>(8)) - ((109 * bf1[29])>>(8)) + ((256 * bf1[30])>>(8)) - ((132 * bf1[31])>>(8));
    bf0[22] = ((121 * bf1[0])>>(8)) - ((255 * bf1[1])>>(8)) + ((162 * bf1[2])>>(8)) + ((74 * bf1[3])>>(8)) - ((245 * bf1[4])>>(8)) + ((198 * bf1[5])>>(8)) + ((25 * bf1[6])>>(8)) - ((226 * bf1[7])>>(8)) + ((226 * bf1[8])>>(8)) - ((25 * bf1[9])>>(8)) - ((198 * bf1[10])>>(8)) + ((245 * bf1[11])>>(8)) - ((74 * bf1[12])>>(8)) - ((162 * bf1[13])>>(8)) + ((255 * bf1[14])>>(8)) - ((121 * bf1[15])>>(8)) - ((121 * bf1[16])>>(8)) + ((255 * bf1[17])>>(8)) - ((162 * bf1[18])>>(8)) - ((74 * bf1[19])>>(8)) + ((245 * bf1[20])>>(8)) - ((198 * bf1[21])>>(8)) - ((25 * bf1[22])>>(8)) + ((226 * bf1[23])>>(8)) - ((226 * bf1[24])>>(8)) + ((25 * bf1[25])>>(8)) + ((198 * bf1[26])>>(8)) - ((245 * bf1[27])>>(8)) + ((74 * bf1[28])>>(8)) + ((162 * bf1[29])>>(8)) - ((255 * bf1[30])>>(8)) + ((121 * bf1[31])>>(8));
    bf0[23] = ((109 * bf1[0])>>(8)) - ((248 * bf1[1])>>(8)) + ((206 * bf1[2])>>(8)) - ((13 * bf1[3])>>(8)) - ((190 * bf1[4])>>(8)) + ((253 * bf1[5])>>(8)) - ((132 * bf1[6])>>(8)) - ((86 * bf1[7])>>(8)) + ((241 * bf1[8])>>(8)) - ((220 * bf1[9])>>(8)) + ((38 * bf1[10])>>(8)) + ((172 * bf1[11])>>(8)) - ((256 * bf1[12])>>(8)) + ((152 * bf1[13])>>(8)) + ((62 * bf1[14])>>(8)) - ((231 * bf1[15])>>(8)) + ((231 * bf1[16])>>(8)) - ((62 * bf1[17])>>(8)) - ((152 * bf1[18])>>(8)) + ((256 * bf1[19])>>(8)) - ((172 * bf1[20])>>(8)) - ((38 * bf1[21])>>(8)) + ((220 * bf1[22])>>(8)) - ((241 * bf1[23])>>(8)) + ((86 * bf1[24])>>(8)) + ((132 * bf1[25])>>(8)) - ((253 * bf1[26])>>(8)) + ((190 * bf1[27])>>(8)) + ((13 * bf1[28])>>(8)) - ((206 * bf1[29])>>(8)) + ((248 * bf1[30])>>(8)) - ((109 * bf1[31])>>(8));
    bf0[24] = ((98 * bf1[0])>>(8)) - ((237 * bf1[1])>>(8)) + ((237 * bf1[2])>>(8)) - ((98 * bf1[3])>>(8)) - ((98 * bf1[4])>>(8)) + ((237 * bf1[5])>>(8)) - ((237 * bf1[6])>>(8)) + ((98 * bf1[7])>>(8)) + ((98 * bf1[8])>>(8)) - ((237 * bf1[9])>>(8)) + ((237 * bf1[10])>>(8)) - ((98 * bf1[11])>>(8)) - ((98 * bf1[12])>>(8)) + ((237 * bf1[13])>>(8)) - ((237 * bf1[14])>>(8)) + ((98 * bf1[15])>>(8)) + ((98 * bf1[16])>>(8)) - ((237 * bf1[17])>>(8)) + ((237 * bf1[18])>>(8)) - ((98 * bf1[19])>>(8)) - ((98 * bf1[20])>>(8)) + ((237 * bf1[21])>>(8)) - ((237 * bf1[22])>>(8)) + ((98 * bf1[23])>>(8)) + ((98 * bf1[24])>>(8)) - ((237 * bf1[25])>>(8)) + ((237 * bf1[26])>>(8)) - ((98 * bf1[27])>>(8)) - ((98 * bf1[28])>>(8)) + ((237 * bf1[29])>>(8)) - ((237 * bf1[30])>>(8)) + ((98 * bf1[31])>>(8));
    bf0[25] = ((86 * bf1[0])>>(8)) - ((220 * bf1[1])>>(8)) + ((253 * bf1[2])>>(8)) - ((172 * bf1[3])>>(8)) + ((13 * bf1[4])>>(8)) + ((152 * bf1[5])>>(8)) - ((248 * bf1[6])>>(8)) + ((231 * bf1[7])>>(8)) - ((109 * bf1[8])>>(8)) - ((62 * bf1[9])>>(8)) + ((206 * bf1[10])>>(8)) - ((256 * bf1[11])>>(8)) + ((190 * bf1[12])>>(8)) - ((38 * bf1[13])>>(8)) - ((132 * bf1[14])>>(8)) + ((241 * bf1[15])>>(8)) - ((241 * bf1[16])>>(8)) + ((132 * bf1[17])>>(8)) + ((38 * bf1[18])>>(8)) - ((190 * bf1[19])>>(8)) + ((256 * bf1[20])>>(8)) - ((206 * bf1[21])>>(8)) + ((62 * bf1[22])>>(8)) + ((109 * bf1[23])>>(8)) - ((231 * bf1[24])>>(8)) + ((248 * bf1[25])>>(8)) - ((152 * bf1[26])>>(8)) - ((13 * bf1[27])>>(8)) + ((172 * bf1[28])>>(8)) - ((253 * bf1[29])>>(8)) + ((220 * bf1[30])>>(8)) - ((86 * bf1[31])>>(8));
    bf0[26] = ((74 * bf1[0])>>(8)) - ((198 * bf1[1])>>(8)) + ((255 * bf1[2])>>(8)) - ((226 * bf1[3])>>(8)) + ((121 * bf1[4])>>(8)) + ((25 * bf1[5])>>(8)) - ((162 * bf1[6])>>(8)) + ((245 * bf1[7])>>(8)) - ((245 * bf1[8])>>(8)) + ((162 * bf1[9])>>(8)) - ((25 * bf1[10])>>(8)) - ((121 * bf1[11])>>(8)) + ((226 * bf1[12])>>(8)) - ((255 * bf1[13])>>(8)) + ((198 * bf1[14])>>(8)) - ((74 * bf1[15])>>(8)) - ((74 * bf1[16])>>(8)) + ((198 * bf1[17])>>(8)) - ((255 * bf1[18])>>(8)) + ((226 * bf1[19])>>(8)) - ((121 * bf1[20])>>(8)) - ((25 * bf1[21])>>(8)) + ((162 * bf1[22])>>(8)) - ((245 * bf1[23])>>(8)) + ((245 * bf1[24])>>(8)) - ((162 * bf1[25])>>(8)) + ((25 * bf1[26])>>(8)) + ((121 * bf1[27])>>(8)) - ((226 * bf1[28])>>(8)) + ((255 * bf1[29])>>(8)) - ((198 * bf1[30])>>(8)) + ((74 * bf1[31])>>(8));
    bf0[27] = ((62 * bf1[0])>>(8)) - ((172 * bf1[1])>>(8)) + ((241 * bf1[2])>>(8)) - ((253 * bf1[3])>>(8)) + ((206 * bf1[4])>>(8)) - ((109 * bf1[5])>>(8)) - ((13 * bf1[6])>>(8)) + ((132 * bf1[7])>>(8)) - ((220 * bf1[8])>>(8)) + ((256 * bf1[9])>>(8)) - ((231 * bf1[10])>>(8)) + ((152 * bf1[11])>>(8)) - ((38 * bf1[12])>>(8)) - ((86 * bf1[13])>>(8)) + ((190 * bf1[14])>>(8)) - ((248 * bf1[15])>>(8)) + ((248 * bf1[16])>>(8)) - ((190 * bf1[17])>>(8)) + ((86 * bf1[18])>>(8)) + ((38 * bf1[19])>>(8)) - ((152 * bf1[20])>>(8)) + ((231 * bf1[21])>>(8)) - ((256 * bf1[22])>>(8)) + ((220 * bf1[23])>>(8)) - ((132 * bf1[24])>>(8)) + ((13 * bf1[25])>>(8)) + ((109 * bf1[26])>>(8)) - ((206 * bf1[27])>>(8)) + ((253 * bf1[28])>>(8)) - ((241 * bf1[29])>>(8)) + ((172 * bf1[30])>>(8)) - ((62 * bf1[31])>>(8));
    bf0[28] = ((50 * bf1[0])>>(8)) - ((142 * bf1[1])>>(8)) + ((213 * bf1[2])>>(8)) - ((251 * bf1[3])>>(8)) + ((251 * bf1[4])>>(8)) - ((213 * bf1[5])>>(8)) + ((142 * bf1[6])>>(8)) - ((50 * bf1[7])>>(8)) - ((50 * bf1[8])>>(8)) + ((142 * bf1[9])>>(8)) - ((213 * bf1[10])>>(8)) + ((251 * bf1[11])>>(8)) - ((251 * bf1[12])>>(8)) + ((213 * bf1[13])>>(8)) - ((142 * bf1[14])>>(8)) + ((50 * bf1[15])>>(8)) + ((50 * bf1[16])>>(8)) - ((142 * bf1[17])>>(8)) + ((213 * bf1[18])>>(8)) - ((251 * bf1[19])>>(8)) + ((251 * bf1[20])>>(8)) - ((213 * bf1[21])>>(8)) + ((142 * bf1[22])>>(8)) - ((50 * bf1[23])>>(8)) - ((50 * bf1[24])>>(8)) + ((142 * bf1[25])>>(8)) - ((213 * bf1[26])>>(8)) + ((251 * bf1[27])>>(8)) - ((251 * bf1[28])>>(8)) + ((213 * bf1[29])>>(8)) - ((142 * bf1[30])>>(8)) + ((50 * bf1[31])>>(8));
    bf0[29] = ((38 * bf1[0])>>(8)) - ((109 * bf1[1])>>(8)) + ((172 * bf1[2])>>(8)) - ((220 * bf1[3])>>(8)) + ((248 * bf1[4])>>(8)) - ((256 * bf1[5])>>(8)) + ((241 * bf1[6])>>(8)) - ((206 * bf1[7])>>(8)) + ((152 * bf1[8])>>(8)) - ((86 * bf1[9])>>(8)) + ((13 * bf1[10])>>(8)) + ((62 * bf1[11])>>(8)) - ((132 * bf1[12])>>(8)) + ((190 * bf1[13])>>(8)) - ((231 * bf1[14])>>(8)) + ((253 * bf1[15])>>(8)) - ((253 * bf1[16])>>(8)) + ((231 * bf1[17])>>(8)) - ((190 * bf1[18])>>(8)) + ((132 * bf1[19])>>(8)) - ((62 * bf1[20])>>(8)) - ((13 * bf1[21])>>(8)) + ((86 * bf1[22])>>(8)) - ((152 * bf1[23])>>(8)) + ((206 * bf1[24])>>(8)) - ((241 * bf1[25])>>(8)) + ((256 * bf1[26])>>(8)) - ((248 * bf1[27])>>(8)) + ((220 * bf1[28])>>(8)) - ((172 * bf1[29])>>(8)) + ((109 * bf1[30])>>(8)) - ((38 * bf1[31])>>(8));
    bf0[30] = ((25 * bf1[0])>>(8)) - ((74 * bf1[1])>>(8)) + ((121 * bf1[2])>>(8)) - ((162 * bf1[3])>>(8)) + ((198 * bf1[4])>>(8)) - ((226 * bf1[5])>>(8)) + ((245 * bf1[6])>>(8)) - ((255 * bf1[7])>>(8)) + ((255 * bf1[8])>>(8)) - ((245 * bf1[9])>>(8)) + ((226 * bf1[10])>>(8)) - ((198 * bf1[11])>>(8)) + ((162 * bf1[12])>>(8)) - ((121 * bf1[13])>>(8)) + ((74 * bf1[14])>>(8)) - ((25 * bf1[15])>>(8)) - ((25 * bf1[16])>>(8)) + ((74 * bf1[17])>>(8)) - ((121 * bf1[18])>>(8)) + ((162 * bf1[19])>>(8)) - ((198 * bf1[20])>>(8)) + ((226 * bf1[21])>>(8)) - ((245 * bf1[22])>>(8)) + ((255 * bf1[23])>>(8)) - ((255 * bf1[24])>>(8)) + ((245 * bf1[25])>>(8)) - ((226 * bf1[26])>>(8)) + ((198 * bf1[27])>>(8)) - ((162 * bf1[28])>>(8)) + ((121 * bf1[29])>>(8)) - ((74 * bf1[30])>>(8)) + ((25 * bf1[31])>>(8));
    bf0[31] = ((13 * bf1[0])>>(8)) - ((38 * bf1[1])>>(8)) + ((62 * bf1[2])>>(8)) - ((86 * bf1[3])>>(8)) + ((109 * bf1[4])>>(8)) - ((132 * bf1[5])>>(8)) + ((152 * bf1[6])>>(8)) - ((172 * bf1[7])>>(8)) + ((190 * bf1[8])>>(8)) - ((206 * bf1[9])>>(8)) + ((220 * bf1[10])>>(8)) - ((231 * bf1[11])>>(8)) + ((241 * bf1[12])>>(8)) - ((248 * bf1[13])>>(8)) + ((253 * bf1[14])>>(8)) - ((256 * bf1[15])>>(8)) + ((256 * bf1[16])>>(8)) - ((253 * bf1[17])>>(8)) + ((248 * bf1[18])>>(8)) - ((241 * bf1[19])>>(8)) + ((231 * bf1[20])>>(8)) - ((220 * bf1[21])>>(8)) + ((206 * bf1[22])>>(8)) - ((190 * bf1[23])>>(8)) + ((172 * bf1[24])>>(8)) - ((152 * bf1[25])>>(8)) + ((132 * bf1[26])>>(8)) - ((109 * bf1[27])>>(8)) + ((86 * bf1[28])>>(8)) - ((62 * bf1[29])>>(8)) + ((38 * bf1[30])>>(8)) - ((13 * bf1[31])>>(8));
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
    int32_t *bf0, *bf1;
    bf0 = output;
    bf1 = input;
    bf0[0] = ((181 * bf1[0])>>(8)) + ((181 * bf1[1])>>(8)) + ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) + ((181 * bf1[5])>>(8)) + ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8)) + ((181 * bf1[8])>>(8)) + ((181 * bf1[9])>>(8)) + ((181 * bf1[10])>>(8)) + ((181 * bf1[11])>>(8)) + ((181 * bf1[12])>>(8)) + ((181 * bf1[13])>>(8)) + ((181 * bf1[14])>>(8)) + ((181 * bf1[15])>>(8)) + ((181 * bf1[16])>>(8)) + ((181 * bf1[17])>>(8)) + ((181 * bf1[18])>>(8)) + ((181 * bf1[19])>>(8)) + ((181 * bf1[20])>>(8)) + ((181 * bf1[21])>>(8)) + ((181 * bf1[22])>>(8)) + ((181 * bf1[23])>>(8)) + ((181 * bf1[24])>>(8)) + ((181 * bf1[25])>>(8)) + ((181 * bf1[26])>>(8)) + ((181 * bf1[27])>>(8)) + ((181 * bf1[28])>>(8)) + ((181 * bf1[29])>>(8)) + ((181 * bf1[30])>>(8)) + ((181 * bf1[31])>>(8)) + ((181 * bf1[32])>>(8)) + ((181 * bf1[33])>>(8)) + ((181 * bf1[34])>>(8)) + ((181 * bf1[35])>>(8)) + ((181 * bf1[36])>>(8)) + ((181 * bf1[37])>>(8)) + ((181 * bf1[38])>>(8)) + ((181 * bf1[39])>>(8)) + ((181 * bf1[40])>>(8)) + ((181 * bf1[41])>>(8)) + ((181 * bf1[42])>>(8)) + ((181 * bf1[43])>>(8)) + ((181 * bf1[44])>>(8)) + ((181 * bf1[45])>>(8)) + ((181 * bf1[46])>>(8)) + ((181 * bf1[47])>>(8)) + ((181 * bf1[48])>>(8)) + ((181 * bf1[49])>>(8)) + ((181 * bf1[50])>>(8)) + ((181 * bf1[51])>>(8)) + ((181 * bf1[52])>>(8)) + ((181 * bf1[53])>>(8)) + ((181 * bf1[54])>>(8)) + ((181 * bf1[55])>>(8)) + ((181 * bf1[56])>>(8)) + ((181 * bf1[57])>>(8)) + ((181 * bf1[58])>>(8)) + ((181 * bf1[59])>>(8)) + ((181 * bf1[60])>>(8)) + ((181 * bf1[61])>>(8)) + ((181 * bf1[62])>>(8)) + ((181 * bf1[63])>>(8));
    bf0[1] = ((256 * bf1[0])>>(8)) + ((255 * bf1[1])>>(8)) + ((254 * bf1[2])>>(8)) + ((252 * bf1[3])>>(8)) + ((250 * bf1[4])>>(8)) + ((247 * bf1[5])>>(8)) + ((243 * bf1[6])>>(8)) + ((239 * bf1[7])>>(8)) + ((234 * bf1[8])>>(8)) + ((229 * bf1[9])>>(8)) + ((223 * bf1[10])>>(8)) + ((216 * bf1[11])>>(8)) + ((209 * bf1[12])>>(8)) + ((202 * bf1[13])>>(8)) + ((194 * bf1[14])>>(8)) + ((185 * bf1[15])>>(8)) + ((177 * bf1[16])>>(8)) + ((167 * bf1[17])>>(8)) + ((157 * bf1[18])>>(8)) + ((147 * bf1[19])>>(8)) + ((137 * bf1[20])>>(8)) + ((126 * bf1[21])>>(8)) + ((115 * bf1[22])>>(8)) + ((104 * bf1[23])>>(8)) + ((92 * bf1[24])>>(8)) + ((80 * bf1[25])>>(8)) + ((68 * bf1[26])>>(8)) + ((56 * bf1[27])>>(8)) + ((44 * bf1[28])>>(8)) + ((31 * bf1[29])>>(8)) + ((19 * bf1[30])>>(8)) + ((6 * bf1[31])>>(8)) - ((6 * bf1[32])>>(8)) - ((19 * bf1[33])>>(8)) - ((31 * bf1[34])>>(8)) - ((44 * bf1[35])>>(8)) - ((56 * bf1[36])>>(8)) - ((68 * bf1[37])>>(8)) - ((80 * bf1[38])>>(8)) - ((92 * bf1[39])>>(8)) - ((104 * bf1[40])>>(8)) - ((115 * bf1[41])>>(8)) - ((126 * bf1[42])>>(8)) - ((137 * bf1[43])>>(8)) - ((147 * bf1[44])>>(8)) - ((157 * bf1[45])>>(8)) - ((167 * bf1[46])>>(8)) - ((177 * bf1[47])>>(8)) - ((185 * bf1[48])>>(8)) - ((194 * bf1[49])>>(8)) - ((202 * bf1[50])>>(8)) - ((209 * bf1[51])>>(8)) - ((216 * bf1[52])>>(8)) - ((223 * bf1[53])>>(8)) - ((229 * bf1[54])>>(8)) - ((234 * bf1[55])>>(8)) - ((239 * bf1[56])>>(8)) - ((243 * bf1[57])>>(8)) - ((247 * bf1[58])>>(8)) - ((250 * bf1[59])>>(8)) - ((252 * bf1[60])>>(8)) - ((254 * bf1[61])>>(8)) - ((255 * bf1[62])>>(8)) - ((256 * bf1[63])>>(8));
    bf0[2] = ((256 * bf1[0])>>(8)) + ((253 * bf1[1])>>(8)) + ((248 * bf1[2])>>(8)) + ((241 * bf1[3])>>(8)) + ((231 * bf1[4])>>(8)) + ((220 * bf1[5])>>(8)) + ((206 * bf1[6])>>(8)) + ((190 * bf1[7])>>(8)) + ((172 * bf1[8])>>(8)) + ((152 * bf1[9])>>(8)) + ((132 * bf1[10])>>(8)) + ((109 * bf1[11])>>(8)) + ((86 * bf1[12])>>(8)) + ((62 * bf1[13])>>(8)) + ((38 * bf1[14])>>(8)) + ((13 * bf1[15])>>(8)) - ((13 * bf1[16])>>(8)) - ((38 * bf1[17])>>(8)) - ((62 * bf1[18])>>(8)) - ((86 * bf1[19])>>(8)) - ((109 * bf1[20])>>(8)) - ((132 * bf1[21])>>(8)) - ((152 * bf1[22])>>(8)) - ((172 * bf1[23])>>(8)) - ((190 * bf1[24])>>(8)) - ((206 * bf1[25])>>(8)) - ((220 * bf1[26])>>(8)) - ((231 * bf1[27])>>(8)) - ((241 * bf1[28])>>(8)) - ((248 * bf1[29])>>(8)) - ((253 * bf1[30])>>(8)) - ((256 * bf1[31])>>(8)) - ((256 * bf1[32])>>(8)) - ((253 * bf1[33])>>(8)) - ((248 * bf1[34])>>(8)) - ((241 * bf1[35])>>(8)) - ((231 * bf1[36])>>(8)) - ((220 * bf1[37])>>(8)) - ((206 * bf1[38])>>(8)) - ((190 * bf1[39])>>(8)) - ((172 * bf1[40])>>(8)) - ((152 * bf1[41])>>(8)) - ((132 * bf1[42])>>(8)) - ((109 * bf1[43])>>(8)) - ((86 * bf1[44])>>(8)) - ((62 * bf1[45])>>(8)) - ((38 * bf1[46])>>(8)) - ((13 * bf1[47])>>(8)) + ((13 * bf1[48])>>(8)) + ((38 * bf1[49])>>(8)) + ((62 * bf1[50])>>(8)) + ((86 * bf1[51])>>(8)) + ((109 * bf1[52])>>(8)) + ((132 * bf1[53])>>(8)) + ((152 * bf1[54])>>(8)) + ((172 * bf1[55])>>(8)) + ((190 * bf1[56])>>(8)) + ((206 * bf1[57])>>(8)) + ((220 * bf1[58])>>(8)) + ((231 * bf1[59])>>(8)) + ((241 * bf1[60])>>(8)) + ((248 * bf1[61])>>(8)) + ((253 * bf1[62])>>(8)) + ((256 * bf1[63])>>(8));
    bf0[3] = ((255 * bf1[0])>>(8)) + ((250 * bf1[1])>>(8)) + ((239 * bf1[2])>>(8)) + ((223 * bf1[3])>>(8)) + ((202 * bf1[4])>>(8)) + ((177 * bf1[5])>>(8)) + ((147 * bf1[6])>>(8)) + ((115 * bf1[7])>>(8)) + ((80 * bf1[8])>>(8)) + ((44 * bf1[9])>>(8)) + ((6 * bf1[10])>>(8)) - ((31 * bf1[11])>>(8)) - ((68 * bf1[12])>>(8)) - ((104 * bf1[13])>>(8)) - ((137 * bf1[14])>>(8)) - ((167 * bf1[15])>>(8)) - ((194 * bf1[16])>>(8)) - ((216 * bf1[17])>>(8)) - ((234 * bf1[18])>>(8)) - ((247 * bf1[19])>>(8)) - ((254 * bf1[20])>>(8)) - ((256 * bf1[21])>>(8)) - ((252 * bf1[22])>>(8)) - ((243 * bf1[23])>>(8)) - ((229 * bf1[24])>>(8)) - ((209 * bf1[25])>>(8)) - ((185 * bf1[26])>>(8)) - ((157 * bf1[27])>>(8)) - ((126 * bf1[28])>>(8)) - ((92 * bf1[29])>>(8)) - ((56 * bf1[30])>>(8)) - ((19 * bf1[31])>>(8)) + ((19 * bf1[32])>>(8)) + ((56 * bf1[33])>>(8)) + ((92 * bf1[34])>>(8)) + ((126 * bf1[35])>>(8)) + ((157 * bf1[36])>>(8)) + ((185 * bf1[37])>>(8)) + ((209 * bf1[38])>>(8)) + ((229 * bf1[39])>>(8)) + ((243 * bf1[40])>>(8)) + ((252 * bf1[41])>>(8)) + ((256 * bf1[42])>>(8)) + ((254 * bf1[43])>>(8)) + ((247 * bf1[44])>>(8)) + ((234 * bf1[45])>>(8)) + ((216 * bf1[46])>>(8)) + ((194 * bf1[47])>>(8)) + ((167 * bf1[48])>>(8)) + ((137 * bf1[49])>>(8)) + ((104 * bf1[50])>>(8)) + ((68 * bf1[51])>>(8)) + ((31 * bf1[52])>>(8)) - ((6 * bf1[53])>>(8)) - ((44 * bf1[54])>>(8)) - ((80 * bf1[55])>>(8)) - ((115 * bf1[56])>>(8)) - ((147 * bf1[57])>>(8)) - ((177 * bf1[58])>>(8)) - ((202 * bf1[59])>>(8)) - ((223 * bf1[60])>>(8)) - ((239 * bf1[61])>>(8)) - ((250 * bf1[62])>>(8)) - ((255 * bf1[63])>>(8));
    bf0[4] = ((255 * bf1[0])>>(8)) + ((245 * bf1[1])>>(8)) + ((226 * bf1[2])>>(8)) + ((198 * bf1[3])>>(8)) + ((162 * bf1[4])>>(8)) + ((121 * bf1[5])>>(8)) + ((74 * bf1[6])>>(8)) + ((25 * bf1[7])>>(8)) - ((25 * bf1[8])>>(8)) - ((74 * bf1[9])>>(8)) - ((121 * bf1[10])>>(8)) - ((162 * bf1[11])>>(8)) - ((198 * bf1[12])>>(8)) - ((226 * bf1[13])>>(8)) - ((245 * bf1[14])>>(8)) - ((255 * bf1[15])>>(8)) - ((255 * bf1[16])>>(8)) - ((245 * bf1[17])>>(8)) - ((226 * bf1[18])>>(8)) - ((198 * bf1[19])>>(8)) - ((162 * bf1[20])>>(8)) - ((121 * bf1[21])>>(8)) - ((74 * bf1[22])>>(8)) - ((25 * bf1[23])>>(8)) + ((25 * bf1[24])>>(8)) + ((74 * bf1[25])>>(8)) + ((121 * bf1[26])>>(8)) + ((162 * bf1[27])>>(8)) + ((198 * bf1[28])>>(8)) + ((226 * bf1[29])>>(8)) + ((245 * bf1[30])>>(8)) + ((255 * bf1[31])>>(8)) + ((255 * bf1[32])>>(8)) + ((245 * bf1[33])>>(8)) + ((226 * bf1[34])>>(8)) + ((198 * bf1[35])>>(8)) + ((162 * bf1[36])>>(8)) + ((121 * bf1[37])>>(8)) + ((74 * bf1[38])>>(8)) + ((25 * bf1[39])>>(8)) - ((25 * bf1[40])>>(8)) - ((74 * bf1[41])>>(8)) - ((121 * bf1[42])>>(8)) - ((162 * bf1[43])>>(8)) - ((198 * bf1[44])>>(8)) - ((226 * bf1[45])>>(8)) - ((245 * bf1[46])>>(8)) - ((255 * bf1[47])>>(8)) - ((255 * bf1[48])>>(8)) - ((245 * bf1[49])>>(8)) - ((226 * bf1[50])>>(8)) - ((198 * bf1[51])>>(8)) - ((162 * bf1[52])>>(8)) - ((121 * bf1[53])>>(8)) - ((74 * bf1[54])>>(8)) - ((25 * bf1[55])>>(8)) + ((25 * bf1[56])>>(8)) + ((74 * bf1[57])>>(8)) + ((121 * bf1[58])>>(8)) + ((162 * bf1[59])>>(8)) + ((198 * bf1[60])>>(8)) + ((226 * bf1[61])>>(8)) + ((245 * bf1[62])>>(8)) + ((255 * bf1[63])>>(8));
    bf0[5] = ((254 * bf1[0])>>(8)) + ((239 * bf1[1])>>(8)) + ((209 * bf1[2])>>(8)) + ((167 * bf1[3])>>(8)) + ((115 * bf1[4])>>(8)) + ((56 * bf1[5])>>(8)) - ((6 * bf1[6])>>(8)) - ((68 * bf1[7])>>(8)) - ((126 * bf1[8])>>(8)) - ((177 * bf1[9])>>(8)) - ((216 * bf1[10])>>(8)) - ((243 * bf1[11])>>(8)) - ((255 * bf1[12])>>(8)) - ((252 * bf1[13])>>(8)) - ((234 * bf1[14])>>(8)) - ((202 * bf1[15])>>(8)) - ((157 * bf1[16])>>(8)) - ((104 * bf1[17])>>(8)) - ((44 * bf1[18])>>(8)) + ((19 * bf1[19])>>(8)) + ((80 * bf1[20])>>(8)) + ((137 * bf1[21])>>(8)) + ((185 * bf1[22])>>(8)) + ((223 * bf1[23])>>(8)) + ((247 * bf1[24])>>(8)) + ((256 * bf1[25])>>(8)) + ((250 * bf1[26])>>(8)) + ((229 * bf1[27])>>(8)) + ((194 * bf1[28])>>(8)) + ((147 * bf1[29])>>(8)) + ((92 * bf1[30])>>(8)) + ((31 * bf1[31])>>(8)) - ((31 * bf1[32])>>(8)) - ((92 * bf1[33])>>(8)) - ((147 * bf1[34])>>(8)) - ((194 * bf1[35])>>(8)) - ((229 * bf1[36])>>(8)) - ((250 * bf1[37])>>(8)) - ((256 * bf1[38])>>(8)) - ((247 * bf1[39])>>(8)) - ((223 * bf1[40])>>(8)) - ((185 * bf1[41])>>(8)) - ((137 * bf1[42])>>(8)) - ((80 * bf1[43])>>(8)) - ((19 * bf1[44])>>(8)) + ((44 * bf1[45])>>(8)) + ((104 * bf1[46])>>(8)) + ((157 * bf1[47])>>(8)) + ((202 * bf1[48])>>(8)) + ((234 * bf1[49])>>(8)) + ((252 * bf1[50])>>(8)) + ((255 * bf1[51])>>(8)) + ((243 * bf1[52])>>(8)) + ((216 * bf1[53])>>(8)) + ((177 * bf1[54])>>(8)) + ((126 * bf1[55])>>(8)) + ((68 * bf1[56])>>(8)) + ((6 * bf1[57])>>(8)) - ((56 * bf1[58])>>(8)) - ((115 * bf1[59])>>(8)) - ((167 * bf1[60])>>(8)) - ((209 * bf1[61])>>(8)) - ((239 * bf1[62])>>(8)) - ((254 * bf1[63])>>(8));
    bf0[6] = ((253 * bf1[0])>>(8)) + ((231 * bf1[1])>>(8)) + ((190 * bf1[2])>>(8)) + ((132 * bf1[3])>>(8)) + ((62 * bf1[4])>>(8)) - ((13 * bf1[5])>>(8)) - ((86 * bf1[6])>>(8)) - ((152 * bf1[7])>>(8)) - ((206 * bf1[8])>>(8)) - ((241 * bf1[9])>>(8)) - ((256 * bf1[10])>>(8)) - ((248 * bf1[11])>>(8)) - ((220 * bf1[12])>>(8)) - ((172 * bf1[13])>>(8)) - ((109 * bf1[14])>>(8)) - ((38 * bf1[15])>>(8)) + ((38 * bf1[16])>>(8)) + ((109 * bf1[17])>>(8)) + ((172 * bf1[18])>>(8)) + ((220 * bf1[19])>>(8)) + ((248 * bf1[20])>>(8)) + ((256 * bf1[21])>>(8)) + ((241 * bf1[22])>>(8)) + ((206 * bf1[23])>>(8)) + ((152 * bf1[24])>>(8)) + ((86 * bf1[25])>>(8)) + ((13 * bf1[26])>>(8)) - ((62 * bf1[27])>>(8)) - ((132 * bf1[28])>>(8)) - ((190 * bf1[29])>>(8)) - ((231 * bf1[30])>>(8)) - ((253 * bf1[31])>>(8)) - ((253 * bf1[32])>>(8)) - ((231 * bf1[33])>>(8)) - ((190 * bf1[34])>>(8)) - ((132 * bf1[35])>>(8)) - ((62 * bf1[36])>>(8)) + ((13 * bf1[37])>>(8)) + ((86 * bf1[38])>>(8)) + ((152 * bf1[39])>>(8)) + ((206 * bf1[40])>>(8)) + ((241 * bf1[41])>>(8)) + ((256 * bf1[42])>>(8)) + ((248 * bf1[43])>>(8)) + ((220 * bf1[44])>>(8)) + ((172 * bf1[45])>>(8)) + ((109 * bf1[46])>>(8)) + ((38 * bf1[47])>>(8)) - ((38 * bf1[48])>>(8)) - ((109 * bf1[49])>>(8)) - ((172 * bf1[50])>>(8)) - ((220 * bf1[51])>>(8)) - ((248 * bf1[52])>>(8)) - ((256 * bf1[53])>>(8)) - ((241 * bf1[54])>>(8)) - ((206 * bf1[55])>>(8)) - ((152 * bf1[56])>>(8)) - ((86 * bf1[57])>>(8)) - ((13 * bf1[58])>>(8)) + ((62 * bf1[59])>>(8)) + ((132 * bf1[60])>>(8)) + ((190 * bf1[61])>>(8)) + ((231 * bf1[62])>>(8)) + ((253 * bf1[63])>>(8));
    bf0[7] = ((252 * bf1[0])>>(8)) + ((223 * bf1[1])>>(8)) + ((167 * bf1[2])>>(8)) + ((92 * bf1[3])>>(8)) + ((6 * bf1[4])>>(8)) - ((80 * bf1[5])>>(8)) - ((157 * bf1[6])>>(8)) - ((216 * bf1[7])>>(8)) - ((250 * bf1[8])>>(8)) - ((254 * bf1[9])>>(8)) - ((229 * bf1[10])>>(8)) - ((177 * bf1[11])>>(8)) - ((104 * bf1[12])>>(8)) - ((19 * bf1[13])>>(8)) + ((68 * bf1[14])>>(8)) + ((147 * bf1[15])>>(8)) + ((209 * bf1[16])>>(8)) + ((247 * bf1[17])>>(8)) + ((255 * bf1[18])>>(8)) + ((234 * bf1[19])>>(8)) + ((185 * bf1[20])>>(8)) + ((115 * bf1[21])>>(8)) + ((31 * bf1[22])>>(8)) - ((56 * bf1[23])>>(8)) - ((137 * bf1[24])>>(8)) - ((202 * bf1[25])>>(8)) - ((243 * bf1[26])>>(8)) - ((256 * bf1[27])>>(8)) - ((239 * bf1[28])>>(8)) - ((194 * bf1[29])>>(8)) - ((126 * bf1[30])>>(8)) - ((44 * bf1[31])>>(8)) + ((44 * bf1[32])>>(8)) + ((126 * bf1[33])>>(8)) + ((194 * bf1[34])>>(8)) + ((239 * bf1[35])>>(8)) + ((256 * bf1[36])>>(8)) + ((243 * bf1[37])>>(8)) + ((202 * bf1[38])>>(8)) + ((137 * bf1[39])>>(8)) + ((56 * bf1[40])>>(8)) - ((31 * bf1[41])>>(8)) - ((115 * bf1[42])>>(8)) - ((185 * bf1[43])>>(8)) - ((234 * bf1[44])>>(8)) - ((255 * bf1[45])>>(8)) - ((247 * bf1[46])>>(8)) - ((209 * bf1[47])>>(8)) - ((147 * bf1[48])>>(8)) - ((68 * bf1[49])>>(8)) + ((19 * bf1[50])>>(8)) + ((104 * bf1[51])>>(8)) + ((177 * bf1[52])>>(8)) + ((229 * bf1[53])>>(8)) + ((254 * bf1[54])>>(8)) + ((250 * bf1[55])>>(8)) + ((216 * bf1[56])>>(8)) + ((157 * bf1[57])>>(8)) + ((80 * bf1[58])>>(8)) - ((6 * bf1[59])>>(8)) - ((92 * bf1[60])>>(8)) - ((167 * bf1[61])>>(8)) - ((223 * bf1[62])>>(8)) - ((252 * bf1[63])>>(8));
    bf0[8] = ((251 * bf1[0])>>(8)) + ((213 * bf1[1])>>(8)) + ((142 * bf1[2])>>(8)) + ((50 * bf1[3])>>(8)) - ((50 * bf1[4])>>(8)) - ((142 * bf1[5])>>(8)) - ((213 * bf1[6])>>(8)) - ((251 * bf1[7])>>(8)) - ((251 * bf1[8])>>(8)) - ((213 * bf1[9])>>(8)) - ((142 * bf1[10])>>(8)) - ((50 * bf1[11])>>(8)) + ((50 * bf1[12])>>(8)) + ((142 * bf1[13])>>(8)) + ((213 * bf1[14])>>(8)) + ((251 * bf1[15])>>(8)) + ((251 * bf1[16])>>(8)) + ((213 * bf1[17])>>(8)) + ((142 * bf1[18])>>(8)) + ((50 * bf1[19])>>(8)) - ((50 * bf1[20])>>(8)) - ((142 * bf1[21])>>(8)) - ((213 * bf1[22])>>(8)) - ((251 * bf1[23])>>(8)) - ((251 * bf1[24])>>(8)) - ((213 * bf1[25])>>(8)) - ((142 * bf1[26])>>(8)) - ((50 * bf1[27])>>(8)) + ((50 * bf1[28])>>(8)) + ((142 * bf1[29])>>(8)) + ((213 * bf1[30])>>(8)) + ((251 * bf1[31])>>(8)) + ((251 * bf1[32])>>(8)) + ((213 * bf1[33])>>(8)) + ((142 * bf1[34])>>(8)) + ((50 * bf1[35])>>(8)) - ((50 * bf1[36])>>(8)) - ((142 * bf1[37])>>(8)) - ((213 * bf1[38])>>(8)) - ((251 * bf1[39])>>(8)) - ((251 * bf1[40])>>(8)) - ((213 * bf1[41])>>(8)) - ((142 * bf1[42])>>(8)) - ((50 * bf1[43])>>(8)) + ((50 * bf1[44])>>(8)) + ((142 * bf1[45])>>(8)) + ((213 * bf1[46])>>(8)) + ((251 * bf1[47])>>(8)) + ((251 * bf1[48])>>(8)) + ((213 * bf1[49])>>(8)) + ((142 * bf1[50])>>(8)) + ((50 * bf1[51])>>(8)) - ((50 * bf1[52])>>(8)) - ((142 * bf1[53])>>(8)) - ((213 * bf1[54])>>(8)) - ((251 * bf1[55])>>(8)) - ((251 * bf1[56])>>(8)) - ((213 * bf1[57])>>(8)) - ((142 * bf1[58])>>(8)) - ((50 * bf1[59])>>(8)) + ((50 * bf1[60])>>(8)) + ((142 * bf1[61])>>(8)) + ((213 * bf1[62])>>(8)) + ((251 * bf1[63])>>(8));
    bf0[9] = ((250 * bf1[0])>>(8)) + ((202 * bf1[1])>>(8)) + ((115 * bf1[2])>>(8)) + ((6 * bf1[3])>>(8)) - ((104 * bf1[4])>>(8)) - ((194 * bf1[5])>>(8)) - ((247 * bf1[6])>>(8)) - ((252 * bf1[7])>>(8)) - ((209 * bf1[8])>>(8)) - ((126 * bf1[9])>>(8)) - ((19 * bf1[10])>>(8)) + ((92 * bf1[11])>>(8)) + ((185 * bf1[12])>>(8)) + ((243 * bf1[13])>>(8)) + ((254 * bf1[14])>>(8)) + ((216 * bf1[15])>>(8)) + ((137 * bf1[16])>>(8)) + ((31 * bf1[17])>>(8)) - ((80 * bf1[18])>>(8)) - ((177 * bf1[19])>>(8)) - ((239 * bf1[20])>>(8)) - ((255 * bf1[21])>>(8)) - ((223 * bf1[22])>>(8)) - ((147 * bf1[23])>>(8)) - ((44 * bf1[24])>>(8)) + ((68 * bf1[25])>>(8)) + ((167 * bf1[26])>>(8)) + ((234 * bf1[27])>>(8)) + ((256 * bf1[28])>>(8)) + ((229 * bf1[29])>>(8)) + ((157 * bf1[30])>>(8)) + ((56 * bf1[31])>>(8)) - ((56 * bf1[32])>>(8)) - ((157 * bf1[33])>>(8)) - ((229 * bf1[34])>>(8)) - ((256 * bf1[35])>>(8)) - ((234 * bf1[36])>>(8)) - ((167 * bf1[37])>>(8)) - ((68 * bf1[38])>>(8)) + ((44 * bf1[39])>>(8)) + ((147 * bf1[40])>>(8)) + ((223 * bf1[41])>>(8)) + ((255 * bf1[42])>>(8)) + ((239 * bf1[43])>>(8)) + ((177 * bf1[44])>>(8)) + ((80 * bf1[45])>>(8)) - ((31 * bf1[46])>>(8)) - ((137 * bf1[47])>>(8)) - ((216 * bf1[48])>>(8)) - ((254 * bf1[49])>>(8)) - ((243 * bf1[50])>>(8)) - ((185 * bf1[51])>>(8)) - ((92 * bf1[52])>>(8)) + ((19 * bf1[53])>>(8)) + ((126 * bf1[54])>>(8)) + ((209 * bf1[55])>>(8)) + ((252 * bf1[56])>>(8)) + ((247 * bf1[57])>>(8)) + ((194 * bf1[58])>>(8)) + ((104 * bf1[59])>>(8)) - ((6 * bf1[60])>>(8)) - ((115 * bf1[61])>>(8)) - ((202 * bf1[62])>>(8)) - ((250 * bf1[63])>>(8));
    bf0[10] = ((248 * bf1[0])>>(8)) + ((190 * bf1[1])>>(8)) + ((86 * bf1[2])>>(8)) - ((38 * bf1[3])>>(8)) - ((152 * bf1[4])>>(8)) - ((231 * bf1[5])>>(8)) - ((256 * bf1[6])>>(8)) - ((220 * bf1[7])>>(8)) - ((132 * bf1[8])>>(8)) - ((13 * bf1[9])>>(8)) + ((109 * bf1[10])>>(8)) + ((206 * bf1[11])>>(8)) + ((253 * bf1[12])>>(8)) + ((241 * bf1[13])>>(8)) + ((172 * bf1[14])>>(8)) + ((62 * bf1[15])>>(8)) - ((62 * bf1[16])>>(8)) - ((172 * bf1[17])>>(8)) - ((241 * bf1[18])>>(8)) - ((253 * bf1[19])>>(8)) - ((206 * bf1[20])>>(8)) - ((109 * bf1[21])>>(8)) + ((13 * bf1[22])>>(8)) + ((132 * bf1[23])>>(8)) + ((220 * bf1[24])>>(8)) + ((256 * bf1[25])>>(8)) + ((231 * bf1[26])>>(8)) + ((152 * bf1[27])>>(8)) + ((38 * bf1[28])>>(8)) - ((86 * bf1[29])>>(8)) - ((190 * bf1[30])>>(8)) - ((248 * bf1[31])>>(8)) - ((248 * bf1[32])>>(8)) - ((190 * bf1[33])>>(8)) - ((86 * bf1[34])>>(8)) + ((38 * bf1[35])>>(8)) + ((152 * bf1[36])>>(8)) + ((231 * bf1[37])>>(8)) + ((256 * bf1[38])>>(8)) + ((220 * bf1[39])>>(8)) + ((132 * bf1[40])>>(8)) + ((13 * bf1[41])>>(8)) - ((109 * bf1[42])>>(8)) - ((206 * bf1[43])>>(8)) - ((253 * bf1[44])>>(8)) - ((241 * bf1[45])>>(8)) - ((172 * bf1[46])>>(8)) - ((62 * bf1[47])>>(8)) + ((62 * bf1[48])>>(8)) + ((172 * bf1[49])>>(8)) + ((241 * bf1[50])>>(8)) + ((253 * bf1[51])>>(8)) + ((206 * bf1[52])>>(8)) + ((109 * bf1[53])>>(8)) - ((13 * bf1[54])>>(8)) - ((132 * bf1[55])>>(8)) - ((220 * bf1[56])>>(8)) - ((256 * bf1[57])>>(8)) - ((231 * bf1[58])>>(8)) - ((152 * bf1[59])>>(8)) - ((38 * bf1[60])>>(8)) + ((86 * bf1[61])>>(8)) + ((190 * bf1[62])>>(8)) + ((248 * bf1[63])>>(8));
    bf0[11] = ((247 * bf1[0])>>(8)) + ((177 * bf1[1])>>(8)) + ((56 * bf1[2])>>(8)) - ((80 * bf1[3])>>(8)) - ((194 * bf1[4])>>(8)) - ((252 * bf1[5])>>(8)) - ((239 * bf1[6])>>(8)) - ((157 * bf1[7])>>(8)) - ((31 * bf1[8])>>(8)) + ((104 * bf1[9])>>(8)) + ((209 * bf1[10])>>(8)) + ((255 * bf1[11])>>(8)) + ((229 * bf1[12])>>(8)) + ((137 * bf1[13])>>(8)) + ((6 * bf1[14])>>(8)) - ((126 * bf1[15])>>(8)) - ((223 * bf1[16])>>(8)) - ((256 * bf1[17])>>(8)) - ((216 * bf1[18])>>(8)) - ((115 * bf1[19])>>(8)) + ((19 * bf1[20])>>(8)) + ((147 * bf1[21])>>(8)) + ((234 * bf1[22])>>(8)) + ((254 * bf1[23])>>(8)) + ((202 * bf1[24])>>(8)) + ((92 * bf1[25])>>(8)) - ((44 * bf1[26])>>(8)) - ((167 * bf1[27])>>(8)) - ((243 * bf1[28])>>(8)) - ((250 * bf1[29])>>(8)) - ((185 * bf1[30])>>(8)) - ((68 * bf1[31])>>(8)) + ((68 * bf1[32])>>(8)) + ((185 * bf1[33])>>(8)) + ((250 * bf1[34])>>(8)) + ((243 * bf1[35])>>(8)) + ((167 * bf1[36])>>(8)) + ((44 * bf1[37])>>(8)) - ((92 * bf1[38])>>(8)) - ((202 * bf1[39])>>(8)) - ((254 * bf1[40])>>(8)) - ((234 * bf1[41])>>(8)) - ((147 * bf1[42])>>(8)) - ((19 * bf1[43])>>(8)) + ((115 * bf1[44])>>(8)) + ((216 * bf1[45])>>(8)) + ((256 * bf1[46])>>(8)) + ((223 * bf1[47])>>(8)) + ((126 * bf1[48])>>(8)) - ((6 * bf1[49])>>(8)) - ((137 * bf1[50])>>(8)) - ((229 * bf1[51])>>(8)) - ((255 * bf1[52])>>(8)) - ((209 * bf1[53])>>(8)) - ((104 * bf1[54])>>(8)) + ((31 * bf1[55])>>(8)) + ((157 * bf1[56])>>(8)) + ((239 * bf1[57])>>(8)) + ((252 * bf1[58])>>(8)) + ((194 * bf1[59])>>(8)) + ((80 * bf1[60])>>(8)) - ((56 * bf1[61])>>(8)) - ((177 * bf1[62])>>(8)) - ((247 * bf1[63])>>(8));
    bf0[12] = ((245 * bf1[0])>>(8)) + ((162 * bf1[1])>>(8)) + ((25 * bf1[2])>>(8)) - ((121 * bf1[3])>>(8)) - ((226 * bf1[4])>>(8)) - ((255 * bf1[5])>>(8)) - ((198 * bf1[6])>>(8)) - ((74 * bf1[7])>>(8)) + ((74 * bf1[8])>>(8)) + ((198 * bf1[9])>>(8)) + ((255 * bf1[10])>>(8)) + ((226 * bf1[11])>>(8)) + ((121 * bf1[12])>>(8)) - ((25 * bf1[13])>>(8)) - ((162 * bf1[14])>>(8)) - ((245 * bf1[15])>>(8)) - ((245 * bf1[16])>>(8)) - ((162 * bf1[17])>>(8)) - ((25 * bf1[18])>>(8)) + ((121 * bf1[19])>>(8)) + ((226 * bf1[20])>>(8)) + ((255 * bf1[21])>>(8)) + ((198 * bf1[22])>>(8)) + ((74 * bf1[23])>>(8)) - ((74 * bf1[24])>>(8)) - ((198 * bf1[25])>>(8)) - ((255 * bf1[26])>>(8)) - ((226 * bf1[27])>>(8)) - ((121 * bf1[28])>>(8)) + ((25 * bf1[29])>>(8)) + ((162 * bf1[30])>>(8)) + ((245 * bf1[31])>>(8)) + ((245 * bf1[32])>>(8)) + ((162 * bf1[33])>>(8)) + ((25 * bf1[34])>>(8)) - ((121 * bf1[35])>>(8)) - ((226 * bf1[36])>>(8)) - ((255 * bf1[37])>>(8)) - ((198 * bf1[38])>>(8)) - ((74 * bf1[39])>>(8)) + ((74 * bf1[40])>>(8)) + ((198 * bf1[41])>>(8)) + ((255 * bf1[42])>>(8)) + ((226 * bf1[43])>>(8)) + ((121 * bf1[44])>>(8)) - ((25 * bf1[45])>>(8)) - ((162 * bf1[46])>>(8)) - ((245 * bf1[47])>>(8)) - ((245 * bf1[48])>>(8)) - ((162 * bf1[49])>>(8)) - ((25 * bf1[50])>>(8)) + ((121 * bf1[51])>>(8)) + ((226 * bf1[52])>>(8)) + ((255 * bf1[53])>>(8)) + ((198 * bf1[54])>>(8)) + ((74 * bf1[55])>>(8)) - ((74 * bf1[56])>>(8)) - ((198 * bf1[57])>>(8)) - ((255 * bf1[58])>>(8)) - ((226 * bf1[59])>>(8)) - ((121 * bf1[60])>>(8)) + ((25 * bf1[61])>>(8)) + ((162 * bf1[62])>>(8)) + ((245 * bf1[63])>>(8));
    bf0[13] = ((243 * bf1[0])>>(8)) + ((147 * bf1[1])>>(8)) - ((6 * bf1[2])>>(8)) - ((157 * bf1[3])>>(8)) - ((247 * bf1[4])>>(8)) - ((239 * bf1[5])>>(8)) - ((137 * bf1[6])>>(8)) + ((19 * bf1[7])>>(8)) + ((167 * bf1[8])>>(8)) + ((250 * bf1[9])>>(8)) + ((234 * bf1[10])>>(8)) + ((126 * bf1[11])>>(8)) - ((31 * bf1[12])>>(8)) - ((177 * bf1[13])>>(8)) - ((252 * bf1[14])>>(8)) - ((229 * bf1[15])>>(8)) - ((115 * bf1[16])>>(8)) + ((44 * bf1[17])>>(8)) + ((185 * bf1[18])>>(8)) + ((254 * bf1[19])>>(8)) + ((223 * bf1[20])>>(8)) + ((104 * bf1[21])>>(8)) - ((56 * bf1[22])>>(8)) - ((194 * bf1[23])>>(8)) - ((255 * bf1[24])>>(8)) - ((216 * bf1[25])>>(8)) - ((92 * bf1[26])>>(8)) + ((68 * bf1[27])>>(8)) + ((202 * bf1[28])>>(8)) + ((256 * bf1[29])>>(8)) + ((209 * bf1[30])>>(8)) + ((80 * bf1[31])>>(8)) - ((80 * bf1[32])>>(8)) - ((209 * bf1[33])>>(8)) - ((256 * bf1[34])>>(8)) - ((202 * bf1[35])>>(8)) - ((68 * bf1[36])>>(8)) + ((92 * bf1[37])>>(8)) + ((216 * bf1[38])>>(8)) + ((255 * bf1[39])>>(8)) + ((194 * bf1[40])>>(8)) + ((56 * bf1[41])>>(8)) - ((104 * bf1[42])>>(8)) - ((223 * bf1[43])>>(8)) - ((254 * bf1[44])>>(8)) - ((185 * bf1[45])>>(8)) - ((44 * bf1[46])>>(8)) + ((115 * bf1[47])>>(8)) + ((229 * bf1[48])>>(8)) + ((252 * bf1[49])>>(8)) + ((177 * bf1[50])>>(8)) + ((31 * bf1[51])>>(8)) - ((126 * bf1[52])>>(8)) - ((234 * bf1[53])>>(8)) - ((250 * bf1[54])>>(8)) - ((167 * bf1[55])>>(8)) - ((19 * bf1[56])>>(8)) + ((137 * bf1[57])>>(8)) + ((239 * bf1[58])>>(8)) + ((247 * bf1[59])>>(8)) + ((157 * bf1[60])>>(8)) + ((6 * bf1[61])>>(8)) - ((147 * bf1[62])>>(8)) - ((243 * bf1[63])>>(8));
    bf0[14] = ((241 * bf1[0])>>(8)) + ((132 * bf1[1])>>(8)) - ((38 * bf1[2])>>(8)) - ((190 * bf1[3])>>(8)) - ((256 * bf1[4])>>(8)) - ((206 * bf1[5])>>(8)) - ((62 * bf1[6])>>(8)) + ((109 * bf1[7])>>(8)) + ((231 * bf1[8])>>(8)) + ((248 * bf1[9])>>(8)) + ((152 * bf1[10])>>(8)) - ((13 * bf1[11])>>(8)) - ((172 * bf1[12])>>(8)) - ((253 * bf1[13])>>(8)) - ((220 * bf1[14])>>(8)) - ((86 * bf1[15])>>(8)) + ((86 * bf1[16])>>(8)) + ((220 * bf1[17])>>(8)) + ((253 * bf1[18])>>(8)) + ((172 * bf1[19])>>(8)) + ((13 * bf1[20])>>(8)) - ((152 * bf1[21])>>(8)) - ((248 * bf1[22])>>(8)) - ((231 * bf1[23])>>(8)) - ((109 * bf1[24])>>(8)) + ((62 * bf1[25])>>(8)) + ((206 * bf1[26])>>(8)) + ((256 * bf1[27])>>(8)) + ((190 * bf1[28])>>(8)) + ((38 * bf1[29])>>(8)) - ((132 * bf1[30])>>(8)) - ((241 * bf1[31])>>(8)) - ((241 * bf1[32])>>(8)) - ((132 * bf1[33])>>(8)) + ((38 * bf1[34])>>(8)) + ((190 * bf1[35])>>(8)) + ((256 * bf1[36])>>(8)) + ((206 * bf1[37])>>(8)) + ((62 * bf1[38])>>(8)) - ((109 * bf1[39])>>(8)) - ((231 * bf1[40])>>(8)) - ((248 * bf1[41])>>(8)) - ((152 * bf1[42])>>(8)) + ((13 * bf1[43])>>(8)) + ((172 * bf1[44])>>(8)) + ((253 * bf1[45])>>(8)) + ((220 * bf1[46])>>(8)) + ((86 * bf1[47])>>(8)) - ((86 * bf1[48])>>(8)) - ((220 * bf1[49])>>(8)) - ((253 * bf1[50])>>(8)) - ((172 * bf1[51])>>(8)) - ((13 * bf1[52])>>(8)) + ((152 * bf1[53])>>(8)) + ((248 * bf1[54])>>(8)) + ((231 * bf1[55])>>(8)) + ((109 * bf1[56])>>(8)) - ((62 * bf1[57])>>(8)) - ((206 * bf1[58])>>(8)) - ((256 * bf1[59])>>(8)) - ((190 * bf1[60])>>(8)) - ((38 * bf1[61])>>(8)) + ((132 * bf1[62])>>(8)) + ((241 * bf1[63])>>(8));
    bf0[15] = ((239 * bf1[0])>>(8)) + ((115 * bf1[1])>>(8)) - ((68 * bf1[2])>>(8)) - ((216 * bf1[3])>>(8)) - ((252 * bf1[4])>>(8)) - ((157 * bf1[5])>>(8)) + ((19 * bf1[6])>>(8)) + ((185 * bf1[7])>>(8)) + ((256 * bf1[8])>>(8)) + ((194 * bf1[9])>>(8)) + ((31 * bf1[10])>>(8)) - ((147 * bf1[11])>>(8)) - ((250 * bf1[12])>>(8)) - ((223 * bf1[13])>>(8)) - ((80 * bf1[14])>>(8)) + ((104 * bf1[15])>>(8)) + ((234 * bf1[16])>>(8)) + ((243 * bf1[17])>>(8)) + ((126 * bf1[18])>>(8)) - ((56 * bf1[19])>>(8)) - ((209 * bf1[20])>>(8)) - ((254 * bf1[21])>>(8)) - ((167 * bf1[22])>>(8)) + ((6 * bf1[23])>>(8)) + ((177 * bf1[24])>>(8)) + ((255 * bf1[25])>>(8)) + ((202 * bf1[26])>>(8)) + ((44 * bf1[27])>>(8)) - ((137 * bf1[28])>>(8)) - ((247 * bf1[29])>>(8)) - ((229 * bf1[30])>>(8)) - ((92 * bf1[31])>>(8)) + ((92 * bf1[32])>>(8)) + ((229 * bf1[33])>>(8)) + ((247 * bf1[34])>>(8)) + ((137 * bf1[35])>>(8)) - ((44 * bf1[36])>>(8)) - ((202 * bf1[37])>>(8)) - ((255 * bf1[38])>>(8)) - ((177 * bf1[39])>>(8)) - ((6 * bf1[40])>>(8)) + ((167 * bf1[41])>>(8)) + ((254 * bf1[42])>>(8)) + ((209 * bf1[43])>>(8)) + ((56 * bf1[44])>>(8)) - ((126 * bf1[45])>>(8)) - ((243 * bf1[46])>>(8)) - ((234 * bf1[47])>>(8)) - ((104 * bf1[48])>>(8)) + ((80 * bf1[49])>>(8)) + ((223 * bf1[50])>>(8)) + ((250 * bf1[51])>>(8)) + ((147 * bf1[52])>>(8)) - ((31 * bf1[53])>>(8)) - ((194 * bf1[54])>>(8)) - ((256 * bf1[55])>>(8)) - ((185 * bf1[56])>>(8)) - ((19 * bf1[57])>>(8)) + ((157 * bf1[58])>>(8)) + ((252 * bf1[59])>>(8)) + ((216 * bf1[60])>>(8)) + ((68 * bf1[61])>>(8)) - ((115 * bf1[62])>>(8)) - ((239 * bf1[63])>>(8));
    bf0[16] = ((237 * bf1[0])>>(8)) + ((98 * bf1[1])>>(8)) - ((98 * bf1[2])>>(8)) - ((237 * bf1[3])>>(8)) - ((237 * bf1[4])>>(8)) - ((98 * bf1[5])>>(8)) + ((98 * bf1[6])>>(8)) + ((237 * bf1[7])>>(8)) + ((237 * bf1[8])>>(8)) + ((98 * bf1[9])>>(8)) - ((98 * bf1[10])>>(8)) - ((237 * bf1[11])>>(8)) - ((237 * bf1[12])>>(8)) - ((98 * bf1[13])>>(8)) + ((98 * bf1[14])>>(8)) + ((237 * bf1[15])>>(8)) + ((237 * bf1[16])>>(8)) + ((98 * bf1[17])>>(8)) - ((98 * bf1[18])>>(8)) - ((237 * bf1[19])>>(8)) - ((237 * bf1[20])>>(8)) - ((98 * bf1[21])>>(8)) + ((98 * bf1[22])>>(8)) + ((237 * bf1[23])>>(8)) + ((237 * bf1[24])>>(8)) + ((98 * bf1[25])>>(8)) - ((98 * bf1[26])>>(8)) - ((237 * bf1[27])>>(8)) - ((237 * bf1[28])>>(8)) - ((98 * bf1[29])>>(8)) + ((98 * bf1[30])>>(8)) + ((237 * bf1[31])>>(8)) + ((237 * bf1[32])>>(8)) + ((98 * bf1[33])>>(8)) - ((98 * bf1[34])>>(8)) - ((237 * bf1[35])>>(8)) - ((237 * bf1[36])>>(8)) - ((98 * bf1[37])>>(8)) + ((98 * bf1[38])>>(8)) + ((237 * bf1[39])>>(8)) + ((237 * bf1[40])>>(8)) + ((98 * bf1[41])>>(8)) - ((98 * bf1[42])>>(8)) - ((237 * bf1[43])>>(8)) - ((237 * bf1[44])>>(8)) - ((98 * bf1[45])>>(8)) + ((98 * bf1[46])>>(8)) + ((237 * bf1[47])>>(8)) + ((237 * bf1[48])>>(8)) + ((98 * bf1[49])>>(8)) - ((98 * bf1[50])>>(8)) - ((237 * bf1[51])>>(8)) - ((237 * bf1[52])>>(8)) - ((98 * bf1[53])>>(8)) + ((98 * bf1[54])>>(8)) + ((237 * bf1[55])>>(8)) + ((237 * bf1[56])>>(8)) + ((98 * bf1[57])>>(8)) - ((98 * bf1[58])>>(8)) - ((237 * bf1[59])>>(8)) - ((237 * bf1[60])>>(8)) - ((98 * bf1[61])>>(8)) + ((98 * bf1[62])>>(8)) + ((237 * bf1[63])>>(8));
    bf0[17] = ((234 * bf1[0])>>(8)) + ((80 * bf1[1])>>(8)) - ((126 * bf1[2])>>(8)) - ((250 * bf1[3])>>(8)) - ((209 * bf1[4])>>(8)) - ((31 * bf1[5])>>(8)) + ((167 * bf1[6])>>(8)) + ((256 * bf1[7])>>(8)) + ((177 * bf1[8])>>(8)) - ((19 * bf1[9])>>(8)) - ((202 * bf1[10])>>(8)) - ((252 * bf1[11])>>(8)) - ((137 * bf1[12])>>(8)) + ((68 * bf1[13])>>(8)) + ((229 * bf1[14])>>(8)) + ((239 * bf1[15])>>(8)) + ((92 * bf1[16])>>(8)) - ((115 * bf1[17])>>(8)) - ((247 * bf1[18])>>(8)) - ((216 * bf1[19])>>(8)) - ((44 * bf1[20])>>(8)) + ((157 * bf1[21])>>(8)) + ((255 * bf1[22])>>(8)) + ((185 * bf1[23])>>(8)) - ((6 * bf1[24])>>(8)) - ((194 * bf1[25])>>(8)) - ((254 * bf1[26])>>(8)) - ((147 * bf1[27])>>(8)) + ((56 * bf1[28])>>(8)) + ((223 * bf1[29])>>(8)) + ((243 * bf1[30])>>(8)) + ((104 * bf1[31])>>(8)) - ((104 * bf1[32])>>(8)) - ((243 * bf1[33])>>(8)) - ((223 * bf1[34])>>(8)) - ((56 * bf1[35])>>(8)) + ((147 * bf1[36])>>(8)) + ((254 * bf1[37])>>(8)) + ((194 * bf1[38])>>(8)) + ((6 * bf1[39])>>(8)) - ((185 * bf1[40])>>(8)) - ((255 * bf1[41])>>(8)) - ((157 * bf1[42])>>(8)) + ((44 * bf1[43])>>(8)) + ((216 * bf1[44])>>(8)) + ((247 * bf1[45])>>(8)) + ((115 * bf1[46])>>(8)) - ((92 * bf1[47])>>(8)) - ((239 * bf1[48])>>(8)) - ((229 * bf1[49])>>(8)) - ((68 * bf1[50])>>(8)) + ((137 * bf1[51])>>(8)) + ((252 * bf1[52])>>(8)) + ((202 * bf1[53])>>(8)) + ((19 * bf1[54])>>(8)) - ((177 * bf1[55])>>(8)) - ((256 * bf1[56])>>(8)) - ((167 * bf1[57])>>(8)) + ((31 * bf1[58])>>(8)) + ((209 * bf1[59])>>(8)) + ((250 * bf1[60])>>(8)) + ((126 * bf1[61])>>(8)) - ((80 * bf1[62])>>(8)) - ((234 * bf1[63])>>(8));
    bf0[18] = ((231 * bf1[0])>>(8)) + ((62 * bf1[1])>>(8)) - ((152 * bf1[2])>>(8)) - ((256 * bf1[3])>>(8)) - ((172 * bf1[4])>>(8)) + ((38 * bf1[5])>>(8)) + ((220 * bf1[6])>>(8)) + ((241 * bf1[7])>>(8)) + ((86 * bf1[8])>>(8)) - ((132 * bf1[9])>>(8)) - ((253 * bf1[10])>>(8)) - ((190 * bf1[11])>>(8)) + ((13 * bf1[12])>>(8)) + ((206 * bf1[13])>>(8)) + ((248 * bf1[14])>>(8)) + ((109 * bf1[15])>>(8)) - ((109 * bf1[16])>>(8)) - ((248 * bf1[17])>>(8)) - ((206 * bf1[18])>>(8)) - ((13 * bf1[19])>>(8)) + ((190 * bf1[20])>>(8)) + ((253 * bf1[21])>>(8)) + ((132 * bf1[22])>>(8)) - ((86 * bf1[23])>>(8)) - ((241 * bf1[24])>>(8)) - ((220 * bf1[25])>>(8)) - ((38 * bf1[26])>>(8)) + ((172 * bf1[27])>>(8)) + ((256 * bf1[28])>>(8)) + ((152 * bf1[29])>>(8)) - ((62 * bf1[30])>>(8)) - ((231 * bf1[31])>>(8)) - ((231 * bf1[32])>>(8)) - ((62 * bf1[33])>>(8)) + ((152 * bf1[34])>>(8)) + ((256 * bf1[35])>>(8)) + ((172 * bf1[36])>>(8)) - ((38 * bf1[37])>>(8)) - ((220 * bf1[38])>>(8)) - ((241 * bf1[39])>>(8)) - ((86 * bf1[40])>>(8)) + ((132 * bf1[41])>>(8)) + ((253 * bf1[42])>>(8)) + ((190 * bf1[43])>>(8)) - ((13 * bf1[44])>>(8)) - ((206 * bf1[45])>>(8)) - ((248 * bf1[46])>>(8)) - ((109 * bf1[47])>>(8)) + ((109 * bf1[48])>>(8)) + ((248 * bf1[49])>>(8)) + ((206 * bf1[50])>>(8)) + ((13 * bf1[51])>>(8)) - ((190 * bf1[52])>>(8)) - ((253 * bf1[53])>>(8)) - ((132 * bf1[54])>>(8)) + ((86 * bf1[55])>>(8)) + ((241 * bf1[56])>>(8)) + ((220 * bf1[57])>>(8)) + ((38 * bf1[58])>>(8)) - ((172 * bf1[59])>>(8)) - ((256 * bf1[60])>>(8)) - ((152 * bf1[61])>>(8)) + ((62 * bf1[62])>>(8)) + ((231 * bf1[63])>>(8));
    bf0[19] = ((229 * bf1[0])>>(8)) + ((44 * bf1[1])>>(8)) - ((177 * bf1[2])>>(8)) - ((254 * bf1[3])>>(8)) - ((126 * bf1[4])>>(8)) + ((104 * bf1[5])>>(8)) + ((250 * bf1[6])>>(8)) + ((194 * bf1[7])>>(8)) - ((19 * bf1[8])>>(8)) - ((216 * bf1[9])>>(8)) - ((239 * bf1[10])>>(8)) - ((68 * bf1[11])>>(8)) + ((157 * bf1[12])>>(8)) + ((256 * bf1[13])>>(8)) + ((147 * bf1[14])>>(8)) - ((80 * bf1[15])>>(8)) - ((243 * bf1[16])>>(8)) - ((209 * bf1[17])>>(8)) - ((6 * bf1[18])>>(8)) + ((202 * bf1[19])>>(8)) + ((247 * bf1[20])>>(8)) + ((92 * bf1[21])>>(8)) - ((137 * bf1[22])>>(8)) - ((255 * bf1[23])>>(8)) - ((167 * bf1[24])>>(8)) + ((56 * bf1[25])>>(8)) + ((234 * bf1[26])>>(8)) + ((223 * bf1[27])>>(8)) + ((31 * bf1[28])>>(8)) - ((185 * bf1[29])>>(8)) - ((252 * bf1[30])>>(8)) - ((115 * bf1[31])>>(8)) + ((115 * bf1[32])>>(8)) + ((252 * bf1[33])>>(8)) + ((185 * bf1[34])>>(8)) - ((31 * bf1[35])>>(8)) - ((223 * bf1[36])>>(8)) - ((234 * bf1[37])>>(8)) - ((56 * bf1[38])>>(8)) + ((167 * bf1[39])>>(8)) + ((255 * bf1[40])>>(8)) + ((137 * bf1[41])>>(8)) - ((92 * bf1[42])>>(8)) - ((247 * bf1[43])>>(8)) - ((202 * bf1[44])>>(8)) + ((6 * bf1[45])>>(8)) + ((209 * bf1[46])>>(8)) + ((243 * bf1[47])>>(8)) + ((80 * bf1[48])>>(8)) - ((147 * bf1[49])>>(8)) - ((256 * bf1[50])>>(8)) - ((157 * bf1[51])>>(8)) + ((68 * bf1[52])>>(8)) + ((239 * bf1[53])>>(8)) + ((216 * bf1[54])>>(8)) + ((19 * bf1[55])>>(8)) - ((194 * bf1[56])>>(8)) - ((250 * bf1[57])>>(8)) - ((104 * bf1[58])>>(8)) + ((126 * bf1[59])>>(8)) + ((254 * bf1[60])>>(8)) + ((177 * bf1[61])>>(8)) - ((44 * bf1[62])>>(8)) - ((229 * bf1[63])>>(8));
    bf0[20] = ((226 * bf1[0])>>(8)) + ((25 * bf1[1])>>(8)) - ((198 * bf1[2])>>(8)) - ((245 * bf1[3])>>(8)) - ((74 * bf1[4])>>(8)) + ((162 * bf1[5])>>(8)) + ((255 * bf1[6])>>(8)) + ((121 * bf1[7])>>(8)) - ((121 * bf1[8])>>(8)) - ((255 * bf1[9])>>(8)) - ((162 * bf1[10])>>(8)) + ((74 * bf1[11])>>(8)) + ((245 * bf1[12])>>(8)) + ((198 * bf1[13])>>(8)) - ((25 * bf1[14])>>(8)) - ((226 * bf1[15])>>(8)) - ((226 * bf1[16])>>(8)) - ((25 * bf1[17])>>(8)) + ((198 * bf1[18])>>(8)) + ((245 * bf1[19])>>(8)) + ((74 * bf1[20])>>(8)) - ((162 * bf1[21])>>(8)) - ((255 * bf1[22])>>(8)) - ((121 * bf1[23])>>(8)) + ((121 * bf1[24])>>(8)) + ((255 * bf1[25])>>(8)) + ((162 * bf1[26])>>(8)) - ((74 * bf1[27])>>(8)) - ((245 * bf1[28])>>(8)) - ((198 * bf1[29])>>(8)) + ((25 * bf1[30])>>(8)) + ((226 * bf1[31])>>(8)) + ((226 * bf1[32])>>(8)) + ((25 * bf1[33])>>(8)) - ((198 * bf1[34])>>(8)) - ((245 * bf1[35])>>(8)) - ((74 * bf1[36])>>(8)) + ((162 * bf1[37])>>(8)) + ((255 * bf1[38])>>(8)) + ((121 * bf1[39])>>(8)) - ((121 * bf1[40])>>(8)) - ((255 * bf1[41])>>(8)) - ((162 * bf1[42])>>(8)) + ((74 * bf1[43])>>(8)) + ((245 * bf1[44])>>(8)) + ((198 * bf1[45])>>(8)) - ((25 * bf1[46])>>(8)) - ((226 * bf1[47])>>(8)) - ((226 * bf1[48])>>(8)) - ((25 * bf1[49])>>(8)) + ((198 * bf1[50])>>(8)) + ((245 * bf1[51])>>(8)) + ((74 * bf1[52])>>(8)) - ((162 * bf1[53])>>(8)) - ((255 * bf1[54])>>(8)) - ((121 * bf1[55])>>(8)) + ((121 * bf1[56])>>(8)) + ((255 * bf1[57])>>(8)) + ((162 * bf1[58])>>(8)) - ((74 * bf1[59])>>(8)) - ((245 * bf1[60])>>(8)) - ((198 * bf1[61])>>(8)) + ((25 * bf1[62])>>(8)) + ((226 * bf1[63])>>(8));
    bf0[21] = ((223 * bf1[0])>>(8)) + ((6 * bf1[1])>>(8)) - ((216 * bf1[2])>>(8)) - ((229 * bf1[3])>>(8)) - ((19 * bf1[4])>>(8)) + ((209 * bf1[5])>>(8)) + ((234 * bf1[6])>>(8)) + ((31 * bf1[7])>>(8)) - ((202 * bf1[8])>>(8)) - ((239 * bf1[9])>>(8)) - ((44 * bf1[10])>>(8)) + ((194 * bf1[11])>>(8)) + ((243 * bf1[12])>>(8)) + ((56 * bf1[13])>>(8)) - ((185 * bf1[14])>>(8)) - ((247 * bf1[15])>>(8)) - ((68 * bf1[16])>>(8)) + ((177 * bf1[17])>>(8)) + ((250 * bf1[18])>>(8)) + ((80 * bf1[19])>>(8)) - ((167 * bf1[20])>>(8)) - ((252 * bf1[21])>>(8)) - ((92 * bf1[22])>>(8)) + ((157 * bf1[23])>>(8)) + ((254 * bf1[24])>>(8)) + ((104 * bf1[25])>>(8)) - ((147 * bf1[26])>>(8)) - ((255 * bf1[27])>>(8)) - ((115 * bf1[28])>>(8)) + ((137 * bf1[29])>>(8)) + ((256 * bf1[30])>>(8)) + ((126 * bf1[31])>>(8)) - ((126 * bf1[32])>>(8)) - ((256 * bf1[33])>>(8)) - ((137 * bf1[34])>>(8)) + ((115 * bf1[35])>>(8)) + ((255 * bf1[36])>>(8)) + ((147 * bf1[37])>>(8)) - ((104 * bf1[38])>>(8)) - ((254 * bf1[39])>>(8)) - ((157 * bf1[40])>>(8)) + ((92 * bf1[41])>>(8)) + ((252 * bf1[42])>>(8)) + ((167 * bf1[43])>>(8)) - ((80 * bf1[44])>>(8)) - ((250 * bf1[45])>>(8)) - ((177 * bf1[46])>>(8)) + ((68 * bf1[47])>>(8)) + ((247 * bf1[48])>>(8)) + ((185 * bf1[49])>>(8)) - ((56 * bf1[50])>>(8)) - ((243 * bf1[51])>>(8)) - ((194 * bf1[52])>>(8)) + ((44 * bf1[53])>>(8)) + ((239 * bf1[54])>>(8)) + ((202 * bf1[55])>>(8)) - ((31 * bf1[56])>>(8)) - ((234 * bf1[57])>>(8)) - ((209 * bf1[58])>>(8)) + ((19 * bf1[59])>>(8)) + ((229 * bf1[60])>>(8)) + ((216 * bf1[61])>>(8)) - ((6 * bf1[62])>>(8)) - ((223 * bf1[63])>>(8));
    bf0[22] = ((220 * bf1[0])>>(8)) - ((13 * bf1[1])>>(8)) - ((231 * bf1[2])>>(8)) - ((206 * bf1[3])>>(8)) + ((38 * bf1[4])>>(8)) + ((241 * bf1[5])>>(8)) + ((190 * bf1[6])>>(8)) - ((62 * bf1[7])>>(8)) - ((248 * bf1[8])>>(8)) - ((172 * bf1[9])>>(8)) + ((86 * bf1[10])>>(8)) + ((253 * bf1[11])>>(8)) + ((152 * bf1[12])>>(8)) - ((109 * bf1[13])>>(8)) - ((256 * bf1[14])>>(8)) - ((132 * bf1[15])>>(8)) + ((132 * bf1[16])>>(8)) + ((256 * bf1[17])>>(8)) + ((109 * bf1[18])>>(8)) - ((152 * bf1[19])>>(8)) - ((253 * bf1[20])>>(8)) - ((86 * bf1[21])>>(8)) + ((172 * bf1[22])>>(8)) + ((248 * bf1[23])>>(8)) + ((62 * bf1[24])>>(8)) - ((190 * bf1[25])>>(8)) - ((241 * bf1[26])>>(8)) - ((38 * bf1[27])>>(8)) + ((206 * bf1[28])>>(8)) + ((231 * bf1[29])>>(8)) + ((13 * bf1[30])>>(8)) - ((220 * bf1[31])>>(8)) - ((220 * bf1[32])>>(8)) + ((13 * bf1[33])>>(8)) + ((231 * bf1[34])>>(8)) + ((206 * bf1[35])>>(8)) - ((38 * bf1[36])>>(8)) - ((241 * bf1[37])>>(8)) - ((190 * bf1[38])>>(8)) + ((62 * bf1[39])>>(8)) + ((248 * bf1[40])>>(8)) + ((172 * bf1[41])>>(8)) - ((86 * bf1[42])>>(8)) - ((253 * bf1[43])>>(8)) - ((152 * bf1[44])>>(8)) + ((109 * bf1[45])>>(8)) + ((256 * bf1[46])>>(8)) + ((132 * bf1[47])>>(8)) - ((132 * bf1[48])>>(8)) - ((256 * bf1[49])>>(8)) - ((109 * bf1[50])>>(8)) + ((152 * bf1[51])>>(8)) + ((253 * bf1[52])>>(8)) + ((86 * bf1[53])>>(8)) - ((172 * bf1[54])>>(8)) - ((248 * bf1[55])>>(8)) - ((62 * bf1[56])>>(8)) + ((190 * bf1[57])>>(8)) + ((241 * bf1[58])>>(8)) + ((38 * bf1[59])>>(8)) - ((206 * bf1[60])>>(8)) - ((231 * bf1[61])>>(8)) - ((13 * bf1[62])>>(8)) + ((220 * bf1[63])>>(8));
    bf0[23] = ((216 * bf1[0])>>(8)) - ((31 * bf1[1])>>(8)) - ((243 * bf1[2])>>(8)) - ((177 * bf1[3])>>(8)) + ((92 * bf1[4])>>(8)) + ((255 * bf1[5])>>(8)) + ((126 * bf1[6])>>(8)) - ((147 * bf1[7])>>(8)) - ((252 * bf1[8])>>(8)) - ((68 * bf1[9])>>(8)) + ((194 * bf1[10])>>(8)) + ((234 * bf1[11])>>(8)) + ((6 * bf1[12])>>(8)) - ((229 * bf1[13])>>(8)) - ((202 * bf1[14])>>(8)) + ((56 * bf1[15])>>(8)) + ((250 * bf1[16])>>(8)) + ((157 * bf1[17])>>(8)) - ((115 * bf1[18])>>(8)) - ((256 * bf1[19])>>(8)) - ((104 * bf1[20])>>(8)) + ((167 * bf1[21])>>(8)) + ((247 * bf1[22])>>(8)) + ((44 * bf1[23])>>(8)) - ((209 * bf1[24])>>(8)) - ((223 * bf1[25])>>(8)) + ((19 * bf1[26])>>(8)) + ((239 * bf1[27])>>(8)) + ((185 * bf1[28])>>(8)) - ((80 * bf1[29])>>(8)) - ((254 * bf1[30])>>(8)) - ((137 * bf1[31])>>(8)) + ((137 * bf1[32])>>(8)) + ((254 * bf1[33])>>(8)) + ((80 * bf1[34])>>(8)) - ((185 * bf1[35])>>(8)) - ((239 * bf1[36])>>(8)) - ((19 * bf1[37])>>(8)) + ((223 * bf1[38])>>(8)) + ((209 * bf1[39])>>(8)) - ((44 * bf1[40])>>(8)) - ((247 * bf1[41])>>(8)) - ((167 * bf1[42])>>(8)) + ((104 * bf1[43])>>(8)) + ((256 * bf1[44])>>(8)) + ((115 * bf1[45])>>(8)) - ((157 * bf1[46])>>(8)) - ((250 * bf1[47])>>(8)) - ((56 * bf1[48])>>(8)) + ((202 * bf1[49])>>(8)) + ((229 * bf1[50])>>(8)) - ((6 * bf1[51])>>(8)) - ((234 * bf1[52])>>(8)) - ((194 * bf1[53])>>(8)) + ((68 * bf1[54])>>(8)) + ((252 * bf1[55])>>(8)) + ((147 * bf1[56])>>(8)) - ((126 * bf1[57])>>(8)) - ((255 * bf1[58])>>(8)) - ((92 * bf1[59])>>(8)) + ((177 * bf1[60])>>(8)) + ((243 * bf1[61])>>(8)) + ((31 * bf1[62])>>(8)) - ((216 * bf1[63])>>(8));
    bf0[24] = ((213 * bf1[0])>>(8)) - ((50 * bf1[1])>>(8)) - ((251 * bf1[2])>>(8)) - ((142 * bf1[3])>>(8)) + ((142 * bf1[4])>>(8)) + ((251 * bf1[5])>>(8)) + ((50 * bf1[6])>>(8)) - ((213 * bf1[7])>>(8)) - ((213 * bf1[8])>>(8)) + ((50 * bf1[9])>>(8)) + ((251 * bf1[10])>>(8)) + ((142 * bf1[11])>>(8)) - ((142 * bf1[12])>>(8)) - ((251 * bf1[13])>>(8)) - ((50 * bf1[14])>>(8)) + ((213 * bf1[15])>>(8)) + ((213 * bf1[16])>>(8)) - ((50 * bf1[17])>>(8)) - ((251 * bf1[18])>>(8)) - ((142 * bf1[19])>>(8)) + ((142 * bf1[20])>>(8)) + ((251 * bf1[21])>>(8)) + ((50 * bf1[22])>>(8)) - ((213 * bf1[23])>>(8)) - ((213 * bf1[24])>>(8)) + ((50 * bf1[25])>>(8)) + ((251 * bf1[26])>>(8)) + ((142 * bf1[27])>>(8)) - ((142 * bf1[28])>>(8)) - ((251 * bf1[29])>>(8)) - ((50 * bf1[30])>>(8)) + ((213 * bf1[31])>>(8)) + ((213 * bf1[32])>>(8)) - ((50 * bf1[33])>>(8)) - ((251 * bf1[34])>>(8)) - ((142 * bf1[35])>>(8)) + ((142 * bf1[36])>>(8)) + ((251 * bf1[37])>>(8)) + ((50 * bf1[38])>>(8)) - ((213 * bf1[39])>>(8)) - ((213 * bf1[40])>>(8)) + ((50 * bf1[41])>>(8)) + ((251 * bf1[42])>>(8)) + ((142 * bf1[43])>>(8)) - ((142 * bf1[44])>>(8)) - ((251 * bf1[45])>>(8)) - ((50 * bf1[46])>>(8)) + ((213 * bf1[47])>>(8)) + ((213 * bf1[48])>>(8)) - ((50 * bf1[49])>>(8)) - ((251 * bf1[50])>>(8)) - ((142 * bf1[51])>>(8)) + ((142 * bf1[52])>>(8)) + ((251 * bf1[53])>>(8)) + ((50 * bf1[54])>>(8)) - ((213 * bf1[55])>>(8)) - ((213 * bf1[56])>>(8)) + ((50 * bf1[57])>>(8)) + ((251 * bf1[58])>>(8)) + ((142 * bf1[59])>>(8)) - ((142 * bf1[60])>>(8)) - ((251 * bf1[61])>>(8)) - ((50 * bf1[62])>>(8)) + ((213 * bf1[63])>>(8));
    bf0[25] = ((209 * bf1[0])>>(8)) - ((68 * bf1[1])>>(8)) - ((255 * bf1[2])>>(8)) - ((104 * bf1[3])>>(8)) + ((185 * bf1[4])>>(8)) + ((229 * bf1[5])>>(8)) - ((31 * bf1[6])>>(8)) - ((250 * bf1[7])>>(8)) - ((137 * bf1[8])>>(8)) + ((157 * bf1[9])>>(8)) + ((243 * bf1[10])>>(8)) + ((6 * bf1[11])>>(8)) - ((239 * bf1[12])>>(8)) - ((167 * bf1[13])>>(8)) + ((126 * bf1[14])>>(8)) + ((252 * bf1[15])>>(8)) + ((44 * bf1[16])>>(8)) - ((223 * bf1[17])>>(8)) - ((194 * bf1[18])>>(8)) + ((92 * bf1[19])>>(8)) + ((256 * bf1[20])>>(8)) + ((80 * bf1[21])>>(8)) - ((202 * bf1[22])>>(8)) - ((216 * bf1[23])>>(8)) + ((56 * bf1[24])>>(8)) + ((254 * bf1[25])>>(8)) + ((115 * bf1[26])>>(8)) - ((177 * bf1[27])>>(8)) - ((234 * bf1[28])>>(8)) + ((19 * bf1[29])>>(8)) + ((247 * bf1[30])>>(8)) + ((147 * bf1[31])>>(8)) - ((147 * bf1[32])>>(8)) - ((247 * bf1[33])>>(8)) - ((19 * bf1[34])>>(8)) + ((234 * bf1[35])>>(8)) + ((177 * bf1[36])>>(8)) - ((115 * bf1[37])>>(8)) - ((254 * bf1[38])>>(8)) - ((56 * bf1[39])>>(8)) + ((216 * bf1[40])>>(8)) + ((202 * bf1[41])>>(8)) - ((80 * bf1[42])>>(8)) - ((256 * bf1[43])>>(8)) - ((92 * bf1[44])>>(8)) + ((194 * bf1[45])>>(8)) + ((223 * bf1[46])>>(8)) - ((44 * bf1[47])>>(8)) - ((252 * bf1[48])>>(8)) - ((126 * bf1[49])>>(8)) + ((167 * bf1[50])>>(8)) + ((239 * bf1[51])>>(8)) - ((6 * bf1[52])>>(8)) - ((243 * bf1[53])>>(8)) - ((157 * bf1[54])>>(8)) + ((137 * bf1[55])>>(8)) + ((250 * bf1[56])>>(8)) + ((31 * bf1[57])>>(8)) - ((229 * bf1[58])>>(8)) - ((185 * bf1[59])>>(8)) + ((104 * bf1[60])>>(8)) + ((255 * bf1[61])>>(8)) + ((68 * bf1[62])>>(8)) - ((209 * bf1[63])>>(8));
    bf0[26] = ((206 * bf1[0])>>(8)) - ((86 * bf1[1])>>(8)) - ((256 * bf1[2])>>(8)) - ((62 * bf1[3])>>(8)) + ((220 * bf1[4])>>(8)) + ((190 * bf1[5])>>(8)) - ((109 * bf1[6])>>(8)) - ((253 * bf1[7])>>(8)) - ((38 * bf1[8])>>(8)) + ((231 * bf1[9])>>(8)) + ((172 * bf1[10])>>(8)) - ((132 * bf1[11])>>(8)) - ((248 * bf1[12])>>(8)) - ((13 * bf1[13])>>(8)) + ((241 * bf1[14])>>(8)) + ((152 * bf1[15])>>(8)) - ((152 * bf1[16])>>(8)) - ((241 * bf1[17])>>(8)) + ((13 * bf1[18])>>(8)) + ((248 * bf1[19])>>(8)) + ((132 * bf1[20])>>(8)) - ((172 * bf1[21])>>(8)) - ((231 * bf1[22])>>(8)) + ((38 * bf1[23])>>(8)) + ((253 * bf1[24])>>(8)) + ((109 * bf1[25])>>(8)) - ((190 * bf1[26])>>(8)) - ((220 * bf1[27])>>(8)) + ((62 * bf1[28])>>(8)) + ((256 * bf1[29])>>(8)) + ((86 * bf1[30])>>(8)) - ((206 * bf1[31])>>(8)) - ((206 * bf1[32])>>(8)) + ((86 * bf1[33])>>(8)) + ((256 * bf1[34])>>(8)) + ((62 * bf1[35])>>(8)) - ((220 * bf1[36])>>(8)) - ((190 * bf1[37])>>(8)) + ((109 * bf1[38])>>(8)) + ((253 * bf1[39])>>(8)) + ((38 * bf1[40])>>(8)) - ((231 * bf1[41])>>(8)) - ((172 * bf1[42])>>(8)) + ((132 * bf1[43])>>(8)) + ((248 * bf1[44])>>(8)) + ((13 * bf1[45])>>(8)) - ((241 * bf1[46])>>(8)) - ((152 * bf1[47])>>(8)) + ((152 * bf1[48])>>(8)) + ((241 * bf1[49])>>(8)) - ((13 * bf1[50])>>(8)) - ((248 * bf1[51])>>(8)) - ((132 * bf1[52])>>(8)) + ((172 * bf1[53])>>(8)) + ((231 * bf1[54])>>(8)) - ((38 * bf1[55])>>(8)) - ((253 * bf1[56])>>(8)) - ((109 * bf1[57])>>(8)) + ((190 * bf1[58])>>(8)) + ((220 * bf1[59])>>(8)) - ((62 * bf1[60])>>(8)) - ((256 * bf1[61])>>(8)) - ((86 * bf1[62])>>(8)) + ((206 * bf1[63])>>(8));
    bf0[27] = ((202 * bf1[0])>>(8)) - ((104 * bf1[1])>>(8)) - ((252 * bf1[2])>>(8)) - ((19 * bf1[3])>>(8)) + ((243 * bf1[4])>>(8)) + ((137 * bf1[5])>>(8)) - ((177 * bf1[6])>>(8)) - ((223 * bf1[7])>>(8)) + ((68 * bf1[8])>>(8)) + ((256 * bf1[9])>>(8)) + ((56 * bf1[10])>>(8)) - ((229 * bf1[11])>>(8)) - ((167 * bf1[12])>>(8)) + ((147 * bf1[13])>>(8)) + ((239 * bf1[14])>>(8)) - ((31 * bf1[15])>>(8)) - ((254 * bf1[16])>>(8)) - ((92 * bf1[17])>>(8)) + ((209 * bf1[18])>>(8)) + ((194 * bf1[19])>>(8)) - ((115 * bf1[20])>>(8)) - ((250 * bf1[21])>>(8)) - ((6 * bf1[22])>>(8)) + ((247 * bf1[23])>>(8)) + ((126 * bf1[24])>>(8)) - ((185 * bf1[25])>>(8)) - ((216 * bf1[26])>>(8)) + ((80 * bf1[27])>>(8)) + ((255 * bf1[28])>>(8)) + ((44 * bf1[29])>>(8)) - ((234 * bf1[30])>>(8)) - ((157 * bf1[31])>>(8)) + ((157 * bf1[32])>>(8)) + ((234 * bf1[33])>>(8)) - ((44 * bf1[34])>>(8)) - ((255 * bf1[35])>>(8)) - ((80 * bf1[36])>>(8)) + ((216 * bf1[37])>>(8)) + ((185 * bf1[38])>>(8)) - ((126 * bf1[39])>>(8)) - ((247 * bf1[40])>>(8)) + ((6 * bf1[41])>>(8)) + ((250 * bf1[42])>>(8)) + ((115 * bf1[43])>>(8)) - ((194 * bf1[44])>>(8)) - ((209 * bf1[45])>>(8)) + ((92 * bf1[46])>>(8)) + ((254 * bf1[47])>>(8)) + ((31 * bf1[48])>>(8)) - ((239 * bf1[49])>>(8)) - ((147 * bf1[50])>>(8)) + ((167 * bf1[51])>>(8)) + ((229 * bf1[52])>>(8)) - ((56 * bf1[53])>>(8)) - ((256 * bf1[54])>>(8)) - ((68 * bf1[55])>>(8)) + ((223 * bf1[56])>>(8)) + ((177 * bf1[57])>>(8)) - ((137 * bf1[58])>>(8)) - ((243 * bf1[59])>>(8)) + ((19 * bf1[60])>>(8)) + ((252 * bf1[61])>>(8)) + ((104 * bf1[62])>>(8)) - ((202 * bf1[63])>>(8));
    bf0[28] = ((198 * bf1[0])>>(8)) - ((121 * bf1[1])>>(8)) - ((245 * bf1[2])>>(8)) + ((25 * bf1[3])>>(8)) + ((255 * bf1[4])>>(8)) + ((74 * bf1[5])>>(8)) - ((226 * bf1[6])>>(8)) - ((162 * bf1[7])>>(8)) + ((162 * bf1[8])>>(8)) + ((226 * bf1[9])>>(8)) - ((74 * bf1[10])>>(8)) - ((255 * bf1[11])>>(8)) - ((25 * bf1[12])>>(8)) + ((245 * bf1[13])>>(8)) + ((121 * bf1[14])>>(8)) - ((198 * bf1[15])>>(8)) - ((198 * bf1[16])>>(8)) + ((121 * bf1[17])>>(8)) + ((245 * bf1[18])>>(8)) - ((25 * bf1[19])>>(8)) - ((255 * bf1[20])>>(8)) - ((74 * bf1[21])>>(8)) + ((226 * bf1[22])>>(8)) + ((162 * bf1[23])>>(8)) - ((162 * bf1[24])>>(8)) - ((226 * bf1[25])>>(8)) + ((74 * bf1[26])>>(8)) + ((255 * bf1[27])>>(8)) + ((25 * bf1[28])>>(8)) - ((245 * bf1[29])>>(8)) - ((121 * bf1[30])>>(8)) + ((198 * bf1[31])>>(8)) + ((198 * bf1[32])>>(8)) - ((121 * bf1[33])>>(8)) - ((245 * bf1[34])>>(8)) + ((25 * bf1[35])>>(8)) + ((255 * bf1[36])>>(8)) + ((74 * bf1[37])>>(8)) - ((226 * bf1[38])>>(8)) - ((162 * bf1[39])>>(8)) + ((162 * bf1[40])>>(8)) + ((226 * bf1[41])>>(8)) - ((74 * bf1[42])>>(8)) - ((255 * bf1[43])>>(8)) - ((25 * bf1[44])>>(8)) + ((245 * bf1[45])>>(8)) + ((121 * bf1[46])>>(8)) - ((198 * bf1[47])>>(8)) - ((198 * bf1[48])>>(8)) + ((121 * bf1[49])>>(8)) + ((245 * bf1[50])>>(8)) - ((25 * bf1[51])>>(8)) - ((255 * bf1[52])>>(8)) - ((74 * bf1[53])>>(8)) + ((226 * bf1[54])>>(8)) + ((162 * bf1[55])>>(8)) - ((162 * bf1[56])>>(8)) - ((226 * bf1[57])>>(8)) + ((74 * bf1[58])>>(8)) + ((255 * bf1[59])>>(8)) + ((25 * bf1[60])>>(8)) - ((245 * bf1[61])>>(8)) - ((121 * bf1[62])>>(8)) + ((198 * bf1[63])>>(8));
    bf0[29] = ((194 * bf1[0])>>(8)) - ((137 * bf1[1])>>(8)) - ((234 * bf1[2])>>(8)) + ((68 * bf1[3])>>(8)) + ((254 * bf1[4])>>(8)) + ((6 * bf1[5])>>(8)) - ((252 * bf1[6])>>(8)) - ((80 * bf1[7])>>(8)) + ((229 * bf1[8])>>(8)) + ((147 * bf1[9])>>(8)) - ((185 * bf1[10])>>(8)) - ((202 * bf1[11])>>(8)) + ((126 * bf1[12])>>(8)) + ((239 * bf1[13])>>(8)) - ((56 * bf1[14])>>(8)) - ((255 * bf1[15])>>(8)) - ((19 * bf1[16])>>(8)) + ((250 * bf1[17])>>(8)) + ((92 * bf1[18])>>(8)) - ((223 * bf1[19])>>(8)) - ((157 * bf1[20])>>(8)) + ((177 * bf1[21])>>(8)) + ((209 * bf1[22])>>(8)) - ((115 * bf1[23])>>(8)) - ((243 * bf1[24])>>(8)) + ((44 * bf1[25])>>(8)) + ((256 * bf1[26])>>(8)) + ((31 * bf1[27])>>(8)) - ((247 * bf1[28])>>(8)) - ((104 * bf1[29])>>(8)) + ((216 * bf1[30])>>(8)) + ((167 * bf1[31])>>(8)) - ((167 * bf1[32])>>(8)) - ((216 * bf1[33])>>(8)) + ((104 * bf1[34])>>(8)) + ((247 * bf1[35])>>(8)) - ((31 * bf1[36])>>(8)) - ((256 * bf1[37])>>(8)) - ((44 * bf1[38])>>(8)) + ((243 * bf1[39])>>(8)) + ((115 * bf1[40])>>(8)) - ((209 * bf1[41])>>(8)) - ((177 * bf1[42])>>(8)) + ((157 * bf1[43])>>(8)) + ((223 * bf1[44])>>(8)) - ((92 * bf1[45])>>(8)) - ((250 * bf1[46])>>(8)) + ((19 * bf1[47])>>(8)) + ((255 * bf1[48])>>(8)) + ((56 * bf1[49])>>(8)) - ((239 * bf1[50])>>(8)) - ((126 * bf1[51])>>(8)) + ((202 * bf1[52])>>(8)) + ((185 * bf1[53])>>(8)) - ((147 * bf1[54])>>(8)) - ((229 * bf1[55])>>(8)) + ((80 * bf1[56])>>(8)) + ((252 * bf1[57])>>(8)) - ((6 * bf1[58])>>(8)) - ((254 * bf1[59])>>(8)) - ((68 * bf1[60])>>(8)) + ((234 * bf1[61])>>(8)) + ((137 * bf1[62])>>(8)) - ((194 * bf1[63])>>(8));
    bf0[30] = ((190 * bf1[0])>>(8)) - ((152 * bf1[1])>>(8)) - ((220 * bf1[2])>>(8)) + ((109 * bf1[3])>>(8)) + ((241 * bf1[4])>>(8)) - ((62 * bf1[5])>>(8)) - ((253 * bf1[6])>>(8)) + ((13 * bf1[7])>>(8)) + ((256 * bf1[8])>>(8)) + ((38 * bf1[9])>>(8)) - ((248 * bf1[10])>>(8)) - ((86 * bf1[11])>>(8)) + ((231 * bf1[12])>>(8)) + ((132 * bf1[13])>>(8)) - ((206 * bf1[14])>>(8)) - ((172 * bf1[15])>>(8)) + ((172 * bf1[16])>>(8)) + ((206 * bf1[17])>>(8)) - ((132 * bf1[18])>>(8)) - ((231 * bf1[19])>>(8)) + ((86 * bf1[20])>>(8)) + ((248 * bf1[21])>>(8)) - ((38 * bf1[22])>>(8)) - ((256 * bf1[23])>>(8)) - ((13 * bf1[24])>>(8)) + ((253 * bf1[25])>>(8)) + ((62 * bf1[26])>>(8)) - ((241 * bf1[27])>>(8)) - ((109 * bf1[28])>>(8)) + ((220 * bf1[29])>>(8)) + ((152 * bf1[30])>>(8)) - ((190 * bf1[31])>>(8)) - ((190 * bf1[32])>>(8)) + ((152 * bf1[33])>>(8)) + ((220 * bf1[34])>>(8)) - ((109 * bf1[35])>>(8)) - ((241 * bf1[36])>>(8)) + ((62 * bf1[37])>>(8)) + ((253 * bf1[38])>>(8)) - ((13 * bf1[39])>>(8)) - ((256 * bf1[40])>>(8)) - ((38 * bf1[41])>>(8)) + ((248 * bf1[42])>>(8)) + ((86 * bf1[43])>>(8)) - ((231 * bf1[44])>>(8)) - ((132 * bf1[45])>>(8)) + ((206 * bf1[46])>>(8)) + ((172 * bf1[47])>>(8)) - ((172 * bf1[48])>>(8)) - ((206 * bf1[49])>>(8)) + ((132 * bf1[50])>>(8)) + ((231 * bf1[51])>>(8)) - ((86 * bf1[52])>>(8)) - ((248 * bf1[53])>>(8)) + ((38 * bf1[54])>>(8)) + ((256 * bf1[55])>>(8)) + ((13 * bf1[56])>>(8)) - ((253 * bf1[57])>>(8)) - ((62 * bf1[58])>>(8)) + ((241 * bf1[59])>>(8)) + ((109 * bf1[60])>>(8)) - ((220 * bf1[61])>>(8)) - ((152 * bf1[62])>>(8)) + ((190 * bf1[63])>>(8));
    bf0[31] = ((185 * bf1[0])>>(8)) - ((167 * bf1[1])>>(8)) - ((202 * bf1[2])>>(8)) + ((147 * bf1[3])>>(8)) + ((216 * bf1[4])>>(8)) - ((126 * bf1[5])>>(8)) - ((229 * bf1[6])>>(8)) + ((104 * bf1[7])>>(8)) + ((239 * bf1[8])>>(8)) - ((80 * bf1[9])>>(8)) - ((247 * bf1[10])>>(8)) + ((56 * bf1[11])>>(8)) + ((252 * bf1[12])>>(8)) - ((31 * bf1[13])>>(8)) - ((255 * bf1[14])>>(8)) + ((6 * bf1[15])>>(8)) + ((256 * bf1[16])>>(8)) + ((19 * bf1[17])>>(8)) - ((254 * bf1[18])>>(8)) - ((44 * bf1[19])>>(8)) + ((250 * bf1[20])>>(8)) + ((68 * bf1[21])>>(8)) - ((243 * bf1[22])>>(8)) - ((92 * bf1[23])>>(8)) + ((234 * bf1[24])>>(8)) + ((115 * bf1[25])>>(8)) - ((223 * bf1[26])>>(8)) - ((137 * bf1[27])>>(8)) + ((209 * bf1[28])>>(8)) + ((157 * bf1[29])>>(8)) - ((194 * bf1[30])>>(8)) - ((177 * bf1[31])>>(8)) + ((177 * bf1[32])>>(8)) + ((194 * bf1[33])>>(8)) - ((157 * bf1[34])>>(8)) - ((209 * bf1[35])>>(8)) + ((137 * bf1[36])>>(8)) + ((223 * bf1[37])>>(8)) - ((115 * bf1[38])>>(8)) - ((234 * bf1[39])>>(8)) + ((92 * bf1[40])>>(8)) + ((243 * bf1[41])>>(8)) - ((68 * bf1[42])>>(8)) - ((250 * bf1[43])>>(8)) + ((44 * bf1[44])>>(8)) + ((254 * bf1[45])>>(8)) - ((19 * bf1[46])>>(8)) - ((256 * bf1[47])>>(8)) - ((6 * bf1[48])>>(8)) + ((255 * bf1[49])>>(8)) + ((31 * bf1[50])>>(8)) - ((252 * bf1[51])>>(8)) - ((56 * bf1[52])>>(8)) + ((247 * bf1[53])>>(8)) + ((80 * bf1[54])>>(8)) - ((239 * bf1[55])>>(8)) - ((104 * bf1[56])>>(8)) + ((229 * bf1[57])>>(8)) + ((126 * bf1[58])>>(8)) - ((216 * bf1[59])>>(8)) - ((147 * bf1[60])>>(8)) + ((202 * bf1[61])>>(8)) + ((167 * bf1[62])>>(8)) - ((185 * bf1[63])>>(8));
    bf0[32] = ((181 * bf1[0])>>(8)) - ((181 * bf1[1])>>(8)) - ((181 * bf1[2])>>(8)) + ((181 * bf1[3])>>(8)) + ((181 * bf1[4])>>(8)) - ((181 * bf1[5])>>(8)) - ((181 * bf1[6])>>(8)) + ((181 * bf1[7])>>(8)) + ((181 * bf1[8])>>(8)) - ((181 * bf1[9])>>(8)) - ((181 * bf1[10])>>(8)) + ((181 * bf1[11])>>(8)) + ((181 * bf1[12])>>(8)) - ((181 * bf1[13])>>(8)) - ((181 * bf1[14])>>(8)) + ((181 * bf1[15])>>(8)) + ((181 * bf1[16])>>(8)) - ((181 * bf1[17])>>(8)) - ((181 * bf1[18])>>(8)) + ((181 * bf1[19])>>(8)) + ((181 * bf1[20])>>(8)) - ((181 * bf1[21])>>(8)) - ((181 * bf1[22])>>(8)) + ((181 * bf1[23])>>(8)) + ((181 * bf1[24])>>(8)) - ((181 * bf1[25])>>(8)) - ((181 * bf1[26])>>(8)) + ((181 * bf1[27])>>(8)) + ((181 * bf1[28])>>(8)) - ((181 * bf1[29])>>(8)) - ((181 * bf1[30])>>(8)) + ((181 * bf1[31])>>(8)) + ((181 * bf1[32])>>(8)) - ((181 * bf1[33])>>(8)) - ((181 * bf1[34])>>(8)) + ((181 * bf1[35])>>(8)) + ((181 * bf1[36])>>(8)) - ((181 * bf1[37])>>(8)) - ((181 * bf1[38])>>(8)) + ((181 * bf1[39])>>(8)) + ((181 * bf1[40])>>(8)) - ((181 * bf1[41])>>(8)) - ((181 * bf1[42])>>(8)) + ((181 * bf1[43])>>(8)) + ((181 * bf1[44])>>(8)) - ((181 * bf1[45])>>(8)) - ((181 * bf1[46])>>(8)) + ((181 * bf1[47])>>(8)) + ((181 * bf1[48])>>(8)) - ((181 * bf1[49])>>(8)) - ((181 * bf1[50])>>(8)) + ((181 * bf1[51])>>(8)) + ((181 * bf1[52])>>(8)) - ((181 * bf1[53])>>(8)) - ((181 * bf1[54])>>(8)) + ((181 * bf1[55])>>(8)) + ((181 * bf1[56])>>(8)) - ((181 * bf1[57])>>(8)) - ((181 * bf1[58])>>(8)) + ((181 * bf1[59])>>(8)) + ((181 * bf1[60])>>(8)) - ((181 * bf1[61])>>(8)) - ((181 * bf1[62])>>(8)) + ((181 * bf1[63])>>(8));
    bf0[33] = ((177 * bf1[0])>>(8)) - ((194 * bf1[1])>>(8)) - ((157 * bf1[2])>>(8)) + ((209 * bf1[3])>>(8)) + ((137 * bf1[4])>>(8)) - ((223 * bf1[5])>>(8)) - ((115 * bf1[6])>>(8)) + ((234 * bf1[7])>>(8)) + ((92 * bf1[8])>>(8)) - ((243 * bf1[9])>>(8)) - ((68 * bf1[10])>>(8)) + ((250 * bf1[11])>>(8)) + ((44 * bf1[12])>>(8)) - ((254 * bf1[13])>>(8)) - ((19 * bf1[14])>>(8)) + ((256 * bf1[15])>>(8)) - ((6 * bf1[16])>>(8)) - ((255 * bf1[17])>>(8)) + ((31 * bf1[18])>>(8)) + ((252 * bf1[19])>>(8)) - ((56 * bf1[20])>>(8)) - ((247 * bf1[21])>>(8)) + ((80 * bf1[22])>>(8)) + ((239 * bf1[23])>>(8)) - ((104 * bf1[24])>>(8)) - ((229 * bf1[25])>>(8)) + ((126 * bf1[26])>>(8)) + ((216 * bf1[27])>>(8)) - ((147 * bf1[28])>>(8)) - ((202 * bf1[29])>>(8)) + ((167 * bf1[30])>>(8)) + ((185 * bf1[31])>>(8)) - ((185 * bf1[32])>>(8)) - ((167 * bf1[33])>>(8)) + ((202 * bf1[34])>>(8)) + ((147 * bf1[35])>>(8)) - ((216 * bf1[36])>>(8)) - ((126 * bf1[37])>>(8)) + ((229 * bf1[38])>>(8)) + ((104 * bf1[39])>>(8)) - ((239 * bf1[40])>>(8)) - ((80 * bf1[41])>>(8)) + ((247 * bf1[42])>>(8)) + ((56 * bf1[43])>>(8)) - ((252 * bf1[44])>>(8)) - ((31 * bf1[45])>>(8)) + ((255 * bf1[46])>>(8)) + ((6 * bf1[47])>>(8)) - ((256 * bf1[48])>>(8)) + ((19 * bf1[49])>>(8)) + ((254 * bf1[50])>>(8)) - ((44 * bf1[51])>>(8)) - ((250 * bf1[52])>>(8)) + ((68 * bf1[53])>>(8)) + ((243 * bf1[54])>>(8)) - ((92 * bf1[55])>>(8)) - ((234 * bf1[56])>>(8)) + ((115 * bf1[57])>>(8)) + ((223 * bf1[58])>>(8)) - ((137 * bf1[59])>>(8)) - ((209 * bf1[60])>>(8)) + ((157 * bf1[61])>>(8)) + ((194 * bf1[62])>>(8)) - ((177 * bf1[63])>>(8));
    bf0[34] = ((172 * bf1[0])>>(8)) - ((206 * bf1[1])>>(8)) - ((132 * bf1[2])>>(8)) + ((231 * bf1[3])>>(8)) + ((86 * bf1[4])>>(8)) - ((248 * bf1[5])>>(8)) - ((38 * bf1[6])>>(8)) + ((256 * bf1[7])>>(8)) - ((13 * bf1[8])>>(8)) - ((253 * bf1[9])>>(8)) + ((62 * bf1[10])>>(8)) + ((241 * bf1[11])>>(8)) - ((109 * bf1[12])>>(8)) - ((220 * bf1[13])>>(8)) + ((152 * bf1[14])>>(8)) + ((190 * bf1[15])>>(8)) - ((190 * bf1[16])>>(8)) - ((152 * bf1[17])>>(8)) + ((220 * bf1[18])>>(8)) + ((109 * bf1[19])>>(8)) - ((241 * bf1[20])>>(8)) - ((62 * bf1[21])>>(8)) + ((253 * bf1[22])>>(8)) + ((13 * bf1[23])>>(8)) - ((256 * bf1[24])>>(8)) + ((38 * bf1[25])>>(8)) + ((248 * bf1[26])>>(8)) - ((86 * bf1[27])>>(8)) - ((231 * bf1[28])>>(8)) + ((132 * bf1[29])>>(8)) + ((206 * bf1[30])>>(8)) - ((172 * bf1[31])>>(8)) - ((172 * bf1[32])>>(8)) + ((206 * bf1[33])>>(8)) + ((132 * bf1[34])>>(8)) - ((231 * bf1[35])>>(8)) - ((86 * bf1[36])>>(8)) + ((248 * bf1[37])>>(8)) + ((38 * bf1[38])>>(8)) - ((256 * bf1[39])>>(8)) + ((13 * bf1[40])>>(8)) + ((253 * bf1[41])>>(8)) - ((62 * bf1[42])>>(8)) - ((241 * bf1[43])>>(8)) + ((109 * bf1[44])>>(8)) + ((220 * bf1[45])>>(8)) - ((152 * bf1[46])>>(8)) - ((190 * bf1[47])>>(8)) + ((190 * bf1[48])>>(8)) + ((152 * bf1[49])>>(8)) - ((220 * bf1[50])>>(8)) - ((109 * bf1[51])>>(8)) + ((241 * bf1[52])>>(8)) + ((62 * bf1[53])>>(8)) - ((253 * bf1[54])>>(8)) - ((13 * bf1[55])>>(8)) + ((256 * bf1[56])>>(8)) - ((38 * bf1[57])>>(8)) - ((248 * bf1[58])>>(8)) + ((86 * bf1[59])>>(8)) + ((231 * bf1[60])>>(8)) - ((132 * bf1[61])>>(8)) - ((206 * bf1[62])>>(8)) + ((172 * bf1[63])>>(8));
    bf0[35] = ((167 * bf1[0])>>(8)) - ((216 * bf1[1])>>(8)) - ((104 * bf1[2])>>(8)) + ((247 * bf1[3])>>(8)) + ((31 * bf1[4])>>(8)) - ((256 * bf1[5])>>(8)) + ((44 * bf1[6])>>(8)) + ((243 * bf1[7])>>(8)) - ((115 * bf1[8])>>(8)) - ((209 * bf1[9])>>(8)) + ((177 * bf1[10])>>(8)) + ((157 * bf1[11])>>(8)) - ((223 * bf1[12])>>(8)) - ((92 * bf1[13])>>(8)) + ((250 * bf1[14])>>(8)) + ((19 * bf1[15])>>(8)) - ((255 * bf1[16])>>(8)) + ((56 * bf1[17])>>(8)) + ((239 * bf1[18])>>(8)) - ((126 * bf1[19])>>(8)) - ((202 * bf1[20])>>(8)) + ((185 * bf1[21])>>(8)) + ((147 * bf1[22])>>(8)) - ((229 * bf1[23])>>(8)) - ((80 * bf1[24])>>(8)) + ((252 * bf1[25])>>(8)) + ((6 * bf1[26])>>(8)) - ((254 * bf1[27])>>(8)) + ((68 * bf1[28])>>(8)) + ((234 * bf1[29])>>(8)) - ((137 * bf1[30])>>(8)) - ((194 * bf1[31])>>(8)) + ((194 * bf1[32])>>(8)) + ((137 * bf1[33])>>(8)) - ((234 * bf1[34])>>(8)) - ((68 * bf1[35])>>(8)) + ((254 * bf1[36])>>(8)) - ((6 * bf1[37])>>(8)) - ((252 * bf1[38])>>(8)) + ((80 * bf1[39])>>(8)) + ((229 * bf1[40])>>(8)) - ((147 * bf1[41])>>(8)) - ((185 * bf1[42])>>(8)) + ((202 * bf1[43])>>(8)) + ((126 * bf1[44])>>(8)) - ((239 * bf1[45])>>(8)) - ((56 * bf1[46])>>(8)) + ((255 * bf1[47])>>(8)) - ((19 * bf1[48])>>(8)) - ((250 * bf1[49])>>(8)) + ((92 * bf1[50])>>(8)) + ((223 * bf1[51])>>(8)) - ((157 * bf1[52])>>(8)) - ((177 * bf1[53])>>(8)) + ((209 * bf1[54])>>(8)) + ((115 * bf1[55])>>(8)) - ((243 * bf1[56])>>(8)) - ((44 * bf1[57])>>(8)) + ((256 * bf1[58])>>(8)) - ((31 * bf1[59])>>(8)) - ((247 * bf1[60])>>(8)) + ((104 * bf1[61])>>(8)) + ((216 * bf1[62])>>(8)) - ((167 * bf1[63])>>(8));
    bf0[36] = ((162 * bf1[0])>>(8)) - ((226 * bf1[1])>>(8)) - ((74 * bf1[2])>>(8)) + ((255 * bf1[3])>>(8)) - ((25 * bf1[4])>>(8)) - ((245 * bf1[5])>>(8)) + ((121 * bf1[6])>>(8)) + ((198 * bf1[7])>>(8)) - ((198 * bf1[8])>>(8)) - ((121 * bf1[9])>>(8)) + ((245 * bf1[10])>>(8)) + ((25 * bf1[11])>>(8)) - ((255 * bf1[12])>>(8)) + ((74 * bf1[13])>>(8)) + ((226 * bf1[14])>>(8)) - ((162 * bf1[15])>>(8)) - ((162 * bf1[16])>>(8)) + ((226 * bf1[17])>>(8)) + ((74 * bf1[18])>>(8)) - ((255 * bf1[19])>>(8)) + ((25 * bf1[20])>>(8)) + ((245 * bf1[21])>>(8)) - ((121 * bf1[22])>>(8)) - ((198 * bf1[23])>>(8)) + ((198 * bf1[24])>>(8)) + ((121 * bf1[25])>>(8)) - ((245 * bf1[26])>>(8)) - ((25 * bf1[27])>>(8)) + ((255 * bf1[28])>>(8)) - ((74 * bf1[29])>>(8)) - ((226 * bf1[30])>>(8)) + ((162 * bf1[31])>>(8)) + ((162 * bf1[32])>>(8)) - ((226 * bf1[33])>>(8)) - ((74 * bf1[34])>>(8)) + ((255 * bf1[35])>>(8)) - ((25 * bf1[36])>>(8)) - ((245 * bf1[37])>>(8)) + ((121 * bf1[38])>>(8)) + ((198 * bf1[39])>>(8)) - ((198 * bf1[40])>>(8)) - ((121 * bf1[41])>>(8)) + ((245 * bf1[42])>>(8)) + ((25 * bf1[43])>>(8)) - ((255 * bf1[44])>>(8)) + ((74 * bf1[45])>>(8)) + ((226 * bf1[46])>>(8)) - ((162 * bf1[47])>>(8)) - ((162 * bf1[48])>>(8)) + ((226 * bf1[49])>>(8)) + ((74 * bf1[50])>>(8)) - ((255 * bf1[51])>>(8)) + ((25 * bf1[52])>>(8)) + ((245 * bf1[53])>>(8)) - ((121 * bf1[54])>>(8)) - ((198 * bf1[55])>>(8)) + ((198 * bf1[56])>>(8)) + ((121 * bf1[57])>>(8)) - ((245 * bf1[58])>>(8)) - ((25 * bf1[59])>>(8)) + ((255 * bf1[60])>>(8)) - ((74 * bf1[61])>>(8)) - ((226 * bf1[62])>>(8)) + ((162 * bf1[63])>>(8));
    bf0[37] = ((157 * bf1[0])>>(8)) - ((234 * bf1[1])>>(8)) - ((44 * bf1[2])>>(8)) + ((255 * bf1[3])>>(8)) - ((80 * bf1[4])>>(8)) - ((216 * bf1[5])>>(8)) + ((185 * bf1[6])>>(8)) + ((126 * bf1[7])>>(8)) - ((247 * bf1[8])>>(8)) - ((6 * bf1[9])>>(8)) + ((250 * bf1[10])>>(8)) - ((115 * bf1[11])>>(8)) - ((194 * bf1[12])>>(8)) + ((209 * bf1[13])>>(8)) + ((92 * bf1[14])>>(8)) - ((254 * bf1[15])>>(8)) + ((31 * bf1[16])>>(8)) + ((239 * bf1[17])>>(8)) - ((147 * bf1[18])>>(8)) - ((167 * bf1[19])>>(8)) + ((229 * bf1[20])>>(8)) + ((56 * bf1[21])>>(8)) - ((256 * bf1[22])>>(8)) + ((68 * bf1[23])>>(8)) + ((223 * bf1[24])>>(8)) - ((177 * bf1[25])>>(8)) - ((137 * bf1[26])>>(8)) + ((243 * bf1[27])>>(8)) + ((19 * bf1[28])>>(8)) - ((252 * bf1[29])>>(8)) + ((104 * bf1[30])>>(8)) + ((202 * bf1[31])>>(8)) - ((202 * bf1[32])>>(8)) - ((104 * bf1[33])>>(8)) + ((252 * bf1[34])>>(8)) - ((19 * bf1[35])>>(8)) - ((243 * bf1[36])>>(8)) + ((137 * bf1[37])>>(8)) + ((177 * bf1[38])>>(8)) - ((223 * bf1[39])>>(8)) - ((68 * bf1[40])>>(8)) + ((256 * bf1[41])>>(8)) - ((56 * bf1[42])>>(8)) - ((229 * bf1[43])>>(8)) + ((167 * bf1[44])>>(8)) + ((147 * bf1[45])>>(8)) - ((239 * bf1[46])>>(8)) - ((31 * bf1[47])>>(8)) + ((254 * bf1[48])>>(8)) - ((92 * bf1[49])>>(8)) - ((209 * bf1[50])>>(8)) + ((194 * bf1[51])>>(8)) + ((115 * bf1[52])>>(8)) - ((250 * bf1[53])>>(8)) + ((6 * bf1[54])>>(8)) + ((247 * bf1[55])>>(8)) - ((126 * bf1[56])>>(8)) - ((185 * bf1[57])>>(8)) + ((216 * bf1[58])>>(8)) + ((80 * bf1[59])>>(8)) - ((255 * bf1[60])>>(8)) + ((44 * bf1[61])>>(8)) + ((234 * bf1[62])>>(8)) - ((157 * bf1[63])>>(8));
    bf0[38] = ((152 * bf1[0])>>(8)) - ((241 * bf1[1])>>(8)) - ((13 * bf1[2])>>(8)) + ((248 * bf1[3])>>(8)) - ((132 * bf1[4])>>(8)) - ((172 * bf1[5])>>(8)) + ((231 * bf1[6])>>(8)) + ((38 * bf1[7])>>(8)) - ((253 * bf1[8])>>(8)) + ((109 * bf1[9])>>(8)) + ((190 * bf1[10])>>(8)) - ((220 * bf1[11])>>(8)) - ((62 * bf1[12])>>(8)) + ((256 * bf1[13])>>(8)) - ((86 * bf1[14])>>(8)) - ((206 * bf1[15])>>(8)) + ((206 * bf1[16])>>(8)) + ((86 * bf1[17])>>(8)) - ((256 * bf1[18])>>(8)) + ((62 * bf1[19])>>(8)) + ((220 * bf1[20])>>(8)) - ((190 * bf1[21])>>(8)) - ((109 * bf1[22])>>(8)) + ((253 * bf1[23])>>(8)) - ((38 * bf1[24])>>(8)) - ((231 * bf1[25])>>(8)) + ((172 * bf1[26])>>(8)) + ((132 * bf1[27])>>(8)) - ((248 * bf1[28])>>(8)) + ((13 * bf1[29])>>(8)) + ((241 * bf1[30])>>(8)) - ((152 * bf1[31])>>(8)) - ((152 * bf1[32])>>(8)) + ((241 * bf1[33])>>(8)) + ((13 * bf1[34])>>(8)) - ((248 * bf1[35])>>(8)) + ((132 * bf1[36])>>(8)) + ((172 * bf1[37])>>(8)) - ((231 * bf1[38])>>(8)) - ((38 * bf1[39])>>(8)) + ((253 * bf1[40])>>(8)) - ((109 * bf1[41])>>(8)) - ((190 * bf1[42])>>(8)) + ((220 * bf1[43])>>(8)) + ((62 * bf1[44])>>(8)) - ((256 * bf1[45])>>(8)) + ((86 * bf1[46])>>(8)) + ((206 * bf1[47])>>(8)) - ((206 * bf1[48])>>(8)) - ((86 * bf1[49])>>(8)) + ((256 * bf1[50])>>(8)) - ((62 * bf1[51])>>(8)) - ((220 * bf1[52])>>(8)) + ((190 * bf1[53])>>(8)) + ((109 * bf1[54])>>(8)) - ((253 * bf1[55])>>(8)) + ((38 * bf1[56])>>(8)) + ((231 * bf1[57])>>(8)) - ((172 * bf1[58])>>(8)) - ((132 * bf1[59])>>(8)) + ((248 * bf1[60])>>(8)) - ((13 * bf1[61])>>(8)) - ((241 * bf1[62])>>(8)) + ((152 * bf1[63])>>(8));
    bf0[39] = ((147 * bf1[0])>>(8)) - ((247 * bf1[1])>>(8)) + ((19 * bf1[2])>>(8)) + ((234 * bf1[3])>>(8)) - ((177 * bf1[4])>>(8)) - ((115 * bf1[5])>>(8)) + ((254 * bf1[6])>>(8)) - ((56 * bf1[7])>>(8)) - ((216 * bf1[8])>>(8)) + ((202 * bf1[9])>>(8)) + ((80 * bf1[10])>>(8)) - ((256 * bf1[11])>>(8)) + ((92 * bf1[12])>>(8)) + ((194 * bf1[13])>>(8)) - ((223 * bf1[14])>>(8)) - ((44 * bf1[15])>>(8)) + ((252 * bf1[16])>>(8)) - ((126 * bf1[17])>>(8)) - ((167 * bf1[18])>>(8)) + ((239 * bf1[19])>>(8)) + ((6 * bf1[20])>>(8)) - ((243 * bf1[21])>>(8)) + ((157 * bf1[22])>>(8)) + ((137 * bf1[23])>>(8)) - ((250 * bf1[24])>>(8)) + ((31 * bf1[25])>>(8)) + ((229 * bf1[26])>>(8)) - ((185 * bf1[27])>>(8)) - ((104 * bf1[28])>>(8)) + ((255 * bf1[29])>>(8)) - ((68 * bf1[30])>>(8)) - ((209 * bf1[31])>>(8)) + ((209 * bf1[32])>>(8)) + ((68 * bf1[33])>>(8)) - ((255 * bf1[34])>>(8)) + ((104 * bf1[35])>>(8)) + ((185 * bf1[36])>>(8)) - ((229 * bf1[37])>>(8)) - ((31 * bf1[38])>>(8)) + ((250 * bf1[39])>>(8)) - ((137 * bf1[40])>>(8)) - ((157 * bf1[41])>>(8)) + ((243 * bf1[42])>>(8)) - ((6 * bf1[43])>>(8)) - ((239 * bf1[44])>>(8)) + ((167 * bf1[45])>>(8)) + ((126 * bf1[46])>>(8)) - ((252 * bf1[47])>>(8)) + ((44 * bf1[48])>>(8)) + ((223 * bf1[49])>>(8)) - ((194 * bf1[50])>>(8)) - ((92 * bf1[51])>>(8)) + ((256 * bf1[52])>>(8)) - ((80 * bf1[53])>>(8)) - ((202 * bf1[54])>>(8)) + ((216 * bf1[55])>>(8)) + ((56 * bf1[56])>>(8)) - ((254 * bf1[57])>>(8)) + ((115 * bf1[58])>>(8)) + ((177 * bf1[59])>>(8)) - ((234 * bf1[60])>>(8)) - ((19 * bf1[61])>>(8)) + ((247 * bf1[62])>>(8)) - ((147 * bf1[63])>>(8));
    bf0[40] = ((142 * bf1[0])>>(8)) - ((251 * bf1[1])>>(8)) + ((50 * bf1[2])>>(8)) + ((213 * bf1[3])>>(8)) - ((213 * bf1[4])>>(8)) - ((50 * bf1[5])>>(8)) + ((251 * bf1[6])>>(8)) - ((142 * bf1[7])>>(8)) - ((142 * bf1[8])>>(8)) + ((251 * bf1[9])>>(8)) - ((50 * bf1[10])>>(8)) - ((213 * bf1[11])>>(8)) + ((213 * bf1[12])>>(8)) + ((50 * bf1[13])>>(8)) - ((251 * bf1[14])>>(8)) + ((142 * bf1[15])>>(8)) + ((142 * bf1[16])>>(8)) - ((251 * bf1[17])>>(8)) + ((50 * bf1[18])>>(8)) + ((213 * bf1[19])>>(8)) - ((213 * bf1[20])>>(8)) - ((50 * bf1[21])>>(8)) + ((251 * bf1[22])>>(8)) - ((142 * bf1[23])>>(8)) - ((142 * bf1[24])>>(8)) + ((251 * bf1[25])>>(8)) - ((50 * bf1[26])>>(8)) - ((213 * bf1[27])>>(8)) + ((213 * bf1[28])>>(8)) + ((50 * bf1[29])>>(8)) - ((251 * bf1[30])>>(8)) + ((142 * bf1[31])>>(8)) + ((142 * bf1[32])>>(8)) - ((251 * bf1[33])>>(8)) + ((50 * bf1[34])>>(8)) + ((213 * bf1[35])>>(8)) - ((213 * bf1[36])>>(8)) - ((50 * bf1[37])>>(8)) + ((251 * bf1[38])>>(8)) - ((142 * bf1[39])>>(8)) - ((142 * bf1[40])>>(8)) + ((251 * bf1[41])>>(8)) - ((50 * bf1[42])>>(8)) - ((213 * bf1[43])>>(8)) + ((213 * bf1[44])>>(8)) + ((50 * bf1[45])>>(8)) - ((251 * bf1[46])>>(8)) + ((142 * bf1[47])>>(8)) + ((142 * bf1[48])>>(8)) - ((251 * bf1[49])>>(8)) + ((50 * bf1[50])>>(8)) + ((213 * bf1[51])>>(8)) - ((213 * bf1[52])>>(8)) - ((50 * bf1[53])>>(8)) + ((251 * bf1[54])>>(8)) - ((142 * bf1[55])>>(8)) - ((142 * bf1[56])>>(8)) + ((251 * bf1[57])>>(8)) - ((50 * bf1[58])>>(8)) - ((213 * bf1[59])>>(8)) + ((213 * bf1[60])>>(8)) + ((50 * bf1[61])>>(8)) - ((251 * bf1[62])>>(8)) + ((142 * bf1[63])>>(8));
    bf0[41] = ((137 * bf1[0])>>(8)) - ((254 * bf1[1])>>(8)) + ((80 * bf1[2])>>(8)) + ((185 * bf1[3])>>(8)) - ((239 * bf1[4])>>(8)) + ((19 * bf1[5])>>(8)) + ((223 * bf1[6])>>(8)) - ((209 * bf1[7])>>(8)) - ((44 * bf1[8])>>(8)) + ((247 * bf1[9])>>(8)) - ((167 * bf1[10])>>(8)) - ((104 * bf1[11])>>(8)) + ((256 * bf1[12])>>(8)) - ((115 * bf1[13])>>(8)) - ((157 * bf1[14])>>(8)) + ((250 * bf1[15])>>(8)) - ((56 * bf1[16])>>(8)) - ((202 * bf1[17])>>(8)) + ((229 * bf1[18])>>(8)) + ((6 * bf1[19])>>(8)) - ((234 * bf1[20])>>(8)) + ((194 * bf1[21])>>(8)) + ((68 * bf1[22])>>(8)) - ((252 * bf1[23])>>(8)) + ((147 * bf1[24])>>(8)) + ((126 * bf1[25])>>(8)) - ((255 * bf1[26])>>(8)) + ((92 * bf1[27])>>(8)) + ((177 * bf1[28])>>(8)) - ((243 * bf1[29])>>(8)) + ((31 * bf1[30])>>(8)) + ((216 * bf1[31])>>(8)) - ((216 * bf1[32])>>(8)) - ((31 * bf1[33])>>(8)) + ((243 * bf1[34])>>(8)) - ((177 * bf1[35])>>(8)) - ((92 * bf1[36])>>(8)) + ((255 * bf1[37])>>(8)) - ((126 * bf1[38])>>(8)) - ((147 * bf1[39])>>(8)) + ((252 * bf1[40])>>(8)) - ((68 * bf1[41])>>(8)) - ((194 * bf1[42])>>(8)) + ((234 * bf1[43])>>(8)) - ((6 * bf1[44])>>(8)) - ((229 * bf1[45])>>(8)) + ((202 * bf1[46])>>(8)) + ((56 * bf1[47])>>(8)) - ((250 * bf1[48])>>(8)) + ((157 * bf1[49])>>(8)) + ((115 * bf1[50])>>(8)) - ((256 * bf1[51])>>(8)) + ((104 * bf1[52])>>(8)) + ((167 * bf1[53])>>(8)) - ((247 * bf1[54])>>(8)) + ((44 * bf1[55])>>(8)) + ((209 * bf1[56])>>(8)) - ((223 * bf1[57])>>(8)) - ((19 * bf1[58])>>(8)) + ((239 * bf1[59])>>(8)) - ((185 * bf1[60])>>(8)) - ((80 * bf1[61])>>(8)) + ((254 * bf1[62])>>(8)) - ((137 * bf1[63])>>(8));
    bf0[42] = ((132 * bf1[0])>>(8)) - ((256 * bf1[1])>>(8)) + ((109 * bf1[2])>>(8)) + ((152 * bf1[3])>>(8)) - ((253 * bf1[4])>>(8)) + ((86 * bf1[5])>>(8)) + ((172 * bf1[6])>>(8)) - ((248 * bf1[7])>>(8)) + ((62 * bf1[8])>>(8)) + ((190 * bf1[9])>>(8)) - ((241 * bf1[10])>>(8)) + ((38 * bf1[11])>>(8)) + ((206 * bf1[12])>>(8)) - ((231 * bf1[13])>>(8)) + ((13 * bf1[14])>>(8)) + ((220 * bf1[15])>>(8)) - ((220 * bf1[16])>>(8)) - ((13 * bf1[17])>>(8)) + ((231 * bf1[18])>>(8)) - ((206 * bf1[19])>>(8)) - ((38 * bf1[20])>>(8)) + ((241 * bf1[21])>>(8)) - ((190 * bf1[22])>>(8)) - ((62 * bf1[23])>>(8)) + ((248 * bf1[24])>>(8)) - ((172 * bf1[25])>>(8)) - ((86 * bf1[26])>>(8)) + ((253 * bf1[27])>>(8)) - ((152 * bf1[28])>>(8)) - ((109 * bf1[29])>>(8)) + ((256 * bf1[30])>>(8)) - ((132 * bf1[31])>>(8)) - ((132 * bf1[32])>>(8)) + ((256 * bf1[33])>>(8)) - ((109 * bf1[34])>>(8)) - ((152 * bf1[35])>>(8)) + ((253 * bf1[36])>>(8)) - ((86 * bf1[37])>>(8)) - ((172 * bf1[38])>>(8)) + ((248 * bf1[39])>>(8)) - ((62 * bf1[40])>>(8)) - ((190 * bf1[41])>>(8)) + ((241 * bf1[42])>>(8)) - ((38 * bf1[43])>>(8)) - ((206 * bf1[44])>>(8)) + ((231 * bf1[45])>>(8)) - ((13 * bf1[46])>>(8)) - ((220 * bf1[47])>>(8)) + ((220 * bf1[48])>>(8)) + ((13 * bf1[49])>>(8)) - ((231 * bf1[50])>>(8)) + ((206 * bf1[51])>>(8)) + ((38 * bf1[52])>>(8)) - ((241 * bf1[53])>>(8)) + ((190 * bf1[54])>>(8)) + ((62 * bf1[55])>>(8)) - ((248 * bf1[56])>>(8)) + ((172 * bf1[57])>>(8)) + ((86 * bf1[58])>>(8)) - ((253 * bf1[59])>>(8)) + ((152 * bf1[60])>>(8)) + ((109 * bf1[61])>>(8)) - ((256 * bf1[62])>>(8)) + ((132 * bf1[63])>>(8));
    bf0[43] = ((126 * bf1[0])>>(8)) - ((256 * bf1[1])>>(8)) + ((137 * bf1[2])>>(8)) + ((115 * bf1[3])>>(8)) - ((255 * bf1[4])>>(8)) + ((147 * bf1[5])>>(8)) + ((104 * bf1[6])>>(8)) - ((254 * bf1[7])>>(8)) + ((157 * bf1[8])>>(8)) + ((92 * bf1[9])>>(8)) - ((252 * bf1[10])>>(8)) + ((167 * bf1[11])>>(8)) + ((80 * bf1[12])>>(8)) - ((250 * bf1[13])>>(8)) + ((177 * bf1[14])>>(8)) + ((68 * bf1[15])>>(8)) - ((247 * bf1[16])>>(8)) + ((185 * bf1[17])>>(8)) + ((56 * bf1[18])>>(8)) - ((243 * bf1[19])>>(8)) + ((194 * bf1[20])>>(8)) + ((44 * bf1[21])>>(8)) - ((239 * bf1[22])>>(8)) + ((202 * bf1[23])>>(8)) + ((31 * bf1[24])>>(8)) - ((234 * bf1[25])>>(8)) + ((209 * bf1[26])>>(8)) + ((19 * bf1[27])>>(8)) - ((229 * bf1[28])>>(8)) + ((216 * bf1[29])>>(8)) + ((6 * bf1[30])>>(8)) - ((223 * bf1[31])>>(8)) + ((223 * bf1[32])>>(8)) - ((6 * bf1[33])>>(8)) - ((216 * bf1[34])>>(8)) + ((229 * bf1[35])>>(8)) - ((19 * bf1[36])>>(8)) - ((209 * bf1[37])>>(8)) + ((234 * bf1[38])>>(8)) - ((31 * bf1[39])>>(8)) - ((202 * bf1[40])>>(8)) + ((239 * bf1[41])>>(8)) - ((44 * bf1[42])>>(8)) - ((194 * bf1[43])>>(8)) + ((243 * bf1[44])>>(8)) - ((56 * bf1[45])>>(8)) - ((185 * bf1[46])>>(8)) + ((247 * bf1[47])>>(8)) - ((68 * bf1[48])>>(8)) - ((177 * bf1[49])>>(8)) + ((250 * bf1[50])>>(8)) - ((80 * bf1[51])>>(8)) - ((167 * bf1[52])>>(8)) + ((252 * bf1[53])>>(8)) - ((92 * bf1[54])>>(8)) - ((157 * bf1[55])>>(8)) + ((254 * bf1[56])>>(8)) - ((104 * bf1[57])>>(8)) - ((147 * bf1[58])>>(8)) + ((255 * bf1[59])>>(8)) - ((115 * bf1[60])>>(8)) - ((137 * bf1[61])>>(8)) + ((256 * bf1[62])>>(8)) - ((126 * bf1[63])>>(8));
    bf0[44] = ((121 * bf1[0])>>(8)) - ((255 * bf1[1])>>(8)) + ((162 * bf1[2])>>(8)) + ((74 * bf1[3])>>(8)) - ((245 * bf1[4])>>(8)) + ((198 * bf1[5])>>(8)) + ((25 * bf1[6])>>(8)) - ((226 * bf1[7])>>(8)) + ((226 * bf1[8])>>(8)) - ((25 * bf1[9])>>(8)) - ((198 * bf1[10])>>(8)) + ((245 * bf1[11])>>(8)) - ((74 * bf1[12])>>(8)) - ((162 * bf1[13])>>(8)) + ((255 * bf1[14])>>(8)) - ((121 * bf1[15])>>(8)) - ((121 * bf1[16])>>(8)) + ((255 * bf1[17])>>(8)) - ((162 * bf1[18])>>(8)) - ((74 * bf1[19])>>(8)) + ((245 * bf1[20])>>(8)) - ((198 * bf1[21])>>(8)) - ((25 * bf1[22])>>(8)) + ((226 * bf1[23])>>(8)) - ((226 * bf1[24])>>(8)) + ((25 * bf1[25])>>(8)) + ((198 * bf1[26])>>(8)) - ((245 * bf1[27])>>(8)) + ((74 * bf1[28])>>(8)) + ((162 * bf1[29])>>(8)) - ((255 * bf1[30])>>(8)) + ((121 * bf1[31])>>(8)) + ((121 * bf1[32])>>(8)) - ((255 * bf1[33])>>(8)) + ((162 * bf1[34])>>(8)) + ((74 * bf1[35])>>(8)) - ((245 * bf1[36])>>(8)) + ((198 * bf1[37])>>(8)) + ((25 * bf1[38])>>(8)) - ((226 * bf1[39])>>(8)) + ((226 * bf1[40])>>(8)) - ((25 * bf1[41])>>(8)) - ((198 * bf1[42])>>(8)) + ((245 * bf1[43])>>(8)) - ((74 * bf1[44])>>(8)) - ((162 * bf1[45])>>(8)) + ((255 * bf1[46])>>(8)) - ((121 * bf1[47])>>(8)) - ((121 * bf1[48])>>(8)) + ((255 * bf1[49])>>(8)) - ((162 * bf1[50])>>(8)) - ((74 * bf1[51])>>(8)) + ((245 * bf1[52])>>(8)) - ((198 * bf1[53])>>(8)) - ((25 * bf1[54])>>(8)) + ((226 * bf1[55])>>(8)) - ((226 * bf1[56])>>(8)) + ((25 * bf1[57])>>(8)) + ((198 * bf1[58])>>(8)) - ((245 * bf1[59])>>(8)) + ((74 * bf1[60])>>(8)) + ((162 * bf1[61])>>(8)) - ((255 * bf1[62])>>(8)) + ((121 * bf1[63])>>(8));
    bf0[45] = ((115 * bf1[0])>>(8)) - ((252 * bf1[1])>>(8)) + ((185 * bf1[2])>>(8)) + ((31 * bf1[3])>>(8)) - ((223 * bf1[4])>>(8)) + ((234 * bf1[5])>>(8)) - ((56 * bf1[6])>>(8)) - ((167 * bf1[7])>>(8)) + ((255 * bf1[8])>>(8)) - ((137 * bf1[9])>>(8)) - ((92 * bf1[10])>>(8)) + ((247 * bf1[11])>>(8)) - ((202 * bf1[12])>>(8)) - ((6 * bf1[13])>>(8)) + ((209 * bf1[14])>>(8)) - ((243 * bf1[15])>>(8)) + ((80 * bf1[16])>>(8)) + ((147 * bf1[17])>>(8)) - ((256 * bf1[18])>>(8)) + ((157 * bf1[19])>>(8)) + ((68 * bf1[20])>>(8)) - ((239 * bf1[21])>>(8)) + ((216 * bf1[22])>>(8)) - ((19 * bf1[23])>>(8)) - ((194 * bf1[24])>>(8)) + ((250 * bf1[25])>>(8)) - ((104 * bf1[26])>>(8)) - ((126 * bf1[27])>>(8)) + ((254 * bf1[28])>>(8)) - ((177 * bf1[29])>>(8)) - ((44 * bf1[30])>>(8)) + ((229 * bf1[31])>>(8)) - ((229 * bf1[32])>>(8)) + ((44 * bf1[33])>>(8)) + ((177 * bf1[34])>>(8)) - ((254 * bf1[35])>>(8)) + ((126 * bf1[36])>>(8)) + ((104 * bf1[37])>>(8)) - ((250 * bf1[38])>>(8)) + ((194 * bf1[39])>>(8)) + ((19 * bf1[40])>>(8)) - ((216 * bf1[41])>>(8)) + ((239 * bf1[42])>>(8)) - ((68 * bf1[43])>>(8)) - ((157 * bf1[44])>>(8)) + ((256 * bf1[45])>>(8)) - ((147 * bf1[46])>>(8)) - ((80 * bf1[47])>>(8)) + ((243 * bf1[48])>>(8)) - ((209 * bf1[49])>>(8)) + ((6 * bf1[50])>>(8)) + ((202 * bf1[51])>>(8)) - ((247 * bf1[52])>>(8)) + ((92 * bf1[53])>>(8)) + ((137 * bf1[54])>>(8)) - ((255 * bf1[55])>>(8)) + ((167 * bf1[56])>>(8)) + ((56 * bf1[57])>>(8)) - ((234 * bf1[58])>>(8)) + ((223 * bf1[59])>>(8)) - ((31 * bf1[60])>>(8)) - ((185 * bf1[61])>>(8)) + ((252 * bf1[62])>>(8)) - ((115 * bf1[63])>>(8));
    bf0[46] = ((109 * bf1[0])>>(8)) - ((248 * bf1[1])>>(8)) + ((206 * bf1[2])>>(8)) - ((13 * bf1[3])>>(8)) - ((190 * bf1[4])>>(8)) + ((253 * bf1[5])>>(8)) - ((132 * bf1[6])>>(8)) - ((86 * bf1[7])>>(8)) + ((241 * bf1[8])>>(8)) - ((220 * bf1[9])>>(8)) + ((38 * bf1[10])>>(8)) + ((172 * bf1[11])>>(8)) - ((256 * bf1[12])>>(8)) + ((152 * bf1[13])>>(8)) + ((62 * bf1[14])>>(8)) - ((231 * bf1[15])>>(8)) + ((231 * bf1[16])>>(8)) - ((62 * bf1[17])>>(8)) - ((152 * bf1[18])>>(8)) + ((256 * bf1[19])>>(8)) - ((172 * bf1[20])>>(8)) - ((38 * bf1[21])>>(8)) + ((220 * bf1[22])>>(8)) - ((241 * bf1[23])>>(8)) + ((86 * bf1[24])>>(8)) + ((132 * bf1[25])>>(8)) - ((253 * bf1[26])>>(8)) + ((190 * bf1[27])>>(8)) + ((13 * bf1[28])>>(8)) - ((206 * bf1[29])>>(8)) + ((248 * bf1[30])>>(8)) - ((109 * bf1[31])>>(8)) - ((109 * bf1[32])>>(8)) + ((248 * bf1[33])>>(8)) - ((206 * bf1[34])>>(8)) + ((13 * bf1[35])>>(8)) + ((190 * bf1[36])>>(8)) - ((253 * bf1[37])>>(8)) + ((132 * bf1[38])>>(8)) + ((86 * bf1[39])>>(8)) - ((241 * bf1[40])>>(8)) + ((220 * bf1[41])>>(8)) - ((38 * bf1[42])>>(8)) - ((172 * bf1[43])>>(8)) + ((256 * bf1[44])>>(8)) - ((152 * bf1[45])>>(8)) - ((62 * bf1[46])>>(8)) + ((231 * bf1[47])>>(8)) - ((231 * bf1[48])>>(8)) + ((62 * bf1[49])>>(8)) + ((152 * bf1[50])>>(8)) - ((256 * bf1[51])>>(8)) + ((172 * bf1[52])>>(8)) + ((38 * bf1[53])>>(8)) - ((220 * bf1[54])>>(8)) + ((241 * bf1[55])>>(8)) - ((86 * bf1[56])>>(8)) - ((132 * bf1[57])>>(8)) + ((253 * bf1[58])>>(8)) - ((190 * bf1[59])>>(8)) - ((13 * bf1[60])>>(8)) + ((206 * bf1[61])>>(8)) - ((248 * bf1[62])>>(8)) + ((109 * bf1[63])>>(8));
    bf0[47] = ((104 * bf1[0])>>(8)) - ((243 * bf1[1])>>(8)) + ((223 * bf1[2])>>(8)) - ((56 * bf1[3])>>(8)) - ((147 * bf1[4])>>(8)) + ((254 * bf1[5])>>(8)) - ((194 * bf1[6])>>(8)) + ((6 * bf1[7])>>(8)) + ((185 * bf1[8])>>(8)) - ((255 * bf1[9])>>(8)) + ((157 * bf1[10])>>(8)) + ((44 * bf1[11])>>(8)) - ((216 * bf1[12])>>(8)) + ((247 * bf1[13])>>(8)) - ((115 * bf1[14])>>(8)) - ((92 * bf1[15])>>(8)) + ((239 * bf1[16])>>(8)) - ((229 * bf1[17])>>(8)) + ((68 * bf1[18])>>(8)) + ((137 * bf1[19])>>(8)) - ((252 * bf1[20])>>(8)) + ((202 * bf1[21])>>(8)) - ((19 * bf1[22])>>(8)) - ((177 * bf1[23])>>(8)) + ((256 * bf1[24])>>(8)) - ((167 * bf1[25])>>(8)) - ((31 * bf1[26])>>(8)) + ((209 * bf1[27])>>(8)) - ((250 * bf1[28])>>(8)) + ((126 * bf1[29])>>(8)) + ((80 * bf1[30])>>(8)) - ((234 * bf1[31])>>(8)) + ((234 * bf1[32])>>(8)) - ((80 * bf1[33])>>(8)) - ((126 * bf1[34])>>(8)) + ((250 * bf1[35])>>(8)) - ((209 * bf1[36])>>(8)) + ((31 * bf1[37])>>(8)) + ((167 * bf1[38])>>(8)) - ((256 * bf1[39])>>(8)) + ((177 * bf1[40])>>(8)) + ((19 * bf1[41])>>(8)) - ((202 * bf1[42])>>(8)) + ((252 * bf1[43])>>(8)) - ((137 * bf1[44])>>(8)) - ((68 * bf1[45])>>(8)) + ((229 * bf1[46])>>(8)) - ((239 * bf1[47])>>(8)) + ((92 * bf1[48])>>(8)) + ((115 * bf1[49])>>(8)) - ((247 * bf1[50])>>(8)) + ((216 * bf1[51])>>(8)) - ((44 * bf1[52])>>(8)) - ((157 * bf1[53])>>(8)) + ((255 * bf1[54])>>(8)) - ((185 * bf1[55])>>(8)) - ((6 * bf1[56])>>(8)) + ((194 * bf1[57])>>(8)) - ((254 * bf1[58])>>(8)) + ((147 * bf1[59])>>(8)) + ((56 * bf1[60])>>(8)) - ((223 * bf1[61])>>(8)) + ((243 * bf1[62])>>(8)) - ((104 * bf1[63])>>(8));
    bf0[48] = ((98 * bf1[0])>>(8)) - ((237 * bf1[1])>>(8)) + ((237 * bf1[2])>>(8)) - ((98 * bf1[3])>>(8)) - ((98 * bf1[4])>>(8)) + ((237 * bf1[5])>>(8)) - ((237 * bf1[6])>>(8)) + ((98 * bf1[7])>>(8)) + ((98 * bf1[8])>>(8)) - ((237 * bf1[9])>>(8)) + ((237 * bf1[10])>>(8)) - ((98 * bf1[11])>>(8)) - ((98 * bf1[12])>>(8)) + ((237 * bf1[13])>>(8)) - ((237 * bf1[14])>>(8)) + ((98 * bf1[15])>>(8)) + ((98 * bf1[16])>>(8)) - ((237 * bf1[17])>>(8)) + ((237 * bf1[18])>>(8)) - ((98 * bf1[19])>>(8)) - ((98 * bf1[20])>>(8)) + ((237 * bf1[21])>>(8)) - ((237 * bf1[22])>>(8)) + ((98 * bf1[23])>>(8)) + ((98 * bf1[24])>>(8)) - ((237 * bf1[25])>>(8)) + ((237 * bf1[26])>>(8)) - ((98 * bf1[27])>>(8)) - ((98 * bf1[28])>>(8)) + ((237 * bf1[29])>>(8)) - ((237 * bf1[30])>>(8)) + ((98 * bf1[31])>>(8)) + ((98 * bf1[32])>>(8)) - ((237 * bf1[33])>>(8)) + ((237 * bf1[34])>>(8)) - ((98 * bf1[35])>>(8)) - ((98 * bf1[36])>>(8)) + ((237 * bf1[37])>>(8)) - ((237 * bf1[38])>>(8)) + ((98 * bf1[39])>>(8)) + ((98 * bf1[40])>>(8)) - ((237 * bf1[41])>>(8)) + ((237 * bf1[42])>>(8)) - ((98 * bf1[43])>>(8)) - ((98 * bf1[44])>>(8)) + ((237 * bf1[45])>>(8)) - ((237 * bf1[46])>>(8)) + ((98 * bf1[47])>>(8)) + ((98 * bf1[48])>>(8)) - ((237 * bf1[49])>>(8)) + ((237 * bf1[50])>>(8)) - ((98 * bf1[51])>>(8)) - ((98 * bf1[52])>>(8)) + ((237 * bf1[53])>>(8)) - ((237 * bf1[54])>>(8)) + ((98 * bf1[55])>>(8)) + ((98 * bf1[56])>>(8)) - ((237 * bf1[57])>>(8)) + ((237 * bf1[58])>>(8)) - ((98 * bf1[59])>>(8)) - ((98 * bf1[60])>>(8)) + ((237 * bf1[61])>>(8)) - ((237 * bf1[62])>>(8)) + ((98 * bf1[63])>>(8));
    bf0[49] = ((92 * bf1[0])>>(8)) - ((229 * bf1[1])>>(8)) + ((247 * bf1[2])>>(8)) - ((137 * bf1[3])>>(8)) - ((44 * bf1[4])>>(8)) + ((202 * bf1[5])>>(8)) - ((255 * bf1[6])>>(8)) + ((177 * bf1[7])>>(8)) - ((6 * bf1[8])>>(8)) - ((167 * bf1[9])>>(8)) + ((254 * bf1[10])>>(8)) - ((209 * bf1[11])>>(8)) + ((56 * bf1[12])>>(8)) + ((126 * bf1[13])>>(8)) - ((243 * bf1[14])>>(8)) + ((234 * bf1[15])>>(8)) - ((104 * bf1[16])>>(8)) - ((80 * bf1[17])>>(8)) + ((223 * bf1[18])>>(8)) - ((250 * bf1[19])>>(8)) + ((147 * bf1[20])>>(8)) + ((31 * bf1[21])>>(8)) - ((194 * bf1[22])>>(8)) + ((256 * bf1[23])>>(8)) - ((185 * bf1[24])>>(8)) + ((19 * bf1[25])>>(8)) + ((157 * bf1[26])>>(8)) - ((252 * bf1[27])>>(8)) + ((216 * bf1[28])>>(8)) - ((68 * bf1[29])>>(8)) - ((115 * bf1[30])>>(8)) + ((239 * bf1[31])>>(8)) - ((239 * bf1[32])>>(8)) + ((115 * bf1[33])>>(8)) + ((68 * bf1[34])>>(8)) - ((216 * bf1[35])>>(8)) + ((252 * bf1[36])>>(8)) - ((157 * bf1[37])>>(8)) - ((19 * bf1[38])>>(8)) + ((185 * bf1[39])>>(8)) - ((256 * bf1[40])>>(8)) + ((194 * bf1[41])>>(8)) - ((31 * bf1[42])>>(8)) - ((147 * bf1[43])>>(8)) + ((250 * bf1[44])>>(8)) - ((223 * bf1[45])>>(8)) + ((80 * bf1[46])>>(8)) + ((104 * bf1[47])>>(8)) - ((234 * bf1[48])>>(8)) + ((243 * bf1[49])>>(8)) - ((126 * bf1[50])>>(8)) - ((56 * bf1[51])>>(8)) + ((209 * bf1[52])>>(8)) - ((254 * bf1[53])>>(8)) + ((167 * bf1[54])>>(8)) + ((6 * bf1[55])>>(8)) - ((177 * bf1[56])>>(8)) + ((255 * bf1[57])>>(8)) - ((202 * bf1[58])>>(8)) + ((44 * bf1[59])>>(8)) + ((137 * bf1[60])>>(8)) - ((247 * bf1[61])>>(8)) + ((229 * bf1[62])>>(8)) - ((92 * bf1[63])>>(8));
    bf0[50] = ((86 * bf1[0])>>(8)) - ((220 * bf1[1])>>(8)) + ((253 * bf1[2])>>(8)) - ((172 * bf1[3])>>(8)) + ((13 * bf1[4])>>(8)) + ((152 * bf1[5])>>(8)) - ((248 * bf1[6])>>(8)) + ((231 * bf1[7])>>(8)) - ((109 * bf1[8])>>(8)) - ((62 * bf1[9])>>(8)) + ((206 * bf1[10])>>(8)) - ((256 * bf1[11])>>(8)) + ((190 * bf1[12])>>(8)) - ((38 * bf1[13])>>(8)) - ((132 * bf1[14])>>(8)) + ((241 * bf1[15])>>(8)) - ((241 * bf1[16])>>(8)) + ((132 * bf1[17])>>(8)) + ((38 * bf1[18])>>(8)) - ((190 * bf1[19])>>(8)) + ((256 * bf1[20])>>(8)) - ((206 * bf1[21])>>(8)) + ((62 * bf1[22])>>(8)) + ((109 * bf1[23])>>(8)) - ((231 * bf1[24])>>(8)) + ((248 * bf1[25])>>(8)) - ((152 * bf1[26])>>(8)) - ((13 * bf1[27])>>(8)) + ((172 * bf1[28])>>(8)) - ((253 * bf1[29])>>(8)) + ((220 * bf1[30])>>(8)) - ((86 * bf1[31])>>(8)) - ((86 * bf1[32])>>(8)) + ((220 * bf1[33])>>(8)) - ((253 * bf1[34])>>(8)) + ((172 * bf1[35])>>(8)) - ((13 * bf1[36])>>(8)) - ((152 * bf1[37])>>(8)) + ((248 * bf1[38])>>(8)) - ((231 * bf1[39])>>(8)) + ((109 * bf1[40])>>(8)) + ((62 * bf1[41])>>(8)) - ((206 * bf1[42])>>(8)) + ((256 * bf1[43])>>(8)) - ((190 * bf1[44])>>(8)) + ((38 * bf1[45])>>(8)) + ((132 * bf1[46])>>(8)) - ((241 * bf1[47])>>(8)) + ((241 * bf1[48])>>(8)) - ((132 * bf1[49])>>(8)) - ((38 * bf1[50])>>(8)) + ((190 * bf1[51])>>(8)) - ((256 * bf1[52])>>(8)) + ((206 * bf1[53])>>(8)) - ((62 * bf1[54])>>(8)) - ((109 * bf1[55])>>(8)) + ((231 * bf1[56])>>(8)) - ((248 * bf1[57])>>(8)) + ((152 * bf1[58])>>(8)) + ((13 * bf1[59])>>(8)) - ((172 * bf1[60])>>(8)) + ((253 * bf1[61])>>(8)) - ((220 * bf1[62])>>(8)) + ((86 * bf1[63])>>(8));
    bf0[51] = ((80 * bf1[0])>>(8)) - ((209 * bf1[1])>>(8)) + ((256 * bf1[2])>>(8)) - ((202 * bf1[3])>>(8)) + ((68 * bf1[4])>>(8)) + ((92 * bf1[5])>>(8)) - ((216 * bf1[6])>>(8)) + ((255 * bf1[7])>>(8)) - ((194 * bf1[8])>>(8)) + ((56 * bf1[9])>>(8)) + ((104 * bf1[10])>>(8)) - ((223 * bf1[11])>>(8)) + ((254 * bf1[12])>>(8)) - ((185 * bf1[13])>>(8)) + ((44 * bf1[14])>>(8)) + ((115 * bf1[15])>>(8)) - ((229 * bf1[16])>>(8)) + ((252 * bf1[17])>>(8)) - ((177 * bf1[18])>>(8)) + ((31 * bf1[19])>>(8)) + ((126 * bf1[20])>>(8)) - ((234 * bf1[21])>>(8)) + ((250 * bf1[22])>>(8)) - ((167 * bf1[23])>>(8)) + ((19 * bf1[24])>>(8)) + ((137 * bf1[25])>>(8)) - ((239 * bf1[26])>>(8)) + ((247 * bf1[27])>>(8)) - ((157 * bf1[28])>>(8)) + ((6 * bf1[29])>>(8)) + ((147 * bf1[30])>>(8)) - ((243 * bf1[31])>>(8)) + ((243 * bf1[32])>>(8)) - ((147 * bf1[33])>>(8)) - ((6 * bf1[34])>>(8)) + ((157 * bf1[35])>>(8)) - ((247 * bf1[36])>>(8)) + ((239 * bf1[37])>>(8)) - ((137 * bf1[38])>>(8)) - ((19 * bf1[39])>>(8)) + ((167 * bf1[40])>>(8)) - ((250 * bf1[41])>>(8)) + ((234 * bf1[42])>>(8)) - ((126 * bf1[43])>>(8)) - ((31 * bf1[44])>>(8)) + ((177 * bf1[45])>>(8)) - ((252 * bf1[46])>>(8)) + ((229 * bf1[47])>>(8)) - ((115 * bf1[48])>>(8)) - ((44 * bf1[49])>>(8)) + ((185 * bf1[50])>>(8)) - ((254 * bf1[51])>>(8)) + ((223 * bf1[52])>>(8)) - ((104 * bf1[53])>>(8)) - ((56 * bf1[54])>>(8)) + ((194 * bf1[55])>>(8)) - ((255 * bf1[56])>>(8)) + ((216 * bf1[57])>>(8)) - ((92 * bf1[58])>>(8)) - ((68 * bf1[59])>>(8)) + ((202 * bf1[60])>>(8)) - ((256 * bf1[61])>>(8)) + ((209 * bf1[62])>>(8)) - ((80 * bf1[63])>>(8));
    bf0[52] = ((74 * bf1[0])>>(8)) - ((198 * bf1[1])>>(8)) + ((255 * bf1[2])>>(8)) - ((226 * bf1[3])>>(8)) + ((121 * bf1[4])>>(8)) + ((25 * bf1[5])>>(8)) - ((162 * bf1[6])>>(8)) + ((245 * bf1[7])>>(8)) - ((245 * bf1[8])>>(8)) + ((162 * bf1[9])>>(8)) - ((25 * bf1[10])>>(8)) - ((121 * bf1[11])>>(8)) + ((226 * bf1[12])>>(8)) - ((255 * bf1[13])>>(8)) + ((198 * bf1[14])>>(8)) - ((74 * bf1[15])>>(8)) - ((74 * bf1[16])>>(8)) + ((198 * bf1[17])>>(8)) - ((255 * bf1[18])>>(8)) + ((226 * bf1[19])>>(8)) - ((121 * bf1[20])>>(8)) - ((25 * bf1[21])>>(8)) + ((162 * bf1[22])>>(8)) - ((245 * bf1[23])>>(8)) + ((245 * bf1[24])>>(8)) - ((162 * bf1[25])>>(8)) + ((25 * bf1[26])>>(8)) + ((121 * bf1[27])>>(8)) - ((226 * bf1[28])>>(8)) + ((255 * bf1[29])>>(8)) - ((198 * bf1[30])>>(8)) + ((74 * bf1[31])>>(8)) + ((74 * bf1[32])>>(8)) - ((198 * bf1[33])>>(8)) + ((255 * bf1[34])>>(8)) - ((226 * bf1[35])>>(8)) + ((121 * bf1[36])>>(8)) + ((25 * bf1[37])>>(8)) - ((162 * bf1[38])>>(8)) + ((245 * bf1[39])>>(8)) - ((245 * bf1[40])>>(8)) + ((162 * bf1[41])>>(8)) - ((25 * bf1[42])>>(8)) - ((121 * bf1[43])>>(8)) + ((226 * bf1[44])>>(8)) - ((255 * bf1[45])>>(8)) + ((198 * bf1[46])>>(8)) - ((74 * bf1[47])>>(8)) - ((74 * bf1[48])>>(8)) + ((198 * bf1[49])>>(8)) - ((255 * bf1[50])>>(8)) + ((226 * bf1[51])>>(8)) - ((121 * bf1[52])>>(8)) - ((25 * bf1[53])>>(8)) + ((162 * bf1[54])>>(8)) - ((245 * bf1[55])>>(8)) + ((245 * bf1[56])>>(8)) - ((162 * bf1[57])>>(8)) + ((25 * bf1[58])>>(8)) + ((121 * bf1[59])>>(8)) - ((226 * bf1[60])>>(8)) + ((255 * bf1[61])>>(8)) - ((198 * bf1[62])>>(8)) + ((74 * bf1[63])>>(8));
    bf0[53] = ((68 * bf1[0])>>(8)) - ((185 * bf1[1])>>(8)) + ((250 * bf1[2])>>(8)) - ((243 * bf1[3])>>(8)) + ((167 * bf1[4])>>(8)) - ((44 * bf1[5])>>(8)) - ((92 * bf1[6])>>(8)) + ((202 * bf1[7])>>(8)) - ((254 * bf1[8])>>(8)) + ((234 * bf1[9])>>(8)) - ((147 * bf1[10])>>(8)) + ((19 * bf1[11])>>(8)) + ((115 * bf1[12])>>(8)) - ((216 * bf1[13])>>(8)) + ((256 * bf1[14])>>(8)) - ((223 * bf1[15])>>(8)) + ((126 * bf1[16])>>(8)) + ((6 * bf1[17])>>(8)) - ((137 * bf1[18])>>(8)) + ((229 * bf1[19])>>(8)) - ((255 * bf1[20])>>(8)) + ((209 * bf1[21])>>(8)) - ((104 * bf1[22])>>(8)) - ((31 * bf1[23])>>(8)) + ((157 * bf1[24])>>(8)) - ((239 * bf1[25])>>(8)) + ((252 * bf1[26])>>(8)) - ((194 * bf1[27])>>(8)) + ((80 * bf1[28])>>(8)) + ((56 * bf1[29])>>(8)) - ((177 * bf1[30])>>(8)) + ((247 * bf1[31])>>(8)) - ((247 * bf1[32])>>(8)) + ((177 * bf1[33])>>(8)) - ((56 * bf1[34])>>(8)) - ((80 * bf1[35])>>(8)) + ((194 * bf1[36])>>(8)) - ((252 * bf1[37])>>(8)) + ((239 * bf1[38])>>(8)) - ((157 * bf1[39])>>(8)) + ((31 * bf1[40])>>(8)) + ((104 * bf1[41])>>(8)) - ((209 * bf1[42])>>(8)) + ((255 * bf1[43])>>(8)) - ((229 * bf1[44])>>(8)) + ((137 * bf1[45])>>(8)) - ((6 * bf1[46])>>(8)) - ((126 * bf1[47])>>(8)) + ((223 * bf1[48])>>(8)) - ((256 * bf1[49])>>(8)) + ((216 * bf1[50])>>(8)) - ((115 * bf1[51])>>(8)) - ((19 * bf1[52])>>(8)) + ((147 * bf1[53])>>(8)) - ((234 * bf1[54])>>(8)) + ((254 * bf1[55])>>(8)) - ((202 * bf1[56])>>(8)) + ((92 * bf1[57])>>(8)) + ((44 * bf1[58])>>(8)) - ((167 * bf1[59])>>(8)) + ((243 * bf1[60])>>(8)) - ((250 * bf1[61])>>(8)) + ((185 * bf1[62])>>(8)) - ((68 * bf1[63])>>(8));
    bf0[54] = ((62 * bf1[0])>>(8)) - ((172 * bf1[1])>>(8)) + ((241 * bf1[2])>>(8)) - ((253 * bf1[3])>>(8)) + ((206 * bf1[4])>>(8)) - ((109 * bf1[5])>>(8)) - ((13 * bf1[6])>>(8)) + ((132 * bf1[7])>>(8)) - ((220 * bf1[8])>>(8)) + ((256 * bf1[9])>>(8)) - ((231 * bf1[10])>>(8)) + ((152 * bf1[11])>>(8)) - ((38 * bf1[12])>>(8)) - ((86 * bf1[13])>>(8)) + ((190 * bf1[14])>>(8)) - ((248 * bf1[15])>>(8)) + ((248 * bf1[16])>>(8)) - ((190 * bf1[17])>>(8)) + ((86 * bf1[18])>>(8)) + ((38 * bf1[19])>>(8)) - ((152 * bf1[20])>>(8)) + ((231 * bf1[21])>>(8)) - ((256 * bf1[22])>>(8)) + ((220 * bf1[23])>>(8)) - ((132 * bf1[24])>>(8)) + ((13 * bf1[25])>>(8)) + ((109 * bf1[26])>>(8)) - ((206 * bf1[27])>>(8)) + ((253 * bf1[28])>>(8)) - ((241 * bf1[29])>>(8)) + ((172 * bf1[30])>>(8)) - ((62 * bf1[31])>>(8)) - ((62 * bf1[32])>>(8)) + ((172 * bf1[33])>>(8)) - ((241 * bf1[34])>>(8)) + ((253 * bf1[35])>>(8)) - ((206 * bf1[36])>>(8)) + ((109 * bf1[37])>>(8)) + ((13 * bf1[38])>>(8)) - ((132 * bf1[39])>>(8)) + ((220 * bf1[40])>>(8)) - ((256 * bf1[41])>>(8)) + ((231 * bf1[42])>>(8)) - ((152 * bf1[43])>>(8)) + ((38 * bf1[44])>>(8)) + ((86 * bf1[45])>>(8)) - ((190 * bf1[46])>>(8)) + ((248 * bf1[47])>>(8)) - ((248 * bf1[48])>>(8)) + ((190 * bf1[49])>>(8)) - ((86 * bf1[50])>>(8)) - ((38 * bf1[51])>>(8)) + ((152 * bf1[52])>>(8)) - ((231 * bf1[53])>>(8)) + ((256 * bf1[54])>>(8)) - ((220 * bf1[55])>>(8)) + ((132 * bf1[56])>>(8)) - ((13 * bf1[57])>>(8)) - ((109 * bf1[58])>>(8)) + ((206 * bf1[59])>>(8)) - ((253 * bf1[60])>>(8)) + ((241 * bf1[61])>>(8)) - ((172 * bf1[62])>>(8)) + ((62 * bf1[63])>>(8));
    bf0[55] = ((56 * bf1[0])>>(8)) - ((157 * bf1[1])>>(8)) + ((229 * bf1[2])>>(8)) - ((256 * bf1[3])>>(8)) + ((234 * bf1[4])>>(8)) - ((167 * bf1[5])>>(8)) + ((68 * bf1[6])>>(8)) + ((44 * bf1[7])>>(8)) - ((147 * bf1[8])>>(8)) + ((223 * bf1[9])>>(8)) - ((255 * bf1[10])>>(8)) + ((239 * bf1[11])>>(8)) - ((177 * bf1[12])>>(8)) + ((80 * bf1[13])>>(8)) + ((31 * bf1[14])>>(8)) - ((137 * bf1[15])>>(8)) + ((216 * bf1[16])>>(8)) - ((254 * bf1[17])>>(8)) + ((243 * bf1[18])>>(8)) - ((185 * bf1[19])>>(8)) + ((92 * bf1[20])>>(8)) + ((19 * bf1[21])>>(8)) - ((126 * bf1[22])>>(8)) + ((209 * bf1[23])>>(8)) - ((252 * bf1[24])>>(8)) + ((247 * bf1[25])>>(8)) - ((194 * bf1[26])>>(8)) + ((104 * bf1[27])>>(8)) + ((6 * bf1[28])>>(8)) - ((115 * bf1[29])>>(8)) + ((202 * bf1[30])>>(8)) - ((250 * bf1[31])>>(8)) + ((250 * bf1[32])>>(8)) - ((202 * bf1[33])>>(8)) + ((115 * bf1[34])>>(8)) - ((6 * bf1[35])>>(8)) - ((104 * bf1[36])>>(8)) + ((194 * bf1[37])>>(8)) - ((247 * bf1[38])>>(8)) + ((252 * bf1[39])>>(8)) - ((209 * bf1[40])>>(8)) + ((126 * bf1[41])>>(8)) - ((19 * bf1[42])>>(8)) - ((92 * bf1[43])>>(8)) + ((185 * bf1[44])>>(8)) - ((243 * bf1[45])>>(8)) + ((254 * bf1[46])>>(8)) - ((216 * bf1[47])>>(8)) + ((137 * bf1[48])>>(8)) - ((31 * bf1[49])>>(8)) - ((80 * bf1[50])>>(8)) + ((177 * bf1[51])>>(8)) - ((239 * bf1[52])>>(8)) + ((255 * bf1[53])>>(8)) - ((223 * bf1[54])>>(8)) + ((147 * bf1[55])>>(8)) - ((44 * bf1[56])>>(8)) - ((68 * bf1[57])>>(8)) + ((167 * bf1[58])>>(8)) - ((234 * bf1[59])>>(8)) + ((256 * bf1[60])>>(8)) - ((229 * bf1[61])>>(8)) + ((157 * bf1[62])>>(8)) - ((56 * bf1[63])>>(8));
    bf0[56] = ((50 * bf1[0])>>(8)) - ((142 * bf1[1])>>(8)) + ((213 * bf1[2])>>(8)) - ((251 * bf1[3])>>(8)) + ((251 * bf1[4])>>(8)) - ((213 * bf1[5])>>(8)) + ((142 * bf1[6])>>(8)) - ((50 * bf1[7])>>(8)) - ((50 * bf1[8])>>(8)) + ((142 * bf1[9])>>(8)) - ((213 * bf1[10])>>(8)) + ((251 * bf1[11])>>(8)) - ((251 * bf1[12])>>(8)) + ((213 * bf1[13])>>(8)) - ((142 * bf1[14])>>(8)) + ((50 * bf1[15])>>(8)) + ((50 * bf1[16])>>(8)) - ((142 * bf1[17])>>(8)) + ((213 * bf1[18])>>(8)) - ((251 * bf1[19])>>(8)) + ((251 * bf1[20])>>(8)) - ((213 * bf1[21])>>(8)) + ((142 * bf1[22])>>(8)) - ((50 * bf1[23])>>(8)) - ((50 * bf1[24])>>(8)) + ((142 * bf1[25])>>(8)) - ((213 * bf1[26])>>(8)) + ((251 * bf1[27])>>(8)) - ((251 * bf1[28])>>(8)) + ((213 * bf1[29])>>(8)) - ((142 * bf1[30])>>(8)) + ((50 * bf1[31])>>(8)) + ((50 * bf1[32])>>(8)) - ((142 * bf1[33])>>(8)) + ((213 * bf1[34])>>(8)) - ((251 * bf1[35])>>(8)) + ((251 * bf1[36])>>(8)) - ((213 * bf1[37])>>(8)) + ((142 * bf1[38])>>(8)) - ((50 * bf1[39])>>(8)) - ((50 * bf1[40])>>(8)) + ((142 * bf1[41])>>(8)) - ((213 * bf1[42])>>(8)) + ((251 * bf1[43])>>(8)) - ((251 * bf1[44])>>(8)) + ((213 * bf1[45])>>(8)) - ((142 * bf1[46])>>(8)) + ((50 * bf1[47])>>(8)) + ((50 * bf1[48])>>(8)) - ((142 * bf1[49])>>(8)) + ((213 * bf1[50])>>(8)) - ((251 * bf1[51])>>(8)) + ((251 * bf1[52])>>(8)) - ((213 * bf1[53])>>(8)) + ((142 * bf1[54])>>(8)) - ((50 * bf1[55])>>(8)) - ((50 * bf1[56])>>(8)) + ((142 * bf1[57])>>(8)) - ((213 * bf1[58])>>(8)) + ((251 * bf1[59])>>(8)) - ((251 * bf1[60])>>(8)) + ((213 * bf1[61])>>(8)) - ((142 * bf1[62])>>(8)) + ((50 * bf1[63])>>(8));
    bf0[57] = ((44 * bf1[0])>>(8)) - ((126 * bf1[1])>>(8)) + ((194 * bf1[2])>>(8)) - ((239 * bf1[3])>>(8)) + ((256 * bf1[4])>>(8)) - ((243 * bf1[5])>>(8)) + ((202 * bf1[6])>>(8)) - ((137 * bf1[7])>>(8)) + ((56 * bf1[8])>>(8)) + ((31 * bf1[9])>>(8)) - ((115 * bf1[10])>>(8)) + ((185 * bf1[11])>>(8)) - ((234 * bf1[12])>>(8)) + ((255 * bf1[13])>>(8)) - ((247 * bf1[14])>>(8)) + ((209 * bf1[15])>>(8)) - ((147 * bf1[16])>>(8)) + ((68 * bf1[17])>>(8)) + ((19 * bf1[18])>>(8)) - ((104 * bf1[19])>>(8)) + ((177 * bf1[20])>>(8)) - ((229 * bf1[21])>>(8)) + ((254 * bf1[22])>>(8)) - ((250 * bf1[23])>>(8)) + ((216 * bf1[24])>>(8)) - ((157 * bf1[25])>>(8)) + ((80 * bf1[26])>>(8)) + ((6 * bf1[27])>>(8)) - ((92 * bf1[28])>>(8)) + ((167 * bf1[29])>>(8)) - ((223 * bf1[30])>>(8)) + ((252 * bf1[31])>>(8)) - ((252 * bf1[32])>>(8)) + ((223 * bf1[33])>>(8)) - ((167 * bf1[34])>>(8)) + ((92 * bf1[35])>>(8)) - ((6 * bf1[36])>>(8)) - ((80 * bf1[37])>>(8)) + ((157 * bf1[38])>>(8)) - ((216 * bf1[39])>>(8)) + ((250 * bf1[40])>>(8)) - ((254 * bf1[41])>>(8)) + ((229 * bf1[42])>>(8)) - ((177 * bf1[43])>>(8)) + ((104 * bf1[44])>>(8)) - ((19 * bf1[45])>>(8)) - ((68 * bf1[46])>>(8)) + ((147 * bf1[47])>>(8)) - ((209 * bf1[48])>>(8)) + ((247 * bf1[49])>>(8)) - ((255 * bf1[50])>>(8)) + ((234 * bf1[51])>>(8)) - ((185 * bf1[52])>>(8)) + ((115 * bf1[53])>>(8)) - ((31 * bf1[54])>>(8)) - ((56 * bf1[55])>>(8)) + ((137 * bf1[56])>>(8)) - ((202 * bf1[57])>>(8)) + ((243 * bf1[58])>>(8)) - ((256 * bf1[59])>>(8)) + ((239 * bf1[60])>>(8)) - ((194 * bf1[61])>>(8)) + ((126 * bf1[62])>>(8)) - ((44 * bf1[63])>>(8));
    bf0[58] = ((38 * bf1[0])>>(8)) - ((109 * bf1[1])>>(8)) + ((172 * bf1[2])>>(8)) - ((220 * bf1[3])>>(8)) + ((248 * bf1[4])>>(8)) - ((256 * bf1[5])>>(8)) + ((241 * bf1[6])>>(8)) - ((206 * bf1[7])>>(8)) + ((152 * bf1[8])>>(8)) - ((86 * bf1[9])>>(8)) + ((13 * bf1[10])>>(8)) + ((62 * bf1[11])>>(8)) - ((132 * bf1[12])>>(8)) + ((190 * bf1[13])>>(8)) - ((231 * bf1[14])>>(8)) + ((253 * bf1[15])>>(8)) - ((253 * bf1[16])>>(8)) + ((231 * bf1[17])>>(8)) - ((190 * bf1[18])>>(8)) + ((132 * bf1[19])>>(8)) - ((62 * bf1[20])>>(8)) - ((13 * bf1[21])>>(8)) + ((86 * bf1[22])>>(8)) - ((152 * bf1[23])>>(8)) + ((206 * bf1[24])>>(8)) - ((241 * bf1[25])>>(8)) + ((256 * bf1[26])>>(8)) - ((248 * bf1[27])>>(8)) + ((220 * bf1[28])>>(8)) - ((172 * bf1[29])>>(8)) + ((109 * bf1[30])>>(8)) - ((38 * bf1[31])>>(8)) - ((38 * bf1[32])>>(8)) + ((109 * bf1[33])>>(8)) - ((172 * bf1[34])>>(8)) + ((220 * bf1[35])>>(8)) - ((248 * bf1[36])>>(8)) + ((256 * bf1[37])>>(8)) - ((241 * bf1[38])>>(8)) + ((206 * bf1[39])>>(8)) - ((152 * bf1[40])>>(8)) + ((86 * bf1[41])>>(8)) - ((13 * bf1[42])>>(8)) - ((62 * bf1[43])>>(8)) + ((132 * bf1[44])>>(8)) - ((190 * bf1[45])>>(8)) + ((231 * bf1[46])>>(8)) - ((253 * bf1[47])>>(8)) + ((253 * bf1[48])>>(8)) - ((231 * bf1[49])>>(8)) + ((190 * bf1[50])>>(8)) - ((132 * bf1[51])>>(8)) + ((62 * bf1[52])>>(8)) + ((13 * bf1[53])>>(8)) - ((86 * bf1[54])>>(8)) + ((152 * bf1[55])>>(8)) - ((206 * bf1[56])>>(8)) + ((241 * bf1[57])>>(8)) - ((256 * bf1[58])>>(8)) + ((248 * bf1[59])>>(8)) - ((220 * bf1[60])>>(8)) + ((172 * bf1[61])>>(8)) - ((109 * bf1[62])>>(8)) + ((38 * bf1[63])>>(8));
    bf0[59] = ((31 * bf1[0])>>(8)) - ((92 * bf1[1])>>(8)) + ((147 * bf1[2])>>(8)) - ((194 * bf1[3])>>(8)) + ((229 * bf1[4])>>(8)) - ((250 * bf1[5])>>(8)) + ((256 * bf1[6])>>(8)) - ((247 * bf1[7])>>(8)) + ((223 * bf1[8])>>(8)) - ((185 * bf1[9])>>(8)) + ((137 * bf1[10])>>(8)) - ((80 * bf1[11])>>(8)) + ((19 * bf1[12])>>(8)) + ((44 * bf1[13])>>(8)) - ((104 * bf1[14])>>(8)) + ((157 * bf1[15])>>(8)) - ((202 * bf1[16])>>(8)) + ((234 * bf1[17])>>(8)) - ((252 * bf1[18])>>(8)) + ((255 * bf1[19])>>(8)) - ((243 * bf1[20])>>(8)) + ((216 * bf1[21])>>(8)) - ((177 * bf1[22])>>(8)) + ((126 * bf1[23])>>(8)) - ((68 * bf1[24])>>(8)) + ((6 * bf1[25])>>(8)) + ((56 * bf1[26])>>(8)) - ((115 * bf1[27])>>(8)) + ((167 * bf1[28])>>(8)) - ((209 * bf1[29])>>(8)) + ((239 * bf1[30])>>(8)) - ((254 * bf1[31])>>(8)) + ((254 * bf1[32])>>(8)) - ((239 * bf1[33])>>(8)) + ((209 * bf1[34])>>(8)) - ((167 * bf1[35])>>(8)) + ((115 * bf1[36])>>(8)) - ((56 * bf1[37])>>(8)) - ((6 * bf1[38])>>(8)) + ((68 * bf1[39])>>(8)) - ((126 * bf1[40])>>(8)) + ((177 * bf1[41])>>(8)) - ((216 * bf1[42])>>(8)) + ((243 * bf1[43])>>(8)) - ((255 * bf1[44])>>(8)) + ((252 * bf1[45])>>(8)) - ((234 * bf1[46])>>(8)) + ((202 * bf1[47])>>(8)) - ((157 * bf1[48])>>(8)) + ((104 * bf1[49])>>(8)) - ((44 * bf1[50])>>(8)) - ((19 * bf1[51])>>(8)) + ((80 * bf1[52])>>(8)) - ((137 * bf1[53])>>(8)) + ((185 * bf1[54])>>(8)) - ((223 * bf1[55])>>(8)) + ((247 * bf1[56])>>(8)) - ((256 * bf1[57])>>(8)) + ((250 * bf1[58])>>(8)) - ((229 * bf1[59])>>(8)) + ((194 * bf1[60])>>(8)) - ((147 * bf1[61])>>(8)) + ((92 * bf1[62])>>(8)) - ((31 * bf1[63])>>(8));
    bf0[60] = ((25 * bf1[0])>>(8)) - ((74 * bf1[1])>>(8)) + ((121 * bf1[2])>>(8)) - ((162 * bf1[3])>>(8)) + ((198 * bf1[4])>>(8)) - ((226 * bf1[5])>>(8)) + ((245 * bf1[6])>>(8)) - ((255 * bf1[7])>>(8)) + ((255 * bf1[8])>>(8)) - ((245 * bf1[9])>>(8)) + ((226 * bf1[10])>>(8)) - ((198 * bf1[11])>>(8)) + ((162 * bf1[12])>>(8)) - ((121 * bf1[13])>>(8)) + ((74 * bf1[14])>>(8)) - ((25 * bf1[15])>>(8)) - ((25 * bf1[16])>>(8)) + ((74 * bf1[17])>>(8)) - ((121 * bf1[18])>>(8)) + ((162 * bf1[19])>>(8)) - ((198 * bf1[20])>>(8)) + ((226 * bf1[21])>>(8)) - ((245 * bf1[22])>>(8)) + ((255 * bf1[23])>>(8)) - ((255 * bf1[24])>>(8)) + ((245 * bf1[25])>>(8)) - ((226 * bf1[26])>>(8)) + ((198 * bf1[27])>>(8)) - ((162 * bf1[28])>>(8)) + ((121 * bf1[29])>>(8)) - ((74 * bf1[30])>>(8)) + ((25 * bf1[31])>>(8)) + ((25 * bf1[32])>>(8)) - ((74 * bf1[33])>>(8)) + ((121 * bf1[34])>>(8)) - ((162 * bf1[35])>>(8)) + ((198 * bf1[36])>>(8)) - ((226 * bf1[37])>>(8)) + ((245 * bf1[38])>>(8)) - ((255 * bf1[39])>>(8)) + ((255 * bf1[40])>>(8)) - ((245 * bf1[41])>>(8)) + ((226 * bf1[42])>>(8)) - ((198 * bf1[43])>>(8)) + ((162 * bf1[44])>>(8)) - ((121 * bf1[45])>>(8)) + ((74 * bf1[46])>>(8)) - ((25 * bf1[47])>>(8)) - ((25 * bf1[48])>>(8)) + ((74 * bf1[49])>>(8)) - ((121 * bf1[50])>>(8)) + ((162 * bf1[51])>>(8)) - ((198 * bf1[52])>>(8)) + ((226 * bf1[53])>>(8)) - ((245 * bf1[54])>>(8)) + ((255 * bf1[55])>>(8)) - ((255 * bf1[56])>>(8)) + ((245 * bf1[57])>>(8)) - ((226 * bf1[58])>>(8)) + ((198 * bf1[59])>>(8)) - ((162 * bf1[60])>>(8)) + ((121 * bf1[61])>>(8)) - ((74 * bf1[62])>>(8)) + ((25 * bf1[63])>>(8));
    bf0[61] = ((19 * bf1[0])>>(8)) - ((56 * bf1[1])>>(8)) + ((92 * bf1[2])>>(8)) - ((126 * bf1[3])>>(8)) + ((157 * bf1[4])>>(8)) - ((185 * bf1[5])>>(8)) + ((209 * bf1[6])>>(8)) - ((229 * bf1[7])>>(8)) + ((243 * bf1[8])>>(8)) - ((252 * bf1[9])>>(8)) + ((256 * bf1[10])>>(8)) - ((254 * bf1[11])>>(8)) + ((247 * bf1[12])>>(8)) - ((234 * bf1[13])>>(8)) + ((216 * bf1[14])>>(8)) - ((194 * bf1[15])>>(8)) + ((167 * bf1[16])>>(8)) - ((137 * bf1[17])>>(8)) + ((104 * bf1[18])>>(8)) - ((68 * bf1[19])>>(8)) + ((31 * bf1[20])>>(8)) + ((6 * bf1[21])>>(8)) - ((44 * bf1[22])>>(8)) + ((80 * bf1[23])>>(8)) - ((115 * bf1[24])>>(8)) + ((147 * bf1[25])>>(8)) - ((177 * bf1[26])>>(8)) + ((202 * bf1[27])>>(8)) - ((223 * bf1[28])>>(8)) + ((239 * bf1[29])>>(8)) - ((250 * bf1[30])>>(8)) + ((255 * bf1[31])>>(8)) - ((255 * bf1[32])>>(8)) + ((250 * bf1[33])>>(8)) - ((239 * bf1[34])>>(8)) + ((223 * bf1[35])>>(8)) - ((202 * bf1[36])>>(8)) + ((177 * bf1[37])>>(8)) - ((147 * bf1[38])>>(8)) + ((115 * bf1[39])>>(8)) - ((80 * bf1[40])>>(8)) + ((44 * bf1[41])>>(8)) - ((6 * bf1[42])>>(8)) - ((31 * bf1[43])>>(8)) + ((68 * bf1[44])>>(8)) - ((104 * bf1[45])>>(8)) + ((137 * bf1[46])>>(8)) - ((167 * bf1[47])>>(8)) + ((194 * bf1[48])>>(8)) - ((216 * bf1[49])>>(8)) + ((234 * bf1[50])>>(8)) - ((247 * bf1[51])>>(8)) + ((254 * bf1[52])>>(8)) - ((256 * bf1[53])>>(8)) + ((252 * bf1[54])>>(8)) - ((243 * bf1[55])>>(8)) + ((229 * bf1[56])>>(8)) - ((209 * bf1[57])>>(8)) + ((185 * bf1[58])>>(8)) - ((157 * bf1[59])>>(8)) + ((126 * bf1[60])>>(8)) - ((92 * bf1[61])>>(8)) + ((56 * bf1[62])>>(8)) - ((19 * bf1[63])>>(8));
    bf0[62] = ((13 * bf1[0])>>(8)) - ((38 * bf1[1])>>(8)) + ((62 * bf1[2])>>(8)) - ((86 * bf1[3])>>(8)) + ((109 * bf1[4])>>(8)) - ((132 * bf1[5])>>(8)) + ((152 * bf1[6])>>(8)) - ((172 * bf1[7])>>(8)) + ((190 * bf1[8])>>(8)) - ((206 * bf1[9])>>(8)) + ((220 * bf1[10])>>(8)) - ((231 * bf1[11])>>(8)) + ((241 * bf1[12])>>(8)) - ((248 * bf1[13])>>(8)) + ((253 * bf1[14])>>(8)) - ((256 * bf1[15])>>(8)) + ((256 * bf1[16])>>(8)) - ((253 * bf1[17])>>(8)) + ((248 * bf1[18])>>(8)) - ((241 * bf1[19])>>(8)) + ((231 * bf1[20])>>(8)) - ((220 * bf1[21])>>(8)) + ((206 * bf1[22])>>(8)) - ((190 * bf1[23])>>(8)) + ((172 * bf1[24])>>(8)) - ((152 * bf1[25])>>(8)) + ((132 * bf1[26])>>(8)) - ((109 * bf1[27])>>(8)) + ((86 * bf1[28])>>(8)) - ((62 * bf1[29])>>(8)) + ((38 * bf1[30])>>(8)) - ((13 * bf1[31])>>(8)) - ((13 * bf1[32])>>(8)) + ((38 * bf1[33])>>(8)) - ((62 * bf1[34])>>(8)) + ((86 * bf1[35])>>(8)) - ((109 * bf1[36])>>(8)) + ((132 * bf1[37])>>(8)) - ((152 * bf1[38])>>(8)) + ((172 * bf1[39])>>(8)) - ((190 * bf1[40])>>(8)) + ((206 * bf1[41])>>(8)) - ((220 * bf1[42])>>(8)) + ((231 * bf1[43])>>(8)) - ((241 * bf1[44])>>(8)) + ((248 * bf1[45])>>(8)) - ((253 * bf1[46])>>(8)) + ((256 * bf1[47])>>(8)) - ((256 * bf1[48])>>(8)) + ((253 * bf1[49])>>(8)) - ((248 * bf1[50])>>(8)) + ((241 * bf1[51])>>(8)) - ((231 * bf1[52])>>(8)) + ((220 * bf1[53])>>(8)) - ((206 * bf1[54])>>(8)) + ((190 * bf1[55])>>(8)) - ((172 * bf1[56])>>(8)) + ((152 * bf1[57])>>(8)) - ((132 * bf1[58])>>(8)) + ((109 * bf1[59])>>(8)) - ((86 * bf1[60])>>(8)) + ((62 * bf1[61])>>(8)) - ((38 * bf1[62])>>(8)) + ((13 * bf1[63])>>(8));
    bf0[63] = ((6 * bf1[0])>>(8)) - ((19 * bf1[1])>>(8)) + ((31 * bf1[2])>>(8)) - ((44 * bf1[3])>>(8)) + ((56 * bf1[4])>>(8)) - ((68 * bf1[5])>>(8)) + ((80 * bf1[6])>>(8)) - ((92 * bf1[7])>>(8)) + ((104 * bf1[8])>>(8)) - ((115 * bf1[9])>>(8)) + ((126 * bf1[10])>>(8)) - ((137 * bf1[11])>>(8)) + ((147 * bf1[12])>>(8)) - ((157 * bf1[13])>>(8)) + ((167 * bf1[14])>>(8)) - ((177 * bf1[15])>>(8)) + ((185 * bf1[16])>>(8)) - ((194 * bf1[17])>>(8)) + ((202 * bf1[18])>>(8)) - ((209 * bf1[19])>>(8)) + ((216 * bf1[20])>>(8)) - ((223 * bf1[21])>>(8)) + ((229 * bf1[22])>>(8)) - ((234 * bf1[23])>>(8)) + ((239 * bf1[24])>>(8)) - ((243 * bf1[25])>>(8)) + ((247 * bf1[26])>>(8)) - ((250 * bf1[27])>>(8)) + ((252 * bf1[28])>>(8)) - ((254 * bf1[29])>>(8)) + ((255 * bf1[30])>>(8)) - ((256 * bf1[31])>>(8)) + ((256 * bf1[32])>>(8)) - ((255 * bf1[33])>>(8)) + ((254 * bf1[34])>>(8)) - ((252 * bf1[35])>>(8)) + ((250 * bf1[36])>>(8)) - ((247 * bf1[37])>>(8)) + ((243 * bf1[38])>>(8)) - ((239 * bf1[39])>>(8)) + ((234 * bf1[40])>>(8)) - ((229 * bf1[41])>>(8)) + ((223 * bf1[42])>>(8)) - ((216 * bf1[43])>>(8)) + ((209 * bf1[44])>>(8)) - ((202 * bf1[45])>>(8)) + ((194 * bf1[46])>>(8)) - ((185 * bf1[47])>>(8)) + ((177 * bf1[48])>>(8)) - ((167 * bf1[49])>>(8)) + ((157 * bf1[50])>>(8)) - ((147 * bf1[51])>>(8)) + ((137 * bf1[52])>>(8)) - ((126 * bf1[53])>>(8)) + ((115 * bf1[54])>>(8)) - ((104 * bf1[55])>>(8)) + ((92 * bf1[56])>>(8)) - ((80 * bf1[57])>>(8)) + ((68 * bf1[58])>>(8)) - ((56 * bf1[59])>>(8)) + ((44 * bf1[60])>>(8)) - ((31 * bf1[61])>>(8)) + ((19 * bf1[62])>>(8)) - ((6 * bf1[63])>>(8));
    */
}
