            .text

start:
			li $v1, 0x0 // initial value for the counter
			li $fp, 0x4 // RAM base address

L1:
			sw $v1, 4($fp)
			lw $v0, 4($fp)
			addiu $v1, $v1, 0x1
			b L1

