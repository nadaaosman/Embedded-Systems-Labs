_main:
;lab6.c,2 :: 		int main()
;lab6.c,4 :: 		GPIOE_ODR=0x0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;lab6.c,5 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_0 |  _GPIO_PINMASK_1  |  _GPIO_PINMASK_2 |  _GPIO_PINMASK_3  );
MOVW	R1, #15
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;lab6.c,6 :: 		GPIO_Digital_Input(&GPIOB_BASE, _GPIO_PINMASK_0 | _GPIO_PINMASK_1);
MOVW	R1, #3
MOVW	R0, #lo_addr(GPIOB_BASE+0)
MOVT	R0, #hi_addr(GPIOB_BASE+0)
BL	_GPIO_Digital_Input+0
;lab6.c,7 :: 		while(1)
L_main0:
;lab6.c,9 :: 		if(Button(&GPIOB_IDR, 0, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;lab6.c,11 :: 		if(!(GPIOE_ODR==0x000f))
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #15
IT	EQ
BEQ	L_main3
;lab6.c,12 :: 		{GPIOE_ODR=GPIOE_ODR+1;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
ADDS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;lab6.c,13 :: 		}
L_main3:
;lab6.c,14 :: 		}
L_main2:
;lab6.c,15 :: 		if(Button(&GPIOB_IDR, 1, 1, 1))
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;lab6.c,17 :: 		if(!(GPIOE_ODR==0))
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main5
;lab6.c,18 :: 		{GPIOE_ODR=GPIOE_ODR-1;
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
SUBS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;lab6.c,19 :: 		}
L_main5:
;lab6.c,20 :: 		}
L_main4:
;lab6.c,21 :: 		}
IT	AL
BAL	L_main0
;lab6.c,22 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
