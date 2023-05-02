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
unsigned char flag_mode=0;//������ʾģʽ��0Ϊ���ں�ʱ�佻����ʾ���棬1Ϊ����Сʱ���棬2Ϊ�������ӽ���
bit  flag_dayORtime=0;  //���ں�ʱ��ģʽ��־

bit  flag_minute=0;     //���ֵ���־
bit  flag_200ms=0;      //0.2s����־
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
	if(times%1000==0)	 //1��
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

	if(times%200==0)	   //0.2�뵽������ˮ�Ʋ���
		flag_200ms=1;	   //��0.2�뵽��־λ����led_pro�����д���

}

//����ܽ�����ʾ
void seg_pro()		 
{	
	if(flag_mode==0) //���ں�ʱ�佻����ʾģʽ
	{
		if(!flag_dayORtime)//ʱ����ʾģʽ
		{		
			sprintf(display_char,"%02d-%02d-%02d",(int)hour,(int)min,(int)sec);
			char_to_code(display_char,display_dat);
		}
		else//������ʾģʽ
		{
			sprintf(display_char,"%4d%02d%02d",(int)year,(int)month,(int)day);
			char_to_code(display_char,display_dat);
		}
	}
	else if(flag_mode==1)//����Сʱģʽ
	{
		sprintf(display_char,"S1    %02d",(int)hour);
		char_to_code(display_char,display_dat);
	}
	else if(flag_mode==2)//��������ģʽ
	{
		sprintf(display_char,"S2    %02d",(int)min);
		char_to_code(display_char,display_dat);
	}
}

//LEDС��
void led()
{
	if(flag_200ms)   //0.2�뵽
	{
		flag_200ms=0;   //��0.2���־
		if(flag_minute)	//�ж��Ƿ�Ҫ��ˮ
		{
			P1=LED_data;
			LED_data=_crol_(LED_data,1);
			if(++LED_count==17)	//�����ﵽ16��Ҳ����������ˮ
			{
				flag_minute=0;   //�ر����ֱ�־
				LED_count=0;     //�����ˮ����
				P1=0xff;	        //�ر�LED��
			}
		}
	}
}


//����������
void key_pro()
{ 
	key_new=key_can();  //��ȡ��������ֵ
	switch((key_new ^ key_old) & key_new)//�½����жϰ���
	{
		case 1://����S1
			if(++flag_mode==3) flag_mode=0;    
				break;
		case 2: //����S2
			if(flag_mode==1)  //�����Сʱ�������棬�ͽ�Сʱ���� 
			{
				if(++hour==24) hour=0;
			}
			else if(flag_mode==2)  //����Ƿ��ӵ������棬�ͽ���������
			{
				if(++min==60) min=0;
			}  
			break;
		case 3:  //����S3
			if(flag_mode==1) //�����Сʱ�������棬�ͽ�Сʱ��С
			{
				if(--hour==-1) hour=23;
			}
			else if(flag_mode==2)//����Ƿ��ӵ������棬�ͽ����Ӽ�С
			{
				if(--min==-1) min=59;
			}
			break;
	}
	key_old=key_new;	 
}