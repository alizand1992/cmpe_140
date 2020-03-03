# $a0 = array base address
# $a1 = n
# $s0 = n!
Main:
        addi        $a0, $0, 0x100      # array base address = 0x100
        addi        $a1, $0, 0          # i = 0
        addi        $t0, $0, 3
        addi        $t1, $0, 50         # $t1 = 50
CreateArray_Loop:
        slt         $t2, $a1, $t1       # i < 50?
        beq         $t2, $0, Exit_Loop  # if not then exit loop
        sll         $t2, $a1, 2         # $t2 = i * 4 (byte offset)
        add         $t2, $t2, $a0       # address of array[i]
        mult        $a1, $t0
        mflo        $t3                 # $t3 = i * 3
        sw          $t3, 0($t2)         # save array[i]
        addi        $a1, $a1, 1         # i = i + 1
        j           CreateArray_Loop
Exit_Loop:                              # n = (arr[25] + arr[30]) / 30
        lw          $t4, 100($a0)       # t4 = arr[25]
        lw          $t5, 120($a0)       # t5 = arr[30]
        add         $t4, $t4, $t5       # t4 = arr[25] + arr[30]
        ori         $t5, $0, 30         # t5 = 30
        div         $t4, $t5            # t4 / 30
        mflo        $a1                 # n = t4
        sw          $a1, 0($0)
        jal         factorial           # call procedure
        j           end

factorial:
	addi	$sp, $sp, -8
	sw   	$s0, 4($sp)
	sw	$ra, 0($sp)

	bne	$a1, $0, else
	addi	$v0, $0, 1
	j	fact_ret

else:
	ori 	$s0, $a1, 0
	addi	$a1, $a1, -1
	jal	factorial

	mult	$s0, $v0
	mflo	$v0

fact_ret:
	lw	$s0, 4($sp)
	lw	$ra, 0($sp)
	addi	$sp, $sp, 8
	jr	$ra

end:
        sw $v0, 16($0)
