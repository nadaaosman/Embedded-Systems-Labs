void main() {
GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
while(1)
    {
GPIOD_ODR = 0xFFFF;
GPIOE_ODR = 0xFFFF;
Delay_ms(500);
GPIOD_ODR = 0;
GPIOE_ODR = 0;
Delay_ms(500);
}
}