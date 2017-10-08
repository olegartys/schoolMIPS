#
# Lab1 - counts the number $t0 to power $t1.
#
# $t0, $t1 > 0

            .text

start:
			li      $v0, 0x0 # Result
            li      $t0, 0x4 # Number
            li		$t1, 0x4 # Power
            li		$t2, 0x0 # Loop Counter

			# Store $t0^1 in the result, and hence decrement power value

			addu 	$v0, $v0, $t0
			addiu	$t1, $t1, -0x1

L0:
			# Is the current loop counter power value is equal to the target power value? Then exit...

			beq		$t2, $t1, L1

			# ... if not, multiplicate the result and increment loop counter

			mul 	$v0, $v0, $t0
			addiu	$t2, 0x1

			b 		L0

L1:
			nop
