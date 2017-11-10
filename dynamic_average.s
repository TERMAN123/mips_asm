# James J 
.data 
numinput: .asciiz "Input number of numbers whose average has to be calculated:\n"
getvals: .asciiz "Input values: " 
giveavg: .asciiz "Output: Average = "
debugmsg: .asciiz "im here\n" 

.globl main
.text

main:
la $a0, numinput
li $v0, 4
syscall

li $v0, 5
syscall

add $t0, $v0, $zero        # move the number of numbers to t0
add $t1, $t0, $zero        # so we can use it as a counter later 

la $a0, getvals
li $v0, 4
syscall

#get one value before we loop
input_loop:
li $v0, 6
syscall
add.s $f1, $f1, $f0
addi $t1, $t1, -1
beq $t1, $zero, end_input_loop
j input_loop

end_input_loop:
li $a0, 0x0A
li $v0, 11
syscall

la $a0, debugmsg
li $v0, 4
syscall

add.s $f12, $f2, $f1

li $v0, 2

syscall
