            .text

start:      move  $v0, $0
            li    $t0, 0x123
            li    $t1, 0x5
            srlv  $v0, $t0, $t1
