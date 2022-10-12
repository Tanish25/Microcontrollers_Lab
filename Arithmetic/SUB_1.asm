ORG 0000H
LJMP MAIN ;Jump to main subroutine
ORG 50H
INIT:
;Write initialization commands that include storing the two numbers in respective locations and defining Port 1 as output port.
MOV R0, #001H
MOV R1, #40H
MOV @R1, #001H
MOV p1, #000H ; FOR CONFUGRING AS OUTPUT PORT
RET

ADDER_8BIT:
; Write the
MOV A, R0
ADD A,@R1
SUBB A, #04H
RET
;addition subroutine

NIBBLE_8BIT:
MOV R5, A
SWAP A 
MOV R6, A 
MOV A, #000H
MOV ACC.7, C


;Write the code to extract upper and lower nibbles and to call LED program
RET


LED:
MOV p1, R5
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
MOV p1, R6
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay
MOV p1, A
acall delay
acall delay
acall delay
acall delay
acall delay
acall delay

;Showing the values on LED
RET

delay:
	mov R3, #255
	delay1: 
		mov R4, #255
		here: djnz R4, here
		djnz R3, delay1
	ret
;------------------------------------ Main subroutine------------------------------------
ORG 0100H
MAIN:
ACALL INIT
ACALL ADDER_8BIT ;Adding the two values
ACALL NIBBLE_8BIT ;Separate the nibbles and Display result on led(sum)

LOOP:
ACALL LED
SJMP LOOP
END
