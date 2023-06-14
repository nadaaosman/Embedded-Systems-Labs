#include "MyProject_objects.h"
#include "MyProject_resources.h"

//--------------------- User code ---------------------//

//----------------- End of User code ------------------//

// Event Handlers



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
      Label1.visible=  1;
}
void Label3OnClick() {
     Label3.visible=  1;
}