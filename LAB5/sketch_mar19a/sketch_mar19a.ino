 //master
 uint8_t count;
 uint8_t recieved;
void setup() {
  // put your setup code here, to run once:
  count=0;
SPI_Init();
 PORTB &= ~(1<<PB2);   //set SS pin Low
 _delay_ms(1000);
 Serial.begin(9600);
}
char SPI_Read()
{
  SPDR = 0xFF;
  while(!(SPSR & (1<<SPIF)));
  return(SPDR);
}
void SPI_Init()
{

/* SPI Initialize function */

DDRB = (1<<PB3) |(1<<PB5) |(1<<PB2); /* Make MOSI, SCK, SS

as Output pin */

/* Make MISO pin

as input pin */

DDRB &= ~(1<<PB4);

PORTB = (1<<PB2);

/* Make high on SS pin */
SPCR = (1<<SPE) | (1<<MSTR) |(1<<SPR0);
/* Enable SPI in master mode*/
SPSR &= ~(1<<SPI2X);
/* Disable speed doubler */
//Set SPI Clock Rate Bits combination to define SCK frequency
}
void SPI_Write (char data)
{
char flush_buffer;
SPDR = data;
while (! (SPSR & (1<<SPIF)));

flush_buffer = SPDR; 
}
void loop() {
if(count==101)
{
  count=0;
}
SPI_Write(count);
 _delay_ms(2000);
 recieved = (uint8_t)SPI_Read();
 Serial.println(recieved);
 _delay_ms(1000);
  count++;
}
  // put your main code here, to run repeatedly:

