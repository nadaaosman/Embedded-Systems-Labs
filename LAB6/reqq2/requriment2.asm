_main:
;requriment2.c,1 :: 		int main()
;requriment2.c,3 :: 		GPIOE_ODR=0x0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;requriment2.c,4 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 |  _GPIO_PINMASK_1  |  _GPIO_PINMASK_2 |  _GPIO_PINMASK_3  );
MOVW	R1, #15
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;requriment2.c,5 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
MOVW	R1, #3
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;requriment2.c,6 :: 		while(1)
L_main0:
;requriment2.c,8 :: 		if(Button(&GPIOB_IDR, 0, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;requriment2.c,10 :: 		if(!(GPIOE_ODR==0x000f))
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L_main3
;requriment2.c,11 :: 		{GPIOE_ODR=GPIOE_ODR+1;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;requriment2.c,12 :: 		}
L_main3:
;requriment2.c,13 :: 		}
L_main2:
;requriment2.c,14 :: 		if(Button(&GPIOB_IDR, 1, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;requriment2.c,16 :: 		if(!(GPIOE_ODR==0))
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;requriment2.c,17 :: 		{GPIOE_ODR=GPIOE_ODR-1;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;requriment2.c,18 :: 		}
L_main5:
;requriment2.c,19 :: 		}
L_main4:
;requriment2.c,20 :: 		}
IT	AL
BAL	L_main0
;requriment2.c,21 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
