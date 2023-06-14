_main:
;MyProject_main.c,19 :: 		void main() {
;MyProject_main.c,21 :: 		Start_TP();
BL	_Start_TP+0
;MyProject_main.c,23 :: 		GPIO_Digital_Input(&GPIOC_BASE, _GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Input+0
;MyProject_main.c,24 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject_main.c,26 :: 		state=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
;MyProject_main.c,27 :: 		while (1) {
L_main0:
;MyProject_main.c,28 :: 		Check_TP();
BL	_Check_TP+0
;MyProject_main.c,29 :: 		if(Button(&GPIOC_IDR, 0,1, 1) )
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;MyProject_main.c,31 :: 		if(state==1)
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRSH	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_main3
;MyProject_main.c,33 :: 		DrawScreen(&Screen2)  ;
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
BL	_DrawScreen+0
;MyProject_main.c,34 :: 		state=2;
MOVS	R1, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
;MyProject_main.c,35 :: 		}
IT	AL
BAL	L_main4
L_main3:
;MyProject_main.c,36 :: 		else if(state==2)
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
LDRSH	R0, [R0, #0]
CMP	R0, #2
IT	NE
BNE	L_main5
;MyProject_main.c,37 :: 		{   DrawScreen(&Screen1)  ;
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_main.c,38 :: 		state=1;
MOVS	R1, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_state+0)
MOVT	R0, #hi_addr(_state+0)
STRH	R1, [R0, #0]
;MyProject_main.c,39 :: 		}
L_main5:
L_main4:
;MyProject_main.c,40 :: 		}
L_main2:
;MyProject_main.c,42 :: 		}
IT	AL
BAL	L_main0
;MyProject_main.c,43 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
