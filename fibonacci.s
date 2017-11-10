# James J 
.data
newl: .asciiz "\n"           # var with new line character
.text
.globl main
main:
#---------------------start up stuff----------------------------
add $s0, $ra, $zero          # save the return address
add $t0, $zero, $zero        # put zero in t0
addi $t1, $zero, 1           # put one in t1
addi $s1, $zero, 15          # counter limit
addi $s2, $zero, 2           # counter var, set to 2 to eliminate an offset
#---------------------printing some values------------------------
add $a0, $t0, $zero          # print out t0
li $v0, 1                    # get ready for int output
syscall                      #
la $a0, newl                 # put new line char in a0
li $v0, 4                    # get ready to print string
syscall                      #
add $a0, $t1, $zero          # print out t1
li $v0, 1                    # get ready for int output
syscall                      #
la $a0, newl                 # put new line char in a0
li $v0, 4                    # get ready to print string
syscall                      #
#-----------------doing some math-----------------------
start:
beq $s1, $s2, print2         # if counter hits limit jump to print2(print one)
addi $s2, $s2, 1             # incriment counter
add $t2, $t0, $t1            # t0 + t1 = t2
add $t0, $zero, $t2          # overwrite old t0 value with t2
beq $s1, $s2, print          # if counter hits limit jump to print(print both)
addi $s2, $s2, 1             # incriment counter
add $t2, $t0, $t1            # t0 + t1 = t2
add $t1, $zero, $t2          # overwrite old t1 value with t2
#----------------print more----------------
print:
add $a0, $t0, $zero          # print out t0
li $v0, 1                    # get ready for int output
syscall                      #
la $a0, newl                 # put new line char in a0
li $v0, 4                    # get ready to print string
syscall                      #
beq $s1, $s2, end            # check if (counter == counter_limit){end();}
print2:
add $a0, $t1, $zero          # print out t1
li $v0, 1                    # get ready for int output
syscall                      #
la $a0, newl                 # put new line char in a0
li $v0, 4                    # get ready to print string
syscall                      #
beq $s1, $s2, end            # check if (counter == counter_limit){end();}
j start                      # jump back to start (looping)
end:
move $s0, $ra                # restore return address
li $v0, 10                   # get ready to exit
syscall                      # 
