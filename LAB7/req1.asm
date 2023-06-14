_main:
;req1.c,1 :: 		void main() {
;req1.c,2 :: 		unsigned int period = 0;
;req1.c,4 :: 		period = PWM_TIM1_Init(500);
MOVW	R0, #500
BL	_PWM_TIM1_Init+0
;req1.c,5 :: 		PWM_TIM1_Set_Duty(100, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
MOVS	R0, #100
BL	_PWM_TIM1_Set_Duty+0
;req1.c,6 :: 		PWM_TIM1_Start(_PWM_CHANNEL4, &_GPIO_MODULE_TIM1_CH4_PE14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVS	R0, #3
BL	_PWM_TIM1_Start+0
;req1.c,8 :: 		while(1)
L_main0:
;req1.c,9 :: 		{}
IT	AL
BAL	L_main0
;req1.c,11 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
