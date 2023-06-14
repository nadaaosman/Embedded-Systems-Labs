#include <avr/io.h>

void setup() {
  // put your setup code here, to run once:
DDRB=DDRB & (~(1<<PB0));
DDRB=DDRB & (~(1<<PB1));
DDRC=DDRC  & (~(1<<PC0));
DDRC = DDRC | (1<<PC1);
PORTC=PORTC & (~(1<<PC0));
PORTC = PORTC & (~(1<<PC1));
Serial.begin(9600);
}

void loop() {
  if(PINB & (1<<PB0))
  {
    _delay_ms(30);
  if(PINB & (1<<PB0))
  {
     Serial.println("button 0");
    if(PORTC == 1)
     PORTC &= (~(1<<PC0));
    else PORTC |=(1<<PC0);
  }
    // Serial.println("button 0");
    // Serial.println(PORTC);
    //println(PORTC);

  }

  // if(PINB & (1<<PB1))
  // {
  //   Serial.println("button 1");
  //   PORTC |= (1<<PC1);
  // }
  // else{
  //   PORTC &=(~(1<<PC1));
  // }
  // put your main code here, to run repeatedly:

}
