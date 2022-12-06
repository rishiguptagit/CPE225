.text
.global main
main:
	andi	t0, t0, 0 #hold input value
	andi	t1, t1, 0 #number & one
	andi	t2, t2, 0 #result
	andi	t4, t4, 0 #indexing
	andi	t5, t5, 0 #store compare
	andi	t6, t6, 0 #stop index
	
	#printing welcome
	la	a0, welcome
	addi	a7, a7, 4
	ecall
program:
	andi	t0, t0, 0 #hold input value
	andi	t1, t1, 0 #number & one
	andi	t2, t2, 0 #result
	andi	t4, t4, 0 #indexing
	andi	t5, t5, 0 #store compare
	andi	t6, t6, 0 #stop index
	
	#print enter number
	andi	a7, a7, 0
	addi	a7, a7, 4
	la	a0, input
	ecall

	#take user input
	andi	a7, a7, 0
	addi	a7, a7, 5
	ecall
	
	#store input in t0
	addi	t0, a0, 0
	
	#store one bitmask
	li	t3, 1
	
	#store stop index
	addi	t6, t6, 32
	
	b operation

continuation:
	#print res
	andi	a7, a7, 0
	addi	a7, a7, 4
	la	a0, value
	ecall
	
	andi	a0, a0, 0
	andi	a7, a7, 0
	addi	a7, a7, 1
	add	a0, a0, t2
	ecall
	
	#ask user to continue
	andi	a7, a7, 0
	addi	a7, a7, 4
	la	a0, continue
	ecall
	
	#get input
	andi	a7, a7, 0
	addi	a7, a7, 12
	ecall
	
	#hold compare
	addi	t5, t5, 'n'
	
	#finish or not
	bne	a0, t5, program
	beq	a0, t5, finishprogram
	

operation:
	and	t1, t0, t3
	beq	t1, t3, increment
	srli	t0, t0, 1
	addi	t4, t4, 1
	blt	t4, t6, operation
	bge 	t4, t6, continuation

increment:
	addi	t2, t2, 1
	srli	t0, t0, 1
	addi	t4, t4, 1
	blt	t4, t6, operation
	bge 	t4, t6, continuation

finishprogram:
	la	a0, exiting
	li	a7, 4
	ecall
	andi	a0, a0, 0
	li	a7, 93
	ecall
.data
welcome:.string "Welcome to the CountOnes program.\n"
input:.string "\n\nPlease enter a number: "
continue:.string "\nContinue (y/n)?: "
value:.string "The number of bits set is: "
exiting:.string "\nExiting"