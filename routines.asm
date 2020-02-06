# routines.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.text
routineB:
    li $t0, 4
    addi $s1, $s1, -5
    mult $s1, $t0
    mflo $s1
    jr $ra

routineA:
    addi $sp, $sp, -4
    sw $ra, 0($sp)
    
    li $t0, 2
    mult $a0, $t0
    mflo $s0
    li $t1, 3
    mult $a1, $t1
    mflo $s1
    jal routineB
    
    add $s1, $s0, $s1
    addi $s1, $s1, -1
    jal routineB
    move $s0, $s1
    lw $ra, 0($sp)
    addi $sp, $sp, 4
    jr $ra

main:
    li $a0, 5
    li $a1, 7
    jal routineA

exit:
    li $v0, 1
    move $a0, $s1
    syscall
    li $v0, 10
    syscall
