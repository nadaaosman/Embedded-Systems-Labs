_main:
;req2.c,1 :: 		void main() {
SUB	SP, SP, #8
;req2.c,2 :: 		unsigned int period = 0;
;req2.c,4 :: 		while(1)
L_main0:
;req2.c,6 :: 		period = PWM_TIM1_Init(3800);
MOVW	R0, #3800
BL	_PWM_TIM1_Init+0
; period start address is: 4 (R1)
UXTH	R1, R0
;req2.c,7 :: 		for(i=0;i<period;i++)
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #4]
; period end address is: 4 (R1)
L_main2:
; period start address is: 4 (R1)
LDRSH	R0, [SP, #4]
CMP	R0, R1
IT	CS
BCS	L_main3
;req2.c,9 :: 		PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
STRH	R1, [SP, #0]
MOVS	R2, #3
MOVS	R1, #0
LDRSH	R0, [SP, #4]
BL	_PWM_TIM1_Set_Duty+0
;req2.c,10 :: 		PWM_TIM1_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM1_CH4_PE14 );
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVS	R0, #3
BL	_PWM_TIM1_Start+0
LDRH	R1, [SP, #0]
;req2.c,11 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req2.c,7 :: 		for(i=0;i<period;i++)
LDRSH	R0, [SP, #4]
ADDS	R0, R0, #1
STRH	R0, [SP, #4]
;req2.c,12 :: 		}
IT	AL
BAL	L_main2
L_main3:
;req2.c,15 :: 		for(i=period;i>-1;i--)
STRH	R1, [SP, #4]
; period end address is: 4 (R1)
L_main5:
LDRSH	R0, [SP, #4]
CMP	R0, #-1
IT	LE
BLE	L_main6
;req2.c,17 :: 		PWM_TIM1_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
LDRSH	R0, [SP, #4]
BL	_PWM_TIM1_Set_Duty+0
;req2.c,18 :: 		PWM_TIM1_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM1_CH4_PE14 );
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM1_CH4_PE14+0)
MOVS	R0, #3
BL	_PWM_TIM1_Start+0
;req2.c,19 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req2.c,15 :: 		for(i=period;i>-1;i--)
LDRSH	R0, [SP, #4]
SUBS	R0, R0, #1
STRH	R0, [SP, #4]
;req2.c,20 :: 		}
IT	AL
BAL	L_main5
L_main6:
;req2.c,22 :: 		}
IT	AL
BAL	L_main0
;req2.c,24 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
