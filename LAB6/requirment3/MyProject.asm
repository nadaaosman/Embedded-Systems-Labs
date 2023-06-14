_main:
;MyProject.c,1 :: 		void main()
;MyProject.c,3 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 |  _GPIO_PINMASK_1  |  _GPIO_PINMASK_2 |  _GPIO_PINMASK_3  );
MOVW	R1, #15
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,4 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
MOVW	R1, #3
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;MyProject.c,5 :: 		GPIOE_ODR=0x0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,6 :: 		while(1)
L_main0:
;MyProject.c,8 :: 		if(Button(&GPIOB_IDR, 0, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;MyProject.c,10 :: 		if(!(GPIOD_ODR==0x000f))
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L_main3
;MyProject.c,11 :: 		{GPIOD_ODR=GPIOD_ODR+1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,12 :: 		}
L_main3:
;MyProject.c,13 :: 		while(Button(&GPIOB_IDR, 0, 1, 1))
L_main4:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main5
;MyProject.c,15 :: 		}
IT	AL
BAL	L_main4
L_main5:
;MyProject.c,16 :: 		}
L_main2:
;MyProject.c,17 :: 		if(Button(&GPIOB_IDR, 1, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main6
;MyProject.c,19 :: 		if(!(GPIOD_ODR==0))
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main7
;MyProject.c,20 :: 		{GPIOD_ODR=GPIOD_ODR-1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,21 :: 		}
L_main7:
;MyProject.c,22 :: 		while(Button(&GPIOB_IDR, 1, 1, 1))
L_main8:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main9
;MyProject.c,24 :: 		}
IT	AL
BAL	L_main8
L_main9:
;MyProject.c,25 :: 		}
L_main6:
;MyProject.c,26 :: 		}
IT	AL
BAL	L_main0
;MyProject.c,27 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
