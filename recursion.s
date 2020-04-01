.data
myMessage: .asciiz "Enter your string:\n"
invalidMessage: .asciiz "NaN"
input: .space 1001

.text

main:

    li $t0, 2839480
    li $t1, 11
    div $t0, $t1
    mfhi $t0 # store remainder
    addi $s0, $t0, 26 # base N
    addiu $s1, $s0, -10 # M

    li $v0, 4
    la $a0, myMessage
    syscall # print myMessage

    li $v0, 8
    la $a0, input
    li $a1, 1001
    syscall # take input

    addi $s2, $zero, 0
    add $s3, $s2, $zero

loop1:
    addi $t0, $zero, 1000
    beq $s3, $t0, endloop1

    la $a1, input
    add $a1, $a1, $s3
    lb $a1, 0($a1)

    li $t0, 10
    beq $a1, $t0, endloop1
    addi $s3, $s3, 1
    j loop1

endloop1:
    addi $s3, $s3, -1
    add $t0, $s3, $zero
    addi $s4, $sp, 0

loop2:
    slt $t1, $t0, $s2
    bne $t1, $zero, endloop2

    addi $sp, $sp, -4
    la $a1, input
    add $a1, $a1, $t0
    lb $a1, 0($a1)

    sw $a1, 0($sp)
    addi $t0, $t0, -1
    j loop2

endloop2:
    jal subprgA

exit:
    li $v0, 10
    syscall

subprgA:
    addi $s5, $sp, 0
    add $t0, $s5, $zero
    move $t9, $ra

Aloop:
    beq $t0, $s4, Aendloop
    lw $a1, 0($t0)

    li $t1, 44
    bne $a1, $t1, stop
    jal subprgB

    li $v0, 11
    la $a0, 44
    syscall

    addi $t0, $t0, 4
    j Aloop

stop:
    addi $sp, $sp, -4
    sw $a1, 0($sp)
    addi $t0, $t0, 4
    j Aloop

Aendloop:
    jal subprgB
    move $ra, $t9
    jr $ra

subprgB:
    addi $s6, $sp, 0

    add $t2, $s5, $zero
    addi $t3, $s6, -4
    addi $t2, $t2, -4

    add $t4, $t2, $zero
    add $t5, $s6, $zero

Bloop1:
    beq $t4, $t3, Bendloop1
    lw $a1, 0($t4)

    seq $t6, $a1, 32
    seq $t7, $a1, 9
    or $t6, $t6, $t7
    beq $t6, $zero, Bendloop1
    addi $t4, $t4, -4
    j Bloop1
