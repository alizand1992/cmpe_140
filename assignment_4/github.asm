main:
	ori	$a0, $0, 5
	jal	factorial
	j 	end

factorial:
	addi	$sp, $sp, -8
	sw   	$s0, 4($sp)
	sw	$ra, 0($sp)

	bne	$a0, $0, else
	addi	$v0, $0, 1
	j	fact_ret

else:
	ori 	$s0, $a0, 0
	addi	$a0, $a0, -1
	jal	factorial

	mult	$s0, $v0
	mflo	$v0

fact_ret:
	lw	$s0, 4($sp)
	lw	$ra, 0($sp)
	addi	$sp, $sp, 8
	jr	$ra

end:
