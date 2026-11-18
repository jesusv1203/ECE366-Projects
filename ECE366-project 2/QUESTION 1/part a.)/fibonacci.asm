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

 

 
