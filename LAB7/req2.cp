#line 1 "C:/Daily use/Materials/Senior II Computer engineer/embedded system/LAB7/req2.c"
void main() {
unsigned int period = 0;
int i;
while(1)
{
period = PWM_TIM1_Init(3800);
for(i=0;i<period;i++)
{
PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM1_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM1_CH4_PE14 );
Delay_1ms();
}


for(i=period;i>-1;i--)
{
PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM1_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM1_CH4_PE14 );
Delay_1ms();
}

}

}
