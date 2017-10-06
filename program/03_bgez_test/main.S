            .text

start:      li      $v0, 0x0
            li      $v1, 0x1

counter:    addiu   $v0, 0x1
            bgez    $v1, counter
