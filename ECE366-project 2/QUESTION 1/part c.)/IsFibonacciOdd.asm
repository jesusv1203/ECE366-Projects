.data
n:      .word 7          # Input number
result: .word 0          # Store the Fibonacci result

.text
.globl main

main:
    # Load n from memory
    lw $a0, n

    # Call the IsFibonacciOdd function
    jal IsFibonacciOdd

    # Store the result in memory
    sw $v0, result

    # Print the IsFibonacciOdd result
    move $a0, $v0
    li $v0, 1
    syscall

    # End the program
    li $v0, 10
    syscall

#part a
# Function to calculate Fibonacci(n)
fibonacci:

    # If n <= 1, return n
    ble $a0, 1, return_n

    # Set a = 0 and b = 1
    li $t0, 0
    li $t1, 1

    # Set loop counter to n - 1
    addi $t2, $a0, -1

    fib_loop:
    # Add previous two Fibonacci numbers
    add $t3, $t0, $t1

    # Update a and b
    move $t0, $t1
    move $t1, $t3

    # Decrease counter by 1
    addi $t2, $t2, -1

    # Repeat loop if counter > 0
    bgtz $t2, fib_loop

    # Return Fibonacci result
    move $v0, $t1
    jr $ra
return_n:
    move $v0, $a0       # Return n when n <= 1
    jr $ra              # Return to main
#////end

 #part c
IsFibonacciOdd:

    # Save return address
    addi $sp, $sp, -4
    sw $ra, 0($sp)

    # Call Fibonacci(n) from Part (a)
    jal fibonacci

    # Pass Fibonacci result to IsOdd
    move $a0, $v0

    # Call IsOdd(m) from Part (b)
    jal IsOdd

    # Restore return address
    lw $ra, 0($sp)
    addi $sp, $sp, 4

    # Return final result (1 or 0)
    jr $ra
 

  #part b
# IsOdd(m)
# Input: $a0 = m
# Output: $v0 = 1 (odd) or 0 (even)

IsOdd:
    addi $sp, $sp, -4
    sw   $ra, 0($sp)

    li   $a1, 2          # Divisor = 2
    jal  division        # Call division(m, 2)

    beq  $v0, $zero, even

odd:
    li   $v0, 1          # Return True
    j    endIsOdd

even:
    li   $v0, 0          # Return False

endIsOdd:
    lw   $ra, 0($sp)
    addi $sp, $sp, 4
    jr   $ra


# division(x, 2)
# Input: $a0 = x, $a1 = 2
# Output: $v0 = remainder

division:
    move $t0, $a0       # x = input
    move $t1, $a1       # 2 = divisor
    li   $t2, 0         # quotient = 0

while:
    blt  $t0, $t1, done # while x >= 2

    sub  $t0, $t0, $t1  # x = x - 2
    addi $t2, $t2, 1   # quotient = quotient + 1
    j    while

done:
    move $v0, $t0       # Return x (remainder)
    jr   $ra
