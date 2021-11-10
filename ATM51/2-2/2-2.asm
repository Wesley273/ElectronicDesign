ORG 0000H
AJMP MAIN
ORG 0030H
MAIN:
MOV A,#0
MOV R0,#30H
MOV R1,#0
COPY:
MOV A,R1
MOV DPTR,#TABLE
MOVC A,@A+DPTR
MOV @R0,A
INC R0
INC R1
CJNE R1,#32,COPY
MOV R7,#31
MAX1:
MOV R1,#30H
MOV A,R7
MOV R6,A
ADD A,#30H
MOV R0,A
MOV B,@R1
MAX2:
INC R1
MOV A,@R1
CJNE A,B,L1
SJMP L2
L1:JC L2
MOV B,A
MOV A,R1
MOV R0,A
L2:DEC R6
MOV A,R6
CJNE A,#0,MAX2
MOV A,B
XCH A,@R1
MOV @R0,A
DEC R7
MOV A,R7
CJNE A,#0,MAX1
SJMP $
TABLE:DB 1,3,9,2,17,4,11,6
      DB 5,20,100,64,21,14,79,35
      DB 92,7,91,23,65,16,13,18
      DB 18,73,65,101,27,19,62,69
END
