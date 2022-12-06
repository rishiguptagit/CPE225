.text
.globl print_str
print_str:
	li	a7, 4
	ecall
    	ret
    	
.globl print_int
print_int:
	li	a7, 5
	ecall
    	ret
    	
.globl print_char
print_char:
        li a7,11
	ecall
    	ret

.globl read_char
read_char:
	li a7,12
	ecall
    	ret
    
.global readInt
readInt:
	li a7,5
	ecall
    	ret	
    	
.globl exit0
exit0:
	li a7,10
	ecall
