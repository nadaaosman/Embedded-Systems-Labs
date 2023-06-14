_BoxRound1OnClick:
;MyProject_events_code.c,12 :: 		void BoxRound1OnClick(){
;MyProject_events_code.c,14 :: 		GPIOD_ODR = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,16 :: 		}
L_end_BoxRound1OnClick:
BX	LR
; end of _BoxRound1OnClick
_BoxRound2OnClick:
;MyProject_events_code.c,18 :: 		void BoxRound2OnClick(){
;MyProject_events_code.c,20 :: 		GPIOD_ODR = 0x0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,21 :: 		}
L_end_BoxRound2OnClick:
BX	LR
; end of _BoxRound2OnClick
_BoxRound3OnClick:
;MyProject_events_code.c,23 :: 		void BoxRound3OnClick(){
;MyProject_events_code.c,25 :: 		GPIOD_ODR = ~GPIOD_ODR ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
MVN	R1, R0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;MyProject_events_code.c,26 :: 		}
L_end_BoxRound3OnClick:
BX	LR
; end of _BoxRound3OnClick
_Label1OnClick:
;MyProject_events_code.c,27 :: 		void Label1OnClick() {
;MyProject_events_code.c,28 :: 		Label1.visible=  1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;MyProject_events_code.c,29 :: 		}
L_end_Label1OnClick:
BX	LR
; end of _Label1OnClick
_Label3OnClick:
;MyProject_events_code.c,30 :: 		void Label3OnClick() {
;MyProject_events_code.c,31 :: 		Label3.visible=  1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;MyProject_events_code.c,32 :: 		}
L_end_Label3OnClick:
BX	LR
; end of _Label3OnClick
