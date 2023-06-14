#include <avr/io.h>
#include <util/delay.h>

void setup() {
  // put your setup code here, to run once:
DDRD=DDRD | (1<<PD6);
PORTD |= (1<<PD6);

}

void loop() {
PORTD=PORTD & (~(1<<PD6));
_delay_ms(1000);
PORTD = PORTD |(1<<PD6);
_delay_ms(1000);
  // put your main code here, to run repeatedly:
}
