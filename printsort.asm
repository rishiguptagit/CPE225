.text
.globl main
main:
	li 	t0, '\n'
	jal	store
	
store:
	la	a0, enter
	li	t1, 0
	li	t2, 19
	jal	print_str
	b	forloop
	
forloop:
	la	t3, arr
	jal	read_char
	beq	a0, '\n', if1
	sb	a0, 0(t3)
	addi	t3, t3, 1
	addi	t1, t1, 1
	blt	t1, t2, forloop
	bge	t1, t2, alphabetize
	
if1:
	addi	t3, t3, 1
	li	a0, '\0'
	sb	a0, 0(t3)
	addi	t1, t1, 1
	blt	t1, t2, forloop
	bge	t1, t2, alphabetize

alphabetize:
	la	a0, arr
	jal	print_str
	
	

.data
arr: 		.space 20
enter:   	.string "\nEnter word: "
input:		.string "Original word: "
organized:	.string "\nAlphabetized word: "
exit:		.string "Exiting"