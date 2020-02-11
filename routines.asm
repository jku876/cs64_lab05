# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
    li $t0, 4
    addi $a0, $a0, -5
    mult $a0, $t0
    mflo $v0
    jr $ra

routineA:
    addi $sp, $sp, -12
    sw $ra, 0($sp)
    sw $s0, 4($sp)
    sw $s1, 8($sp)
    
    li $t0, 2
    mult $a0, $t0
    mflo $s0
    li $t1, 3
    mult $a1, $t1
    mflo $a0
    jal routineB
    
    add $s1, $s0, $v0
    addi $a0, $s1, -1
    jal routineB
    lw $ra, 0($sp)
    lw $s0, 4($sp)
    lw $s1, 8($sp)
    addi $sp, $sp, 12
    jr $ra

main:
    li $a0, 101
    li $a1, 298
    jal routineA

exit:
    move $a0, $v0
    li $v0, 1
    syscall
    li $v0, 10
    syscall
