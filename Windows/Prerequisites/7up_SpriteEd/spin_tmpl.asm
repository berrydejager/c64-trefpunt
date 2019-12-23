*= $0800
.byte $00,$0c,$08,$0a,$00,$9e,$32,$30,$36,$34,$00,$00,$00,$00
*= $0810

				 sei
				 jsr $e544   ;clr screen

;Sprite stuff
				 lda #$ff  	 ;turn on Sprite 0-7
				 sta $d015
				 lda #$00  	 ;Sprite Multicolor Register #0 to -black-
				 sta $d025	 
				 lda #$01  	 ;Sprite Multicolor Register #1 to -white-
				 sta $d026	 

         ;sprites' color
				 lda #$05	   ;-green-
         sta $d027
         sta $d028
         sta $d029
         sta $d02a
         sta $d02b
         sta $d02c
         sta $d02d
         sta $d02e
				
         ;sprites' multicolor | hires
				 lda #$ff    ;11111111 sprite 0..7
         sta $d01c   ;set to Multicolor with bit[0..7]=1, to Hires with bit[..]=0

         ;sprites' pointer
				 lda #$80    ;($2000) 8192 / 64 = 128 == $80
         sta $07f8   ;pointer to spritedata
				 lda #$81    ;($2040) 8256 / 64 = 129 == $81
         sta $07f9   ;pointer to spritedata1
				 lda #$82    ;($2080) 8320 / 64 = 130 == $82
         sta $07fa   ;pointer to spritedata2
				 lda #$83    ;($20C0) 8384 / 64 = 131 == $83
         sta $07fb   ;pointer to spritedata3
				 lda #$84    ;($2100) 8448 / 64 = 132 == $84
         sta $07fc   ;pointer to spritedata4
				 lda #$85    ;($2140) 8512 / 64 = 133 == $85
         sta $07fd   ;pointer to spritedata5
				 lda #$86
         sta $07fe   ;pointer to spritedata6
				 lda #$87
         sta $07ff   ;pointer to spritedata7

				 ;sprites' position
         ;first x-pos is 30
         ;first y-pos is 50
         lda #30
				 sta $d000	 ;X - coordinate to 30 (sprite 0)
				 lda #50
				 sta $d001	 ;y - coordinate to 50
				 lda #30+24
         sta $d002	 ;X - coordinate (sprite 1)
				 lda #50
				 sta $d003	 ;y - coordinate
			 	 lda #30+48
         sta $d004	 ;X - coordinate (sprite 2)
				 lda #50
				 sta $d005	 ;y - coordinate
         lda #30
         sta $d006	 ;X - coordinate (sprite 3)
				 lda #50+21
				 sta $d007	 ;y - coordinate
				 lda #30+24
         sta $d008	 ;X - coordinate (sprite 4)
				 lda #50+21
				 sta $d009	 ;y - coordinate
				 lda #30+48
         sta $d00a	 ;X - coordinate (sprite 5)
				 lda #50+21
				 sta $d00b	 ;y - coordinate
				 lda #30
         sta $d00c	 ;X - coordinate (sprite 6)
				 lda #50+42
				 sta $d00d	 ;y - coordinate
				 lda #30+24
         sta $d00e	 ;X - coordinate (sprite 7)
				 lda #50+42
				 sta $d00f	 ;y - coordinate

				
mainloop ldx #$ff
         lda $d012
         cmp #$ff     ;raster beam: wait till line 255
         bne mainloop
		
; ... do something

				 jmp mainloop
		
*=$2000
spritedata
; spritedata inserted below by 7up spritepainter >>>

