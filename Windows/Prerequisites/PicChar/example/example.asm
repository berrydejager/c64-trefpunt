*=$1000


		lda #1
		sta $d020
		lda #0
		sta $d021

		ldx #0
		lda #1
-
		sta $d800,x
		sta $d900,x
		sta $da00,x
		sta $db00,x
		inx
		bne -

		lda #$18
		sta $d018	; switch to charset at $2000

		ldx #0
-
		lda alien_screen,x
		sta $0400,x
		lda alien_screen+256,x
		sta $0500,x
		lda alien_screen+512,x
		sta $0600,x
		lda alien_screen+768,x
		sta $0700,x
		inx
		bne -

		jmp *		; infinite loop

.align $0100		; put the screendata at the next aligned bank

alien_screen
.binary "alien.sc1"


*=$2000		; load converted charset at $2000
.binary "alien.chr"
