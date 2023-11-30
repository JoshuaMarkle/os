org 0x7C00
bits 16

msg db "Hello, World!", 0 ; The zero is the null terminator

mov si, msg ; define si as a pointer to the msg (start of string)

print:
	mov al, [si]
	test al, al ; Check if the char is a null terminator
	jz done ; Complete the loop if it is
	
	mov ah, 0x0e
	int 0x10

	inc si
	jmp print

done:
	jmp $

times 510-($-$$) db 0
dw 0xaa55
