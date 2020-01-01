section .bss
    num1 resb 8    
    num2 resb 8
    sum  resb 8

section .data
    prompt1 db 'Enter number1 :',0
    p1len equ $ - prompt1
    prompt2 db 'Enter number2 :',0
    p2len equ $ - prompt2
    result db "The sum is "
    reslen equ $ - result

section .text
    global _start
    
  convert:
	mov eax, 0
	mov edx, 0
	mov edi,10
	mov bp,0
	mov bl, [esi]
	cmp bl,'-'
	jne posn
	mov bp,1
	inc esi
  posn:
	mov bl,[esi]
	inc esi
	cmp bl,10
	je brk1
 	cmp bl,0
	je brk1
	sub bl,'0'
	mul edi
	add eax,ebx
	jmp posn
  brk1:
	cmp bp,1
	jne endc
	neg eax
  endc:
	ret


  store:
	cmp eax ,0
	jne nonz
        mov [esi], byte'0'
	mov [esi+1], byte 10
	mov [esi+2], byte 0
	ret
  nonz:
	mov ebp,esi
	mov ecx,5
	mov edi,10
	mov edx,0
	cmp eax,0
	jg poss
	mov [esi], byte 45
	neg eax
  poss:
	add esi, ecx
	mov [esi+1],byte 10
  divl:
	div edi
	add dl,'0'
	mov [esi],dl
	dec esi
	mov edx,0
	loop divl
	mov esi,ebp
	mov ecx,0
	mov bl,[esi]
	cmp bl,'-'
	jne cont1
	inc esi
	inc ebp
	inc ecx
  cont1:
	mov bl,[esi]
	sub bl,'0'
	cmp bl,1
	jge cont2
	inc esi
	jmp cont1
  cont2:
	mov bl,[esi]
	cmp bl, 0
	je cont3
	mov [ebp],bl
	inc ebp
	inc esi
	inc ecx
	jmp cont2
  cont3:
	mov [esi], byte 0
	ret

_start:
	;print prompt1
	mov eax,4
	mov ebx,1
	mov ecx,prompt1
	mov edx,p1len
	int 0x80
	
	mov eax,3
	mov ebx,0
	mov ecx,num1
	mov edx,8
	int 0x80

	;print prompt2
	mov eax,4
	mov ebx,1
	mov ecx,prompt2
	mov edx,p2len
	int 0x80

	mov eax,3
	mov ebx,0
	mov ecx,num2
	mov edx,8
	int 0x80

        mov esi,num1
        call convert
        push eax
        
        mov esi,num2
        call convert
        pop ebx
	add eax,ebx
        mov esi,sum
	call store
	push ecx

	;print result
	mov eax,4
	mov ebx,1
	mov ecx,result
	mov edx,reslen
	int 0x80

	;print sum
	mov eax,4
	mov ebx,1
	mov ecx,sum
	int 0x80

	mov eax,1
	int 0x80


;nasm -f elf32 sign.asm -o sign.o
;ld -m elf_i386 sign.o -o sign
;./sign


