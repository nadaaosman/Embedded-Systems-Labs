_main:
;req3.c,1 :: 		void main() {
SUB	SP, SP, #8
;req3.c,2 :: 		unsigned int period = 0;
;req3.c,5 :: 		while(1)
L_main0:
;req3.c,7 :: 		period = PWM_TIM4_Init(3800);
MOVW	R0, #3800
BL	_PWM_TIM4_Init+0
STRH	R0, [SP, #4]
;req3.c,8 :: 		for(counter=0;counter<4;counter++)
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
L_main2:
LDRSH	R0, [SP, #2]
CMP	R0, #4
IT	GE
BGE	L_main3
;req3.c,10 :: 		for(i=0;i<period;i++)
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
L_main5:
LDRH	R1, [SP, #4]
LDRSH	R0, [SP, #0]
CMP	R0, R1
IT	CS
BCS	L_main6
;req3.c,12 :: 		if(counter==0)
LDRSH	R0, [SP, #2]
CMP	R0, #0
IT	NE
BNE	L_main8
;req3.c,14 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,15 :: 		PWM_TIM4_Start(_PWM_CHANNEL1,&_GPIO_MODULE_TIM4_CH1_PD12);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;req3.c,16 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,17 :: 		}
L_main8:
;req3.c,18 :: 		if(counter==1)
LDRSH	R0, [SP, #2]
CMP	R0, #1
IT	NE
BNE	L_main9
;req3.c,20 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,21 :: 		PWM_TIM4_Start(_PWM_CHANNEL2,&_GPIO_MODULE_TIM4_CH2_PD13 );
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;req3.c,22 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,23 :: 		}
L_main9:
;req3.c,24 :: 		if(counter==2)
LDRSH	R0, [SP, #2]
CMP	R0, #2
IT	NE
BNE	L_main10
;req3.c,26 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,27 :: 		PWM_TIM4_Start(_PWM_CHANNEL3,&_GPIO_MODULE_TIM4_CH3_PD14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;req3.c,28 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,29 :: 		}
L_main10:
;req3.c,30 :: 		if(counter==3)
LDRSH	R0, [SP, #2]
CMP	R0, #3
IT	NE
BNE	L_main11
;req3.c,32 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,33 :: 		PWM_TIM4_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM4_CH4_PD15 );
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;req3.c,34 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,35 :: 		}
L_main11:
;req3.c,10 :: 		for(i=0;i<period;i++)
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;req3.c,36 :: 		}
IT	AL
BAL	L_main5
L_main6:
;req3.c,8 :: 		for(counter=0;counter<4;counter++)
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #1
STRH	R0, [SP, #2]
;req3.c,37 :: 		}
IT	AL
BAL	L_main2
L_main3:
;req3.c,39 :: 		for(counter=0;counter<4;counter++)
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
L_main12:
LDRSH	R0, [SP, #2]
CMP	R0, #4
IT	GE
BGE	L_main13
;req3.c,41 :: 		for(i=period;i>-1;i--)
LDRH	R0, [SP, #4]
STRH	R0, [SP, #0]
L_main15:
LDRSH	R0, [SP, #0]
CMP	R0, #-1
IT	LE
BLE	L_main16
;req3.c,43 :: 		if(counter==0)
LDRSH	R0, [SP, #2]
CMP	R0, #0
IT	NE
BNE	L_main18
;req3.c,45 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL1);
MOVS	R2, #0
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,46 :: 		PWM_TIM4_Start(_PWM_CHANNEL1,&_GPIO_MODULE_TIM4_CH1_PD12);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH1_PD12+0)
MOVS	R0, #0
BL	_PWM_TIM4_Start+0
;req3.c,47 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,48 :: 		}
L_main18:
;req3.c,49 :: 		if(counter==1)
LDRSH	R0, [SP, #2]
CMP	R0, #1
IT	NE
BNE	L_main19
;req3.c,51 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL2);
MOVS	R2, #1
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,52 :: 		PWM_TIM4_Start(_PWM_CHANNEL2,&_GPIO_MODULE_TIM4_CH2_PD13 );
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH2_PD13+0)
MOVS	R0, #1
BL	_PWM_TIM4_Start+0
;req3.c,53 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,54 :: 		}
L_main19:
;req3.c,55 :: 		if(counter==2)
LDRSH	R0, [SP, #2]
CMP	R0, #2
IT	NE
BNE	L_main20
;req3.c,57 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL3);
MOVS	R2, #2
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,58 :: 		PWM_TIM4_Start(_PWM_CHANNEL3,&_GPIO_MODULE_TIM4_CH3_PD14);
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH3_PD14+0)
MOVS	R0, #2
BL	_PWM_TIM4_Start+0
;req3.c,59 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,60 :: 		}
L_main20:
;req3.c,61 :: 		if(counter==3)
LDRSH	R0, [SP, #2]
CMP	R0, #3
IT	NE
BNE	L_main21
;req3.c,63 :: 		PWM_TIM4_Set_Duty(i, _PWM_NON_INVERTED, _PWM_CHANNEL4);
MOVS	R2, #3
MOVS	R1, #0
LDRSH	R0, [SP, #0]
BL	_PWM_TIM4_Set_Duty+0
;req3.c,64 :: 		PWM_TIM4_Start(_PWM_CHANNEL4,&_GPIO_MODULE_TIM4_CH4_PD15 );
MOVW	R1, #lo_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVT	R1, #hi_addr(__GPIO_MODULE_TIM4_CH4_PD15+0)
MOVS	R0, #3
BL	_PWM_TIM4_Start+0
;req3.c,65 :: 		Delay_1ms();
BL	_Delay_1ms+0
;req3.c,66 :: 		}
L_main21:
;req3.c,41 :: 		for(i=period;i>-1;i--)
LDRSH	R0, [SP, #0]
SUBS	R0, R0, #1
STRH	R0, [SP, #0]
;req3.c,67 :: 		}
IT	AL
BAL	L_main15
L_main16:
;req3.c,39 :: 		for(counter=0;counter<4;counter++)
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #1
STRH	R0, [SP, #2]
;req3.c,68 :: 		}
IT	AL
BAL	L_main12
L_main13:
;req3.c,69 :: 		}
IT	AL
BAL	L_main0
;req3.c,70 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
