.model small
.stack 64
.data
xbinary		dw		0
ybinary		dw		0
ascval		dw		?

dispdata 	label 	byte
xmsg		db		'X = '
xascii		dw		?
			db		' '
ymsg		db		'Y = '
yascii		db		?
.code
begin		proc 	far
			mov		ax,@data
			mov		ds,ax
			call 	q10clear
			call	b10init
			cmp		ax,00
			je		a90
a10:
			call	d10ptr
			cmp		bx,01
			je		a80
			call 	q20curs
			mov 	ax,xbinary
			call	g10conv
			mov 	ax,ascval
			mov 	xascii,ax
			mov		ax,ybinary
			call	g10conv
			mov		ax,ascval
			mov 	yascii,ax
			call 	q30disp
			jmp		a10
a80:
			call	h10hide
a90:		
			call q10clear
			mov 