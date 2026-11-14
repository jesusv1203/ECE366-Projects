.text
.globl main

main:
    li   $a0, 11       # Test number m = 7
    jal  IsOdd        # Call IsOdd(7)

    move $t3, $v0     # Save answer in $t3

    li   $v0, 10      # Exit program
    syscall


.text
.globl IsOdd

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


# division(x, y)
# Input: $a0 = x, $a1 = y
# Output: $v0 = remainder

division:
    move $t0, $a0       # x = input
    move $t1, $a1       # y = divisor
    li   $t2, 0         # quotient = 0

while:
    blt  $t0, $t1, done # while x >= y

    sub  $t0, $t0, $t1  # x = x - y
    addi $t2, $t2, 1   # quotient = quotient + 1
    j    while

done:
    move $v0, $t0       # Return x (remainder)
    jr   $ra
