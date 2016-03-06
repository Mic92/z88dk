;
;       CPM Library
;
;       Fputc_cons
;
;	Stefano Bodrato - Apr. 2000
;
;
;	$Id: fputc_cons.asm,v 1.6 2016-03-06 21:36:52 dom Exp $
;

	SECTION	code_clib
          PUBLIC  fputc_cons
          PUBLIC  _fputc_cons

;
; Entry:        hl = points to char
;
.fputc_cons
._fputc_cons
	ld      hl,2
	add     hl,sp
	ld	a,(hl)
	cp	12	; FF (CLS) ?
	jr	z,docls
	cp	13	; CR ?
	jr	nz,nocrlf
	ld	de,10	; Add a LineFeed
	ld	c,2
	push	af
	call	5
	pop	af
.nocrlf
	ld	e,a	; Send the character
	ld	d,0
	ld      c,2
	jp	5
.docls
;	This is the ANSI CLS call
	ld	e,27
	ld	c,2
	call	5
	ld	e,'['
	ld	c,2
	call	5
	ld	e,'J'
	ld	c,2
	jp	5
