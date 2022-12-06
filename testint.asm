
.text
.globl main
main:

	jal    init

	li     a0, '*'
forever:
	jal    printChar
	j      forever
	


	jal   exitProgram
