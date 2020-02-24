ori $a0, $0, 5	# n = 5
ori $s0, $0, 1  # f = 1
ori $t1, $0, 0
ori $t3, $0, 1

sw $a0, 0($t1)

while:
	slti $t2, $a0, 2    	# if n < 2 -> 1
	beq  $t2, $t3, end
	mul  $s0, $s0, $a0	# f = f * n
	addi $a0, $a0, -1	# n = n - 1
	j    while

end:
	sw $s0, 16($t1)
