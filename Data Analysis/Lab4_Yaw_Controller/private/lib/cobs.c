/*
 * Riccardo Antonello (riccardo.antonello@unipd.it)
 * 
 * December 15, 2017
 *
 * Dept. of Information Engineering, University of Padova 
 *
 */

#include "simstruc.h"


/*	COBS encoding routine  */
#define FinishBlock(X) (*code_ptr = (X), code_ptr = dst++, code = 0x01)

void cobsEncode(const uint8_T *src, uint8_T length, uint8_T *dst)
{
    const uint8_T *src_end = src + length;
    uint8_T *code_ptr = dst++;
    uint8_T code = 0x01;
    
    while (src < src_end)
    {
        if (*src == 0)
            FinishBlock(code);
        else
        {
            *dst++ = *src;
            if (++code == 0xFF)
                FinishBlock(code);
        }
        src++;
    }
    
    FinishBlock(code);
}


/*	COBS decoding routine */
void cobsDecode(const uint8_T *src, uint8_T length, uint8_T *dst)
{
  const uint8_T *src_end = src + length;
  const uint8_T *dst_end = dst + length - 1;
  uint8_T code, i;

  while (src < src_end)
  {
    code = *src++;

    for (i = 1; dst < dst_end && i < code; i++)
      *dst++ = *src++;

    if (dst < dst_end && code < 0xFF)
      *dst++ = 0;
  }
}
