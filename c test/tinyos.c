#include <stdio.h>
#define ACIAC 0x8001
#define ACIAD 0x8003
#define RDRF 1
#define TDRE 2
#define MENU "\nMenu\n\r 1. ALUTest\n\r 2. Addition\n\r  3. Subtraction \n\r 4. Multiplication\n\r 5. Division\n\r 6. RamTest \n\r"
#define CR   0x0D
#define LF   0x0A

#define BANNER    "TSBUG 2 Version 23.07.86"
#define MODIFY    "Modified by Eugene A. Rockey Jr. Oct.18.2009"
#define WHY       "for use with the M68000 Minimal Computer Configuration"
#define WHERE     "University of Louisville"
#define ADDRE     "CECS 525, www.cs.louisville.edu"
#define USERNA    "Username: "
#define PASSM     "Password: "
#define CRLF      "TS2MON >"


// protocals
void mainProcessorCheck(void);  // check main processor
void ramTest(void);                // test RAM

void switchUser(void);          // switch between user and superuser
void userList(void);            // assign Users in RAM

void newline(void);
void MSG(void);
void banner(void);                // prints TinyOS start-up banner
void cmdPrompt(void);            // prints the command prompt
char* getCommand(void);            // recognizes the command line and stores it in _D1

void main(){
    EX_DIS();
    banner();
    do{
        char* cmd;
        cmd = getCommand();
    }while(1);
    
    unsigned char choice;
    newline();
    sendmsg(&MENU);
    newline();
    choice = getchar();
    
    sendchar(choice);
    
    switch(choice)
    {
        case 1:
            __asm__("add.l  #7, d1"
                    "cmpi.l #21, d1"
                    "bne     AddingError"
                    "rts"
                );
    }
    
    sendmsg(&MSG6);
    newline();
}

void banner(void)
{
    heading();
    pstring();
    newline();
}
void MSG(void)
{
    trap(15);
    word(7);
}
//Subroutine to get a character typed into Hyperterminal
unsigned char getchar()
{
    unsigned char temp = 0;
    unsigned char * const C = (unsigned char *) ACIAC;
    unsigned char * const D = (unsigned char *) ACIAD;
    while (temp == 0) {temp = *C & RDRF;}
    temp = *D;
    return temp;
}

//Subroutine to send a character to Hyperterminal
void sendchar(unsigned char asciiout)
{
    unsigned char temp = 0;
    unsigned char dummyread = 0;
    unsigned char * const C = (unsigned char *) ACIAC;
    unsigned char * const D = (unsigned char *) ACIAD;
    temp = *C & RDRF;
    while (temp != 0)
    {
        dummyread = *D;
        temp = *C & RDRF;
    }
    while (temp == 0) {temp = *C & TDRE;}
    *D = asciiout;
}

//Subroutine to send a message string to Hyperterminal
void sendmsg(unsigned int msg)
{
    unsigned char * strptr = (unsigned char *) msg;
    unsigned char ASCII = *strptr;
    while (ASCII != 0)
    {
        sendchar(ASCII);
        strptr = strptr + 1;
        ASCII = *strptr;
    }
}

//Subroutine to start a new line in Hyperterminal
void newline()
{
    sendchar(LF);
    sendchar(CR);
}

