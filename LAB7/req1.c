void main() {
unsigned int period = 0;

period = PWM_TIM1_Init(500);
PWM_TIM1_Set_Duty(0.2*period, _PWM_NON_INVERTED, _PWM_CHANNEL4);
PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
//PWM_TIM1_Stop(_PWM_CHANNEL4);
while(1)
{}

}