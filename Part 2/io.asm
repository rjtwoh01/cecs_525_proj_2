; C:\USERS\ANTHONY\DESKTOP\SCHOOL\CECS 525\PROJECT 1\PROJECT 1\MYPROG\IO.C - Compiled by CC68K  Version 5.00 (c) 1991-2005  Peter J. Fondse
; //by Eugene Rockey Copyright 2012 All Rights Reserved
; //Constants
; #define ACIAC 0x8001
; #define ACIAD 0x8003
; #define RDRF 1
; #define TDRE 2
; #define MENU "\nMenu\n\r 1. Addition\n\r 2. Subtraction\n\r 3. Multiplication\n\r 4. Division\n\r"
; #define answer "Result: "
; #define MSG0 "Single Digit Result Addition"
; #define MSG1 "Enter First Number: "
; #define MSG2 "Enter Second Number: "
; #define MSG3 " + "
; #define MSG4 " = "
; #define MSG5 "Add Again?"
; #define MSG6 "Goodbye!"
; #define MSG7 "Num1: "
; #define MSG8 "Num2: "
; #define CR   0x0D
; #define LF   0x0A
; //Protocols
; unsigned char getchar(void);
; void sendchar(unsigned char c);
; void sendmsg(unsigned int msga);
; void newline(void);
; //Main Code
; void main()
; {

    org $4C00
_main:
       movem.l   D2/D3/D4/D5/D6/D7/A2/A3/A4/A5,-(A7)
       lea       _newline.L,A2
       lea       _sendmsg.L,A3
       lea       _sendchar.L,A4
       lea       _getchar.L,A5
; unsigned char choice;
; unsigned char num1 = 0;
       clr.b     D4
; unsigned char num2 = 0;
       clr.b     D3
; unsigned char ASCII = 0;
       clr.b     D2
; unsigned char result = 0;
       clr.b     D5
; unsigned char again = 'Y';
       moveq     #89,D6
; while(again == 'Y' || again == 'y')
main_1:
       cmp.b     #89,D6
       beq.s     main_4
       cmp.b     #121,D6
       bne       main_3
main_4:
; {
; newline();
       jsr       (A2)
; sendmsg(&MENU);
       pea       io_1.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; choice = getchar();
       jsr       (A5)
       move.b    D0,D7
; sendchar(choice);
       and.l     #255,D7
       move.l    D7,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; switch(choice)
       and.l     #255,D7
       move.l    D7,D0
       sub.l     #49,D0
       blo       main_6
       cmp.l     #4,D0
       bhs       main_6
       asl.l     #1,D0
       move.w    main_7(PC,D0.L),D0
       jmp       main_7(PC,D0.W)
main_7:
       dc.w      main_8-main_7
       dc.w      main_9-main_7
       dc.w      main_10-main_7
       dc.w      main_11-main_7
main_8:
; {
; case '1':          //addition
; newline();
       jsr       (A2)
; sendmsg(&MSG1);
       pea       io_2.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num1 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D4
; newline();
       jsr       (A2)
; sendmsg(&MSG2);
       pea       io_3.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num2 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D3
; result = num1 + num2;
       move.b    D4,D0
       add.b     D3,D0
       move.b    D0,D5
; newline();
       jsr       (A2)
; sendmsg(&answer);
       pea       io_4.L
       jsr       (A3)
       addq.w    #4,A7
; sendchar(result + 48);
       move.b    D5,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG5);
       pea       io_5.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; again = getchar();
       jsr       (A5)
       move.b    D0,D6
; break;
       bra       main_6
main_9:
; case '2':           //subtraction
; newline();
       jsr       (A2)
; sendmsg(&MSG1);
       pea       io_2.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num1 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D4
; newline();
       jsr       (A2)
; sendmsg(&MSG2);
       pea       io_3.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num2 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D3
; result = num1 - num2;
       move.b    D4,D0
       sub.b     D3,D0
       move.b    D0,D5
; newline();
       jsr       (A2)
; sendmsg(&answer);
       pea       io_4.L
       jsr       (A3)
       addq.w    #4,A7
; sendchar(result + 48);
       move.b    D5,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG5);
       pea       io_5.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; again = getchar();
       jsr       (A5)
       move.b    D0,D6
; break;
       bra       main_6
main_10:
; case '3':           //multiplication
; newline();
       jsr       (A2)
; sendmsg(&MSG1);
       pea       io_2.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num1 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D4
; newline();
       jsr       (A2)
; sendmsg(&MSG2);
       pea       io_3.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num2 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D3
; result = num1 * num2;
       move.b    D4,D0
       and.w     #255,D0
       and.w     #255,D3
       mulu.w    D3,D0
       move.b    D0,D5
; newline();
       jsr       (A2)
; sendmsg(&answer);
       pea       io_4.L
       jsr       (A3)
       addq.w    #4,A7
; sendchar(result + 48);
       move.b    D5,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG5);
       pea       io_5.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; again = getchar();
       jsr       (A5)
       move.b    D0,D6
; break;
       bra       main_6
main_11:
; case '4':           //division
; newline();
       jsr       (A2)
; sendmsg(&MSG1);
       pea       io_2.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num1 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D4
; newline();
       jsr       (A2)
; sendmsg(&MSG2);
       pea       io_3.L
       jsr       (A3)
       addq.w    #4,A7
; ASCII = 0;
       clr.b     D2
; ASCII = getchar();
       jsr       (A5)
       move.b    D0,D2
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; num2 = ASCII - 48;
       move.b    D2,D0
       sub.b     #48,D0
       move.b    D0,D3
; sendmsg(&MSG7);
       pea       io_6.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendchar(num1 + 48);
       move.b    D4,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG8);
       pea       io_7.L
       jsr       (A3)
       addq.w    #4,A7
; sendchar(num2 + 48);
       move.b    D3,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; result = num1 / num2;
       move.b    D4,D0
       and.l     #65535,D0
       divu.w    D3,D0
       move.b    D0,D5
; newline();
       jsr       (A2)
; sendmsg(&answer);
       pea       io_4.L
       jsr       (A3)
       addq.w    #4,A7
; //sendchar(result);
; //result = result + 48;
; sendchar(result + 48);
       move.b    D5,D1
       add.b     #48,D1
       and.l     #255,D1
       move.l    D1,-(A7)
       jsr       (A4)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; sendmsg(&MSG5);
       pea       io_5.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
; again = getchar();
       jsr       (A5)
       move.b    D0,D6
; break;
main_6:
       bra       main_1
main_3:
; }
; }
; sendmsg(&MSG6);
       pea       io_8.L
       jsr       (A3)
       addq.w    #4,A7
; newline();
       jsr       (A2)
       movem.l   (A7)+,D2/D3/D4/D5/D6/D7/A2/A3/A4/A5
       JMP        $1000
; }
; //Subroutine to get a character typed into Hyperterminal
; unsigned char getchar()
; {

_getchar:
       link      A6,#-8
       move.l    D2,-(A7)
; unsigned char temp = 0;
       clr.b     D2
; unsigned char * const C = (unsigned char *) ACIAC;
       move.l    #32769,-8(A6)
; unsigned char * const D = (unsigned char *) ACIAD;
       move.l    #32771,-4(A6)
; while (temp == 0) {temp = *C & RDRF;}
getchar_1:
       tst.b     D2
       bne.s     getchar_3
       move.l    -8(A6),A0
       move.b    (A0),D0
       and.b     #1,D0
       move.b    D0,D2
       bra       getchar_1
getchar_3:
; temp = *D;
       move.l    -4(A6),A0
       move.b    (A0),D2
; return temp;
       move.b    D2,D0
       move.l    (A7)+,D2
       unlk      A6
       rts
; }
; //Subroutine to send a character to Hyperterminal
; void sendchar(unsigned char asciiout)
; {

_sendchar:
       link      A6,#-4
       movem.l   D2/D3/D4,-(A7)
; unsigned char temp = 0;
       clr.b     D2
; unsigned char dummyread = 0;
       clr.b     -1(A6)
; unsigned char * const C = (unsigned char *) ACIAC;
       move.l    #32769,D3
; unsigned char * const D = (unsigned char *) ACIAD;
       move.l    #32771,D4
; temp = *C & RDRF;
       move.l    D3,A0
       move.b    (A0),D0
       and.b     #1,D0
       move.b    D0,D2
; while (temp != 0)
sendchar_1:
       tst.b     D2
       beq.s     sendchar_3
; {
; dummyread = *D;
       move.l    D4,A0
       move.b    (A0),-1(A6)
; temp = *C & RDRF;
       move.l    D3,A0
       move.b    (A0),D0
       and.b     #1,D0
       move.b    D0,D2
       bra       sendchar_1
sendchar_3:
; }
; while (temp == 0) {temp = *C & TDRE;}
sendchar_4:
       tst.b     D2
       bne.s     sendchar_6
       move.l    D3,A0
       move.b    (A0),D0
       and.b     #2,D0
       move.b    D0,D2
       bra       sendchar_4
sendchar_6:
; *D = asciiout;
       move.l    D4,A0
       move.b    11(A6),(A0)
       movem.l   (A7)+,D2/D3/D4
       unlk      A6
       rts
; }
; //Subroutine to send a message string to Hyperterminal
; void sendmsg(unsigned int msg)
; {

_sendmsg:
       link      A6,#0
       movem.l   D2/D3,-(A7)
; unsigned char * strptr = (unsigned char *) msg;
       move.l    8(A6),D3
; unsigned char ASCII = *strptr;
       move.l    D3,A0
       move.b    (A0),D2
; while (ASCII != 0)
sendmsg_1:
       tst.b     D2
       beq.s     sendmsg_3
; {
; sendchar(ASCII);
       and.l     #255,D2
       move.l    D2,-(A7)
       jsr       _sendchar
       addq.w    #4,A7
; strptr = strptr + 1;
       addq.l    #1,D3
; ASCII = *strptr;
       move.l    D3,A0
       move.b    (A0),D2
       bra       sendmsg_1
sendmsg_3:
       movem.l   (A7)+,D2/D3
       unlk      A6
       rts
; }
; }
; //Subroutine to start a new line in Hyperterminal
; void newline()
; {

_newline:
; sendchar(LF);
       pea       10
       jsr       _sendchar
       addq.w    #4,A7
; sendchar(CR);
       pea       13
       jsr       _sendchar
       addq.w    #4,A7
       rts
; }

io_1:
       dc.b      10,77,101,110,117,10,13,32,49,46,32,65,100,100
       dc.b      105,116,105,111,110,10,13,32,50,46,32,83,117
       dc.b      98,116,114,97,99,116,105,111,110,10,13,32,51
       dc.b      46,32,77,117,108,116,105,112,108,105,99,97,116
       dc.b      105,111,110,10,13,32,52,46,32,68,105,118,105
       dc.b      115,105,111,110,10,13,0
io_2:
       dc.b      69,110,116,101,114,32,70,105,114,115,116,32
       dc.b      78,117,109,98,101,114,58,32,0
io_3:
       dc.b      69,110,116,101,114,32,83,101,99,111,110,100
       dc.b      32,78,117,109,98,101,114,58,32,0
io_4:
       dc.b      82,101,115,117,108,116,58,32,0
io_5:
       dc.b      65,100,100,32,65,103,97,105,110,63,0
io_6:
       dc.b      78,117,109,49,58,32,0
io_7:
       dc.b      78,117,109,50,58,32,0
io_8:
       dc.b      71,111,111,100,98,121,101,33,0
