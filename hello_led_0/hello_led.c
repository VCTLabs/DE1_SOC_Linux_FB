
#include "basic_io.h"
#include "SD_Card.h"

int main(void)
{
  UINT16 i=0,Tmp1=0,Tmp2=0;
  UINT32 j=720;
  BYTE Buffer[512]={0};

  while(SD_card_init())
  usleep(500000);
  
  while(1)
  {
    SD_read_lba(Buffer,j,1);
    while(i<512)
    {
      if(!IORD(AUDIO_0_BASE,0))
      {
        Tmp1=(Buffer[i+1]<<8)|Buffer[i];
        IOWR(AUDIO_0_BASE,0,Tmp1);
        i+=2;
      }
    }
    if(j%64==0)
    {
      Tmp2=Tmp1*Tmp1;
      IOWR(LED_RED_BASE,0,Tmp2);
      IOWR(LED_GREEN_BASE,0,Tmp1);
    }
    IOWR(SEG7_DISPLAY_BASE,0,j);
    j++;
    i=0;
  }
 
  return 0;
}

//-------------------------------------------------------------------------


