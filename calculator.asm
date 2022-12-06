.text
main:
	andi	s0, s0, 0 #welcome
	andi	s1, s1, 0 #print operations
	andi	s2, s2, 0 #continue input
	andi	s3, s3, 0 #store input 1
	andi	s4, s4, 0 #store input 2
	andi	s5, s5, 0 #store operator
	andi	s6, s6, 0 #store compare operator
	andi	s7, s7, 0 #store invalid output print message
	andi	s8, s8, 0 #store continue prompt
	andi	s9, s9, 0 #result
	andi	s10, s10, 0 #'n'
	andi	s11, s11, 0 #Exiting
	
	
	#welcome operation
	la	a0, welcome
	jal	ra, printing_str
	la	a0, operations
	jal	ra, printing_str
	li	s10, 'n'

while:
	andi	s3, s3, 0 #store input 1
	andi	s4, s4, 0 #store input 2
	andi	s5, s5, 0 #store operator
	andi	s6, s6, 0 #store compare operator
	andi	s9, s9, 0 #result
	beq	s2, s10, exit
	
	#start of input loop
	#getting first input
	la	a0, input_1
	jal	ra, printing_str
	jal	ra, read_int
	add	s3, s3, a0
	
	#getting second input
	la	a0, input_2
	jal	ra, printing_str
	jal	ra, read_int
	add	s4, s4, a0
	
	#getting operator input
	la	a0, operation
	jal	ra, printing_str
	jal	ra, read_int
	add	s5, s5, a0
	
	#add statement
	li	s6, 1
	beq	s5, s6, addition
	
	#sub statement
	li	s6, 2
	beq	s5, s6, subtraction
	
	#mult statement
	li	s6, 3
	beq	s5, s6 multiply
	
	#div statement
	li	s6, 4
	beq	s5, s6, divide
	
	#and statement
	li	s6, 5
	beq	s5, s6, and_oper
	
	#or statement
	li	s6, 6
	beq	s5, s6, or_oper
	
	#xor statement
	li	s6, 7
	beq	s5, s6, xoper
	
	#lshift statement
	li	s6, 8
	beq	s5, s6, lshift
	
	#rshift statement
	li	s6, 9
	beq	s5, s6, rshift
	
	#print invalid
	b	continue_invalid

addition:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_add
	add	s9, s9, a0
	b	continue

subtraction:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_sub
	add	s9, s9, a0
	b	continue

multiply:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_mult
	add	s9, s9, a0
	b	continue
divide:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_div
	add	s9, s9, a0
	b	continue

and_oper:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_and
	add	s9, s9, a0
	b	continue

or_oper:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_or
	add	s9, s9, a0
	b	continue
xoper:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_xor
	add	s9, s9, a0
	b	continue
lshift:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_lshift
	add	s9, s9, a0
	b	continue
rshift:
	andi	a0, a0, 0
	addi	a0, s3, 0
	andi	a1, a1, 0
	addi	a1, s4, 0
	jal	op_rshift
	add	s9, s9, a0
	b	continue



continue:
	#print continue prompt
	la	a0, result
	jal	ra, printing_str
	li	a0, 0
	add	a0, a0, s9
	jal	ra, print_int
	la	a0, continuation
	jal	ra, printing_str
	jal	ra, read_char
	andi	s2, s2, 0
	add	s2, s2, a0
	b	while
	
continue_invalid:
	#print continue prompt invalid
	la	a0, invalid_oper
	jal	ra, printing_str
	la	a0, continuation
	jal	ra, printing_str
	jal	ra, read_char
	andi	s2, s2, 0
	add	s2, s2, a0
	b	while

exit:
	#exiting function
	la	a0, exiting
	jal	ra, printing_str
	jal	ra, exiting_out
	
.data
welcome:.string "Welcome to the Calculator program."
operations:.string "\nOperations - 1:add 2:subtract 3:multiply 4:divide 5:and 6:or 7:xor 8:lshift 9:rshift"
input_1:.string "\n\nEnter number: "
input_2:.string "Enter second number: "
operation:.string "Select operation: "
result:.string "Result: "
continuation:.string "\nContinue (y/n)?: " 
invalid_oper:.string "Result: Invalid Operation "
exiting:.string "\n\nExiting"
