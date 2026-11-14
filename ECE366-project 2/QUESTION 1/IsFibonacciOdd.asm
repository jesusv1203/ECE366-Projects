.data
n:          .word 7     # Input number
result:     .word 0     # 1 = odd, 0 = even

.text
.globl main

main:
    lw $a0, n           # Load n from memory
    jal IsFibonacciOdd  # Calculate whether Fibonacci(n) is odd
    nop
    sw $v0, result      # Store final answer in memory
    move $t3, $v0       # Save answer in $t3 as in part (b)
    move $a0, $v0       # Print final answer
    li $v0, 1
    syscall
    li $v0, 10          # Exit program
    syscall

# Part (c): IsFibonacciOdd(n)
IsFibonacciOdd:
    addi $sp, $sp, -4   # Allocate stack space
    sw $ra, 0($sp)      # Save caller's return address
    jal fibonacci       # Compute Fibonacci(n)
    nop
    move $a0, $v0       # Pass Fibonacci result to IsOdd
    jal IsOdd           # Return 1 if odd, 0 if even
    nop
    lw $ra, 0($sp)      # Restore return address
    addi $sp, $sp, 4
    jr $ra
    nop

# Part (a): Fibonacci(n)
fibonacci:
    ble $a0, 1, return_n
    nop
    li $t0, 0           # a = 0
    li $t1, 1           # b = 1
    addi $t2, $a0, -1   # Loop counter = n - 1

fib_loop:
    beq $t2, $zero, fib_done
    nop
    move $t3, $t1       # temp = b
    add $t1, $t0, $t1   # b = a + b
    move $t0, $t3       # a = temp
    addi $t2, $t2, -1   # Decrement counter
    j fib_loop
    nop

fib_done:
    move $v0, $t1       # Return b
    jr $ra
    nop

return_n:
    move $v0, $a0       # Return n for base cases
    jr $ra
    nop

# Part (b): IsOdd(m)
IsOdd:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    li $a1, 2           # Divisor = 2
    jal division        # Compute remainder
    nop
    beq $v0, $zero, even
    nop
odd:
    li $v0, 1           # Return True
    j endIsOdd
    nop
even:
    li $v0, 0           # Return False
endIsOdd:
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra
    nop

# Division by repeated subtraction
# Input: $a0 = x, $a1 = 2; output: $v0 = remainder
division:
    move $t0, $a0       # x = input
    move $t1, $a1       # Divisor
    li $t2, 0           # quotient = 0
while:
    blt $t0, $t1, done
    nop
    sub $t0, $t0, $t1   # x = x - 2
    addi $t2, $t2, 1    # quotient = quotient + 1
    j while
    nop
done:
    move $v0, $t0       # Return remainder
    jr $ra
    nop
