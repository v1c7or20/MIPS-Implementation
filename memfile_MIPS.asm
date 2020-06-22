1 	ADDI $v0 $zero 0x0005	#v0 = 5
2	ADDI $v1 $zero 0x000C	#v1 = c
3	ADDI $a3 $v1 0xFFF7	#a3 = 3
4	OR $a0 $a3 $v0		#a0 = 7
5	AND $a1 $v1 $a0		#a1 = 4
6	ADD $a1 $a1 $a0		#a1 = 7
7	BEQ $a1 $a3 0x000A  	#No tomar
8	SLT $a0 $v1 $a0		#a0 = 0
9	BEQ $a0 $zero 0x0001	#No tomar
A	ADDI $a1 $zero 0x0000	#a1 = 0
B	SLT $a0 $a3 $v0		#a0 = 1
C	ADD $a3 $a0 $a1		#a3 = 0
D	SUB $a3 $a3 $v0		#a3 = FFFB
E	SW $a3 0x0044 $v1	#nada
F	LW $v0 0x0050 $zero	#v0 = 03FB
10	J 0x0000011		#nada
11	ADDI $v0 $zero 0x0001	#v0 = 1
12	SW $v0 0x0054 $zero	#nada


