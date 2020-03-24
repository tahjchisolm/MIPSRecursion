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

    jr $ra

subprog:

    jr $ra
