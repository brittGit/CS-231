#Write a program that asks the user to enter the number of integers that
#needs to be added together. Then you use the loop to get the integers they chose to check to 
#see if they are even and add them together.
#Finally your program should output the sum on the screen.

.data
str: .asciiz "\n Enter a number: "
sumMessage: .asciiz "\n Sum: "
.text
main:
#initializing variables
li $s0, 0 #counter
li $s1, 1 #int 1
li $s3, 2 #int 2
li $s6, 0 #sum
li $s4, 0 #number of numbers to be added

#calling the string to be printed
la $a0, str #load address of str into $a0 
li $v0, 4 #load immediate value of 4 into $v0 for printing a string
syscall #call operating system to perform above console operation

li $v0, 5 #load immediate value of 5 int $v0, returns an int to $v0; receiveing number from user
syscall #call operating system to perform above console operation
add $s4, $v0, $0 #add number of numbers to be added, to 0 then store into $s4



loop: beq $s4, $s0, done #compare $s0 to $s4 to check equal, once equal jump to done

li $v0, 5 #load immediate value 5 into $v0 for read int; this is where the user inputs a number to be summed
syscall #call operating system to perform above console operation

div $v0, $s3 #dividing input by 2
mfhi $t0 #mfhi is remainder for div/2 stored into $t0
add $s5, $t0, $0 #add remainder $t0 to 0 then store in $s5 because $t0 is a temporary register

#if  remainder = 0, go to addnum
beq $s5, $0, addnum #comparing remainder to 0, if remainder is = 0 go to addnum. Determining if number is odd or even. If even, meaning no remainder, then go to addnum to be added to the sum
add $s0, $s0, $s1 #incrmenting counter by adding one($s1) to the counter($s0)
j loop #jump back to the begining of the loop

addnum: #adding even number function
add $s6, $s6, $v0 #adding even input($v0) to sum($s6)
add $s0, $s0, $s1 #incrementing counter($s0) by one($S1)
j loop #return to begining of loop


done: 
la $a0, sumMessage #load address of string into $a0
li $v0, 4 #load immediate value 4 into $v0 for printing a string
syscall #call operating system to perform $v0 console operation

li $v0, 1 #load immediate value 1 for printing an int (only prints $a0)
add $a0, $s6, $0 #moving sum to $a0 in order to print, moving sum into register $a0 to print
syscall #call operating system to perform $v0 console operation

li $v0, 10 #exit 
syscall #call operating system to perform $v0 console operation
