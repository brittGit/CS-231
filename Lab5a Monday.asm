#Write a MIPS program to ask user to input the number of elements of array. The user input
#should be a positive number less than or equal to 10. Then your program ask the user to fill
#up the array and then print the content of array in reverse order. An Example of sample input
#and output would b
#Program Description: Lab 5
#Author: Brittany Garcia
#Date: 9/18/17
	 .data
array:     .word  0,0,0,0,0,0,0,0,0,0 #creating 10 elements each one initialized to 0
prompt:	 .asciiz "Enter number of elements in the array: "
number:	 .asciiz "Enter number "
endprompt: .asciiz "The numbers in the array in reverse order are: \n"
space:	 .asciiz " "
error1:	 .asciiz "Error cannot be less than 1\n" 
error2:	 .asciiz "Error cannot be greater than 10\n"
	 .text
main:
#initialize variables
	li $s0, 0 	#counter
	li $s4, 1	#int 1
	li $s7, 10	#int 10
	li $t9, 4	#int 4
	la $s1, array 	#array
	
#prompt user to figure out how big array will be
	la $a0, prompt 	#load address of prompt into $a0
	li $v0, 4 	#load immediate appropriate call code 4(print string) into $v0
	syscall
	
	li $v0, 5 	#load immediate value of 5; return 5(read int) to $v0
	syscall
	
	add $s3, $v0, $0 	#store user input into $s3
	
	bgt $s3, $s7, errortoohigh #compares #s3 to #s7 to see if $s3 > $s7
	ble $s3, $0, errortoolow   #compares $s3 to $0 to see if $s3 <= $0
	
	add $s6, $s3, $0 	#moves array size to $s6
	j loop
	
	
	#store user input into array
loop: beq $s0, $s3, block 	#checks to see if user input has filled the array, counter=array size?

	#prompt message to user
	la $a0, number	#load address of number into $a0, says Enter number:
	li $v0, 4 	#load immediate appropriate call code 4(print string) into $v0
	syscall

	#save user input
	li $v0, 5 	#load immediate value of 5(read int) to $v0, return int to $v0
	syscall

	sw $v0, 0($s1) 	#sw in $vo into RAM at address contained into $s1(array) store word from user into the register of the array
	add $s1, $s1, 4		#add 4 to the array
	add $s0, $s0, 1		#add 1 to counter
	
	j loop
block:
	#overriding the array and counter to reset back to top
	li $s0, 0 	#counter
	la $s1, array 	#array

	la $a0, endprompt 	#end prompt says The numbers in the array are: 
	li $v0, 4 		#load immediate appropriate call code 4(print string) into $v0
	syscall
	
	mult $s6, $t9		#$s6 is array size $t9 is 4
	mflo $t0		#arraysize*4 stored in $t0
	add $s1, $t0, $s1	#adding multiplication to array($s1 = array)
	
print: beq $s0, $s3, exit	#$s3 is number of elements in the array as stated by user

	sub $s1, $s1, 4 	#add 4 to the first address of the array, which is now last address of array, moving the pointer to the next address each time
	
	lw $a0, 0($s1) 		#load word from $a0 into position 0 of the array($s1)
	li $v0, 1		#load immediate value of 1, print int, into $v0
	syscall
	
	#prints a space between numbers
	la $a0, space 		#load address of space into $a0, space: .asciiz " "
	li $v0, 4		#load immediate appropriate call code 4(print string) into $v0
	syscall		
	
	
	sub $s3, $s3, 1		#counter - 1 to get it back to the first position of the array
	j print

exit:
	li $v0, 10
	syscall

	#error section
errortoolow:
	la $a0, error1 	#prints error cannot be less than 1
	li $v0, 4 	#print string
	syscall
	j main
	
errortoohigh: 
	la $a0, error2 	#prints error annot be greater than 10
	li $v0, 4 	#print string
	syscall
	j main	

