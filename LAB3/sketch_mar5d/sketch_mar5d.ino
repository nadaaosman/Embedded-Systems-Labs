#include <avr/io.h>
#include <avr/interrupt.h>
volatile uint8_t tot_overflow;
volatile uint8_t x;
ISR(TIMER2_OVF_vect)
{
 tot_overflow++;
}

void timer2_init(void)
{
  // set up timer with prescaler = 256 
 TCCR2B |= (1 << CS21);
TCCR2B |= (1 << CS22);
// initialize counter
TCNT2 = 0;
// enable overflow interrupt
TIMSK2 |= (1 << TOIE0);
// enable global interrupts
sei();
// initialize overflow counter variable
tot_overflow = 0;
}
void setup() {
  x=0;
}

void loop() {
 
DDRC =0xFF;
// initialize timer
timer2_init();
while(1){
// check if no. of overflows = 12
if (tot_overflow >=244 ) // NOTE: '>=' is used
{
// check if the timer count reaches 53
if (x==0){
PORTC =0b0111111; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==1){
PORTC =0b0000110; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==2){
PORTC =0b1011011; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==3){
PORTC =0b1001111; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==4){
PORTC =0b1100110; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==5){
PORTC =0b1101101; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==6){
PORTC =0b1111101; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==7){
PORTC =0b0000111; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else if (x==8){
PORTC =0b1111111; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
x++;
}
else {
PORTC =0b1101111; // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0;
x=0;// reset overflow counter
}
} }
}