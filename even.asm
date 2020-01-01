
section.data
msg1 db "Enter a digit " 
len3 equ $- msg1 
   
even_msg  db  'Even Number!' 
len1  equ  $ - even_msg 
   
odd_msg db  'Odd Number!'    
len2  equ  $ - odd_msg


section .bss
  num1  resb 4
  
section .text
   global _start            
_start:                    
mov eax, 4         
   mov ebx,1         
   mov ecx, msg1         
   mov edx, len3 
   int 0x80                

   mov eax, 3 
   mov ebx, 0  
   mov ecx, num1 
   mov edx, 4
   int 0x80   
   
   
   mov   ax,[num1+eax-2]          ;getting 8 in the ax 
   ;mov ah,0
   ;mov ax,ecx
   and   ax, 1              ;and ax with 1
   jz    evnn
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, odd_msg       ;message to write
   mov   edx, len2          ;length of message
   int   0x80               ;call kernel
   jmp   outprog

evnn:   
  
   mov   ah,  09h
   mov   eax, 4             ;system call number (sys_write)
   mov   ebx, 1             ;file descriptor (stdout)
   mov   ecx, even_msg      ;message to write
   mov   edx, len1          ;length of message
   int   0x80               ;call kernel

outprog:

   mov   eax,1              ;system call number (sys_exit)
   int   0x80               ;call kernel


