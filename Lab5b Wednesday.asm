#Write a program that prompt the user to input n numbers (0<n<11) and stores them in an
#array. Then it finds the median of the array, assuming the elements are in ascending order
#Program Description: Lab 5 part 2
#Author: Brittany Garcia
#Date: 9/20/17
	 .data
array:     .word   0,0,0,0,0,0,0,0,0,0 #creating 10 elements each one initialized to 0
prompt:	 .asciiz "Enter number of elements in the array: "
number:	 .asciiz "Enter number "
endprompt: .asciiz "The numbers in the array in reverse order are: \n"
space:	 .asciiz " "
error1:	 .asciiz "Error cannot be less than 1\n" 
error2:	 .asciiz "Error cannot be greater than 10\n"
median:	 .asciiz "Median is: "
	 .text
main:
#initialize variables
	li $s0, 0 	#counter
	li $s4, 1	#int 1 to check if array side is below 1
	li $s7, 10	#int 10 to check if array size is above 10
	li $t4, 4	#int 4 so I can change the positon of the pointer
	li $s2, 2	#int 2 so I can divide by 2, to determine quotent, for odd/even also for even block
	la $s1, array 	#array
	
#prompt user to figure out how big array will be
	la $a0, prompt 	#load address of prompt into $a0
	li $v0, 4 	#load immediate appropriate call code 4(print string) into $v0
	syscall
	
	li $v0, 5 			#load immediate call code 5; return 5(read int) to $v0
	syscall
	
	add $s3, $v0, $0 		#store user input into $s3
	
	bgt $s3, $s7, errortoohigh 	#compares #s3 to #s7 to see if $s3 > $s7
	ble $s3, $0, errortoolow 	#compares $s3 to $0 to see if $s3 <= $0
	
	add $s6, $s3, $0 		#moves array size to $s6
	j loop
	
	
	#store user input into array
loop: beq $s0, $s3, check 		#checks to see if user input has filled the array, counter=array size?

	#prompt message to user
	la $a0, number		#load address of number into $a0, says Enter number:
	li $v0, 4 		#load immediate appropriate call code 4(print string) into $v0
	syscall

	#save user input
	li $v0, 5 		#load immediate value of 5(read int) to $v0, return int to $v0
	syscall

	sw $v0, 0($s1) 		#sw in $vo into RAM at address contained into $s1(array) store word from user into the register of the array
	add $s1, $s1, 4		#add 4 to the array
	add $s0, $s0, 1		#add 1 to counter
	#add $s5, $s5, 1	#add 1 to $s5 to change position of element (Enter number ...)
	
	j loop
check:
	div $s6, $s2		#divide size of array($s6) by 2($s2)
	mfhi $t1		#remainder goes into $t1
	mflo $t2		#quotent goes into $t2
	
	beq $t1, $0, printeven 
	bne $t1, $0, printodd
	
printeven:
	la $s1, array 		#array
	
	la $a0, median		#loads medianeven (Median even is:) into $a0
	li $v0, 4		#load immediate appropriate call code 4(print string) into $v0
	syscall
	
	#the idea here is to get the middle two elements and add them together then divide by 2
	
	#getting value of right-middle
	mult $t2, $t4		#multiply quotent of size of array by $t4 which is 4
	mflo $t3		#store in $t3
	add $s1, $s1, $t3	#add address to point to right side median element
	lw $s5, 0($s1)		#$s5 is the value of right-middle, $s1 is an address of the right-middle element in the array
	
	#getting second value, left-middle
	sub $s1, $s1, 4		#subtract 4 from address of $s1 to move it to the left-middle element
	lw $t1, 0($s1)		#$t1 is value of poition of $s1
	add $s5, $t1, $s5	#add right-middle value to left-middle value, store into $s5
	
	div $s5, $s2		#s5 divided by 2 $s2 holds 2
	mflo $a0		#load quotent into $a0 because I want to print the values
	li $v0, 1		#load immediate appropriate call code 1(1 is print int) into $v0
	syscall
	
	j exit			#when finished jump to exit

printodd:
	la $s1, array 		#array
	
	la $a0, median		#loads medianeven (Median even is:) into $a0
	li $v0, 4		#load immediate appropriate call code 4(print string) into $v0
	syscall

	mult $t2, $t4		#multiply quotent of size of array (which is the middle value)by $t4 which is 4, to move the pointer to the middle position
	mflo $t9		#store into $t9
	add $s1, $s1, $t9	#add middle value address ($t9) to address of array 
	lw $a0, 0($s1)		#$a0 is now the value of the position of $s1
	
	li $v0, 1		#load immediate call code 1(print int) into $v0
	syscall
	
	j exit

exit:
	li $v0, 10		#load immediate call code 10(exit) into $v0
	syscall


	#error section
errortoolow:
	la $a0, error1 		#prints error cannot be less than 1
	li $v0, 4 		#print string
	syscall
	j main			#jump to main
	
errortoohigh: 
	la $a0, error2 		#prints error annot be greater than 10
	li $v0, 4 		#print string
	syscall
	j main			#jump to main

