ori $a0, $0, 0x8000	# a
ori $a1, $0, 0x00A9	# b
ori $s0, $0, 1974	# c

ori $t1, $0, 0x0020
ori $t2, $0, 0x0024
ori $t3, $0, 0x002c

mul $s1, $a0, $a0	# x = a * a
sw  $s1, 0($t1)		# -> 0x20
mul $s2, $s1, $a1	# y = x * b
sw  $s2, 0($t2)		# -> 0x24

srl $s2, $s2, 16	# y = y >> 16

j   calc

	div $t4, $s2, $s0	#          y / c
	add $t4, $s0, $t4	#      c +   ^
	srl $s0, $t4, 1		# c =    ^        / 2
	sw  $s0, 0($t3)	# -> 0x2C

if:
	slti $t5, $s0, 1665 	# if (c < 1665) 1
	beq  $t5, $0, while
	j    end

while:
	j calc

calc:	# c = (c + y / c) / 2
	div $t4, $s2, $s0	#          y / c
	add $t4, $s0, $t4	#      c +   ^
	srl $s0, $t4, 1		# c =    ^        / 2
	j   if

end:
	sll $s0, $s0, 8
	sw  $s0, 0($t3)	# -> 0x2C
