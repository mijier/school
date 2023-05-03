#include "reg51.h"
#include "intrins.h"
#include "stdio.h"

unsigned char code display_code[]={'S',0X92,' ',0xff,'0',0xC0,'1',0xF9,'2',0xA4,'3',0xB0,'4',0x99,'5',0x92,'6',0x82,'7',0xF8,'8',0x80,'9',0x90,'-',0xbf};

void SEG_refresh(unsigned char *p)
{
	static char i=0,x=0xfe;

	P2=0xff;
	P0=x;
	P2=p[i];

	x=_crol_(x,1);
	i++;

	if(i==8)i=0;
}

void char_to_code(unsigned char *p,unsigned char *q)
{
	static char i,j,k;
	for(j=0,k=0;k<8;k++,j++)
	{
		for(i=0;i<15;i++)
		{
			if(p[j]==display_code[2*i])
			{
				 q[k]=display_code[2*i+1];
				 break;
			}
		}
	}

}