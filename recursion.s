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

Bendloop1:

Bloop2:
    beq $t5, $s5, Bendloop2

    lw $a1, 0($t5)
    seq $t6, $a1, 32
    seq $t7, $a1, 9
    or $t6, $t6, $t7
    beq $t6, $zero, Bendloop2
    addi $t5, $t5, 4
    j Bloop2

Bendloop2:
    sub $t6, $t4, $t5

    slti $t7, $t6, 0
    sgt $t8, $t6, 12
    or $t7, $t7, $t8
    bne $t7, $zero, invalid

    add $t6, $t4, $zero
    li $t7, 0
    addi $t5, $t5, -4

Bloop3:
    beq $t6, $t5, Bendloop3
    lw $a1, 0($t6)

    sgt $t1, $a1, 64
    addi $a2, $s1, 65
    slt $t8, $a1, $a2
    and $a3, $t1, $t8

    sgt $t1, $a1, 96
    addi $a2, $s1, 97
    slt $t8, $a1, $a2
    and $s7, $t1, $t8

    sgt $t1, $a1, 47
    li $a2, 58
    slt $t8, $a1, $a2
    and $t1, $t1, $t8

    or $a3, $a3, $s7
    or $a3, $a3, $t1
    beq $a3, $zero, invalid

    move $a0, $t6
    move $t1, $ra
    li $a2, 0
    addi $a2, $t5, 4
    sub $a2, $t6, $a2
    li $s7, 4
    div $a2, $s7
    mflo $v1
    jal subprgC
    move $ra, $t1

    add $t7, $t7, $v0
    addi $t6, $t6, -4
    j subprgC

Bendloop3:
    li $t6, 1
    j Bfinish

invalid:
    add $t6, $zero, $zero
    j Bfinish

Bfinish:

pop:
    beq $sp, $s5, endpop
    addi $sp, $sp, 4
    j pop

endpop:
    beq $t6, $zero, addNaN
    j addInt

addNaN:
    li $v0, 4
    la $a0, invalidMessage
    syscall
    j exit

addInt:
    li $v0, 1
    move $a0, $t7
    syscall
    j back

back:
    jr $ra

subprgC:
    li $s7, 65
    add $s7, $s1, $s7
    sgt $t8, $a1, 64
    slt $a3, $a1, $s7
    and $t8, $t8, $a3
    bne $t8, $zero, uppercase

    li $s7, 97
    add $s7, $s7, $s1
    sgt $t8, $a1, 96
    slt $a3, $a1, $s7
    and $t8, $t8, $a3
    bne $t8, $zero, lowercase

    sgt $t8, $a1, 47
    slti $a3, $a1, 58
    and $t8, $t8, $a3
    bne $t8, $zero, number

lowercase:
    addiu $a1, $a1, -87
    j findEx

uppercase:
    addiu $a1, $a1, -55
    j findEx
