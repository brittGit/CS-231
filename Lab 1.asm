.data
hrd:  .asciiz "Program Description: Output\n"
hrd1:  .asciiz "Author: Brittany Garcia\n"
hrd2:  .asciiz "Creation Date: 9/3/2017\n"
str:  .asciiz "\n\n\n\n\nHere is the Report of Top 5 employees in Erickson Company: \n"
str1: .asciiz "============================================================================================================\n"
str2: .asciiz "\t Last Name \t \t First Name \t Position \t \t \t \t Salary\n"
str3: .asciiz "\t ~~~~~~~~~ \t \t ~~~~~~~~~~ \t ~~~~~~~~ \t \t \t \t ~~~~~~\n"
str4: .asciiz "\t Smith \t \t \t Adam \t \t Director \t \t \t \t 99010\n"
str5: .asciiz "\t Hadden \t \t Mary \t \t Director \t \t \t \t 95220\n"
str6: .asciiz "\t Simpson \t \t Mike \t \t Manager \t \t \t \t 80000\n"
str7: .asciiz "\t Williams \t \t Andrea \t Designer \t \t \t \t 70000\n"
str8: .asciiz "\t Amer \t \t \t Ali \t \t Designer \t \t \t \t 55000\n"
str9: .asciiz "============================================================================================================\n"

.text
main:
#prints header 
li $v0 4
la $a0, hrd
syscall

#prints header 2
la $a0, hrd1
syscall

#prints header 3
la $a0, hrd2
syscall

#prints string 0-9
la $a0, str
syscall
la $a0, str1
syscall
la $a0, str2
syscall
la $a0, str3
syscall
la $a0, str4
syscall
la $a0, str5
syscall
la $a0, str6
syscall
la $a0, str7
syscall
la $a0, str8
syscall
la $a0, str9
syscall

#exits the program
li $v0, 10
syscall
