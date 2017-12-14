.data
input: 
.asciiz "Enter an integer "
output: 
.asciiz "\nSum = "
.text
and $t7, $t7, $0
loop:  
li $v0, 4
la $a0, input
syscall
li $v0 , 5
syscall
and $t6, $t6 , $0
move $t5 , $v0
beq $0, $t5 , end
add $t4 , $t6, $t5
add $t7 , $t4 , $t7
j loop
end:
li  $v0, 4
la $a0, output
syscall
li $v0, 1
move $a0, $t7
syscall
li $v0, 10
syscall