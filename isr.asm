.text
.globl init


init:
	addi    sp, sp, -4
	sw      ra, 0(sp)

	la      t0, interrupt_handler
	csrrw   zero, utvec, t0  
	li      t0, 0x100
	csrrw   zero, uie, t0  

	lw      t0, RCR   
	li      t1, 2
	sw      t1, 0(t0)

	csrrsi  zero, ustatus, 1   

	la     a0, startmsg
	jal    printString      

	lw      ra, 0(sp)
	addi    sp, sp, 4
	ret

interrupt_handler:
	addi    sp, sp, -20
	sw      ra, 0(sp)
	sw      s0, 4(sp)
	sw      s1, 8(sp)
	sw      t0, 12(sp)
	sw      t1, 16(sp)

	lw      s1, RDR     
	mv      a0, x0
	lbu     s0, (s1)     
	
	la      a0, keypressedmsg   
	jal     printString

	mv      a0, s0
	jal     printChar

	li      a0, '\n'
	jal     printChar

	mv      a0, s0   

	lw      t0, count
	addi    t0, t0, 1
	li      t1, 5
	bne     t0, t1, keep_counting

	la      t0, main
	csrrw   zero, uepc, t0  

	la      t0, count
	sw      zero, 0(t0)
	j       exit_handler
keep_counting:
	la      t1, count
	sw      t0, 0(t1)

exit_handler:
	lw      ra, 0(sp)
	lw      s0, 4(sp)
	lw      s1, 8(sp)
	lw      t0, 12(sp)
	lw      t1, 16(sp)

	addi    sp, sp, 20
	uret


.data
startmsg:       .string "\nInitializing Interrupts\n"
keypressedmsg:  .string "\nKey Pressed is: "

RCR:   .word 0xffff0000
RDR:   .word 0xffff0004
count: .word 0


