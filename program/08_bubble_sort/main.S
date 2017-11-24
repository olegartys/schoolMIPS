            .text

start:
			li $t0, 0xA // size of an array
			li $v1, 0x0 // base of an array

			// repeat
L0:
			// for i = 1, i <= n - 1 (initialize values)
			li $t1, 0 // swapped = false
			li $t2, 0 // i = 0
			li $v1, 0 // A = 0 (pointer to begin of the array)

L5:
			// for-loop body
			addiu $v1, $v1, 0x4 // A++
			addiu $t2, $t2, 0x1 // i++

			beq $t2, $t0, L2 // if i == n - 1 -> goto L2
			lw $t3, 0x0($v1) // get A[i]
			lw $t4, -0x4($v1) // get A[i - 1]
			sltu $t5, $t4, $t3 // if A[i - 1] < A[i] -> t5 = 1
			beq $t5, $0, L4 // t5 != 1 -> goto L4

L1:
			// then Swap A[i - 1] and A[i]

			// in-memory swap
			sw $t3, -0x4($v1)
			sw $t4, 0x0($v1)

			li $t1, 1 // swapped = true

L4:
			b L5 // continue for-loop

L2:
			bne $t1, $0, L0 // repeat until not swapped

exit:
			nop
