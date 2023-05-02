//1.c
#include"REG51.h"
#include"intrins.h"
#include "stdio.h"

#include "seg.h"

unsigned char key_can();
void seg_pro();
void led();
void key_pro();

char hour=9,min=31,sec=55;
int year =2023;
char month=1,day=12; 
char display_dat[8];
char display_char[10];
unsigned char flag_mode=0;//界面显示模式：0为日期和时间交替显示界面，1为调整小时界面，2为调整分钟界面
bit  flag_dayORtime=0;  //日期和时间模式标志

bit  flag_minute=0;     //整分到标志
bit  flag_200ms=0;      //0.2s到标志
unsigned char LED_count=0,LED_data=0xfe;

unsigned char key_new,key_old=0;

void main()
{
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
		led();
		key_pro();   
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
			flag_minute=1;
			sec=0;
			if(++min==0)
			{
				min=0;
				if(++hour==24) hour=0;
			}
		}
	}

	if(times%200==0)	   //0.2秒到——流水灯操作
		flag_200ms=1;	   //置0.2秒到标志位，在led_pro函数中处理

}

//数码管界面显示
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

//LED小灯
void led()
{
	if(flag_200ms)   //0.2秒到
	{
		flag_200ms=0;   //清0.2秒标志
		if(flag_minute)	//判断是否要流水
		{
			P1=LED_data;
			LED_data=_crol_(LED_data,1);
			if(++LED_count==17)	//次数达到16，也就是两轮流水
			{
				flag_minute=0;   //关闭整分标志
				LED_count=0;     //清除流水次数
				P1=0xff;	        //关闭LED灯
			}
		}
	}
}


//按键处理函数
void key_pro()
{ 
	key_new=key_can();  //获取按键定义值
	switch((key_new ^ key_old) & key_new)//下降沿判断按键
	{
		case 1://按下S1
			if(++flag_mode==3) flag_mode=0;    
				break;
		case 2: //按下S2
			if(flag_mode==1)  //如果是小时调整界面，就将小时增加 
			{
				if(++hour==24) hour=0;
			}
			else if(flag_mode==2)  //如果是分钟调整界面，就将分钟增加
			{
				if(++min==60) min=0;
			}  
			break;
		case 3:  //按下S3
			if(flag_mode==1) //如果是小时调整界面，就将小时减小
			{
				if(--hour==-1) hour=23;
			}
			else if(flag_mode==2)//如果是分钟调整界面，就将分钟减小
			{
				if(--min==-1) min=59;
			}
			break;
	}
	key_old=key_new;	 
}