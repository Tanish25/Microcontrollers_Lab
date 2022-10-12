LCD_data equ P2
LCD_rs equ P0.0
LCD_rw equ P0.1
LCD_en equ P0.2

ORG 0000H
ljmp start

org 200h
start:
	
	mov P2, #00H
	acall delay
	acall delay
	acall lcd_init
	acall delay
	acall delay
	acall delay
	mov A, #085H
	acall lcd_command
	acall delay
	acall lcd_senddata1
	acall delay
	mov A, #0C3H
	acall lcd_command
	acall delay
	acall lcd_senddata2
	acall delay
	here: sjmp here



lcd_init:
	mov A,#38H
	acall lcd_command

	mov A,#0EH
	acall lcd_command
	
	mov A,#01H
	acall lcd_command

	mov A,#06H
	acall lcd_command

	ret




lcd_command:
	mov LCD_data, A	
	clr LCD_rs
	clr LCD_rw
	setb LCD_en
		acall delay
	clr LCD_en
		acall delay
	ret

lcd_senddata1:
	mov dptr,#my_string1
	push 0e0h 
	 jmp_loop:
		clr A
	
		movc A, @A+DPTR
		JZ end1
	mov LCD_data, a
	setb LCD_rs
	clr LCD_rw
	setb LCD_en
		acall delay
	clr LCD_en
		acall delay
	inc DPTR
	jmp jmp_loop
	end1:
		pop 0e0h
		ret

lcd_senddata2:
	mov dptr,#my_string2
	push 0e0h 
	 jmp_loop1:
		clr A
	
		movc A, @A+DPTR
		JZ end2
	mov LCD_data, a
	setb LCD_rs
	clr LCD_rw
	setb LCD_en
		acall delay
	clr LCD_en
		acall delay
	inc DPTR
	jmp jmp_loop1
	end2:
		pop 0e0h
		ret


 ;Load DPTR with sring1 Addr
;call strings sending routine
;call delay

;lcd_sendstring:
;push 0e0h ; push value of accumulator (use in case accumulator is prestored with some other data)
;clear Accumulator for any previous data
;jmp_loop: 
;clr A
;movc A, @A+DPTR
;JZ end1
 

;load the first character in accumulator using movc command that loads data from dptr location
;go to exit if zero
;send first character
;increment data pointer
;jump back to send the next character
;exit: ;pop 0e0h
;ret ;End of routine

delay: mov r0,#10
loop2: mov r1, #255
	loop1: djnz r1, loop1
	djnz r0, loop2
	ret

	


;Do the above string sending step for next line data also
;lcd_sendstring:
;push 0e0h ; push value of accumulator (use in case accumulator is prestored with some other data)
;clear Accumulator for any previous data
;load the first character in accumulator using movc command that loads data from dptr location
;go to exit if zero
;send first character
;increment data pointer
;jump back to send the next character
;exit: ;pop 0e0h
;ret ;End of routine


org 300h
my_string1:
DB 'Aditya', 00H
my_string2:
DB '10OCT 2022', 00H
End


