   ;String Revarsal


.MODEL SMALL

.STACK 100H

.DATA
INPUT DB 40 DUP('$') 
NEWLINE DB 0AH,0DH,'$'

.CODE
MAIN PROC 
    MOV AX, @DATA
    MOV DS, AX
   
    MOV CX,0
      
    STRING_INPUT:
        MOV AH, 1
        INT 21H
        CMP AL, 0DH
        JE END_STRING_INPUT
        PUSH AX
        INC CX
        JMP STRING_INPUT
        
   END_STRING_INPUT:
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
        
   PRINT:
     POP DX
     MOV AH,2
     INT 21H
     LOOP PRINT
     
     
 END MAIN
      
       