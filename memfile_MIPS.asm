1 	ADDI $v0 $zero 0x0005
2	ADDI $v1 $zero 0x000C
3	ADDI $a3 $v1 0xFFF7
4	OR $a0 $a3 $v0		#Posible error
5	AND $a1 $v1 $a0
6	ADD $a1 $a1 $a0
7	BEQ $a1 $a3 0x000A
8	SLT $a0 $v1 $a0
9	BEQ $a0 $zero 0x0001
10	ADDI $a1 $zero 0x0000
11	SLT $a0 $a3 $v0
12	ADD $a3 $a0 $a1
13	SUB $a3 $a3 $v0
14	SW $a3 0x0044 $v1
15	LW $v0 0x0050 $zero
16	J 0x0000011
17	ADDI $v0 $zero 0x0001
18	SW $v0 0x0054 $zero
