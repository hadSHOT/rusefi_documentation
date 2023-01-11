# Frankenstein Pinout

## P1

|def|pin|pin|def
|-|-|-|-|
||GND|GND|
||VDD|VDD|
||GND|NRST|N/C|
|Inp4/ADC11/CLT|PC1|PC0|EXT|
|Inp3/ADC13/IAT|PC3|PC2|Inp6/ADC12/USER|
|Inp1/ADC1/MAF|PA1|PA0|Inp5/ADC0/V_BATT|
|Inp2/ADC3/TPS|PA3|PA2|Inp8/ADC2/USER|
|EXT/TRIGGER IN 2|PA5|PA4|Inp7/ADC4/USER|
|Inp10/adc7/USER|PA7|PA6|Inp9/adc6/USER|
|Inp12/HALL/USER|PC5|PC4|Inp11/HALL/USER MAP?|
|?|PB1|PB0|?|
||GND|PB2|?|
|YES|PE7|PE8|HIGH DRIVER 1|
|HD44780_D6|PE9|PE10|HIGH DRIVER 2|
|HD44780_D7|PE11|PE12|HIGH DRIVER 3|
|DD HOLD|PE13|PE14|HIGH DRIVER 4|
|SPI CS|PE15|PB10|EXT|
|EXT|PB11|PB12|EXT/2CAN Rx|
|SPI SCK|PB13|PB14|SPI SO|
|SPI SI|PB15|PD8|EXT|
|EXT|PD9|PD10|EXT|
|EXT|PD11|PD12|LEDRUNNING ORANGE|
|LED CRANKING GREEN|PD13|PD14|LED ERROR RED|
|LED COMMUNICATION BLUE|PD15|NC|
||GND|GND|

## P2

|def|def|pin|pin|def|def|
|-|-|-|-|-|-|
|||GND|GND|
|||5V|5V|
|||3V|3V|
|||PH0 no_po|PH1 no_po|
|EXTRA_LED_1|OUT 1 jumper!|PC14|PC15|OUT 2|
|INJECTOR_5|OUT 3|PE6|PC13|OUT 4|FUEL_PUMP|
|SPARK_2|OUT 5|PE4|PE5|OUT 6|INJECTOR_4|
|IDLE_VALVE|OUT 7|PE2|PE3|OUT 8|INJECTOR_3|
|SPARK_3|OUT 9|PE0|PE1|OUT 10|SPARK_4|
|INJECTOR_2|OUT 11|PB8|PB9|OUT 12|INJECTOR_1|
|||BOOT0|VDD|
|2CAN Tx||PB6|PB7||spi cs2|
|spi MISO||PB4|PB5||spi MOSI|
|spi cs1||PD7|PB3||spi SCK|
|spi cs3||PD5|PD6|
|spi cs 4/ETB_LINE_3|ETB_LINE_3|PD3|PD4|
|1 EMULATION||PD1|PD2||2 EMULATION|
|HD44780_RS|YES|PC12|PD0|NC|
|HD44780_CS|YES|PC10|PC11|YES|HD44780_D5|
||NC|PA14|PA15|NC||
|HD44780_D4|YES|PA10|PA13|NC|
|||PA8|PA9|NC|
|||PC8|PC9|HIGH DRIVER 5|
|TRIGGER IN 1|| PC6|PC7|HIGH DRIVER 6|SPARK_1|
|||GND|GND|