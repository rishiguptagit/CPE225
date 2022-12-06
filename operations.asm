.text
.globl op_add
op_add:	
	add	a0, a0, a1
	ret
.globl op_sub
op_sub:
	sub	a0, a0, a1
	ret 
.globl op_mult
op_mult:
	mul	a0, a0, a1
	ret
.globl op_div
op_div:
	div	a0, a0, a1
	ret
.globl op_and
op_and:
	and	a0, a0, a1
	ret
.globl op_or
op_or:
	or	a0, a0, a1
	ret
.globl op_xor
op_xor:
	xor	a0, a0, a1
	ret
.globl op_lshift
op_lshift:
	sll	a0, a0, a1
	ret
.globl op_rshift
op_rshift:
	srl	a0, a0, a1
	ret
