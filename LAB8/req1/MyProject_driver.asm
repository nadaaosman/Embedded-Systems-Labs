_Init_ADC:
;MyProject_driver.c,52 :: 		void Init_ADC() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,53 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9);
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;MyProject_driver.c,54 :: 		ADC1_Init();
BL	_ADC1_Init+0
;MyProject_driver.c,55 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_Init_ADC0:
SUBS	R7, R7, #1
BNE	L_Init_ADC0
NOP
NOP
NOP
NOP
;MyProject_driver.c,56 :: 		}
L_end_Init_ADC:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_ADC
MyProject_driver_InitializeTouchPanel:
;MyProject_driver.c,57 :: 		static void InitializeTouchPanel() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,58 :: 		Init_ADC();
BL	_Init_ADC+0
;MyProject_driver.c,59 :: 		TFT_Init_ILI9341_8bit(320, 240);
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;MyProject_driver.c,61 :: 		TP_TFT_Init(320, 240, 8, 9);                                  // Initialize touch panel
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;MyProject_driver.c,62 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;MyProject_driver.c,64 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,65 :: 		PressedObject = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PressedObject+0)
MOVT	R0, #hi_addr(_PressedObject+0)
STR	R1, [R0, #0]
;MyProject_driver.c,66 :: 		PressedObjectType = -1;
MOVW	R1, #65535
SXTH	R1, R1
MOVW	R0, #lo_addr(_PressedObjectType+0)
MOVT	R0, #hi_addr(_PressedObjectType+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,67 :: 		}
L_end_InitializeTouchPanel:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of MyProject_driver_InitializeTouchPanel
_Calibrate:
;MyProject_driver.c,69 :: 		void Calibrate() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,70 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;MyProject_driver.c,71 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;MyProject_driver.c,72 :: 		TFT_Write_Text("Touch selected corners for calibration", 50, 80);
MOVW	R0, #lo_addr(?lstr1_MyProject_driver+0)
MOVT	R0, #hi_addr(?lstr1_MyProject_driver+0)
MOVS	R2, #80
MOVS	R1, #50
BL	_TFT_Write_Text+0
;MyProject_driver.c,73 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,74 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,75 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,76 :: 		TFT_Write_Text("first here", 210, 220);
MOVW	R0, #lo_addr(?lstr2_MyProject_driver+0)
MOVT	R0, #hi_addr(?lstr2_MyProject_driver+0)
MOVS	R2, #220
MOVS	R1, #210
BL	_TFT_Write_Text+0
;MyProject_driver.c,78 :: 		TP_TFT_Calibrate_Min();                      // Calibration of TP minimum
BL	_TP_TFT_Calibrate_Min+0
;MyProject_driver.c,79 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate2:
SUBS	R7, R7, #1
BNE	L_Calibrate2
NOP
NOP
;MyProject_driver.c,81 :: 		TFT_Set_Pen(CL_BLACK, 3);
MOVS	R1, #3
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;MyProject_driver.c,82 :: 		TFT_Set_Font(TFT_defaultFont, CL_BLACK, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #0
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;MyProject_driver.c,83 :: 		TFT_Line(315, 239, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #239
SXTH	R1, R1
MOVW	R0, #315
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,84 :: 		TFT_Line(309, 229, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #229
SXTH	R1, R1
MOVW	R0, #309
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,85 :: 		TFT_Line(319, 234, 319, 239);
MOVS	R3, #239
SXTH	R3, R3
MOVW	R2, #319
SXTH	R2, R2
MOVS	R1, #234
SXTH	R1, R1
MOVW	R0, #319
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,86 :: 		TFT_Write_Text("first here", 210, 220);
MOVW	R0, #lo_addr(?lstr3_MyProject_driver+0)
MOVT	R0, #hi_addr(?lstr3_MyProject_driver+0)
MOVS	R2, #220
MOVS	R1, #210
BL	_TFT_Write_Text+0
;MyProject_driver.c,88 :: 		TFT_Set_Pen(CL_WHITE, 3);
MOVS	R1, #3
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;MyProject_driver.c,89 :: 		TFT_Set_Font(TFT_defaultFont, CL_WHITE, FO_HORIZONTAL);
MOVS	R2, #0
MOVW	R1, #65535
MOVW	R0, #lo_addr(_TFT_defaultFont+0)
MOVT	R0, #hi_addr(_TFT_defaultFont+0)
BL	_TFT_Set_Font+0
;MyProject_driver.c,90 :: 		TFT_Write_Text("now here ", 20, 5);
MOVW	R0, #lo_addr(?lstr4_MyProject_driver+0)
MOVT	R0, #hi_addr(?lstr4_MyProject_driver+0)
MOVS	R2, #5
MOVS	R1, #20
BL	_TFT_Write_Text+0
;MyProject_driver.c,91 :: 		TFT_Line(0, 0, 5, 0);
MOVS	R3, #0
SXTH	R3, R3
MOVS	R2, #5
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,92 :: 		TFT_Line(0, 0, 0, 5);
MOVS	R3, #5
SXTH	R3, R3
MOVS	R2, #0
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,93 :: 		TFT_Line(0, 0, 10, 10);
MOVS	R3, #10
SXTH	R3, R3
MOVS	R2, #10
SXTH	R2, R2
MOVS	R1, #0
SXTH	R1, R1
MOVS	R0, #0
SXTH	R0, R0
BL	_TFT_Line+0
;MyProject_driver.c,95 :: 		TP_TFT_Calibrate_Max();                       // Calibration of TP maximum
BL	_TP_TFT_Calibrate_Max+0
;MyProject_driver.c,96 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Calibrate4:
SUBS	R7, R7, #1
BNE	L_Calibrate4
NOP
NOP
;MyProject_driver.c,97 :: 		}
L_end_Calibrate:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Calibrate
MyProject_driver_InitializeObjects:
;MyProject_driver.c,166 :: 		static void InitializeObjects() {
;MyProject_driver.c,167 :: 		Screen1.Color                     = 0x07E0;
MOVW	R1, #2016
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,168 :: 		Screen1.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,169 :: 		Screen1.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,170 :: 		Screen1.LabelsCount               = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen1+8)
MOVT	R0, #hi_addr(_Screen1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,171 :: 		Screen1.Labels                    = Screen1_Labels;
MOVW	R1, #lo_addr(_Screen1_Labels+0)
MOVT	R1, #hi_addr(_Screen1_Labels+0)
MOVW	R0, #lo_addr(_Screen1+12)
MOVT	R0, #hi_addr(_Screen1+12)
STR	R1, [R0, #0]
;MyProject_driver.c,172 :: 		Screen1.CLabelsCount              = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen1+16)
MOVT	R0, #hi_addr(_Screen1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,173 :: 		Screen1.CLabels                   = Screen1_CLabels;
MOVW	R1, #lo_addr(_Screen1_CLabels+0)
MOVT	R1, #hi_addr(_Screen1_CLabels+0)
MOVW	R0, #lo_addr(_Screen1+20)
MOVT	R0, #hi_addr(_Screen1+20)
STR	R1, [R0, #0]
;MyProject_driver.c,174 :: 		Screen1.ImagesCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+24)
MOVT	R0, #hi_addr(_Screen1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,175 :: 		Screen1.BoxesCount                = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen1+32)
MOVT	R0, #hi_addr(_Screen1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,176 :: 		Screen1.Boxes_RoundCount          = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen1+40)
MOVT	R0, #hi_addr(_Screen1+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,177 :: 		Screen1.Boxes_Round               = Screen1_Boxes_Round;
MOVW	R1, #lo_addr(_Screen1_Boxes_Round+0)
MOVT	R1, #hi_addr(_Screen1_Boxes_Round+0)
MOVW	R0, #lo_addr(_Screen1+44)
MOVT	R0, #hi_addr(_Screen1+44)
STR	R1, [R0, #0]
;MyProject_driver.c,178 :: 		Screen1.ObjectsCount              = 6;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Screen1+6)
MOVT	R0, #hi_addr(_Screen1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,180 :: 		Screen2.Color                     = 0xFFFF;
MOVW	R1, #65535
MOVW	R0, #lo_addr(_Screen2+0)
MOVT	R0, #hi_addr(_Screen2+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,181 :: 		Screen2.Width                     = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Screen2+2)
MOVT	R0, #hi_addr(_Screen2+2)
STRH	R1, [R0, #0]
;MyProject_driver.c,182 :: 		Screen2.Height                    = 240;
MOVS	R1, #240
MOVW	R0, #lo_addr(_Screen2+4)
MOVT	R0, #hi_addr(_Screen2+4)
STRH	R1, [R0, #0]
;MyProject_driver.c,183 :: 		Screen2.LabelsCount               = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+8)
MOVT	R0, #hi_addr(_Screen2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,184 :: 		Screen2.CLabelsCount              = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+16)
MOVT	R0, #hi_addr(_Screen2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,185 :: 		Screen2.ImagesCount               = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Screen2+24)
MOVT	R0, #hi_addr(_Screen2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,186 :: 		Screen2.Images                    = Screen2_Images;
MOVW	R1, #lo_addr(_Screen2_Images+0)
MOVT	R1, #hi_addr(_Screen2_Images+0)
MOVW	R0, #lo_addr(_Screen2+28)
MOVT	R0, #hi_addr(_Screen2+28)
STR	R1, [R0, #0]
;MyProject_driver.c,187 :: 		Screen2.BoxesCount                = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Screen2+32)
MOVT	R0, #hi_addr(_Screen2+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,188 :: 		Screen2.Boxes                     = Screen2_Boxes;
MOVW	R1, #lo_addr(_Screen2_Boxes+0)
MOVT	R1, #hi_addr(_Screen2_Boxes+0)
MOVW	R0, #lo_addr(_Screen2+36)
MOVT	R0, #hi_addr(_Screen2+36)
STR	R1, [R0, #0]
;MyProject_driver.c,189 :: 		Screen2.Boxes_RoundCount          = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Screen2+40)
MOVT	R0, #hi_addr(_Screen2+40)
STRH	R1, [R0, #0]
;MyProject_driver.c,190 :: 		Screen2.ObjectsCount              = 3;
MOVS	R1, #3
MOVW	R0, #lo_addr(_Screen2+6)
MOVT	R0, #hi_addr(_Screen2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,193 :: 		BoxRound1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound1+0)
MOVT	R0, #hi_addr(_BoxRound1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,194 :: 		BoxRound1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+4)
MOVT	R0, #hi_addr(_BoxRound1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,195 :: 		BoxRound1.Left            = 27;
MOVS	R1, #27
MOVW	R0, #lo_addr(_BoxRound1+6)
MOVT	R0, #hi_addr(_BoxRound1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,196 :: 		BoxRound1.Top             = 10;
MOVS	R1, #10
MOVW	R0, #lo_addr(_BoxRound1+8)
MOVT	R0, #hi_addr(_BoxRound1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,197 :: 		BoxRound1.Width           = 248;
MOVS	R1, #248
MOVW	R0, #lo_addr(_BoxRound1+10)
MOVT	R0, #hi_addr(_BoxRound1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,198 :: 		BoxRound1.Height          = 65;
MOVS	R1, #65
MOVW	R0, #lo_addr(_BoxRound1+12)
MOVT	R0, #hi_addr(_BoxRound1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,199 :: 		BoxRound1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+14)
MOVT	R0, #hi_addr(_BoxRound1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,200 :: 		BoxRound1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+16)
MOVT	R0, #hi_addr(_BoxRound1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,201 :: 		BoxRound1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+18)
MOVT	R0, #hi_addr(_BoxRound1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,202 :: 		BoxRound1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+19)
MOVT	R0, #hi_addr(_BoxRound1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,203 :: 		BoxRound1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+20)
MOVT	R0, #hi_addr(_BoxRound1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,204 :: 		BoxRound1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound1+21)
MOVT	R0, #hi_addr(_BoxRound1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,205 :: 		BoxRound1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+22)
MOVT	R0, #hi_addr(_BoxRound1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,206 :: 		BoxRound1.Gradient_Start_Color = 0xFFE6;
MOVW	R1, #65510
MOVW	R0, #lo_addr(_BoxRound1+24)
MOVT	R0, #hi_addr(_BoxRound1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,207 :: 		BoxRound1.Gradient_End_Color = 0xFB20;
MOVW	R1, #64288
MOVW	R0, #lo_addr(_BoxRound1+26)
MOVT	R0, #hi_addr(_BoxRound1+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,208 :: 		BoxRound1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound1+28)
MOVT	R0, #hi_addr(_BoxRound1+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,209 :: 		BoxRound1.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound1+31)
MOVT	R0, #hi_addr(_BoxRound1+31)
STRB	R1, [R0, #0]
;MyProject_driver.c,210 :: 		BoxRound1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound1+32)
MOVT	R0, #hi_addr(_BoxRound1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,211 :: 		BoxRound1.Corner_Radius   = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BoxRound1+30)
MOVT	R0, #hi_addr(_BoxRound1+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,212 :: 		BoxRound1.OnClickPtr      = BoxRound1OnClick;
MOVW	R1, #lo_addr(_BoxRound1OnClick+0)
MOVT	R1, #hi_addr(_BoxRound1OnClick+0)
MOVW	R0, #lo_addr(_BoxRound1+44)
MOVT	R0, #hi_addr(_BoxRound1+44)
STR	R1, [R0, #0]
;MyProject_driver.c,214 :: 		BoxRound2.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound2+0)
MOVT	R0, #hi_addr(_BoxRound2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,215 :: 		BoxRound2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+4)
MOVT	R0, #hi_addr(_BoxRound2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,216 :: 		BoxRound2.Left            = 25;
MOVS	R1, #25
MOVW	R0, #lo_addr(_BoxRound2+6)
MOVT	R0, #hi_addr(_BoxRound2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,217 :: 		BoxRound2.Top             = 83;
MOVS	R1, #83
MOVW	R0, #lo_addr(_BoxRound2+8)
MOVT	R0, #hi_addr(_BoxRound2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,218 :: 		BoxRound2.Width           = 249;
MOVS	R1, #249
MOVW	R0, #lo_addr(_BoxRound2+10)
MOVT	R0, #hi_addr(_BoxRound2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,219 :: 		BoxRound2.Height          = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_BoxRound2+12)
MOVT	R0, #hi_addr(_BoxRound2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,220 :: 		BoxRound2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+14)
MOVT	R0, #hi_addr(_BoxRound2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,221 :: 		BoxRound2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+16)
MOVT	R0, #hi_addr(_BoxRound2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,222 :: 		BoxRound2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+18)
MOVT	R0, #hi_addr(_BoxRound2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,223 :: 		BoxRound2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+19)
MOVT	R0, #hi_addr(_BoxRound2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,224 :: 		BoxRound2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+20)
MOVT	R0, #hi_addr(_BoxRound2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,225 :: 		BoxRound2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound2+21)
MOVT	R0, #hi_addr(_BoxRound2+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,226 :: 		BoxRound2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+22)
MOVT	R0, #hi_addr(_BoxRound2+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,227 :: 		BoxRound2.Gradient_Start_Color = 0x367F;
MOVW	R1, #13951
MOVW	R0, #lo_addr(_BoxRound2+24)
MOVT	R0, #hi_addr(_BoxRound2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,228 :: 		BoxRound2.Gradient_End_Color = 0x319F;
MOVW	R1, #12703
MOVW	R0, #lo_addr(_BoxRound2+26)
MOVT	R0, #hi_addr(_BoxRound2+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,229 :: 		BoxRound2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound2+28)
MOVT	R0, #hi_addr(_BoxRound2+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,230 :: 		BoxRound2.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound2+31)
MOVT	R0, #hi_addr(_BoxRound2+31)
STRB	R1, [R0, #0]
;MyProject_driver.c,231 :: 		BoxRound2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound2+32)
MOVT	R0, #hi_addr(_BoxRound2+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,232 :: 		BoxRound2.Corner_Radius   = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BoxRound2+30)
MOVT	R0, #hi_addr(_BoxRound2+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,233 :: 		BoxRound2.OnClickPtr      = BoxRound2OnClick;
MOVW	R1, #lo_addr(_BoxRound2OnClick+0)
MOVT	R1, #hi_addr(_BoxRound2OnClick+0)
MOVW	R0, #lo_addr(_BoxRound2+44)
MOVT	R0, #hi_addr(_BoxRound2+44)
STR	R1, [R0, #0]
;MyProject_driver.c,235 :: 		Label1.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label1+0)
MOVT	R0, #hi_addr(_Label1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,236 :: 		Label1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Label1+4)
MOVT	R0, #hi_addr(_Label1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,237 :: 		Label1.Left            = 43;
MOVS	R1, #43
MOVW	R0, #lo_addr(_Label1+6)
MOVT	R0, #hi_addr(_Label1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,238 :: 		Label1.Top             = 21;
MOVS	R1, #21
MOVW	R0, #lo_addr(_Label1+8)
MOVT	R0, #hi_addr(_Label1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,239 :: 		Label1.Width           = 219;
MOVS	R1, #219
MOVW	R0, #lo_addr(_Label1+10)
MOVT	R0, #hi_addr(_Label1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,240 :: 		Label1.Height          = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label1+12)
MOVT	R0, #hi_addr(_Label1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,241 :: 		Label1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+27)
MOVT	R0, #hi_addr(_Label1+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,242 :: 		Label1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label1+28)
MOVT	R0, #hi_addr(_Label1+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,243 :: 		Label1.Caption         = Label1_Caption;
MOVW	R1, #lo_addr(_Label1_Caption+0)
MOVT	R1, #hi_addr(_Label1_Caption+0)
MOVW	R0, #lo_addr(_Label1+16)
MOVT	R0, #hi_addr(_Label1+16)
STR	R1, [R0, #0]
;MyProject_driver.c,244 :: 		Label1.FontName        = Tahoma26x33_Regular;
MOVW	R2, #lo_addr(_Tahoma26x33_Regular+0)
MOVT	R2, #hi_addr(_Tahoma26x33_Regular+0)
MOVW	R0, #lo_addr(_Label1+20)
MOVT	R0, #hi_addr(_Label1+20)
STR	R2, [R0, #0]
;MyProject_driver.c,245 :: 		Label1.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+24)
MOVT	R0, #hi_addr(_Label1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,246 :: 		Label1.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label1+26)
MOVT	R0, #hi_addr(_Label1+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,247 :: 		Label1.OnClickPtr      = Label1OnClick;
MOVW	R1, #lo_addr(_Label1OnClick+0)
MOVT	R1, #hi_addr(_Label1OnClick+0)
MOVW	R0, #lo_addr(_Label1+40)
MOVT	R0, #hi_addr(_Label1+40)
STR	R1, [R0, #0]
;MyProject_driver.c,249 :: 		BoxRound3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_BoxRound3+0)
MOVT	R0, #hi_addr(_BoxRound3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,250 :: 		BoxRound3.Order           = 4;
MOVS	R1, #4
MOVW	R0, #lo_addr(_BoxRound3+4)
MOVT	R0, #hi_addr(_BoxRound3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,251 :: 		BoxRound3.Left            = 29;
MOVS	R1, #29
MOVW	R0, #lo_addr(_BoxRound3+6)
MOVT	R0, #hi_addr(_BoxRound3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,252 :: 		BoxRound3.Top             = 161;
MOVS	R1, #161
MOVW	R0, #lo_addr(_BoxRound3+8)
MOVT	R0, #hi_addr(_BoxRound3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,253 :: 		BoxRound3.Width           = 243;
MOVS	R1, #243
MOVW	R0, #lo_addr(_BoxRound3+10)
MOVT	R0, #hi_addr(_BoxRound3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,254 :: 		BoxRound3.Height          = 61;
MOVS	R1, #61
MOVW	R0, #lo_addr(_BoxRound3+12)
MOVT	R0, #hi_addr(_BoxRound3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,255 :: 		BoxRound3.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+14)
MOVT	R0, #hi_addr(_BoxRound3+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,256 :: 		BoxRound3.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound3+16)
MOVT	R0, #hi_addr(_BoxRound3+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,257 :: 		BoxRound3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+18)
MOVT	R0, #hi_addr(_BoxRound3+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,258 :: 		BoxRound3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+19)
MOVT	R0, #hi_addr(_BoxRound3+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,259 :: 		BoxRound3.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+20)
MOVT	R0, #hi_addr(_BoxRound3+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,260 :: 		BoxRound3.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_BoxRound3+21)
MOVT	R0, #hi_addr(_BoxRound3+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,261 :: 		BoxRound3.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound3+22)
MOVT	R0, #hi_addr(_BoxRound3+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,262 :: 		BoxRound3.Gradient_Start_Color = 0xF993;
MOVW	R1, #63891
MOVW	R0, #lo_addr(_BoxRound3+24)
MOVT	R0, #hi_addr(_BoxRound3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,263 :: 		BoxRound3.Gradient_End_Color = 0xC999;
MOVW	R1, #51609
MOVW	R0, #lo_addr(_BoxRound3+26)
MOVT	R0, #hi_addr(_BoxRound3+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,264 :: 		BoxRound3.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_BoxRound3+28)
MOVT	R0, #hi_addr(_BoxRound3+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,265 :: 		BoxRound3.PressColEnabled = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_BoxRound3+31)
MOVT	R0, #hi_addr(_BoxRound3+31)
STRB	R1, [R0, #0]
;MyProject_driver.c,266 :: 		BoxRound3.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_BoxRound3+32)
MOVT	R0, #hi_addr(_BoxRound3+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,267 :: 		BoxRound3.Corner_Radius   = 20;
MOVS	R1, #20
MOVW	R0, #lo_addr(_BoxRound3+30)
MOVT	R0, #hi_addr(_BoxRound3+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,268 :: 		BoxRound3.OnClickPtr      = BoxRound3OnClick;
MOVW	R1, #lo_addr(_BoxRound3OnClick+0)
MOVT	R1, #hi_addr(_BoxRound3OnClick+0)
MOVW	R0, #lo_addr(_BoxRound3+44)
MOVT	R0, #hi_addr(_BoxRound3+44)
STR	R1, [R0, #0]
;MyProject_driver.c,270 :: 		Label3.OwnerScreen     = &Screen1;
MOVW	R1, #lo_addr(_Screen1+0)
MOVT	R1, #hi_addr(_Screen1+0)
MOVW	R0, #lo_addr(_Label3+0)
MOVT	R0, #hi_addr(_Label3+0)
STR	R1, [R0, #0]
;MyProject_driver.c,271 :: 		Label3.Order           = 5;
MOVS	R1, #5
MOVW	R0, #lo_addr(_Label3+4)
MOVT	R0, #hi_addr(_Label3+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,272 :: 		Label3.Left            = 69;
MOVS	R1, #69
MOVW	R0, #lo_addr(_Label3+6)
MOVT	R0, #hi_addr(_Label3+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,273 :: 		Label3.Top             = 173;
MOVS	R1, #173
MOVW	R0, #lo_addr(_Label3+8)
MOVT	R0, #hi_addr(_Label3+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,274 :: 		Label3.Width           = 159;
MOVS	R1, #159
MOVW	R0, #lo_addr(_Label3+10)
MOVT	R0, #hi_addr(_Label3+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,275 :: 		Label3.Height          = 36;
MOVS	R1, #36
MOVW	R0, #lo_addr(_Label3+12)
MOVT	R0, #hi_addr(_Label3+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,276 :: 		Label3.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+27)
MOVT	R0, #hi_addr(_Label3+27)
STRB	R1, [R0, #0]
;MyProject_driver.c,277 :: 		Label3.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Label3+28)
MOVT	R0, #hi_addr(_Label3+28)
STRB	R1, [R0, #0]
;MyProject_driver.c,278 :: 		Label3.Caption         = Label3_Caption;
MOVW	R1, #lo_addr(_Label3_Caption+0)
MOVT	R1, #hi_addr(_Label3_Caption+0)
MOVW	R0, #lo_addr(_Label3+16)
MOVT	R0, #hi_addr(_Label3+16)
STR	R1, [R0, #0]
;MyProject_driver.c,279 :: 		Label3.FontName        = Tahoma26x33_Regular;
MOVW	R0, #lo_addr(_Label3+20)
MOVT	R0, #hi_addr(_Label3+20)
STR	R2, [R0, #0]
;MyProject_driver.c,280 :: 		Label3.Font_Color      = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+24)
MOVT	R0, #hi_addr(_Label3+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,281 :: 		Label3.VerticalText    = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Label3+26)
MOVT	R0, #hi_addr(_Label3+26)
STRB	R1, [R0, #0]
;MyProject_driver.c,282 :: 		Label3.OnClickPtr      = Label3OnClick;
MOVW	R1, #lo_addr(_Label3OnClick+0)
MOVT	R1, #hi_addr(_Label3OnClick+0)
MOVW	R0, #lo_addr(_Label3+40)
MOVT	R0, #hi_addr(_Label3+40)
STR	R1, [R0, #0]
;MyProject_driver.c,284 :: 		Box1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Box1+0)
MOVT	R0, #hi_addr(_Box1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,285 :: 		Box1.Order           = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+4)
MOVT	R0, #hi_addr(_Box1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,286 :: 		Box1.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+6)
MOVT	R0, #hi_addr(_Box1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,287 :: 		Box1.Top             = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+8)
MOVT	R0, #hi_addr(_Box1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,288 :: 		Box1.Width           = 319;
MOVW	R1, #319
MOVW	R0, #lo_addr(_Box1+10)
MOVT	R0, #hi_addr(_Box1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,289 :: 		Box1.Height          = 79;
MOVS	R1, #79
MOVW	R0, #lo_addr(_Box1+12)
MOVT	R0, #hi_addr(_Box1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,290 :: 		Box1.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+14)
MOVT	R0, #hi_addr(_Box1+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,291 :: 		Box1.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+16)
MOVT	R0, #hi_addr(_Box1+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,292 :: 		Box1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+18)
MOVT	R0, #hi_addr(_Box1+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,293 :: 		Box1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+19)
MOVT	R0, #hi_addr(_Box1+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,294 :: 		Box1.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+20)
MOVT	R0, #hi_addr(_Box1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,295 :: 		Box1.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+21)
MOVT	R0, #hi_addr(_Box1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,296 :: 		Box1.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box1+22)
MOVT	R0, #hi_addr(_Box1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,297 :: 		Box1.Gradient_Start_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Box1+24)
MOVT	R0, #hi_addr(_Box1+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,298 :: 		Box1.Gradient_End_Color = 0xF800;
MOVW	R1, #63488
MOVW	R0, #lo_addr(_Box1+26)
MOVT	R0, #hi_addr(_Box1+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,299 :: 		Box1.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box1+28)
MOVT	R0, #hi_addr(_Box1+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,300 :: 		Box1.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box1+30)
MOVT	R0, #hi_addr(_Box1+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,301 :: 		Box1.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box1+32)
MOVT	R0, #hi_addr(_Box1+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,303 :: 		Box2.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Box2+0)
MOVT	R0, #hi_addr(_Box2+0)
STR	R1, [R0, #0]
;MyProject_driver.c,304 :: 		Box2.Order           = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+4)
MOVT	R0, #hi_addr(_Box2+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,305 :: 		Box2.Left            = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+6)
MOVT	R0, #hi_addr(_Box2+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,306 :: 		Box2.Top             = 152;
MOVS	R1, #152
MOVW	R0, #lo_addr(_Box2+8)
MOVT	R0, #hi_addr(_Box2+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,307 :: 		Box2.Width           = 320;
MOVW	R1, #320
MOVW	R0, #lo_addr(_Box2+10)
MOVT	R0, #hi_addr(_Box2+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,308 :: 		Box2.Height          = 85;
MOVS	R1, #85
MOVW	R0, #lo_addr(_Box2+12)
MOVT	R0, #hi_addr(_Box2+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,309 :: 		Box2.Pen_Width       = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+14)
MOVT	R0, #hi_addr(_Box2+14)
STRB	R1, [R0, #0]
;MyProject_driver.c,310 :: 		Box2.Pen_Color       = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+16)
MOVT	R0, #hi_addr(_Box2+16)
STRH	R1, [R0, #0]
;MyProject_driver.c,311 :: 		Box2.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+18)
MOVT	R0, #hi_addr(_Box2+18)
STRB	R1, [R0, #0]
;MyProject_driver.c,312 :: 		Box2.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+19)
MOVT	R0, #hi_addr(_Box2+19)
STRB	R1, [R0, #0]
;MyProject_driver.c,313 :: 		Box2.Transparent     = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+20)
MOVT	R0, #hi_addr(_Box2+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,314 :: 		Box2.Gradient        = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+21)
MOVT	R0, #hi_addr(_Box2+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,315 :: 		Box2.Gradient_Orientation = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+22)
MOVT	R0, #hi_addr(_Box2+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,316 :: 		Box2.Gradient_Start_Color = 0x0006;
MOVS	R1, #6
MOVW	R0, #lo_addr(_Box2+24)
MOVT	R0, #hi_addr(_Box2+24)
STRH	R1, [R0, #0]
;MyProject_driver.c,317 :: 		Box2.Gradient_End_Color = 0x0000;
MOVS	R1, #0
MOVW	R0, #lo_addr(_Box2+26)
MOVT	R0, #hi_addr(_Box2+26)
STRH	R1, [R0, #0]
;MyProject_driver.c,318 :: 		Box2.Color           = 0xC618;
MOVW	R1, #50712
MOVW	R0, #lo_addr(_Box2+28)
MOVT	R0, #hi_addr(_Box2+28)
STRH	R1, [R0, #0]
;MyProject_driver.c,319 :: 		Box2.PressColEnabled = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Box2+30)
MOVT	R0, #hi_addr(_Box2+30)
STRB	R1, [R0, #0]
;MyProject_driver.c,320 :: 		Box2.Press_Color     = 0xE71C;
MOVW	R1, #59164
MOVW	R0, #lo_addr(_Box2+32)
MOVT	R0, #hi_addr(_Box2+32)
STRH	R1, [R0, #0]
;MyProject_driver.c,322 :: 		Image1.OwnerScreen     = &Screen2;
MOVW	R1, #lo_addr(_Screen2+0)
MOVT	R1, #hi_addr(_Screen2+0)
MOVW	R0, #lo_addr(_Image1+0)
MOVT	R0, #hi_addr(_Image1+0)
STR	R1, [R0, #0]
;MyProject_driver.c,323 :: 		Image1.Order           = 2;
MOVS	R1, #2
MOVW	R0, #lo_addr(_Image1+4)
MOVT	R0, #hi_addr(_Image1+4)
STRB	R1, [R0, #0]
;MyProject_driver.c,324 :: 		Image1.Left            = 132;
MOVS	R1, #132
MOVW	R0, #lo_addr(_Image1+6)
MOVT	R0, #hi_addr(_Image1+6)
STRH	R1, [R0, #0]
;MyProject_driver.c,325 :: 		Image1.Top             = 86;
MOVS	R1, #86
MOVW	R0, #lo_addr(_Image1+8)
MOVT	R0, #hi_addr(_Image1+8)
STRH	R1, [R0, #0]
;MyProject_driver.c,326 :: 		Image1.Width           = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Image1+10)
MOVT	R0, #hi_addr(_Image1+10)
STRH	R1, [R0, #0]
;MyProject_driver.c,327 :: 		Image1.Height          = 60;
MOVS	R1, #60
MOVW	R0, #lo_addr(_Image1+12)
MOVT	R0, #hi_addr(_Image1+12)
STRH	R1, [R0, #0]
;MyProject_driver.c,328 :: 		Image1.Picture_Type    = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+22)
MOVT	R0, #hi_addr(_Image1+22)
STRB	R1, [R0, #0]
;MyProject_driver.c,329 :: 		Image1.Picture_Ratio   = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+23)
MOVT	R0, #hi_addr(_Image1+23)
STRB	R1, [R0, #0]
;MyProject_driver.c,330 :: 		Image1.Picture_Name    = eagle_jpg;
MOVW	R1, #lo_addr(_eagle_jpg+0)
MOVT	R1, #hi_addr(_eagle_jpg+0)
MOVW	R0, #lo_addr(_Image1+16)
MOVT	R0, #hi_addr(_Image1+16)
STR	R1, [R0, #0]
;MyProject_driver.c,331 :: 		Image1.Visible         = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+20)
MOVT	R0, #hi_addr(_Image1+20)
STRB	R1, [R0, #0]
;MyProject_driver.c,332 :: 		Image1.Active          = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_Image1+21)
MOVT	R0, #hi_addr(_Image1+21)
STRB	R1, [R0, #0]
;MyProject_driver.c,333 :: 		}
L_end_InitializeObjects:
BX	LR
; end of MyProject_driver_InitializeObjects
MyProject_driver_IsInsideObject:
;MyProject_driver.c,335 :: 		static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) { // static
; Top start address is: 12 (R3)
; Left start address is: 8 (R2)
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
; Top end address is: 12 (R3)
; Left end address is: 8 (R2)
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
; Left start address is: 8 (R2)
; Top start address is: 12 (R3)
; Width start address is: 20 (R5)
LDRH	R5, [SP, #0]
; Height start address is: 24 (R6)
LDRH	R6, [SP, #4]
;MyProject_driver.c,336 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
CMP	R2, R0
IT	HI
BHI	L_MyProject_driver_IsInsideObject152
ADDS	R4, R2, R5
UXTH	R4, R4
; Left end address is: 8 (R2)
; Width end address is: 20 (R5)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R0
IT	CC
BCC	L_MyProject_driver_IsInsideObject151
; X end address is: 0 (R0)
;MyProject_driver.c,337 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
CMP	R3, R1
IT	HI
BHI	L_MyProject_driver_IsInsideObject150
ADDS	R4, R3, R6
UXTH	R4, R4
; Top end address is: 12 (R3)
; Height end address is: 24 (R6)
SUBS	R4, R4, #1
UXTH	R4, R4
CMP	R4, R1
IT	CC
BCC	L_MyProject_driver_IsInsideObject149
; Y end address is: 4 (R1)
L_MyProject_driver_IsInsideObject148:
;MyProject_driver.c,338 :: 		return 1;
MOVS	R0, #1
IT	AL
BAL	L_end_IsInsideObject
;MyProject_driver.c,336 :: 		if ( (Left<= X) && (Left+ Width - 1 >= X) &&
L_MyProject_driver_IsInsideObject152:
L_MyProject_driver_IsInsideObject151:
;MyProject_driver.c,337 :: 		(Top <= Y)  && (Top + Height - 1 >= Y) )
L_MyProject_driver_IsInsideObject150:
L_MyProject_driver_IsInsideObject149:
;MyProject_driver.c,340 :: 		return 0;
MOVS	R0, #0
;MyProject_driver.c,341 :: 		}
L_end_IsInsideObject:
BX	LR
; end of MyProject_driver_IsInsideObject
_DrawLabel:
;MyProject_driver.c,351 :: 		void DrawLabel(TLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;MyProject_driver.c,352 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel10
;MyProject_driver.c,353 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawLabel11
;MyProject_driver.c,354 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawLabel12
L_DrawLabel11:
;MyProject_driver.c,356 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawLabel12:
;MyProject_driver.c,357 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;MyProject_driver.c,358 :: 		}
L_DrawLabel10:
;MyProject_driver.c,359 :: 		}
L_end_DrawLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawLabel
_DrawCLabel:
;MyProject_driver.c,361 :: 		void DrawCLabel(TCLabel *ALabel) {
; ALabel start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ALabel end address is: 0 (R0)
; ALabel start address is: 0 (R0)
;MyProject_driver.c,362 :: 		if (ALabel->Visible != 0) {
ADDW	R1, R0, #27
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawCLabel13
;MyProject_driver.c,363 :: 		if (ALabel->VerticalText != 0)
ADDW	R1, R0, #26
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawCLabel14
;MyProject_driver.c,364 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #2
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
IT	AL
BAL	L_DrawCLabel15
L_DrawCLabel14:
;MyProject_driver.c,366 :: 		TFT_Set_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDR	R1, [R1, #0]
STR	R0, [SP, #4]
MOV	R0, R1
UXTH	R1, R2
MOVS	R2, #0
BL	_TFT_Set_Font+0
LDR	R0, [SP, #4]
L_DrawCLabel15:
;MyProject_driver.c,367 :: 		TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R3, R1
ADDS	R1, R0, #6
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #16
; ALabel end address is: 0 (R0)
LDR	R1, [R1, #0]
MOV	R0, R1
UXTH	R1, R2
UXTH	R2, R3
BL	_TFT_Write_Text+0
;MyProject_driver.c,368 :: 		}
L_DrawCLabel13:
;MyProject_driver.c,369 :: 		}
L_end_DrawCLabel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawCLabel
_DrawImage:
;MyProject_driver.c,371 :: 		void DrawImage(TImage *AImage) {
; AImage start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; AImage end address is: 0 (R0)
; AImage start address is: 0 (R0)
;MyProject_driver.c,372 :: 		if (AImage->Visible != 0) {
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawImage16
;MyProject_driver.c,373 :: 		TFT_Image_Jpeg(AImage->Left, AImage->Top, AImage->Picture_Name);
ADDW	R1, R0, #16
LDR	R1, [R1, #0]
MOV	R3, R1
ADDW	R1, R0, #8
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDS	R1, R0, #6
; AImage end address is: 0 (R0)
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
MOV	R2, R3
BL	_TFT_Image_Jpeg+0
;MyProject_driver.c,374 :: 		}
L_DrawImage16:
;MyProject_driver.c,375 :: 		}
L_end_DrawImage:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _DrawImage
_DrawBox:
;MyProject_driver.c,377 :: 		void DrawBox(TBox *ABox) {
; ABox start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; ABox end address is: 0 (R0)
; ABox start address is: 0 (R0)
;MyProject_driver.c,378 :: 		if (ABox->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawBox17
;MyProject_driver.c,379 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawBox18
;MyProject_driver.c,380 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,381 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,382 :: 		}
IT	AL
BAL	L_DrawBox19
L_DrawBox18:
;MyProject_driver.c,384 :: 		TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
LDR	R0, [SP, #4]
;MyProject_driver.c,385 :: 		}
L_DrawBox19:
;MyProject_driver.c,386 :: 		TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,387 :: 		TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #1
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; ABox end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #1
SXTH	R2, R2
SXTH	R1, R4
SXTH	R0, R1
SXTH	R1, R2
SXTH	R2, R3
SXTH	R3, R5
BL	_TFT_Rectangle+0
;MyProject_driver.c,388 :: 		}
L_DrawBox17:
;MyProject_driver.c,389 :: 		}
L_end_DrawBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawBox
_DrawRoundBox:
;MyProject_driver.c,391 :: 		void DrawRoundBox(TBox_Round *Around_box) {
; Around_box start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Around_box end address is: 0 (R0)
; Around_box start address is: 0 (R0)
;MyProject_driver.c,392 :: 		if (Around_box->Visible != 0) {
ADDW	R1, R0, #18
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L_DrawRoundBox20
;MyProject_driver.c,393 :: 		if (object_pressed == 1) {
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_DrawRoundBox21
;MyProject_driver.c,394 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,396 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MyProject_driver.c,395 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #32
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MyProject_driver.c,396 :: 		Around_box->Gradient_End_Color, Around_box->Gradient_Start_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_driver.c,395 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Press_Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LDR	R0, [SP, #4]
;MyProject_driver.c,397 :: 		}
IT	AL
BAL	L_DrawRoundBox22
L_DrawRoundBox21:
;MyProject_driver.c,400 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
ADDW	R1, R0, #26
LDRH	R1, [R1, #0]
UXTH	R6, R1
ADDW	R1, R0, #24
LDRH	R1, [R1, #0]
UXTH	R5, R1
;MyProject_driver.c,399 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
ADDW	R1, R0, #22
LDRB	R1, [R1, #0]
UXTB	R4, R1
ADDW	R1, R0, #21
LDRB	R1, [R1, #0]
UXTB	R3, R1
ADDW	R1, R0, #28
LDRH	R1, [R1, #0]
UXTH	R2, R1
ADDW	R1, R0, #20
LDRB	R1, [R1, #0]
STR	R0, [SP, #4]
UXTB	R0, R1
UXTH	R1, R2
UXTB	R2, R3
UXTB	R3, R4
;MyProject_driver.c,400 :: 		Around_box->Gradient_Start_Color, Around_box->Gradient_End_Color);
PUSH	(R6)
PUSH	(R5)
BL	_TFT_Set_Brush+0
ADD	SP, SP, #8
;MyProject_driver.c,399 :: 		TFT_Set_Brush(Around_box->Transparent, Around_box->Color, Around_box->Gradient, Around_box->Gradient_Orientation,
LDR	R0, [SP, #4]
;MyProject_driver.c,401 :: 		}
L_DrawRoundBox22:
;MyProject_driver.c,402 :: 		TFT_Set_Pen(Around_box->Pen_Color, Around_box->Pen_Width);
ADDW	R1, R0, #14
LDRB	R1, [R1, #0]
UXTB	R2, R1
ADDW	R1, R0, #16
LDRH	R1, [R1, #0]
STR	R0, [SP, #4]
UXTH	R0, R1
UXTB	R1, R2
BL	_TFT_Set_Pen+0
LDR	R0, [SP, #4]
;MyProject_driver.c,405 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
ADDW	R1, R0, #30
LDRB	R1, [R1, #0]
UXTB	R6, R1
ADDW	R1, R0, #8
LDRH	R2, [R1, #0]
ADDW	R1, R0, #12
LDRH	R1, [R1, #0]
ADDS	R1, R2, R1
UXTH	R1, R1
SUBS	R5, R1, #2
;MyProject_driver.c,404 :: 		Around_box->Left + Around_box->Width - 2,
ADDS	R1, R0, #6
LDRH	R4, [R1, #0]
ADDW	R1, R0, #10
; Around_box end address is: 0 (R0)
LDRH	R1, [R1, #0]
ADDS	R1, R4, R1
UXTH	R1, R1
SUBS	R3, R1, #2
;MyProject_driver.c,403 :: 		TFT_Rectangle_Round_Edges(Around_box->Left + 1, Around_box->Top + 1,
ADDS	R2, R2, #1
ADDS	R1, R4, #1
UXTH	R0, R1
UXTH	R1, R2
;MyProject_driver.c,404 :: 		Around_box->Left + Around_box->Width - 2,
UXTH	R2, R3
;MyProject_driver.c,405 :: 		Around_box->Top + Around_box->Height - 2, Around_box->Corner_Radius);
UXTH	R3, R5
PUSH	(R6)
BL	_TFT_Rectangle_Round_Edges+0
ADD	SP, SP, #4
;MyProject_driver.c,406 :: 		}
L_DrawRoundBox20:
;MyProject_driver.c,407 :: 		}
L_end_DrawRoundBox:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _DrawRoundBox
_DrawScreen:
;MyProject_driver.c,409 :: 		void DrawScreen(TScreen *aScreen) {
; aScreen start address is: 0 (R0)
SUB	SP, SP, #48
STR	LR, [SP, #0]
; aScreen end address is: 0 (R0)
; aScreen start address is: 0 (R0)
;MyProject_driver.c,423 :: 		object_pressed = 0;
MOVS	R2, #0
MOVW	R1, #lo_addr(_object_pressed+0)
MOVT	R1, #hi_addr(_object_pressed+0)
STRB	R2, [R1, #0]
;MyProject_driver.c,424 :: 		order = 0;
MOVS	R1, #0
STRH	R1, [SP, #4]
;MyProject_driver.c,425 :: 		label_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #6]
;MyProject_driver.c,426 :: 		clabel_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #12]
;MyProject_driver.c,427 :: 		image_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #20]
;MyProject_driver.c,428 :: 		box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #28]
;MyProject_driver.c,429 :: 		round_box_idx = 0;
MOVS	R1, #0
STRB	R1, [SP, #36]
;MyProject_driver.c,430 :: 		CurrentScreen = aScreen;
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
STR	R0, [R1, #0]
;MyProject_driver.c,432 :: 		if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
ADDS	R1, R0, #2
; aScreen end address is: 0 (R0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen155
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
LDRH	R1, [R1, #0]
CMP	R1, R2
IT	NE
BNE	L__DrawScreen154
IT	AL
BAL	L_DrawScreen25
L__DrawScreen155:
L__DrawScreen154:
;MyProject_driver.c,433 :: 		save_bled = TFT_BLED;
MOVW	R2, #lo_addr(GPIOE_ODR+0)
MOVT	R2, #hi_addr(GPIOE_ODR+0)
_LX	[R2, ByteOffset(GPIOE_ODR+0)]
STRB	R1, [SP, #44]
;MyProject_driver.c,434 :: 		TFT_BLED           = 0;
MOVS	R1, #0
SXTB	R1, R1
_SX	[R2, ByteOffset(GPIOE_ODR+0)]
;MyProject_driver.c,435 :: 		TFT_Init_ILI9341_8bit(CurrentScreen->Width, CurrentScreen->Height);
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
UXTH	R0, R1
UXTH	R1, R2
BL	_TFT_Init_ILI9341_8bit+0
;MyProject_driver.c,436 :: 		TP_TFT_Init(CurrentScreen->Width, CurrentScreen->Height, 8, 9);                                  // Initialize touch panel
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #4
LDRH	R1, [R1, #0]
UXTH	R2, R1
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #2
LDRH	R1, [R1, #0]
MOVS	R3, #9
UXTH	R0, R1
UXTH	R1, R2
MOVS	R2, #8
BL	_TP_TFT_Init+0
;MyProject_driver.c,437 :: 		TP_TFT_Set_ADC_Threshold(ADC_THRESHOLD);                              // Set touch panel ADC threshold
MOVW	R0, #1500
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;MyProject_driver.c,438 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
;MyProject_driver.c,439 :: 		display_width = CurrentScreen->Width;
MOVW	R3, #lo_addr(_CurrentScreen+0)
MOVT	R3, #hi_addr(_CurrentScreen+0)
LDR	R1, [R3, #0]
ADDS	R1, R1, #2
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_width+0)
MOVT	R1, #hi_addr(_display_width+0)
STRH	R2, [R1, #0]
;MyProject_driver.c,440 :: 		display_height = CurrentScreen->Height;
MOV	R1, R3
LDR	R1, [R1, #0]
ADDS	R1, R1, #4
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_display_height+0)
MOVT	R1, #hi_addr(_display_height+0)
STRH	R2, [R1, #0]
;MyProject_driver.c,441 :: 		TFT_BLED           = save_bled;
LDRB	R2, [SP, #44]
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
_SX	[R1, ByteOffset(GPIOE_ODR+0)]
;MyProject_driver.c,442 :: 		}
IT	AL
BAL	L_DrawScreen26
L_DrawScreen25:
;MyProject_driver.c,444 :: 		TFT_Fill_Screen(CurrentScreen->Color);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
LDRH	R1, [R1, #0]
UXTH	R0, R1
BL	_TFT_Fill_Screen+0
L_DrawScreen26:
;MyProject_driver.c,447 :: 		while (order < CurrentScreen->ObjectsCount) {
L_DrawScreen27:
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, R1, #6
LDRH	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen28
;MyProject_driver.c,448 :: 		if (label_idx < CurrentScreen->LabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #8
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #6]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen29
;MyProject_driver.c,449 :: 		local_label = GetLabel(label_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #12
LDR	R2, [R1, #0]
LDRB	R1, [SP, #6]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #8]
;MyProject_driver.c,450 :: 		if (order == local_label->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen30
;MyProject_driver.c,451 :: 		label_idx++;
LDRB	R1, [SP, #6]
ADDS	R1, R1, #1
STRB	R1, [SP, #6]
;MyProject_driver.c,452 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,453 :: 		DrawLabel(local_label);
LDR	R0, [SP, #8]
BL	_DrawLabel+0
;MyProject_driver.c,454 :: 		}
L_DrawScreen30:
;MyProject_driver.c,455 :: 		}
L_DrawScreen29:
;MyProject_driver.c,457 :: 		if (clabel_idx < CurrentScreen->CLabelsCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #16
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #12]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen31
;MyProject_driver.c,458 :: 		local_clabel = GetCLabel(clabel_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #20
LDR	R2, [R1, #0]
LDRB	R1, [SP, #12]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #16]
;MyProject_driver.c,459 :: 		if (order == local_clabel->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen32
;MyProject_driver.c,460 :: 		clabel_idx++;
LDRB	R1, [SP, #12]
ADDS	R1, R1, #1
STRB	R1, [SP, #12]
;MyProject_driver.c,461 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,462 :: 		DrawCLabel(local_clabel);
LDR	R0, [SP, #16]
BL	_DrawCLabel+0
;MyProject_driver.c,463 :: 		}
L_DrawScreen32:
;MyProject_driver.c,464 :: 		}
L_DrawScreen31:
;MyProject_driver.c,466 :: 		if (box_idx < CurrentScreen->BoxesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #32
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #28]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen33
;MyProject_driver.c,467 :: 		local_box = GetBox(box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #36
LDR	R2, [R1, #0]
LDRB	R1, [SP, #28]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #32]
;MyProject_driver.c,468 :: 		if (order == local_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen34
;MyProject_driver.c,469 :: 		box_idx++;
LDRB	R1, [SP, #28]
ADDS	R1, R1, #1
STRB	R1, [SP, #28]
;MyProject_driver.c,470 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,471 :: 		DrawBox(local_box);
LDR	R0, [SP, #32]
BL	_DrawBox+0
;MyProject_driver.c,472 :: 		}
L_DrawScreen34:
;MyProject_driver.c,473 :: 		}
L_DrawScreen33:
;MyProject_driver.c,475 :: 		if (round_box_idx < CurrentScreen->Boxes_RoundCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #40
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #36]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen35
;MyProject_driver.c,476 :: 		local_round_box = GetBox_Round(round_box_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #44
LDR	R2, [R1, #0]
LDRB	R1, [SP, #36]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #40]
;MyProject_driver.c,477 :: 		if (order == local_round_box->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen36
;MyProject_driver.c,478 :: 		round_box_idx++;
LDRB	R1, [SP, #36]
ADDS	R1, R1, #1
STRB	R1, [SP, #36]
;MyProject_driver.c,479 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,480 :: 		DrawRoundBox(local_round_box);
LDR	R0, [SP, #40]
BL	_DrawRoundBox+0
;MyProject_driver.c,481 :: 		}
L_DrawScreen36:
;MyProject_driver.c,482 :: 		}
L_DrawScreen35:
;MyProject_driver.c,484 :: 		if (image_idx < CurrentScreen->ImagesCount) {
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #24
LDRH	R2, [R1, #0]
LDRB	R1, [SP, #20]
CMP	R1, R2
IT	CS
BCS	L_DrawScreen37
;MyProject_driver.c,485 :: 		local_image = GetImage(image_idx);
MOVW	R1, #lo_addr(_CurrentScreen+0)
MOVT	R1, #hi_addr(_CurrentScreen+0)
LDR	R1, [R1, #0]
ADDS	R1, #28
LDR	R2, [R1, #0]
LDRB	R1, [SP, #20]
LSLS	R1, R1, #2
ADDS	R1, R2, R1
LDR	R1, [R1, #0]
STR	R1, [SP, #24]
;MyProject_driver.c,486 :: 		if (order == local_image->Order) {
ADDS	R1, R1, #4
LDRB	R2, [R1, #0]
LDRH	R1, [SP, #4]
CMP	R1, R2
IT	NE
BNE	L_DrawScreen38
;MyProject_driver.c,487 :: 		image_idx++;
LDRB	R1, [SP, #20]
ADDS	R1, R1, #1
STRB	R1, [SP, #20]
;MyProject_driver.c,488 :: 		order++;
LDRH	R1, [SP, #4]
ADDS	R1, R1, #1
STRH	R1, [SP, #4]
;MyProject_driver.c,489 :: 		DrawImage(local_image);
LDR	R0, [SP, #24]
BL	_DrawImage+0
;MyProject_driver.c,490 :: 		}
L_DrawScreen38:
;MyProject_driver.c,491 :: 		}
L_DrawScreen37:
;MyProject_driver.c,493 :: 		}
IT	AL
BAL	L_DrawScreen27
L_DrawScreen28:
;MyProject_driver.c,494 :: 		}
L_end_DrawScreen:
LDR	LR, [SP, #0]
ADD	SP, SP, #48
BX	LR
; end of _DrawScreen
_Get_Object:
;MyProject_driver.c,496 :: 		void Get_Object(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,497 :: 		label_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,498 :: 		clabel_order        = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,499 :: 		image_order         = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,500 :: 		box_order           = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,501 :: 		box_round_order     = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,503 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 0 (R0)
; Y end address is: 4 (R1)
UXTH	R8, R0
UXTH	R7, R1
L_Get_Object39:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object40
;MyProject_driver.c,504 :: 		local_label = GetLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #12
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_label+0)
MOVT	R2, #hi_addr(_local_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,505 :: 		if (local_label->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object42
;MyProject_driver.c,507 :: 		local_label->Width, local_label->Height) == 1) {
MOVW	R6, #lo_addr(_local_label+0)
MOVT	R6, #hi_addr(_local_label+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,506 :: 		if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,507 :: 		local_label->Width, local_label->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object43
;MyProject_driver.c,508 :: 		label_order = local_label->Order;
MOVW	R4, #lo_addr(_local_label+0)
MOVT	R4, #hi_addr(_local_label+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,509 :: 		exec_label = local_label;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,510 :: 		}
L_Get_Object43:
;MyProject_driver.c,511 :: 		}
L_Get_Object42:
;MyProject_driver.c,503 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,512 :: 		}
IT	AL
BAL	L_Get_Object39
L_Get_Object40:
;MyProject_driver.c,515 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object44:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #16
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object45
;MyProject_driver.c,516 :: 		local_clabel = GetCLabel(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #20
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_clabel+0)
MOVT	R2, #hi_addr(_local_clabel+0)
STR	R3, [R2, #0]
;MyProject_driver.c,517 :: 		if (local_clabel->Active != 0) {
ADDW	R2, R3, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object47
;MyProject_driver.c,519 :: 		local_clabel->Width, local_clabel->Height) == 1) {
MOVW	R6, #lo_addr(_local_clabel+0)
MOVT	R6, #hi_addr(_local_clabel+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,518 :: 		if (IsInsideObject(X, Y, local_clabel->Left, local_clabel->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MyProject_driver.c,519 :: 		local_clabel->Width, local_clabel->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object48
;MyProject_driver.c,520 :: 		clabel_order = local_clabel->Order;
MOVW	R4, #lo_addr(_local_clabel+0)
MOVT	R4, #hi_addr(_local_clabel+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,521 :: 		exec_clabel = local_clabel;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
STR	R3, [R2, #0]
;MyProject_driver.c,522 :: 		}
L_Get_Object48:
;MyProject_driver.c,523 :: 		}
L_Get_Object47:
;MyProject_driver.c,515 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->CLabelsCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,524 :: 		}
IT	AL
BAL	L_Get_Object44
L_Get_Object45:
;MyProject_driver.c,527 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object49:
; Y start address is: 28 (R7)
; X start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #24
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object50
;MyProject_driver.c,528 :: 		local_image = GetImage(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_image+0)
MOVT	R2, #hi_addr(_local_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,529 :: 		if (local_image->Active != 0) {
ADDW	R2, R3, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object52
;MyProject_driver.c,531 :: 		local_image->Width, local_image->Height) == 1) {
MOVW	R6, #lo_addr(_local_image+0)
MOVT	R6, #hi_addr(_local_image+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,530 :: 		if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,531 :: 		local_image->Width, local_image->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object53
;MyProject_driver.c,532 :: 		image_order = local_image->Order;
MOVW	R4, #lo_addr(_local_image+0)
MOVT	R4, #hi_addr(_local_image+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,533 :: 		exec_image = local_image;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,534 :: 		}
L_Get_Object53:
;MyProject_driver.c,535 :: 		}
L_Get_Object52:
;MyProject_driver.c,527 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,536 :: 		}
IT	AL
BAL	L_Get_Object49
L_Get_Object50:
;MyProject_driver.c,539 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object54:
; X start address is: 28 (R7)
; Y start address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #32
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object55
;MyProject_driver.c,540 :: 		local_box = GetBox(_object_count);
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #36
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_box+0)
MOVT	R2, #hi_addr(_local_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,541 :: 		if (local_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object57
;MyProject_driver.c,543 :: 		local_box->Width, local_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_box+0)
MOVT	R6, #hi_addr(_local_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,542 :: 		if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R8
UXTH	R0, R7
;MyProject_driver.c,543 :: 		local_box->Width, local_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object58
;MyProject_driver.c,544 :: 		box_order = local_box->Order;
MOVW	R4, #lo_addr(_local_box+0)
MOVT	R4, #hi_addr(_local_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,545 :: 		exec_box = local_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,546 :: 		}
L_Get_Object58:
;MyProject_driver.c,547 :: 		}
L_Get_Object57:
;MyProject_driver.c,539 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,548 :: 		}
IT	AL
BAL	L_Get_Object54
L_Get_Object55:
;MyProject_driver.c,551 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
MOVS	R3, #0
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
; X end address is: 28 (R7)
; Y end address is: 32 (R8)
STRH	R8, [SP, #4]
UXTH	R8, R7
LDRH	R7, [SP, #4]
L_Get_Object59:
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
; Y start address is: 28 (R7)
; Y end address is: 28 (R7)
; X start address is: 32 (R8)
; X end address is: 32 (R8)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #40
LDRH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	CS
BCS	L_Get_Object60
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
;MyProject_driver.c,552 :: 		local_round_box = GetBox_Round(_object_count);
; X start address is: 32 (R8)
; Y start address is: 28 (R7)
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
ADDS	R2, #44
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
LSLS	R2, R2, #2
ADDS	R2, R3, R2
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_local_round_box+0)
MOVT	R2, #hi_addr(_local_round_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,553 :: 		if (local_round_box->Active != 0) {
ADDW	R2, R3, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Get_Object62
;MyProject_driver.c,555 :: 		local_round_box->Width, local_round_box->Height) == 1) {
MOVW	R6, #lo_addr(_local_round_box+0)
MOVT	R6, #hi_addr(_local_round_box+0)
LDR	R2, [R6, #0]
ADDS	R2, #12
LDRH	R2, [R2, #0]
UXTH	R5, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #10
LDRH	R2, [R2, #0]
UXTH	R4, R2
;MyProject_driver.c,554 :: 		if (IsInsideObject(X, Y, local_round_box->Left, local_round_box->Top,
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, #8
LDRH	R2, [R2, #0]
UXTH	R3, R2
MOV	R2, R6
LDR	R2, [R2, #0]
ADDS	R2, R2, #6
LDRH	R2, [R2, #0]
UXTH	R1, R7
UXTH	R0, R8
;MyProject_driver.c,555 :: 		local_round_box->Width, local_round_box->Height) == 1) {
PUSH	(R5)
PUSH	(R4)
BL	MyProject_driver_IsInsideObject+0
ADD	SP, SP, #8
CMP	R0, #1
IT	NE
BNE	L_Get_Object63
;MyProject_driver.c,556 :: 		box_round_order = local_round_box->Order;
MOVW	R4, #lo_addr(_local_round_box+0)
MOVT	R4, #hi_addr(_local_round_box+0)
LDR	R2, [R4, #0]
ADDS	R2, R2, #4
LDRB	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,557 :: 		exec_round_box = local_round_box;
MOV	R2, R4
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,558 :: 		}
L_Get_Object63:
;MyProject_driver.c,559 :: 		}
L_Get_Object62:
;MyProject_driver.c,551 :: 		for ( _object_count = 0 ; _object_count < CurrentScreen->Boxes_RoundCount ; _object_count++ ) {
MOVW	R3, #lo_addr(__object_count+0)
MOVT	R3, #hi_addr(__object_count+0)
LDRSH	R2, [R3, #0]
ADDS	R2, R2, #1
STRH	R2, [R3, #0]
;MyProject_driver.c,560 :: 		}
; Y end address is: 28 (R7)
; X end address is: 32 (R8)
IT	AL
BAL	L_Get_Object59
L_Get_Object60:
;MyProject_driver.c,562 :: 		_object_count = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,563 :: 		if (label_order >  _object_count )
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	LE
BLE	L_Get_Object64
;MyProject_driver.c,564 :: 		_object_count = label_order;
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object64:
;MyProject_driver.c,565 :: 		if (clabel_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object65
;MyProject_driver.c,566 :: 		_object_count = clabel_order;
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object65:
;MyProject_driver.c,567 :: 		if (image_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object66
;MyProject_driver.c,568 :: 		_object_count = image_order;
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object66:
;MyProject_driver.c,569 :: 		if (box_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object67
;MyProject_driver.c,570 :: 		_object_count = box_order;
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object67:
;MyProject_driver.c,571 :: 		if (box_round_order >  _object_count )
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	LE
BLE	L_Get_Object68
;MyProject_driver.c,572 :: 		_object_count = box_round_order;
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
STRH	R3, [R2, #0]
L_Get_Object68:
;MyProject_driver.c,573 :: 		}
L_end_Get_Object:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _Get_Object
_Process_TP_Press:
;MyProject_driver.c,576 :: 		void Process_TP_Press(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,577 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,578 :: 		exec_clabel         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
STR	R3, [R2, #0]
;MyProject_driver.c,579 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,580 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,581 :: 		exec_round_box      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,583 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,585 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Press69
;MyProject_driver.c,586 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press70
;MyProject_driver.c,587 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press71
;MyProject_driver.c,588 :: 		if (exec_label->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press72
;MyProject_driver.c,589 :: 		exec_label->OnPressPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,590 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,591 :: 		}
L_Process_TP_Press72:
;MyProject_driver.c,592 :: 		}
L_Process_TP_Press71:
;MyProject_driver.c,593 :: 		}
L_Process_TP_Press70:
;MyProject_driver.c,595 :: 		if (_object_count == clabel_order) {
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press73
;MyProject_driver.c,596 :: 		if (exec_clabel->Active != 0) {
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press74
;MyProject_driver.c,597 :: 		if (exec_clabel->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press75
;MyProject_driver.c,598 :: 		exec_clabel->OnPressPtr();
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,599 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,600 :: 		}
L_Process_TP_Press75:
;MyProject_driver.c,601 :: 		}
L_Process_TP_Press74:
;MyProject_driver.c,602 :: 		}
L_Process_TP_Press73:
;MyProject_driver.c,604 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press76
;MyProject_driver.c,605 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press77
;MyProject_driver.c,606 :: 		if (exec_image->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press78
;MyProject_driver.c,607 :: 		exec_image->OnPressPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,608 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,609 :: 		}
L_Process_TP_Press78:
;MyProject_driver.c,610 :: 		}
L_Process_TP_Press77:
;MyProject_driver.c,611 :: 		}
L_Process_TP_Press76:
;MyProject_driver.c,613 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press79
;MyProject_driver.c,614 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press80
;MyProject_driver.c,615 :: 		if (exec_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press81
;MyProject_driver.c,616 :: 		exec_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,617 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,618 :: 		}
L_Process_TP_Press81:
;MyProject_driver.c,619 :: 		}
L_Process_TP_Press80:
;MyProject_driver.c,620 :: 		}
L_Process_TP_Press79:
;MyProject_driver.c,622 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Press82
;MyProject_driver.c,623 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Press83
;MyProject_driver.c,624 :: 		if (exec_round_box->OnPressPtr != 0) {
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Press84
;MyProject_driver.c,625 :: 		exec_round_box->OnPressPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #48
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,626 :: 		return;
IT	AL
BAL	L_end_Process_TP_Press
;MyProject_driver.c,627 :: 		}
L_Process_TP_Press84:
;MyProject_driver.c,628 :: 		}
L_Process_TP_Press83:
;MyProject_driver.c,629 :: 		}
L_Process_TP_Press82:
;MyProject_driver.c,631 :: 		}
L_Process_TP_Press69:
;MyProject_driver.c,632 :: 		}
L_end_Process_TP_Press:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Press
_Process_TP_Up:
;MyProject_driver.c,634 :: 		void Process_TP_Up(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #12
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,636 :: 		switch (PressedObjectType) {
IT	AL
BAL	L_Process_TP_Up85
;MyProject_driver.c,638 :: 		case 6: {
L_Process_TP_Up87:
;MyProject_driver.c,639 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up88
;MyProject_driver.c,640 :: 		exec_box = (TBox*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,641 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up159
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up158
L__Process_TP_Up157:
;MyProject_driver.c,642 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,641 :: 		if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up159:
L__Process_TP_Up158:
;MyProject_driver.c,644 :: 		break;
IT	AL
BAL	L_Process_TP_Up86
;MyProject_driver.c,645 :: 		}
L_Process_TP_Up88:
;MyProject_driver.c,646 :: 		break;
IT	AL
BAL	L_Process_TP_Up86
;MyProject_driver.c,649 :: 		case 7: {
L_Process_TP_Up92:
;MyProject_driver.c,650 :: 		if (PressedObject != 0) {
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up93
;MyProject_driver.c,651 :: 		exec_round_box = (TBox_Round*)PressedObject;
MOVW	R4, #lo_addr(_PressedObject+0)
MOVT	R4, #hi_addr(_PressedObject+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,652 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
MOV	R2, R4
LDR	R2, [R2, #0]
ADDS	R2, #31
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L__Process_TP_Up161
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_CurrentScreen+0)
MOVT	R2, #hi_addr(_CurrentScreen+0)
LDR	R2, [R2, #0]
CMP	R3, R2
IT	NE
BNE	L__Process_TP_Up160
L__Process_TP_Up156:
;MyProject_driver.c,653 :: 		DrawRoundBox(exec_round_box);
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
STRH	R1, [SP, #4]
STRH	R0, [SP, #8]
MOV	R0, R2
BL	_DrawRoundBox+0
LDRH	R0, [SP, #8]
LDRH	R1, [SP, #4]
;MyProject_driver.c,652 :: 		if ((exec_round_box->PressColEnabled != 0) && (exec_round_box->OwnerScreen == CurrentScreen)) {
L__Process_TP_Up161:
L__Process_TP_Up160:
;MyProject_driver.c,655 :: 		break;
IT	AL
BAL	L_Process_TP_Up86
;MyProject_driver.c,656 :: 		}
L_Process_TP_Up93:
;MyProject_driver.c,657 :: 		break;
IT	AL
BAL	L_Process_TP_Up86
;MyProject_driver.c,659 :: 		}
L_Process_TP_Up85:
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #6
IT	EQ
BEQ	L_Process_TP_Up87
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
LDRSH	R2, [R2, #0]
CMP	R2, #7
IT	EQ
BEQ	L_Process_TP_Up92
L_Process_TP_Up86:
;MyProject_driver.c,661 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,662 :: 		exec_clabel          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
STR	R3, [R2, #0]
;MyProject_driver.c,663 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,665 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,668 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Up97
;MyProject_driver.c,670 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up98
;MyProject_driver.c,671 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up99
;MyProject_driver.c,672 :: 		if (exec_label->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up100
;MyProject_driver.c,673 :: 		exec_label->OnUpPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up100:
;MyProject_driver.c,674 :: 		if (PressedObject == (TPointer)exec_label)
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up101
;MyProject_driver.c,675 :: 		if (exec_label->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up102
;MyProject_driver.c,676 :: 		exec_label->OnClickPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up102:
L_Process_TP_Up101:
;MyProject_driver.c,677 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,678 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,679 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,680 :: 		}
L_Process_TP_Up99:
;MyProject_driver.c,681 :: 		}
L_Process_TP_Up98:
;MyProject_driver.c,684 :: 		if (_object_count == clabel_order) {
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up103
;MyProject_driver.c,685 :: 		if (exec_clabel->Active != 0) {
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up104
;MyProject_driver.c,686 :: 		if (exec_clabel->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up105
;MyProject_driver.c,687 :: 		exec_clabel->OnUpPtr();
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up105:
;MyProject_driver.c,688 :: 		if (PressedObject == (TPointer)exec_clabel)
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up106
;MyProject_driver.c,689 :: 		if (exec_clabel->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up107
;MyProject_driver.c,690 :: 		exec_clabel->OnClickPtr();
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up107:
L_Process_TP_Up106:
;MyProject_driver.c,691 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,692 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,693 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,694 :: 		}
L_Process_TP_Up104:
;MyProject_driver.c,695 :: 		}
L_Process_TP_Up103:
;MyProject_driver.c,698 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up108
;MyProject_driver.c,699 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up109
;MyProject_driver.c,700 :: 		if (exec_image->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up110
;MyProject_driver.c,701 :: 		exec_image->OnUpPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #24
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up110:
;MyProject_driver.c,702 :: 		if (PressedObject == (TPointer)exec_image)
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up111
;MyProject_driver.c,703 :: 		if (exec_image->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up112
;MyProject_driver.c,704 :: 		exec_image->OnClickPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #32
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up112:
L_Process_TP_Up111:
;MyProject_driver.c,705 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,706 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,707 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,708 :: 		}
L_Process_TP_Up109:
;MyProject_driver.c,709 :: 		}
L_Process_TP_Up108:
;MyProject_driver.c,712 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up113
;MyProject_driver.c,713 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up114
;MyProject_driver.c,714 :: 		if (exec_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up115
;MyProject_driver.c,715 :: 		exec_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up115:
;MyProject_driver.c,716 :: 		if (PressedObject == (TPointer)exec_box)
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up116
;MyProject_driver.c,717 :: 		if (exec_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up117
;MyProject_driver.c,718 :: 		exec_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up117:
L_Process_TP_Up116:
;MyProject_driver.c,719 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,720 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,721 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,722 :: 		}
L_Process_TP_Up114:
;MyProject_driver.c,723 :: 		}
L_Process_TP_Up113:
;MyProject_driver.c,726 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up118
;MyProject_driver.c,727 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Up119
;MyProject_driver.c,728 :: 		if (exec_round_box->OnUpPtr != 0)
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up120
;MyProject_driver.c,729 :: 		exec_round_box->OnUpPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up120:
;MyProject_driver.c,730 :: 		if (PressedObject == (TPointer)exec_round_box)
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R3, [R2, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
LDR	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Up121
;MyProject_driver.c,731 :: 		if (exec_round_box->OnClickPtr != 0)
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Up122
;MyProject_driver.c,732 :: 		exec_round_box->OnClickPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #44
LDR	R2, [R4, #0]
BLX	R2
L_Process_TP_Up122:
L_Process_TP_Up121:
;MyProject_driver.c,733 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,734 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,735 :: 		return;
IT	AL
BAL	L_end_Process_TP_Up
;MyProject_driver.c,736 :: 		}
L_Process_TP_Up119:
;MyProject_driver.c,737 :: 		}
L_Process_TP_Up118:
;MyProject_driver.c,739 :: 		}
L_Process_TP_Up97:
;MyProject_driver.c,740 :: 		PressedObject = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,741 :: 		PressedObjectType = -1;
MOVW	R3, #65535
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,742 :: 		}
L_end_Process_TP_Up:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _Process_TP_Up
_Process_TP_Down:
;MyProject_driver.c,744 :: 		void Process_TP_Down(unsigned int X, unsigned int Y) {
; Y start address is: 4 (R1)
; X start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
; X start address is: 0 (R0)
; Y start address is: 4 (R1)
;MyProject_driver.c,746 :: 		object_pressed      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,747 :: 		exec_label          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
STR	R3, [R2, #0]
;MyProject_driver.c,748 :: 		exec_clabel         = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
STR	R3, [R2, #0]
;MyProject_driver.c,749 :: 		exec_image          = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
STR	R3, [R2, #0]
;MyProject_driver.c,750 :: 		exec_box            = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,751 :: 		exec_round_box      = 0;
MOVS	R3, #0
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
STR	R3, [R2, #0]
;MyProject_driver.c,753 :: 		Get_Object(X, Y);
; Y end address is: 4 (R1)
; X end address is: 0 (R0)
BL	_Get_Object+0
;MyProject_driver.c,755 :: 		if (_object_count != -1) {
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, #-1
IT	EQ
BEQ	L_Process_TP_Down123
;MyProject_driver.c,756 :: 		if (_object_count == label_order) {
MOVW	R2, #lo_addr(_label_order+0)
MOVT	R2, #hi_addr(_label_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down124
;MyProject_driver.c,757 :: 		if (exec_label->Active != 0) {
MOVW	R2, #lo_addr(_exec_label+0)
MOVT	R2, #hi_addr(_exec_label+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down125
;MyProject_driver.c,758 :: 		PressedObject = (TPointer)exec_label;
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,759 :: 		PressedObjectType = 2;
MOVS	R3, #2
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,760 :: 		if (exec_label->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down126
;MyProject_driver.c,761 :: 		exec_label->OnDownPtr();
MOVW	R4, #lo_addr(_exec_label+0)
MOVT	R4, #hi_addr(_exec_label+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,762 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,763 :: 		}
L_Process_TP_Down126:
;MyProject_driver.c,764 :: 		}
L_Process_TP_Down125:
;MyProject_driver.c,765 :: 		}
L_Process_TP_Down124:
;MyProject_driver.c,767 :: 		if (_object_count == clabel_order) {
MOVW	R2, #lo_addr(_clabel_order+0)
MOVT	R2, #hi_addr(_clabel_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down127
;MyProject_driver.c,768 :: 		if (exec_clabel->Active != 0) {
MOVW	R2, #lo_addr(_exec_clabel+0)
MOVT	R2, #hi_addr(_exec_clabel+0)
LDR	R2, [R2, #0]
ADDS	R2, #28
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down128
;MyProject_driver.c,769 :: 		PressedObject = (TPointer)exec_clabel;
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,770 :: 		PressedObjectType = 10;
MOVS	R3, #10
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,771 :: 		if (exec_clabel->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down129
;MyProject_driver.c,772 :: 		exec_clabel->OnDownPtr();
MOVW	R4, #lo_addr(_exec_clabel+0)
MOVT	R4, #hi_addr(_exec_clabel+0)
LDR	R4, [R4, #0]
ADDS	R4, #36
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,773 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,774 :: 		}
L_Process_TP_Down129:
;MyProject_driver.c,775 :: 		}
L_Process_TP_Down128:
;MyProject_driver.c,776 :: 		}
L_Process_TP_Down127:
;MyProject_driver.c,778 :: 		if (_object_count == image_order) {
MOVW	R2, #lo_addr(_image_order+0)
MOVT	R2, #hi_addr(_image_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down130
;MyProject_driver.c,779 :: 		if (exec_image->Active != 0) {
MOVW	R2, #lo_addr(_exec_image+0)
MOVT	R2, #hi_addr(_exec_image+0)
LDR	R2, [R2, #0]
ADDS	R2, #21
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down131
;MyProject_driver.c,780 :: 		PressedObject = (TPointer)exec_image;
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,781 :: 		PressedObjectType = 3;
MOVS	R3, #3
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,782 :: 		if (exec_image->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down132
;MyProject_driver.c,783 :: 		exec_image->OnDownPtr();
MOVW	R4, #lo_addr(_exec_image+0)
MOVT	R4, #hi_addr(_exec_image+0)
LDR	R4, [R4, #0]
ADDS	R4, #28
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,784 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,785 :: 		}
L_Process_TP_Down132:
;MyProject_driver.c,786 :: 		}
L_Process_TP_Down131:
;MyProject_driver.c,787 :: 		}
L_Process_TP_Down130:
;MyProject_driver.c,789 :: 		if (_object_count == box_order) {
MOVW	R2, #lo_addr(_box_order+0)
MOVT	R2, #hi_addr(_box_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down133
;MyProject_driver.c,790 :: 		if (exec_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down134
;MyProject_driver.c,791 :: 		if (exec_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #30
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down135
;MyProject_driver.c,792 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,793 :: 		DrawBox(exec_box);
MOVW	R2, #lo_addr(_exec_box+0)
MOVT	R2, #hi_addr(_exec_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawBox+0
;MyProject_driver.c,794 :: 		}
L_Process_TP_Down135:
;MyProject_driver.c,795 :: 		PressedObject = (TPointer)exec_box;
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,796 :: 		PressedObjectType = 6;
MOVS	R3, #6
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,797 :: 		if (exec_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down136
;MyProject_driver.c,798 :: 		exec_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_box+0)
MOVT	R4, #hi_addr(_exec_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,799 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,800 :: 		}
L_Process_TP_Down136:
;MyProject_driver.c,801 :: 		}
L_Process_TP_Down134:
;MyProject_driver.c,802 :: 		}
L_Process_TP_Down133:
;MyProject_driver.c,804 :: 		if (_object_count == box_round_order) {
MOVW	R2, #lo_addr(_box_round_order+0)
MOVT	R2, #hi_addr(_box_round_order+0)
LDRSH	R3, [R2, #0]
MOVW	R2, #lo_addr(__object_count+0)
MOVT	R2, #hi_addr(__object_count+0)
LDRSH	R2, [R2, #0]
CMP	R2, R3
IT	NE
BNE	L_Process_TP_Down137
;MyProject_driver.c,805 :: 		if (exec_round_box->Active != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #19
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down138
;MyProject_driver.c,806 :: 		if (exec_round_box->PressColEnabled != 0) {
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
ADDS	R2, #31
LDRB	R2, [R2, #0]
CMP	R2, #0
IT	EQ
BEQ	L_Process_TP_Down139
;MyProject_driver.c,807 :: 		object_pressed = 1;
MOVS	R3, #1
MOVW	R2, #lo_addr(_object_pressed+0)
MOVT	R2, #hi_addr(_object_pressed+0)
STRB	R3, [R2, #0]
;MyProject_driver.c,808 :: 		DrawRoundBox(exec_round_box);
MOVW	R2, #lo_addr(_exec_round_box+0)
MOVT	R2, #hi_addr(_exec_round_box+0)
LDR	R2, [R2, #0]
MOV	R0, R2
BL	_DrawRoundBox+0
;MyProject_driver.c,809 :: 		}
L_Process_TP_Down139:
;MyProject_driver.c,810 :: 		PressedObject = (TPointer)exec_round_box;
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R3, [R4, #0]
MOVW	R2, #lo_addr(_PressedObject+0)
MOVT	R2, #hi_addr(_PressedObject+0)
STR	R3, [R2, #0]
;MyProject_driver.c,811 :: 		PressedObjectType = 7;
MOVS	R3, #7
SXTH	R3, R3
MOVW	R2, #lo_addr(_PressedObjectType+0)
MOVT	R2, #hi_addr(_PressedObjectType+0)
STRH	R3, [R2, #0]
;MyProject_driver.c,812 :: 		if (exec_round_box->OnDownPtr != 0) {
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R4, [R4, #0]
CMP	R4, #0
IT	EQ
BEQ	L_Process_TP_Down140
;MyProject_driver.c,813 :: 		exec_round_box->OnDownPtr();
MOVW	R4, #lo_addr(_exec_round_box+0)
MOVT	R4, #hi_addr(_exec_round_box+0)
LDR	R4, [R4, #0]
ADDS	R4, #40
LDR	R2, [R4, #0]
BLX	R2
;MyProject_driver.c,814 :: 		return;
IT	AL
BAL	L_end_Process_TP_Down
;MyProject_driver.c,815 :: 		}
L_Process_TP_Down140:
;MyProject_driver.c,816 :: 		}
L_Process_TP_Down138:
;MyProject_driver.c,817 :: 		}
L_Process_TP_Down137:
;MyProject_driver.c,819 :: 		}
L_Process_TP_Down123:
;MyProject_driver.c,820 :: 		}
L_end_Process_TP_Down:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Process_TP_Down
_Check_TP:
;MyProject_driver.c,822 :: 		void Check_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,823 :: 		if (TP_TFT_Press_Detect()) {
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_Check_TP141
;MyProject_driver.c,824 :: 		if (TP_TFT_Get_Coordinates(&Xcoord, &Ycoord) == 0) {
MOVW	R1, #lo_addr(_Ycoord+0)
MOVT	R1, #hi_addr(_Ycoord+0)
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
BL	_TP_TFT_Get_Coordinates+0
CMP	R0, #0
IT	NE
BNE	L_Check_TP142
;MyProject_driver.c,826 :: 		Process_TP_Press(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Press+0
;MyProject_driver.c,827 :: 		if (PenDown == 0) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_Check_TP143
;MyProject_driver.c,828 :: 		PenDown = 1;
MOVS	R1, #1
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,829 :: 		Process_TP_Down(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Down+0
;MyProject_driver.c,830 :: 		}
L_Check_TP143:
;MyProject_driver.c,831 :: 		}
L_Check_TP142:
;MyProject_driver.c,832 :: 		}
IT	AL
BAL	L_Check_TP144
L_Check_TP141:
;MyProject_driver.c,833 :: 		else if (PenDown == 1) {
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_Check_TP145
;MyProject_driver.c,834 :: 		PenDown = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_PenDown+0)
MOVT	R0, #hi_addr(_PenDown+0)
STRB	R1, [R0, #0]
;MyProject_driver.c,835 :: 		Process_TP_Up(Xcoord, Ycoord);
MOVW	R0, #lo_addr(_Ycoord+0)
MOVT	R0, #hi_addr(_Ycoord+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_Xcoord+0)
MOVT	R0, #hi_addr(_Xcoord+0)
LDRH	R0, [R0, #0]
BL	_Process_TP_Up+0
;MyProject_driver.c,836 :: 		}
L_Check_TP145:
L_Check_TP144:
;MyProject_driver.c,837 :: 		}
L_end_Check_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Check_TP
_Init_MCU:
;MyProject_driver.c,839 :: 		void Init_MCU() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,840 :: 		GPIO_Digital_Output(&GPIOE_BASE, _GPIO_PINMASK_9);
MOVW	R1, #512
MOVW	R0, #lo_addr(GPIOE_BASE+0)
MOVT	R0, #hi_addr(GPIOE_BASE+0)
BL	_GPIO_Digital_Output+0
;MyProject_driver.c,841 :: 		TFT_BLED = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
_SX	[R0, ByteOffset(GPIOE_ODR+0)]
;MyProject_driver.c,842 :: 		TFT_Set_Default_Mode();
BL	_TFT_Set_Default_Mode+0
;MyProject_driver.c,843 :: 		TP_TFT_Set_Default_Mode();
BL	_TP_TFT_Set_Default_Mode+0
;MyProject_driver.c,844 :: 		}
L_end_Init_MCU:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Init_MCU
_Start_TP:
;MyProject_driver.c,846 :: 		void Start_TP() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MyProject_driver.c,847 :: 		Init_MCU();
BL	_Init_MCU+0
;MyProject_driver.c,849 :: 		InitializeTouchPanel();
BL	MyProject_driver_InitializeTouchPanel+0
;MyProject_driver.c,851 :: 		Delay_ms(1000);
MOVW	R7, #24915
MOVT	R7, #81
NOP
NOP
L_Start_TP146:
SUBS	R7, R7, #1
BNE	L_Start_TP146
NOP
NOP
NOP
NOP
;MyProject_driver.c,852 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;MyProject_driver.c,853 :: 		Calibrate();
BL	_Calibrate+0
;MyProject_driver.c,854 :: 		TFT_Fill_Screen(0);
MOVS	R0, #0
BL	_TFT_Fill_Screen+0
;MyProject_driver.c,856 :: 		InitializeObjects();
BL	MyProject_driver_InitializeObjects+0
;MyProject_driver.c,857 :: 		display_width = Screen1.Width;
MOVW	R0, #lo_addr(_Screen1+2)
MOVT	R0, #hi_addr(_Screen1+2)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_width+0)
MOVT	R0, #hi_addr(_display_width+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,858 :: 		display_height = Screen1.Height;
MOVW	R0, #lo_addr(_Screen1+4)
MOVT	R0, #hi_addr(_Screen1+4)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_display_height+0)
MOVT	R0, #hi_addr(_display_height+0)
STRH	R1, [R0, #0]
;MyProject_driver.c,859 :: 		DrawScreen(&Screen1);
MOVW	R0, #lo_addr(_Screen1+0)
MOVT	R0, #hi_addr(_Screen1+0)
BL	_DrawScreen+0
;MyProject_driver.c,860 :: 		}
L_end_Start_TP:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Start_TP
MyProject_driver____?ag:
L_end_MyProject_driver___?ag:
BX	LR
; end of MyProject_driver____?ag
