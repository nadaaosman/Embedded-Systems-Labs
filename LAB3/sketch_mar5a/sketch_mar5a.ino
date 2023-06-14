#include <avr/io.h>
volatile uint8_t tot_overflow;
ISR(TIMER2_OVF_vect)
{
// keep a track of number of overflows
tot_overflow++;
}
void timer2_init(){
// set up timer with no prescaling
TCCR2B |= (1 << CS02)|(1 << CS00)|(1 << CS01);
// enable overflow interrupt
TIMSK2 |= (1 << TOIE0);
// enable global interrupts
sei();
// initialize counter
TCNT2 = 0;
tot_overflow = 0;}
void setup(){
// connect led to pin PC0

DDRC |= (1 << PC0);
PORTC=PORTC & (~(1<<PC0));  //intialize the led is off at the beggining 
// initialize timer
timer2_init();
}
void loop(){
// check if the timer count reaches 191

if (tot_overflow >= 30) // NOTE: '>=' is used
{
// check if the timer count reaches 53
if (TCNT2 >= 133){
PORTC ^= (1 << PC0); // toggles the led
TCNT2 = 0; // reset counter
tot_overflow = 0; // reset overflow counter
}
}
}




