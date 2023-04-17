#include<reg51.h>
#include <intrins.h>

unsigned char key_can()
{
   unsigned char i,n=0xfe;
   for(i=0;i<4;i++)
   {
      	P3=n;
		if(P3!=n)
			switch(P3)
			{
				case 0x7e:return 1;
				case 0x7d:return 2;
				case 0x7b:return 3;
			}
		n=_crol_(n,1);
   }
   return 0x00;
}