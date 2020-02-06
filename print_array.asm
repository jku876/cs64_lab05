# print_array.asm program
# CS 64, Z.Matni, zmatni@ucsb.edu
#
# Don't forget to:
#   make all arguments to any function go in $a0 and/or $a1
#   make all returned values from functions go in $v0

.data
	prompt: .asciiz "The contents of the array are:\n"
	newLine: .asciiz "\n"
	myArray: .word 1 2 3 4 5 6 7 8 9 10

.text
printA:
	#initialize iterator
	li $t0, 0
	move $t1, $a0
loop:
	#for loop
	beq $t0, $t1, return
	lw $t2, 0($a1)
	addi $a1, $a1, 4
	li $v0, 1
	move $a0, $t2
	syscall
	li $v0, 4
	la $a0, newLine
	syscall
	addi $t0, $t0, 1
	j loop

return:
	jr $ra

main:
	li $v0, 4
	la $a0, prompt
	syscall
	li $a0, 10
	la $a1, myArray
	jal printA

exit:
	li $v0, 10
	syscall

