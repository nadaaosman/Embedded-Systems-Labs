#line 1 "C:/Daily use/Materials/Senior II Computer engineer/embedded system/LAB6/lab/req3.c"
GPIOE_ODR=0;
int main()
{
GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 );
GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
while(1)
{
 if(Button(&GPIOB_IDR, 0, 1, 1)))
 {
 if(!(GPIOE_ODR==0x000f))
 {GPIOE_ODR=GPIOE_ODR+1;
 }
 }
 if(Button(&GPIOB_IDR, 1, 1, 1)))
 {
 if(!(GPIOE_ODR==0))
 {GPIOE_ODR=GPIOE_ODR-1;
 }
 }
}
}
