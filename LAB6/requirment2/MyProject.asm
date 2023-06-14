_main:
;MyProject.c,5 :: 		void main() {
;MyProject.c,6 :: 		GPIO_Digital_Output(&GPIOD_BASE, _GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,7 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_HIGH);
MOVW	R1, #65280
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject.c,8 :: 		GPIOD_ODR = 0x0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,9 :: 		GPIOE_ODR = 0x0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,10 :: 		while(1)
L_main0:
;MyProject.c,12 :: 		for(i=0;i<4;i++)
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
STRH	R1, [R0, #0]
L_main2:
MOVW	R0, #lo_addr(_i+0)
MOVT	R0, #hi_addr(_i+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	GE
BGE	L_main3
;MyProject.c,14 :: 		GPIOD_ODR=GPIOD_ODR|x;
MOVW	R2, #lo_addr(_x+0)
MOVT	R2, #hi_addr(_x+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,15 :: 		GPIOE_ODR =GPIOE_ODR|x ;
MOV	R0, R2
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,16 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main5:
SUBS	R7, R7, #1
BNE	L_main5
NOP
NOP
NOP
NOP
;MyProject.c,17 :: 		x=GPIOD_ODR<<1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
;MyProject.c,12 :: 		for(i=0;i<4;i++)
MOVW	R1, #lo_addr(_i+0)
MOVT	R1, #hi_addr(_i+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject.c,18 :: 		}
IT	AL
BAL	L_main2
L_main3:
;MyProject.c,19 :: 		x=0x1111;
MOVW	R1, #4369
SXTH	R1, R1
MOVW	R0, #lo_addr(_x+0)
MOVT	R0, #hi_addr(_x+0)
STRH	R1, [R0, #0]
;MyProject.c,20 :: 		for(j=0;j<4;j++){
MOVS	R1, #0
SXTH	R1, R1
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
STRH	R1, [R0, #0]
L_main7:
MOVW	R0, #lo_addr(_j+0)
MOVT	R0, #hi_addr(_j+0)
LDRSH	R0, [R0, #0]
CMP	R0, #4
IT	GE
BGE	L_main8
;MyProject.c,21 :: 		GPIOD_ODR=GPIOD_ODR^y;
MOVW	R2, #lo_addr(_y+0)
MOVT	R2, #hi_addr(_y+0)
LDRSH	R1, [R2, #0]
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,22 :: 		GPIOE_ODR =GPIOE_ODR^y ;
MOV	R0, R2
LDRSH	R1, [R0, #0]
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;MyProject.c,23 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
NOP
NOP
;MyProject.c,24 :: 		y=GPIOD_ODR<<1;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
STRH	R1, [R0, #0]
;MyProject.c,20 :: 		for(j=0;j<4;j++){
MOVW	R1, #lo_addr(_j+0)
MOVT	R1, #hi_addr(_j+0)
LDRSH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MyProject.c,25 :: 		}
IT	AL
BAL	L_main7
L_main8:
;MyProject.c,26 :: 		y=0x1111;
MOVW	R1, #4369
SXTH	R1, R1
MOVW	R0, #lo_addr(_y+0)
MOVT	R0, #hi_addr(_y+0)
STRH	R1, [R0, #0]
;MyProject.c,27 :: 		}
IT	AL
BAL	L_main0
;MyProject.c,28 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
