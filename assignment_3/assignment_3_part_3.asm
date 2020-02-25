ori $a0, $0, 5	# n = 5
ori $s0, $0, 1  # f = 1

sw $a0, 0($0)

while:  slti  $t2, $a0, 2    	# if n < 2 -> 1
	beq   $t2, $t3, end
	mult  $s0, $a0		# f = f * n
	mflo  $s0
	addi  $a0, $a0, -1	# n = n - 1
	j     while

end:	mflo $s0
	sw   $s0, 16($0)
