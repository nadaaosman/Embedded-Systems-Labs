  // slave
   uint8_t count;
void setup() {
// put your setup code here, to run once:
SPI_Init();
 Serial.begin(9600);
}
void SPI_Init()
{
  DDRB&=~((1<<PB3)|(1<<PB5)|(1<<PB2));
 DDRB |= (1<<PB4);
SPCR = (1<<SPE) ;
}

void SPI_Write (char data)
{
char flush_buffer;
SPDR = data;
while (! (SPSR & (1<<SPIF)));

flush_buffer = SPDR; 
}
char SPI_Receive()
{
  while(!(SPSR&(1<<SPIF)));
  return(SPDR);
}
void loop() {
  // put your main code here, to run repeatedly:
    count = (uint8_t)SPI_Receive();
     Serial.println(count);
       _delay_ms(500);
    SPI_Write(count+100);
    _delay_ms(500);
 }

