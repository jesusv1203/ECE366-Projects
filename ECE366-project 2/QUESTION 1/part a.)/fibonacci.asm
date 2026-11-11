
.data
n:      .word 7          # Input number
result: .word 0          # Store the Fibonacci result

.text
.globl main

main:
    # Load n from memory
    lw $a0, n

    # Call the Fibonacci function
    jal fibonacci

    # Store the result in memory
    sw $v0, result

    # Print the Fibonacci result
    move $a0, $v0
    li $v0, 1
    syscall

    # End the program
    li $v0, 10
    syscall


# Function to calculate Fibonacci(n)
fibonacci:

    # If n <= 1, return n
    ble $a0, 1, return_n

    # Set a = 0 and b = 1
    li $t0, 0
    li $t1, 1

    # Set loop counter to n - 1
    addi $t2, $a0, -1


