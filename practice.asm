.text
initial:
	li	t0, 0 #num1 input
	li	t1, 0 #num2 input
	li	t2, 0 #result
main:
	li	a7, 4
	la	a0, enternumber
	ecall #print enter number
	
	li	a7, 5
	ecall #read num1 input
	add	t0, t0, a0
	li	a7, 4
	la	a0, entersecondnumber 
	ecall #print second enter number
	
	li	a7, 5
	ecall #read num2 input
	add t1, t1, a0
	
	add	t2, t0, t1
	sub	t2, t2, t1
	and	t2, t0, t2
	
	li	a7, 4
	la	a0, result
	ecall
	
	li	a0, 0
	li	a7, 1
	add	a0, t2, a0
	ecall
	
	
	
	
.data
enternumber: .string "\nEnter number: "
entersecondnumber: .string "Enter second number: "
result: .string "Result: \n"