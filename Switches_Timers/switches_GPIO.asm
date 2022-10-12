ORG 0000H
LJMP MAIN ;Jump to main subroutine
;Write initialization commands that include storing the two numbers in respective locations and defining Port 1 as output port.

MAIN:
;MOV @R1, #0FFH
MOV p1, #0FFH ; FOR CONFUGRING AS input and output PORT
;RET
acall delay
acall delay
acall delay
acall delay


MOV R4,P1; save input in register
acall delay
acall delay
acall delay
acall delay

MOV A, R4
ANL A, #0FH
MOV R0, #60H


MOVX @R0, A
mov p1, #00H
acall delay
acall delay
acall delay
acall delay

RL A ; FOR CONFUGRING AS input and output PORT
RL A 
RL A 
RL A 
MOV R5,P1; save input in register
MOV p1,A

ACALL DELAY
ACALL DELAY
ACALL DELAY
ACALL DELAY

MOV p1,#000H
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay

SJMP MAIN

delay:
USING 0
PUSH 0E0H
PUSH AR0 ;saving the contents of the registers which are going to be used
PUSH AR1
PUSH AR2
MOV A, #01 ;Value of \u20182*n\u2019 to create a delay of n seconds is loaded in A
MOV B, #10;Load 10 in B
MUL AB
;Multiply 10 with n to get the number of iterations for the 50ms loop
MOV R0, A ;Move the result to R0 which is used as the iterator in the loop
BACK1:
;following is a nested loop which generates a delay of 50ms. This delay
;has been iterated 10*2*n times to get a total delay of 500*2*n ms = n seconds
MOV R2,#200
BACK2:
MOV R1,#0FFH
BACK3:
DJNZ R1, BACK3
DJNZ R2, BACK2
DJNZ R0, BACK1
POP AR2
;popping the register in the exact reverse order before
POP AR1
POP AR0
POP 0E0H
RET

END
