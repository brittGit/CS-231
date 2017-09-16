#Write a program that asks user “how many positive number that is devisable by you want to add?” .Then your loop
#counter would be the user input. If the user enters a positive number between 1 and 100 that is devisable by 6,
#you increment your loop counter and add it to the sum.. You need to decide if the positive number entered by the
#user is divisible by 6 or not. Your program should print an error message if the number is not within the range and
#ask user for another number
.data 
str: .asciiz "\n How many positive numbers that are divisible by 6 do you want to add? "
str1: .asciiz "\n Enter a number: "
str2: .asciiz " is divisible by 6."
str3: .asciiz "\n Sum of the numbers: "
error1msg: .asciiz "\n ERROR: Not within range."
error2msg: .asciiz "\n ERROR: Not divisible by 6"
error3msg: .asciiz "\n ERROR: Cannot enter a negative number."

.text
main:
#initialize variables
li $s0, 0 #counter
li $s3, 0 #sum
li $s6, 6 #int 6 to checck if divisible by 6
li $s7, 0 #number of times to loop through the loop
li $t1, 1 #int 1
li $t2, 100 #int 100

la $a0 str #load address of str into $a0
li $v0, 4 #load immediate value of 4 is printing string, $v0 looks for whats in $a0 ot print
syscall #call operating system to perform operation

#How many positive integers the user wants to add
li $v0, 5 #load immediate value of 5 returns an integer into $v0, takes input from user and stores into $v0 
syscall #call operating system to perform $v0 operation
add $s7, $v0, $0 #how many positive the user said they want to enter stored into s7

#$s7 is the # of #'s the user said they want to enter 
loop: beq $s0, $s7, done #start of the loop, if $s0(counter) != $s7 go through the loop, when they are equal go to done

la $a0 str1 #load address of str1 into $a0; prints enter a number
li $v0, 4 #load immediate value of 4 is printing string, $v0 looks for whats in $a0 to print
syscall #call operating system to perform $v0 operaton

li $v0, 5 #load immediate value of 5 reads an int the user wants to check (divisible by 6 and within the range) in the program
syscall #call operating system to perform $v0 operation

add $s4, $v0, $0 #add $v0(value the user enters to check) to 0 then store into $s4

blt $s4, $0, error3 #checks if s4 is less than 0, if it is go to error3, else check next condition
blt $s4, $t1, error1 #checks if $s4 is less than 1, if it is go to error 1, else check next condition
bgt $s4, $t2, error1 #checks if $s4 is greater than 100, if it is go to error 1, else check next condition

div $s4, $s6 #divide $s6 which is 6, by $s4 which is the current number the user entered
mfhi $t3 #remainder stored into mfhi, stored into $t3

bne $t3, $0, error2 #checks to see if the remainder is != to 0,  if it is != go to error2. if there is a remainder thats more than 0 print error

add $s0, $s0, $t1 #increment the counter($s0) by 1($t1)
add $s3, $s3, $s4 #add (user input)$s4 to sum($s3)
j loop #jump to loop

done: #breaks out of loop
la $a0 str3 #load address of str3 into $a0 (prints:the sum of the numbers) 
li $v0, 4 #print_string $a0 = address of string in memory
syscall #call operating system to perform $v0 operation

add $a0, $s3, $0 #add sum($s3) to 0 then into $a0
li $v0, 1 #load immediate value of 1 into $v0, value 1 is print_int, which prints $a0
syscall #call operating system to perform $v0 operation

#ends the program
li $v0, 10 #load immediate value of 10 into $v0 which exits the program
syscall #call operating system to perform $v0 operation


#ERROR SECTION
error1:
la $a0, error1msg #prints error1 which says; ERROR not within range
li $v0, 4 #print_string $a0 = address of string in memory
syscall #call operating system to perform $v0 operation
j loop #jump to loop

error2:
la $a0, error2msg #prints error2 which says; ERROR not divisible by 6
li $v0, 4 #print_string $a0 = address of string in memory
syscall #call operating system to perform $v0 operation
j loop #jump to loop

error3:
la $a0, error3msg #prints error3 which says; ERROR cannot enter a negative number
li $v0, 4 #print_string $a0 = address of string in memory
syscall #call operating system to perform $v0 operation
j loop #jump to loop







