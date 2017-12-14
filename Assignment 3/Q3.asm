.data
End: 
.asciiz "\nThese are the first 100 prime numbers.\n "
Space: 
.asciiz " "
.text
main:
addi $s0, $zero, 0			
addi $s1, $zero, 100		
addi $s2, $zero, 0			
loop:
beq $s0, $s1, loop_done	
add $a0, $zero, $s2		 
jal test_prime		
beq $v0, $zero, Counter	
addi $s0, $s0, 1			
li $v0,1			
add $a0, $zero, $s2			
syscall
li $v0, 4        			
la $a0, Space     			
syscall 
div $s0,$s3 			
mfhi $t7 
bgtz $t7, Counter  		     			
Counter:
addi $s2, $s2, 1 			
j loop 		
loop_done:
li $v0, 4        			
la $a0, End     			
syscall 
li $v0, 10      			
syscall 
.text
test_prime:
addi $sp,$sp,-4 			
sw $ra,($sp) 		
addi $sp,$sp,-4 			
sw $s2,($sp) 			
addi $sp,$sp,-4 			
sw $s3,($sp) 			
addi $sp,$sp,-4 		
addi $s2, $zero, 1			
bne $s2, $a0, test  		
add $v0, $zero, $zero		
j exit	
test: 
addi $s2, $zero, 2 			
beq $a0,$s2, next_done  		
div $a0, $s2 		
mfhi $t7  				
bgtz $t7, next 			
add $v0, $zero, $zero		
j exit         	
next:
addi $s2, $s2, 1 		 
next_loop:
add $t7, $zero, $zero		
mult $s2, $s2 			
mflo $s3 	
sub $t7, $a0, $s3 			 
bltz $t7, next_done  		
div $a0, $s2 			
mfhi $t7 				
bgtz $t7, next_continue  		  
add $v0, $zero, $zero		
j exit         	
next_continue:
addi $s2, $s2, 2  			
j next_loop  	
next_done:					
addi $v0, $zero, 1 			
exit:
addi $sp,$sp,4 			
lw $s3,($sp) 			
addi $sp,$sp,4 		
lw $s2,($sp) 			
addi $sp,$sp,4 			
lw $ra,($sp) 			
addi $sp,$sp,4 			
jr $ra