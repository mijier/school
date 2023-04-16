//1.c
#include"REG51.h"
#include"intrins.h"
#include "stdio.h"
#include "seg.h"

void seg_pro();

char hour=9,min=31,sec=10;
int year =2023;
char month=1,day=12; 
char display_dat[8];
char display_char[10];
unsigned char flag_mode=0;
bit  flag_dayORtime=0;  //日期和时间模式标志

void main()
{
	unsigned int m;
	sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);		 
	char_to_code(display_char,display_dat);

	TMOD=0x01;
	TH0=0XFC;
	TL0=0X18;
	TR0=1;
	ET0=1;
	EA=1;
	
	while(1)
	{
		seg_pro();
		//SEG_refresh(display_dat);
		//for(m=0;m<500;m++);	   
	}
}

void timer0() interrupt 1
{	
	
	static unsigned int times=0;
	TH0=0XFC;
	TL0=0X18;
	times++;
	SEG_refresh(display_dat);
	if(times==3000)
	{
		flag_dayORtime= ~flag_dayORtime;
		times=0;
	}
	if(times%1000==0)	 //1秒
	{
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


}

void seg_pro()		 
{	
	if(flag_mode==0) //日期和时间交替显示模式
	{
		if(!flag_dayORtime)//时间显示模式
		{		
			sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);
			char_to_code(display_char,display_dat);
		}
		else//日期显示模式
		{
			sprintf(display_char,"%4d%02d%02d",(int)year,(int)month,(int)day);
			char_to_code(display_char,display_dat);
		}
	}
	else if(flag_mode==1)//调整小时模式
	{
		sprintf(display_char,"S1    %02d",(int)hour);
		char_to_code(display_char,display_dat);
	}
	else if(flag_mode==2)//调整分钟模式
	{
		sprintf(display_char,"S2    %02d",(int)min);
		char_to_code(display_char,display_dat);
	}
}

