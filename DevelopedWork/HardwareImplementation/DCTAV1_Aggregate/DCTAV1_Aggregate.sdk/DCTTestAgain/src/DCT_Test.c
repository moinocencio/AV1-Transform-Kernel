/*
 * DCT_Test.c: Verify DCT Implementation
 *
 * Send Vector to DCT Kernel, retrieve output for various vector sizes,
 * and verify correct usage.
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "DCTs.h"

const int vecIn[64] = {53, -155, -175, -206, -220, 105, 150, 18, 56, -152, -168, -200, -216, 104, 152, 24, 49, -159, -175, -206, -223, 105, 145, 17, 55, -153, -173, -201, -217, 103, 149, 23, 53, -155, -175, -206, -220, 105, 150, 18, 56, -155, -171, -203, -216, 100, 148, 20, 52, -158, -174, -206, -217, 97, 144, 18, 55, -152, -172, -238, -222, 102, 149, 20};

const int vecOut4[4] = {-342, 247, 125, 80};
const int vecOut8[8] = {-311, -384, 490, 367, -203, 290, 141, -80};
const int vecOut16[16] = {-600, -316, -4, -696, 979, 701, 12, 264, -399, 245, -1, 451, 282, -292, -4, 16};
const int vecOut32[32] = {-1223, -260, -1, -362, -7, -474, 4, -1375, 1954, 1386, 7, 479, 15, 310, 0, 213, -793, 229, 7, 241, 2, 361, -8, 806, 571, -668, -3, -169, -7, -29, 11, 80};
const int vecOut64[64] = {-2489, -218, -41, -240, -17, -322, -30, -357, -10, -399, 37, -586, 31, -980, 27, -2765, 3945, 2722, 43, 922, 38, 552, -10, 415, 5, 338, -32, 339, -48, 275, -45, 228, -1602, 264, -14, 254, -4, 248, 1, 204, 26, 299, 46, 341, 33, 544, 30, 1506, 1150, -1413, -14, -414, -23, -192, -22, -107, -39, -14, -28, 19, -14, 78, -38, 228};
unsigned int DCTtime;


int main()
{
    init_platform();

	xil_printf("Begin DCT Test\n\r");

	DCTtime = get_Time();
	xil_printf("Current Number of cycles: %i\n\r", DCTtime);

	xil_printf("Disabling and Resetting...\n\r");
	setControlReg(4,0,1);

	DCTtime = get_Time();
	xil_printf("Re-checking Number of cycles: %i\n\r", DCTtime);

	xil_printf("Loading Data...\n\r");
	for(int i = 0; i < 64; i++){
		load_Data(i,vecIn[i]);
	}

	//xil_printf("Reading Outputs (before enable)\n\r");
	//for(int i = 0; i < 16; i++){
	//	xil_printf("dataOut%i = %i\n\r",i,read_Data(i));
	//}

	xil_printf("Enabling and Waiting...\n\r");
	setControlReg(4,1,0);
	while(get_ValOut() == 0);
	DCTtime = get_Time();

	xil_printf("Reading Outputs (after enable)\n\r");
	for(int i = 0; i < 64; i++){
		xil_printf("\ndataOut%i = %i\nExpected = %i\n\r",i,read_Data(i), vecOut64[i]);
	}

	xil_printf("Number of Cycles: %i\n\r", DCTtime);
	DCTtime = get_Time();
	xil_printf("Number of Cycles Again: %i\n\r", DCTtime);
	/*
	xil_printf("Loading Data...\n\r");
	for(int i = 0; i < 64; i++){
		load_Data(i,vecIn[i]);
	}
	setControlReg(2,0,1);

	xil_printf("Verifying Data Written\n\r");
	xil_printf("dataIn0 = %i\nslv_reg0 = %i\n",vecIn[0], read_Data(0));
	xil_printf("dataIn1 = %i\nslv_reg1 = %i\n",vecIn[1], read_Data(1));
	xil_printf("dataIn62 = %i\nslv_reg62 = %i\n",vecIn[62], read_Data(62));
	xil_printf("Control Data = %i\nslv_reg64 = %i\n",2 + (1<<4), read_Data(63));
	*/

	xil_printf("Resetting...\n\r");
	setControlReg(1,1,1);
	setControlReg(1,0,1);
	DCTtime = get_Time();
	xil_printf("Number of Cycles Again: %i\n\r", DCTtime);
	//xil_printf("Reading Outputs (after reset)\n\r");
	//for(int i = 0; i < 16; i++){
	//	xil_printf("dataOut%i = %i\n\r",i,read_Data(i));
	//}

    cleanup_platform();
    return 0;
}

