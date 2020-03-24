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

    jr $ra

subprog:

    jr $ra
