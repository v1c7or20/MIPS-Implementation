0 	ADDI $v0 $zero 0x0005	#v0 = 5
4	ADDI $v1 $zero 0x000C	#v1 = c
8	ADDI $a3 $v1 0xFFF7	#a3 = 3
c	OR $a0 $a3 $v0		#a0 = 7
10	AND $a1 $v1 $a0		#a1 = 4
14	ADD $a1 $a1 $a0		#a1 = 7
18	BEQ $a1 $a3 0x000A  	#No tomar
1c	SLT $a0 $v1 $a0		#a0 = 0
20	BEQ $a0 $zero 0x0001	#No tomar
24	ADDI $a1 $zero 0x0000	#a1 = 0
28	SLT $a0 $a3 $v0		#a0 = 1
2c	ADD $a3 $a0 $a1		#a3 = 0
30	SUB $a3 $a3 $v0		#a3 = FFFB
34	SW $a3 0x0044 $v1	#nada
38	LW $v0 0x0050 $zero	#v0 = 03FB
3c	J 0x0000011		#nada
40	ADDI $v0 $zero 0x0001	#v0 = 1
44	SW $v0 0x0054 $zero	#nada
