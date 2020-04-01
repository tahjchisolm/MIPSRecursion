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
