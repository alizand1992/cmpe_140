ori $a0, $0, 0x8000	# a
ori $a1, $0, 0x00A9	# b
ori $s0, $0, 1974	# c

ori $t1, $0, 0x0020

mult $a0, $a0	# x = a * a
mflo $s1
sw  $s1, 0($t1)		# -> 0x20
mult $s1, $a1	# y = x * b
mflo $s2
sw  $s2, 4($t1)		# -> 0x24
mfhi $t2
sw  $t2, 8($t1)

srl $s2, $s2, 16	# y = y >> 16


	div $s2, $s0	#          y / c
	mflo $t4
	add $t4, $s0, $t4	#      c +   ^
	srl $s0, $t4, 1		# c =    ^        / 2
	sw  $s0, 12($t1)	# -> 0x2C

# c = (c + y / c) / 2
calc:	div $s2, $s0	#          y / c
	mflo $t4
	add $t4, $s0, $t4	#      c +   ^
	srl $s0, $t4, 1		# c =    ^        / 2

if:	slti $t5, $s0, 1665 	# if (c < 1665) 1
	beq  $t5, $0, while
	j    end


while:	j calc


end:	sll $s0, $s0, 8
	sw  $s0, 12($t1)	# -> 0x2C
