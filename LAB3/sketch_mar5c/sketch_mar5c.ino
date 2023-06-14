#include <avr/io.h>
volatile uint8_t tot_overflow;
ISR (TIMER2_COMPA_vect)
{
// toggle led here
tot_overflow++;
if(tot_overflow==31)
PORTB ^=(1<<PB3);
}
void timer2_init(){
// set up timer with no prescaling
TCCR2B |= (1<<WGM22)|(1 << CS01)|(1 << CS00)| (1 << CS02);
TCCR2A |= (1 << COM2A0);
// initialize compare value
OCR2A = 250;
// enable compare interrupt
TIMSK2 |= (1 << OCIE2A);
sei();
// initialize counter
TCNT2 = 0;}
void setup(){
// connect led to pin PC0
// DDRC |= (1 << PC0);
DDRB |= (1 << PB3);
// PORTC=PORTC & (~(1<<PC0));  //intialize the led is off at the beggining 
tot_overflow=0;
// initialize timer
timer2_init();
}
void loop(){

}





