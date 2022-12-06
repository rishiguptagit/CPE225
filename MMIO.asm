.text
.globl printString
printString:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	a0, 8(sp)
	sw	s1, 4(sp)
	sw	s0, 0(sp)
	mv	s1, a0

here:
	lb	a0, 0(s1)
	li	s0, '\0'
	beq	a0, s0, tear
	jal	printChar
	addi	s1, s1, 1
	b	here
	
tear:
	lw	s0, 0(sp)
	lw	s1, 4(sp)
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret
	
.globl printChar
printChar:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)
	
prichr:
	lw	s1, TCR
	lw	s0, (s1)
	andi	s0, s0, 1
	beq	s0, zero, prichr
	lw	s1, TDR
	sb	a0, (s1)
	
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	lw	s1, 4(sp)
	addi	sp, sp, 16
	ret

.globl readChar
readChar:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)

redchr:
	lw	s1, RCR
	lw	s0, (s1)
	andi	s0, s0, 1
	beq	s0, zero, redchr
	lw	s1, RDR
	lbu	a0, (s1)
	
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	lw	s1, 4(sp)
	addi	sp, sp, 16
	ret
	
	
.globl readInt
readInt:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)

redint:
	lw	s1, RCR
	lw	s0, (s1)
	andi	s0, s0, 1
	beq	s0, zero, redint
	lw	s1, RDR
	
	lw	a0, (s1)
	addi	a0, a0, -48
	
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	lw	s1, 4(sp)
	addi	sp, sp, 16
	ret	

.globl printInt
printInt:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	s0, 8(sp)
	sw	s1, 4(sp)

priint:
	lw	s1, TCR
	lw	s0, (s1)
	andi	s0, s0, 1
	beq	s0, zero, priint
	lw	s1, TDR
	
	addi	a0, a0, 48

	sw	a0, (s1)
	
	lw	ra, 12(sp)
	lw	s0, 8(sp)
	lw	s1, 4(sp)
	addi	sp, sp, 16
	ret


.globl exitProgram
exitProgram:
	li	a7, 10
	ecall

.globl readString
readString:
	addi	sp, sp, -16
	sw	ra, 12(sp)
	sw	a0, 8(sp)
	sw	t0, 4(sp)
	sw	t1, 0(sp)
	
	mv	t0, a0	
	
if:
	jal	readChar
	
	li	t1, '\n'
	beq	a0, t1, else
	sb	a0, 0(t0)
	addi	t0, t0, 1
	b	if
	
else:
	li	t1, '\0'
	sb	t1, 0(t0)

tearDown:
	lw	t1, 0(sp)
	lw	t0, 4(sp)
	lw	a0, 8(sp)
	lw	ra, 12(sp)
	addi	sp, sp, 16
	ret


.data
RCR:	.word 0xFFFF0000	# Bit [0] is one when keyboard has received a new character.
RDR:	.word 0xFFFF0004	# Bits [7:0] contain the last character typed on keyboard.
TCR:	.word 0xFFFF0008	# Bit [0] is one when device ready to display another char on screen.
TDR:	.word 0xFFFF000c	# Character written to bits [7:0] will be displayed on screen.
