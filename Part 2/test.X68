
*-----------------------------------------------------------
* Title      : SIMPLE CALCULATOR
* Written by : ANTHONY LOFLIN
* Date       : 1/27/2018
* Description: PROJECT 1 PART 1
*-----------------------------------------------------------
    ORG    $4C00        ORIGIN IN MEMORY
START:            

    LEA     MESSAGE,A4  LOADS THE ADDRESS OF THE SAVED STRING INTO ADDRESS REGISTER 1 
    MOVE.B  #4,D1      PLACES THE TRAP COMMAND INTO DATA REGISTER ZERO
    TRAP    #0         TRAP COMMAND DISPLAYS STRING TO THE SCREEN WITH LF AND CR
    
MENU:
    move.b  #2,d1
    trap    #0
    LEA     MENUPROMPT,A4   LOADS THE ADDRESS FOR THE MENUPROMPT 
    MOVE.B  #4,D1          PLACES THE TRAP COMMAND INTO DATA REGISTER ZERO
    TRAP    #0             TRAP COMMAND DISPLAYS STRING TO THE SCREEN WITHOUT LF AND CR

    MOVE.B  #0,D1           PLACES THE TRAP COMMAND INTO DATA REGISTER ZERO
    TRAP    #0             TRAP COMMAND READS A NUMBER FROM THE KEYBOARD AND STORES IT INTO D1.L
    LEA     SPACING,A4      LOADS A PREDETERMINED SPACING STRING
    MOVE.B  #4,D1          PLACES THE TRAP COMMAND INTO DATA REGISTER ZERO
    TRAP    #0             TRAP COMMAND DISPLAYS STRING TO THE SCREEN WITH LF AND CR
    
    

    
    
    CMP.b   #49,D0           COMPARES THE NUMBER CAPTURED ABOVE TO PRE-SELECTED INTEGERS TO BRANCH TO SUBROUTINES
    BEQ     ADD             BRANCH IF EQUAL TO ADDITION
    CMP.b   #50,D0
    BEQ     SUB             BRANCH IF EQUAL TO SUBTRACTION
    CMP.b   #51,D0
    BEQ     MULTI           BRANCH IF EQUAL TO MULTIPLICATION
    CMP.b   #52,D0
    BEQ     DIV             BRANCH IF EQUAL TO DIVISION
    CMP.b   #53,D0       
    BEQ     illegal            BRANCH IF EQUAL TO EXIT
    CMP.b   #54,D0       
    BEQ     EXIT            BRANCH IF EQUAL TO EXIT

     

ERROR:                      ;SHOULD NOTHING EQUAL, PROGRAM RUNS INTO AN ERROR MESSAGE AND LOOPS BACK


    LEA     ERRORPROMPT,A4  LOADS STRING ADDRESS
    MOVE.B  #4,D1
    TRAP    #0
    BRA     MENU            
ADD:


    LEA     ADDPROMPT,A4    LOADS PROMPT FOR ADDITION
    MOVE.B  #4,D1          
    TRAP    #0
    LEA     SPACING,A4      LOADS A SPACING FORMAT FOR ASTHETICS
    MOVE.B  #4,D1
    TRAP    #0
    MOVE.B  #0,D1           CAPTURES A NUMBER FROM THE KEYBOARD (STORED IN DATA REGISTER 1)
    TRAP    #0
    LEA     ADDSIGN,A4      ADDITION SIGN IS DISPLAYED
    MOVE.B  #4,D1
    TRAP    #0
    MOVE.L  D0,D2           MOVE DATA FROM THE FIRST NUMBER TO DATA REGISTER 2 FROM DATA REGISTER 1
    MOVE.B  #0,D1           CAPTURE ANOTHER NUMBER  FROM THE KEYBOARD (STORED IN DATA REGISTER 1)
    TRAP    #0
    MOVE.L  D0,D3           MOVE DATA FROM DATA REGISTER 1 TO DATA REGISTER 3
    ADD.L   D2,D3           ADD DATA FROM REGISTER 2 TO REGISTER 3
    LEA     EQUALSIGN,A4    EQUAL SIGN IS DISPLAYED
    MOVE.B  #4,D1
    TRAP    #0
    MOVE.L  D3,D0           MOVE THE ADDED NUMBER FROM REGISTER 3 TO REGISTER 1
    sub.l   #48,d0
    MOVE.B  #1,D1           DISPLAY THE ANSWER OF THE ADDITION OPERATION
    TRAP    #0
    LEA     SPACING,A4      SPACING FOR ASTHETICS
    MOVE.B  #4,D1
    TRAP    #0
    BRA     MENU            RETURN TO MAIN MENU
    
SUB:
    
    
    LEA     SUBPROMPT,A4    LOADS SUBTRATION PROMPT
    MOVE.B  #4,D1
    TRAP    #0
    ANDI.W  #$DFFF,SR

    BRA     Menu
 
MULTI:

    
    LEA     MULTIPROMPT,A4  LOADS MULTIPLICATION PROMP
    MOVE.B  #4,D1
    Trap    #0
    trap    #14

    BRA     Menu
    
    

DIV:
   
    LEA    DIVPROMPT,A4     LOADS DIVISION PROMPT
    MOVE.B  #4,D0
    TRAP    #0
    jmp     $0001
  
       BRA     MENU            RETURN TO MAIN 
    

illegal:
     LEA    illegalprompt,A4     LOADS DIVISION PROMPT
    MOVE.B  #4,D0
    TRAP    #0
    jmp     $0000
 
       BRA     MENU            RETURN TO MAIN 

    
EXIT

    
    LEA     GOODBYE,A4       LOADS EXIT MESSAGE
    MOVE.B  #4,D1
    TRAP    #0          
    TRAP    #15 

   
  
CR  EQU $0D
LF  EQU $0A   

MESSAGE 
         DC.B    '',CR,LF
        DC.B  'User Mode',CR,LF
        DC.B   'PLEASE CHOOSE AN OPERATION',CR,LF,0
MENUPROMPT  
        DC.B    '',CR,LF
        DC.B    '1) ADDITION',CR,LF
        DC.B    '2) Privilage Error test',CR,LF
        DC.B    '3) Break Point test',CR,LF
        DC.B    '4) Address Error test',CR,LF
        DC.B    '5) Illegal Instruction Test',CR,LF 
        DC.B    '6) EXIT',CR,LF
        DC.B    '   OPERATION: ',0  
ADDPROMPT 
        DC.B  'ADDITION',CR,LF
        DC.B   'CHOSE THE TWO NUMBERS TO ADD (-99 TO 99)',CR,LF,0
     
SUBPROMPT 
        DC.B  'Privilage Error test',CR,LF,0
               
MULTIPROMPT 
        DC.B  'Break Point',CR,LF,0
         
        
DIVPROMPT 
        DC.B  'Address Error Test',CR,LF,0
      
     
ERRORPROMPT 
        DC.B  'NOT A VALID CHOICE',CR,LF
        DC.B  'TRY AGAIN',CR,LF,0 
SPACING
        DC.B    ' ',CR,LF,0
        
DIVZEROPROMPT 
        DC.B  'CANNOT DIVIDE BY ZERO',CR,LF
        DC.B  'TRY AGAIN',CR,LF,0 
EQUALSIGN
        DC.B  '=====',0
ADDSIGN
        DC.B    '+',0
SUBSIGN
        DC.B    '-',0
MULTISIGN
        DC.B    '*',0
DIVSIGN
        DC.B    '/',CR,LF,0
GOODBYE
        DC.B    'Exiting using Trap 15',CR,LF
        DC.B     'GOOD BYE',CR,LF,0
illegalprompt        
        
        DC.B    'Illegal instruction test',CR,LF,0
        

     END    START       












*~Font name~Courier New~
*~Font size~10~
*~Tab type~1~
*~Tab size~4~
