/*
 * DCT_Timing_Anal.c
 *
 *      Author: moinocencio
 *
 *      Evaluate timing performance of developed architecture
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "DCTs.h"

const int vecIn[64] = {53, -155, -175, -206, -220, 105, 150, 18, 56, -152, -168, -200, -216, 104, 152, 24, 49, -159, -175, -206, -223, 105, 145, 17, 55, -153, -173, -201, -217, 103, 149, 23, 53, -155, -175, -206, -220, 105, 150, 18, 56, -155, -171, -203, -216, 100, 148, 20, 52, -158, -174, -206, -217, 97, 144, 18, 55, -152, -172, -238, -222, 102, 149, 20};

const int vecOutEx[5][64] = {
							{-350, 249, 127, 86},
							{-311, -384, 490, 367, -203, 290, 141, -80},
							{-600, -316, -4, -696, 979, 701, 12, 264, -399, 245, -1, 451, 282, -292, -4, 16},
							{-1223, -260, -1, -362, -7, -474, 4, -1375, 1954, 1386, 7, 479, 15, 310, 0, 213, -793, 229, 7, 241, 2, 361, -8, 806, 571, -668, -3, -169, -7, -29, 11, 80},
							{-2489, -218, -41, -240, -17, -322, -30, -357, -10, -399, 37, -586, 31, -980, 27, -2765, 3945, 2722, 43, 922, 38, 552, -10, 415, 5, 338, -32, 339, -48, 275, -45, 228, -1602, 264, -14, 254, -4, 248, 1, 204, 26, 299, 46, 341, 33, 544, 30, 1506, 1150, -1413, -14, -414, -23, -192, -22, -107, -39, -14, -28, 19, -14, 78, -38, 228}};

int vecOut[64];
const int vecSiz[5] = {4, 8, 16, 32, 64};
unsigned int DCTtime, InLoadTime, OutReadTime;

int main(){

    init_platform();

	xil_printf("Beginning DCT Timing Analysis\n\r");

	xil_printf("Disabling and Resetting...\n\r");
	setControlReg(0,0,1,0,0);

	for(int k = 0; k < 5; k++){

		xil_printf("Starting DCT%i:\nDisabling and Resetting...\n\r", vecSiz[k]);
		setControlReg(0,0,1,0,0);

		xil_printf("Loading Data...\n\r");
		setControlReg(0,0,0,1,0);
		for(int i = 0; i < vecSiz[k]; i++) {
			load_Data(i,vecIn[i]);
		}
		setControlReg(0,0,0,0,0);
		InLoadTime = get_InTime();

		xil_printf("Enabling and Waiting...\n\r");
		setControlReg(k,1,0,0,0);
		while(get_ValOut() == 0);

		xil_printf("Retrieving Data...\n\r");
		setControlReg(0,0,0,0,1);
		for(int i = 0; i < vecSiz[k]; i++){
			vecOut[i] = read_Data(i);
		}
		setControlReg(0,0,0,0,0);
		OutReadTime = get_OutTime();
		DCTtime = get_DCTTime();

		xil_printf("Number of Load In Cycles: %i\nNumber of DCT Cycles: %i\nNumber of Read Out Cycles: %i\n\r", InLoadTime, DCTtime, OutReadTime);

		for(int i = 0; i < vecSiz[k]; i++){
			if(vecOut[i] != vecOutEx[k][i])
				xil_printf("Wrong data!\ndataOut%i = | Expected = %i\n\r",vecOut[i], vecOutEx[k][i]);
		}
	}

	setControlReg(0,0,1,0,0);
	xil_printf("Exiting...\n\r");
	cleanup_platform();
    return 0;
}

