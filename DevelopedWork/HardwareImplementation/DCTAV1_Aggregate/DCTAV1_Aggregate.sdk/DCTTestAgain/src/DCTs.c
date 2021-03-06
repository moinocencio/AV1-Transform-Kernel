/*
 * DCTs.c
 *
 *  Created on: Nov 14, 2019
 *      Author: moinocencio
 */

#include "DCTs.h"

void setControlReg(unsigned int selSt, unsigned int enSt, unsigned int resSt, unsigned int inClkEn, unsigned int outClkEn){
	unsigned int t_reg = selSt + (enSt<<3) + (resSt<<4) + (inClkEn<<5) + (outClkEn<<6);
	Xil_Out32(DCTSBASEADDR + data_off[64], t_reg);
}

void load_Data(unsigned int offset, int value){
	Xil_Out32(DCTSBASEADDR + data_off[offset], value);
}

int read_Data(unsigned int offset){
	return Xil_In32(DCTSBASEADDR + data_off[offset]);
}

unsigned int get_ValOut() {
	unsigned int t_reg = Xil_In32(DCTSBASEADDR + data_off[64]);
	return (t_reg & 0x01);
}

unsigned int get_DCTTime() {
	return (Xil_In32(DCTSBASEADDR + data_off[64])>>1);
}

unsigned int get_InTime() {
	return (Xil_In32(DCTSBASEADDR + data_off[65]));
}

unsigned int get_OutTime() {
	return (Xil_In32(DCTSBASEADDR + data_off[66]));
}
