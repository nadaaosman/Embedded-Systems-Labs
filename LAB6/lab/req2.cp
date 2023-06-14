#line 1 "C:/Daily use/Materials/Senior II Computer engineer/embedded system/LAB6/lab/req2.c"
int x=0x1111;
int y=0x1111;
int z=0;
GPIOD_ODR = 0x0;
GPIOE_ODR = 0x0;
void main() {
GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
while(1)
 {
if(z<4)
 {
GPIOD_ODR=GPIOD_ODR+x;
GPIOE_ODR =GPIOE_ODR+x ;
Delay_ms(100);
x=GPIOD_ODR>>1;
z=z+1;
}
else {
GPIOD_ODR=GPIOD_ODR-y;
GPIOE_ODR =GPIOE_ODR-y ;
Delay_ms(100);
y=GPIOD_ODR>>1;
z=z-1;
}
}
