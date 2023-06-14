#line 1 "C:/Daily use/Materials/Senior II Computer engineer/embedded system/LAB8/req1/MyProject_events_code.c"
#line 1 "c:/daily use/materials/senior ii computer engineer/embedded system/lab8/req1/myproject_objects.h"
typedef struct Screen TScreen;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef const struct CLabel {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TCLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

typedef struct Box_Round {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char Corner_Radius;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox_Round;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int CLabelsCount;
 TCLabel * const code *CLabels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 unsigned int Boxes_RoundCount;
 TBox_Round * const code *Boxes_Round;
};

extern TScreen Screen1;
extern TBox_Round BoxRound1;
extern TBox_Round BoxRound2;
extern TLabel Label1;
extern TCLabel Label2;
extern TBox_Round BoxRound3;
extern TLabel Label3;
extern TLabel * const code Screen1_Labels[2];
extern TCLabel * const code Screen1_CLabels[1];
extern TBox_Round * const code Screen1_Boxes_Round[3];

extern TScreen Screen2;
extern TBox Box1;
extern TBox Box2;
extern TImage Image1;
extern TImage * const code Screen2_Images[1];
extern TBox * const code Screen2_Boxes[2];




void BoxRound1OnClick();
void BoxRound2OnClick();
void BoxRound3OnClick();
void Label1OnClick();
void Label3OnClick();




extern char BoxRound1_Caption[];
extern char BoxRound2_Caption[];
extern char Label1_Caption[];
extern const char Label2_Caption[];
extern char BoxRound3_Caption[];
extern char Label3_Caption[];
extern char Box1_Caption[];
extern char Box2_Caption[];
extern char Image1_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawLabel(TLabel *ALabel);
void DrawCLabel(TCLabel *AClabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void DrawRoundBox(TBox_Round *Around_box);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "c:/daily use/materials/senior ii computer engineer/embedded system/lab8/req1/myproject_resources.h"
const code char Tahoma26x33_Regular[];
const code char eagle_jpg[3501];
#line 12 "C:/Daily use/Materials/Senior II Computer engineer/embedded system/LAB8/req1/MyProject_events_code.c"
void BoxRound1OnClick(){

 GPIOD_ODR = 0xFFFF;

}

void BoxRound2OnClick(){

 GPIOD_ODR = 0x0;
}

void BoxRound3OnClick(){

 GPIOD_ODR = ~GPIOD_ODR ;
}
void Label1OnClick() {
 Label1.visible= 1;
}
void Label3OnClick() {
 Label3.visible= 1;
}
