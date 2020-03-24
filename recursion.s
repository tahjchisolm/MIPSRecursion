.data
myMessage: .asciiz "Enter your string:\n"
invalidMessage: .asciiz "Invalid input"
input: .space 1001

.text
main:

    jal subprog

    la $a0, myMessage
    li $v0, 4
    syscall

    li $v0, 8 #takes input
    la $a0, buffer #byte space
    li $a1, 1000
    move $t0, $a0 #string stored in $t0
    syscall

    li $t1, 2839480
    li $t2, 11
    div $t1, $t2
    mfhi $t1 # store remainder
    addi $s0, $t1, 26 # base N in $s0
    addiu $s1, $s0, -10 # M in $s1

    jr $ra

subprog:

    jr $ra
