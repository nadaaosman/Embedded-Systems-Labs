#line 1 "C:/Daily use/Materials/Senior II Computer engineer/embedded system/LAB7/req3.c"
void main() {
unsigned int period = 0;
int i;
int counter;
while(1)
{
period = PWM_TIM4_Init(3800);
for(counter=0;counter<4;counter++)
{
for(i=0;i<period;i++)
{
if(counter==0)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
PWM_TIM4_Start(_PWM_CHANNEL1,&_GPIO_MODULE_TIM4_CH1_PD12);
Delay_1ms();
}
if(counter==1)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
PWM_TIM4_Start(_PWM_CHANNEL2,&_GPIO_MODULE_TIM4_CH2_PD13 );
Delay_1ms();
}
if(counter==2)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
PWM_TIM4_Start(_PWM_CHANNEL3,&_GPIO_MODULE_TIM4_CH3_PD14);
Delay_1ms();
}
if(counter==3)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM4_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM4_CH4_PD15 );
Delay_1ms();
}
}
}

for(counter=0;counter<4;counter++)
{
for(i=period;i>-1;i--)
{
if(counter==0)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
PWM_TIM4_Start(_PWM_CHANNEL1,&_GPIO_MODULE_TIM4_CH1_PD12);
Delay_1ms();
}
if(counter==1)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
PWM_TIM4_Start(_PWM_CHANNEL2,&_GPIO_MODULE_TIM4_CH2_PD13 );
Delay_1ms();
}
if(counter==2)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
PWM_TIM4_Start(_PWM_CHANNEL3,&_GPIO_MODULE_TIM4_CH3_PD14);
Delay_1ms();
}
if(counter==3)
{
PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM4_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM4_CH4_PD15 );
Delay_1ms();
}
}
}
}
}
