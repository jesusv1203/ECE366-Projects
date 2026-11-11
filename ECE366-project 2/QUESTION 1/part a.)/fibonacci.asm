
.data
n:      .word 10          # number we want to tesr
result: .word 0          # stores the fibonacci result

.text
.globl main

main:    
    lw $a0, n	  # load n from memory
    jal fibonacci # call the fibonacci function
    sw $v0, result # store the result in memory

    # print the fibonacci result
    move $a0, $v0 
    li $v0, 1     # print number
    syscall

    # End the program
    li $v0, 10
    syscall


# function to calculate fibonacci
fibonacci:

    ble $a0, 1, small # if n is 0 or 1, skip loop

    li $t0, 0 # a = 0
    li $t1, 1 # b = 1
    li $t2, 1 # i = 1

loop:
   
    beq $t2, $a0, endloop # stop when i = n

    move $t3, $t1 # temp = b
    add $t1, $t0, $t1 # b = a + b
    move $t0, $t3 # a = temp

    addi $t2, $t2, 1 # i = i + 1
    j loop # Repeat the loop

endloop:
    
    move $v0, $t1 # return b
    jr $ra

small:
    
    move $v0, $a0 # return n if n is smaller then one
    jr $ra
