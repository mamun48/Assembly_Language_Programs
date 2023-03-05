
; Check substring

.MODEL SMALL
.STACK 100H
.DATA

NEWLINE DB 0AH,0DH,'$'

STRING DB 40 DUP('$')
SUBSTRING DB 40 DUP('$') 
FOUND_MSG DB 'FOUND','$' 
NOTFOUND_MSG DB 'NOT FOUND','$'


.CODE 

MAIN PROC
    
    MOV AX,@DATA
    MOV DS,AX
    
    
    MOV SI,0
    MOV DI,0
    
    INPUT_STRING:
        MOV AH,1 
        INT 21H
        CMP AL,0DH
        JE END
        MOV STRING+SI,AL
        INC SI
        JMP INPUT_STRING
        
    
    
     END:
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
     
     
     MOV SI,0
     INPUT_SUBSTRING:
        MOV AH,1
        INT 21H
        CMP AL,0DH
        JE END2
        MOV SUBSTRING+SI,AL
        INC SI
        JMP INPUT_SUBSTRING
        
     END2:
        MOV AH,9
        LEA DX,NEWLINE
        INT 21H
         
     MOV SI,0
         
    
        
    
    
    STRING_LOOP:
       MOV DI,0
       PUSH SI
       
       SUBSTRING_LOOP:
            MOV CH,STRING[SI]
            MOV CL,SUBSTRING[DI]
            INC DI
            INC SI
            CMP CL,'$'
            JE FOUND
            CMP CH,'$'
            JE NOT_FOUND
            CMP CH,CL
            JE SUBSTRING_LOOP
            JNE UPDATE_INDEX
            
            
      UPDATE_INDEX:
        POP SI
        INC SI
        JMP STRING_LOOP
        
      FOUND:
        MOV AH,9
        LEA DX,FOUND_MSG
        INT 21H
        JMP EXIT
        
        
      NOT_FOUND:
        MOV AH,9
        LEA DX,NOTFOUND_MSG
        INT 21H
        JMP EXIT
        
        
      EXIT:
      
    END MAIN
      
            
            



