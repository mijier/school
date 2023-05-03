#include "reg51.h"
#include "intrins.h"
#include "stdio.h"

unsigned char key_can();
void SEG_refresh(unsigned char *p);
void char_to_code(unsigned char *p,unsigned char *q);

void seg_pro();
void led();
void key_pro();

unsigned char  display_char[10];
unsigned char  display_dat[8];
unsigned char hour=9,min=31,sec=55;
bit flag_dayORtime=0;
bit flag_200ms=0;
bit flag_minute=0;
char flag_mode=0;
unsigned int year=2023,month=5,day=5;
char key_new,key_old=0;
unsigned char LED_data=0xfe,LED_count=0;
void main()
{
	sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);
	char_to_code(display_char,display_dat);

	TMOD=0x01;
	TH0=0xFC;
	TL0=0x18;
	TR0=1;
	ET0=1;
	EA=1;

	while(1)
	{
		seg_pro();
		led();
		key_pro();		
	}
}

void timer0() interrupt 1
{
	static unsigned int times=0;
	times++;
	SEG_refresh(display_dat);
	TH0=0xFC;
	TL0=0x18;
	if(times==3000)
	{
		times=0;
		flag_dayORtime=~flag_dayORtime;
	}
	if(times%1000==0)
	{
		if(++sec==60)
		{
			sec=0;
			flag_minute=1;
			if(++min==60)
			{
				min=0;
				if(++hour==24)hour=0;
			}
		}
	}
	if(times%200==0)
	{
		flag_200ms=1;
	}
}

void seg_pro()
{
	if(flag_mode==0)
	{
		if(!flag_dayORtime)
		{
			sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);
			char_to_code(display_char,display_dat);
		}else
		{
			sprintf(display_char,"%04d%02d%02d",(int)year,(int)month,(int)day);
			char_to_code(display_char,display_dat);		
		}
	}
	if(flag_mode==1)
	{
		sprintf(display_char,"S1    %02d",(int)hour);
		char_to_code(display_char,display_dat);
	}
	if(flag_mode==2)
	{
		sprintf(display_char,"S2    %02d",(int)min);
		char_to_code(display_char,display_dat);
	}
}
void led()
{
	if(flag_200ms)
	{
		flag_200ms=0;
		if(flag_minute)
		{
			P1=LED_data;
			LED_data=_crol_(LED_data,1);
			if(++LED_count==17)
			{
				 flag_minute=0;
				 LED_count=0;
				 P1=0xff;
			}
		}
	}
}

void key_pro()
{
	key_new=key_can();
	switch((key_new^key_old)&key_new)
	{
		case 1:
				if(++flag_mode==3)flag_mode=0;break;
		case 2:
				if(flag_mode==1)
				{
					if(++hour==24)hour=0;
				}
				if(flag_mode==2)
				{
					if(++min==60)min=0;
				}
				break;
		case 3:
				if(flag_mode==1)
				{
					if(--hour==-1)hour=23;
				}
				if(flag_mode==2)
				{
					if(--min==-1)min=59;
				}
				break;
	}
	key_old=key_new;
}











