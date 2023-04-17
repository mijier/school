//1.c
#include"REG51.h"
#include"intrins.h"
#include "stdio.h"
#include "seg.h"

char hour=9,min=31,sec=10;
char display_dat[8];
char display_char[10];

void main()
{
	unsigned int m;
	sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);		 
	char_to_code(display_char,display_dat);

	TMOD=0x01;
	TH0=0x3c;
	TL0=0xB0;
	TR0=1;
	ET0=1;
	EA=1;
	
	while(1)
	{
		SEG_refresh(display_dat);
		for(m=0;m<500;m++);	   
	}
}

void timer0() interrupt 1
{
	static char times=0;
	TH0=0x3c;
	TL0=0xB0;
	times++;
	if(times==20)
	{
		times=0;
		if(++sec==60)
		{
			sec=0;
			if(++min==0)
			{
				min=0;
				if(++hour==24) hour=0;
			}
		}	
	}
	
	sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);		 
	char_to_code(display_char,display_dat);
}