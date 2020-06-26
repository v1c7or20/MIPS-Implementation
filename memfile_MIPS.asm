ADDI $v0 $zero 0x0005	#v0 = 5
ADDI $v1 $zero 0x000C	#v1 = c
ADDI $a3 $v1 0xFFF7	#a3 = 3
OR $a0 $a3 $v0		#a0 = 7
AND $a1 $v1 $a0		#a1 = 4
ADD $a1 $a1 $a0		#a1 = 7
BEQ $a1 $a3 0x000A  	#No tomar
SLT $a0 $v1 $a0		#a0 = 0
BEQ $a0 $zero 0x0001	#No tomar
ADDI $a1 $zero 0x0000	#a1 = 0
SLT $a0 $a3 $v0		#a0 = 1
ADD $a3 $a0 $a1		#a3 = 0
SUB $a3 $a3 $v0		#a3 = FFFB
SW $a3 0x0044 $v1	#nada
LW $v0 0x0050 $zero	#v0 = 03FB
J 0x0000011		#nada
ADDI $v0 $zero 0x0001	#v0 = 1
SW $v0 0x0054 $zero	#nada
