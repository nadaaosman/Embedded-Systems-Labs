int x=0x1111;
int y=0x1111;
int i;
int j;
void main() {
GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
GPIOD_ODR = 0x0;
GPIOE_ODR = 0x0;
while(1)
{
for(i=0;i<4;i++)
{
GPIOD_ODR=GPIOD_ODR|x;
GPIOE_ODR =GPIOE_ODR|x ;
Delay_ms(100);
x=GPIOD_ODR<<1;
}
 x=0x1111;
for(j=0;j<4;j++){
GPIOD_ODR=GPIOD_ODR^y;
GPIOE_ODR =GPIOE_ODR^y ;
Delay_ms(100);
y=GPIOD_ODR<<1;
}
y=0x1111;
}
}