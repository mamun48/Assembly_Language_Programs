;smallest and Largest capital letter

.MODEL SMALL
.STACK 100H
.DATA 

INPUT DB 50 DUP('$')
NEWLINE DB 0AH,0DH,'$'
MSG DB 'NO CAPITAL','$'
SMALL DB 'Z'
BIG DB 'A'
FLAG DB 0

.CODE

MAIN PROC
    MOV AX,DATA
    MOV DS,AX
    
    MOV AH,1
    MOV SI,0
    
    
    STRING_INPUT:
    
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JE END_INPUT
        MOV INPUT+SI,AL
        INC SI
        JMP STRING_INPUT 
    
    END_INPUT:
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
        
        MOV DI,0
        
    CHECK:
        MOV DL,INPUT[DI]
        INC DI
        CMP DL,'$'
        JE NO
        CMP DL,'A'
        JGE LESS_Z
        JMP CHECK
        
    LESS_Z:
        CMP DL,'Z'
        JLE CAPITAL
        JMP CHECK
        
    
    NO:
        CMP FLAG,1
        JE FOUND
        LEA DX,MSG
        MOV AH,9
        INT 21H
        JMP EXIT
        
        
   CAPITAL:
        MOV BL,SMALL
        CMP DL,BL
        JL UPDATE_SMALL
        MOV BL,BIG
        CMP DL,BL
        JG UPDATE_BIG 
        JMP CHECK
        
   UPDATE_SMALL:
        MOV SMALL,DL 
        MOV FLAG,1
        JMP CHECK 
        
        
   UPDATE_BIG:
        MOV BIG,DL
        MOV FLAG,1
        JMP CHECK
   
          
          
          
   FOUND:
        MOV AH,2
        MOV DL,SMALL
        INT 21H
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
        MOV AH,2
        MOV DL,BIG
        INT 21H
        
   MOV AH,4CH
   INT 21H     
   
   
   EXIT:
   
 END MAIN        
        
         
    
    


