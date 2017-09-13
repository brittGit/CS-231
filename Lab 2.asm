.data
str1: .asciiz "============================================================================================================\n"
hrd:  .asciiz "Program Description: This program is written to mimic a very basic calculator \n"
hrd1:  .asciiz "Author: Brittany Garcia\n"
hrd2:  .asciiz "Creation Date: 9/6/2017\n"
str2: .asciiz "============================================================================================================\n"
str3: .asciiz "Please enter two numbers: "
str4: .asciiz "Sum is: "
str5: .asciiz "\n Difference is: "
str6: .asciiz "\n Product is: "
str7: .asciiz "\n Quotient is: "
str8: .asciiz "\n Remainder is: "

.text
main: 
li $v0 4 #load immediate value of 4 is print string into $v0

la $a0, str1 #prints ======
syscall
la $a0, hrd #prints Program Description
syscall
la $a0, hrd1 #prints Author
syscall
la $a0, hrd2 #prints Creation Date
syscall
la $a0, str2 #prins ========
syscall

#Prompt user
la $a0, str3 #prints Please enter two numbers
syscall #call operating system to perform operation

li $v0, 5 #load immediate value of 5 reads int one into $v0
syscall #call operating system to perform operation
add  $s0,$0,$v0 #adding value of $v0 to 0 then moving into $s0; storing first value into $s0

li $v0, 5 #reads another int into $v0
syscall #call operating system to perform operation
add  $s1,$0,$v0 #adding value of $v0 to 0 then moving to $s1 ;moving another int into $s1

#addition
li $v0 4 #load immediate value of 4 is print string
la $a0, str4 #load address of str4 into $a0; prints Sum is:
syscall #call operating system to perform operation

add   $a0, $s0, $s1 #adding s0 and s1 storing sum into $a0
li $v0, 1 #load immediate value of 1 is int to be printed
syscall #call operating system to perform operation

#subtract
li $v0 4 #load immediate value of 4 is print string
la $a0, str5 #load address of str5 into $a0; prints Difference is
syscall #call operating system to perform operation


sub $a0, $s0, $s1 #subtracting s0 and s1 and storing into $a0
li $v0, 1 #load immediate value of 1 is int to be printed
syscall #call operating system to perform operation


#product
li $v0 4 #load immediate value of 4 is print string
la $a0, str6 #load address of str6 into $a0; prints Product is
syscall #call operating system to perform operation


mult $s0, $s1 #multiplying $s0 and $s1
mfhi $t0 #move the value of hi register into $t0. Most significant digits placed into hi
mflo $t1 #move the value of lo register into $t1. Least significant digits placed into lo

li $v0, 1 #load immediate value of 1 is int to be printed
add $a0, $t1, $0 #add $t1 to 0 and store the value into $a0
syscall #call operating system to perform operation


#division
li $v0 4 #load immediate value of 4 is print string
la $a0, str7 #load address of str7 into $a0; prints Division is
syscall #call operating system to perform operation


div $s0, $s1 #dividing $s0 and $s1
mfhi $t0 #move the value of hi register into $t0 which is the remainder
mflo $t1 #move the value of lo register into $t1 which is the quotent as an int

li $v0, 1 #load immediate value of 1 is int to be printed 
add $a0, $t1, $0 #add $t1(which is the int of the dividion) to 0, store it in $a0
syscall #call operating system to perform operation


#remainder
li $v0 4 #load immediate value of 4 is print string
la $a0, str8 #load address of str8 into $a0; prints Remainder is
syscall #call operating system to perform operation


div $s0, $s1 #dividing then remembering remainder s0 and s1
mfhi $t0 #move the value of hi register into $t0 which is remainder
mflo $t1 #move the value of lo register into $t1 which is the quotent as an int


li $v0, 1 #load immediate value of 1 is int to be printed 
add $a0, $t0, $0 #adds $t1(has the answer for the division)to 0 then stores in $a0 
syscall  #call operating system to perform operation


#ends program 
li $v0, 10
syscall




