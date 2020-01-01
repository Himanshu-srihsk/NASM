section .data
msg1 db "enter no:"
l1 equ $- msg1
msg2 db "largest no  is:"
l2 equ $-msg2


section .bss
  num1 resb 50
  num2 resb 50
  num3 resb 50
  
  
  section .text
     global _start
     
_start:
  mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, l1
  int 80h
  

  mov eax, 3
  mov ebx, 0
  mov ecx, num1
  mov edx, 50
  int 80h
  
  
  
    mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, l1
  int 80h
  

  mov eax, 3
  mov ebx, 0
  mov ecx, num2
  mov edx, 50
  int 80h
  
  
    mov eax, 4
  mov ebx, 1
  mov ecx, msg1
  mov edx, l1
  int 80h
  

  mov eax, 3
  mov ebx, 0
  mov ecx, num3
  mov edx, 50
  int 80h
  
  mov al,[num1]
  mov ah,0
  sub ax,0030h
  
  mov bl,[num2]
  mov bh,0
  sub bx,0030h
  
  mov cl,[num3]
  mov ch,0
  sub cx,0030h
  
  
  cmp ax,bx
  jc jtnum3
  cmp ax,cx
  jc disp
  
   mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, l2
  int 80h
  

  mov eax, 4
  mov ebx, 1
  mov ecx, num2
  mov edx, 50
  int 80h
  jmp out
  
  disp:
   mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, l2
  int 80h
  

  mov eax, 4
  mov ebx, 1
  mov ecx, num3
  mov edx, 50
  int 80h
  jmp out
  
jtnum3:
 cmp bx,cx
 jc disp
 mov eax, 4
  mov ebx, 1
  mov ecx, msg2
  mov edx, l2
  int 80h
  

  mov eax, 4
  mov ebx, 1
  mov ecx, num2
  mov edx, 50
  int 80h
  jmp out
  
  
   
  out:
  mov eax,1
  int 80h
  
