  void main()
{
GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 |  _GPIO_PINMASK_1  |  _GPIO_PINMASK_2 |  _GPIO_PINMASK_3  );
GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
GPIOE_ODR=0x0;
while(1)
{
    if(Button(&GPIOB_IDR, 0, 1, 1))
    {
    if(!(GPIOD_ODR==0x000f))
    {GPIOD_ODR=GPIOD_ODR+1;
    }
    while(Button(&GPIOB_IDR, 0, 1, 1))
    {
    }
    }
    if(Button(&GPIOB_IDR, 1, 1, 1))
    {
    if(!(GPIOD_ODR==0))
    {GPIOD_ODR=GPIOD_ODR-1;
    }
     while(Button(&GPIOB_IDR, 1, 1, 1))
    {
    }
    }
}
}