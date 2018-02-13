#include "QSKDefines.h"
#include "proto.h"
#include "extern.h"
// LED control variable
int disp_count;
//analoge to digital values							
uint A2DValue;	
uint A2DValuePot;
uint A2DValueTherm;
uchar A2DProcessed;

void main(void)
{	//initailizes clock
	MCUInit();
	//initial display message				
	InitDisplay("Team-4  ");
	//initailizes UART1	
	InitUART();													
	//LED initialization 
	ENABLE_LEDS					
	//while loop with switch to control output
	//from each button, switch is located in 
	//LEDDisplay function 
	while(1) {
		// display current value of LED control variable
		LEDDisplay();
		//if SW1 is pressed		
		if(S1 == 0)
		{	//Displays a string to the LCD
			DisplayString(LCD_LINE1,"Hello!  ");
			//Blank string ensures previous characters are removed
			DisplayString(LCD_LINE2,"        ");
			//sets switch condition to control LEDS 
			disp_count=1;
		}
		//if SW2 is pressed
		else if (S2 == 0)
		{
			DisplayString(LCD_LINE1,"How Are ");
			DisplayString(LCD_LINE2,"You?    ");
			disp_count=2;
		}
		//if SW3 is pressed
		else if (S3 == 0)
		{
			
			DisplayString(LCD_LINE1,"Good Bye!");
			DisplayString(LCD_LINE2,"        ");
			disp_count=3;
		}
		//if no button is pressed, the LCD's defualt state
		else
		{
            	DisplayString(LCD_LINE1,"Part-3  ");
				DisplayString(LCD_LINE2,"Demo    ");
				//resets switch to default
				disp_count=0;
        }
	}
}

//Function contains a switch that controls
//the LED's state
void LEDDisplay(void)
{

	switch (disp_count){
		//if SW1 is pressed
		//the left most LED turns on
		case 1:							
   				LED0 = LED_ON;			
				LED1 = LED_OFF;
				LED2 = LED_OFF;
				break;
		//if SW2 is pressed
		//the two left most LED's
		//turn on		
		case 2:	
				LED0 = LED_ON;			
				LED1 = LED_ON;
				LED2 = LED_OFF;
				break;	
		//if SW3 is pressed
		//all three LED's turn on							
		case 3:
   				LED0 = LED_ON;			
				LED1 = LED_ON;
				LED2 = LED_ON;
				break;
		//if none of the buttons are
		//currently pressed all LED's
		//turn off
		default:
								
   				LED0 = LED_OFF;			
				LED1 = LED_OFF;
				LED2 = LED_OFF;	
				
				
				}
			
}	
	
	

