#define BANNER	"TSBUG 2 Version 23.07.86"
#define MODIFY	"Modified by Eugene A. Rockey Jr. Oct.18.2009"
#define WHY   	"for use with the M68000 Minimal Computer Configuration"
#define WHERE 	"University of Louisville"
#define ADDRE 	"CECS 525, www.cs.louisville.edu"
#define USERNA 	"Username: "
#define PASSM 	"Password: "
#define CRLF    "TS2MON >"

void mainProcessorCheck(void);  // check main processor
void ramTest(void);			    // test RAM

void switchUser(void);  		// switch between user and superuser
void userList(void);			// assign Users in RAM

void MSG(void);			        // this will print out message that's stored on _A0
void newline(void);
void banner(void);				// prints TinyOS start-up banner
void cmdPrompt(void);			// prints the command prompt
char* getCommand(void);			// recognizes the command line and stores it in _D1

void main(){
	EX_DIS();
	banner();
	do{
		char* cmd;
		cmd = getCommand();
	}while(1);
}

void banner(void)
{
	HEADING();
	PSTRING();
	NEWLINE();
	PSTRING();
	NEWLINE();
	PSTRING();
	NEWLINE();
	PSTRING();
	NEWLINE();
}
void MSG(void)
{
	trap(15);
	word(7);
}
