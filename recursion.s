.data
myMessage: .asciiz "Enter your string:\n"
invalidMessage: .asciiz "Invalid input"
input: .space 1001

.text
main:

    jal subprog

    jr $ra

subprog:

    jr $ra
