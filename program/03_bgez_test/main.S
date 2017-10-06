

            .text

start:      move    $v0, $0
	    	li      $v1, 1

counter:    addiu   $v0, 1
            bgez    $v1, counter
