.data 
input: 
.asciiz "Please input a positive integer " 
valid: 
.asciiz "\nThis is an acceptable value. The output is " 
invalid: 
.asciiz "\nThis is not an acceptable value. Please try again. " 
zero0:	
.asciiz "zero " 
one1:	
.asciiz "one " 
two2:	
.asciiz "two " 
three3: 
.asciiz "three " 
four4: 
.asciiz "four " 
five5: 
.asciiz "five " 
six6: 
.asciiz "six " 
seven7: 
.asciiz "seven " 
eight8: 
.asciiz "eight " 
nine9: 
.asciiz "nine " 
array:	
.asciiz " " 
.text 
main: 
li $v0,4 
la $a0, input 
syscall 
li $v0, 5	 
syscall  
move $t1, $v0
j check 
loop: 
beq $t1,$0,next	 
addi $sp, $sp, -4	 
sw $s0,0($sp)	 
j next 
next: 
bge $t1,$0,words  
lw $v0, 4($sp)  
addi $sp, $sp, 4 
jr  $ra	  
check:
beqz $t1, no 
bgt $t1,$0, yes 
blt $t1,$0, no 
j loop 
words:	 
lw $t1,0($sp)
addi $sp, $sp, 4
beq $t1,0,zero 
beq $t1,1,one	
beq $t1,2,two 
beq $t1,3,three 
beq $t1,4,four 
beq $t1,5,five 
beq $t1,6,six 
beq $t1,7,seven 
beq $t1,8,eight 
beq $t1,9,nine 
j concat  
zero:  
li $v0, 4 
la $a0, zero0 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
one:  
li $v0, 4 
la $a0, one1 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
two:  
li $v0, 4 
la $a0, two2 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
three:  
li $v0, 4 
la $a0, three3 
syscall
addi $t6,$t6,-1
beqz $t6,concat
j words 
four:  
li $v0,4 
la $a0, four4 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
five:  
li $v0,4 
la $a0, five5 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
six:  
li $v0,4 
la $a0, six6 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
seven:  
li $v0,4 
la $a0, seven7 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
eight: 
li $v0,4 
la $a0, eight8 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
nine: 
li $v0,4 
la $a0, nine9 
syscall 
addi $t6,$t6,-1
beqz $t6,concat
j words 
concat:	 
la $t3, array 
li $a1, 100  
#beqz $t3, end 
lw $t3, 4($sp) 
add $sp, $sp, 4 
bnez $t3,concat
beqz $t3, end
#j end
yes:  
li $v0, 4 
la $a0, valid 
syscall 
j separate 
end: 
li $v0, 4  
la $a0, array
syscall 
li $v0, 10 
syscall 
no: 
li $v0,4  
la $a0, invalid 
syscall 
li $v0,10 
syscall
separate:
li $t4,10
div $t1, $t4
mfhi $t5
addi $sp,$sp,-4
sw $t5,0($sp)
mflo $t1
bne $t1,$0,count
count:
addi $t6,$t6,1
beqz $t1,words
j separate
