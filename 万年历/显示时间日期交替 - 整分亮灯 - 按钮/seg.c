//seg.c
#include"REG51.h"
#include"intrins.h"
#include "stdio.h"
#include "seg.h"

unsigned char code display_code[]={'C',0xc6,' ',0xff,'0',0xc0,'1',0xf9,'2',0xa4,'3',0xb0,'4',0x99,'5',0x92,'6',0x82,'7',0xf8,'8',0x80,'9',0x90,'-',0xbf};

void SEG_refresh(unsigned char *p)
{
	static char x=0xfe;	   // 1111 1110
	static unsigned int i=0;

	P2=0xff;
	P0=x;
	P2=p[i];
	x=_crol_(x,1);
	i++;
	if(i==8)  i=0;

}

void char_to_code(unsigned char *p,unsigned char *q)	 //	display_char是p,display_dat是q
{
	unsigned int i,j,k;
	for(k=0,j=0;k<8;j++,k++)
	{
		  for(i=0;i<13;i++)
		  {
		  	if(p[j]==display_code[2*i])
			{
				q[k]=display_code[2*i+1];
				break;
			}
			if(p[j+1]=='.')
			{
				q[k]=q[k] & 0x7f;//将最高位置为0，即显示小数点		  
				j++;
			}
		  }
	}
}