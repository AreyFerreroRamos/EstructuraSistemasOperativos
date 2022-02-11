	.arch armv5te
	.eabi_attribute 23, 1
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.file	"DNIE.c"
	.text
	.align	2
	.global	aleatorio
	.syntax unified
	.arm
	.fpu softvfp
	.type	aleatorio, %function
aleatorio:
	@ args = 0, pretend = 0, frame = 24
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #28
	str	r0, [sp, #4]
	ldr	r3, [sp, #4]
	add	r3, r3, #1
	str	r3, [sp, #4]
	bl	GARLIC_random
	mov	r3, r0
	str	r3, [sp, #20]
	ldr	r1, [sp, #4]
	add	r3, sp, #12
	add	r2, sp, #16
	ldr	r0, [sp, #20]
	bl	GARLIC_divmod
	b	.L2
.L3:
	ldr	r2, [sp, #12]
	mov	r3, r2
	lsl	r3, r3, #2
	add	r3, r3, r2
	lsl	r3, r3, #1
	str	r3, [sp, #12]
	ldr	r0, [sp, #12]
	ldr	r1, [sp, #4]
	add	r3, sp, #12
	add	r2, sp, #16
	bl	GARLIC_divmod
.L2:
	ldr	r3, [sp, #16]
	cmp	r3, #0
	beq	.L3
	ldr	r3, [sp, #20]
	mov	r0, r3
	add	sp, sp, #28
	@ sp needed
	ldr	pc, [sp], #4
	.size	aleatorio, .-aleatorio
	.section	.rodata
	.align	2
.LC0:
	.ascii	"Has seleccionado la opcion de DNI:\012\000"
	.align	2
.LC1:
	.ascii	"%0%d, letra:\000"
	.align	2
.LC2:
	.ascii	"%2 %c \012\000"
	.align	2
.LC3:
	.ascii	"Has seleccionado la opcion de NIE:\012\000"
	.align	2
.LC4:
	.ascii	"%0%c%d, letra:\000"
	.text
	.align	2
	.global	_start
	.syntax unified
	.arm
	.fpu softvfp
	.type	_start, %function
_start:
	@ args = 0, pretend = 0, frame = 32
	@ frame_needed = 0, uses_anonymous_args = 0
	str	lr, [sp, #-4]!
	sub	sp, sp, #36
	str	r0, [sp, #4]
	mov	r3, #0
	str	r3, [sp, #24]
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bge	.L6
	mov	r3, #0
	str	r3, [sp, #4]
	b	.L7
.L6:
	ldr	r3, [sp, #4]
	cmp	r3, #3
	ble	.L7
	mov	r3, #3
	str	r3, [sp, #4]
.L7:
	ldr	r3, [sp, #4]
	cmp	r3, #2
	beq	.L9
	cmp	r3, #3
	beq	.L10
	cmp	r3, #1
	bne	.L8
	mov	r3, #88
	strb	r3, [sp, #23]
	b	.L8
.L9:
	mov	r3, #89
	strb	r3, [sp, #23]
	ldr	r3, .L19
	str	r3, [sp, #24]
	b	.L8
.L10:
	mov	r3, #90
	strb	r3, [sp, #23]
	ldr	r3, .L19+4
	str	r3, [sp, #24]
	nop
.L8:
	ldr	r3, [sp, #4]
	cmp	r3, #0
	bne	.L12
	ldr	r0, .L19+8
	bl	GARLIC_printf
	mov	r3, #0
	str	r3, [sp, #28]
	b	.L13
.L14:
	ldr	r0, .L19+12
	bl	aleatorio
	str	r0, [sp, #16]
	ldr	r1, [sp, #16]
	ldr	r0, .L19+16
	bl	GARLIC_printf
	ldr	r0, [sp, #16]
	add	r3, sp, #8
	add	r2, sp, #12
	mov	r1, #23
	bl	GARLIC_divmod
	ldr	r3, [sp, #8]
	ldr	r2, .L19+20
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L19+24
	bl	GARLIC_printf
	ldr	r3, [sp, #28]
	add	r3, r3, #1
	str	r3, [sp, #28]
.L13:
	ldr	r3, [sp, #28]
	cmp	r3, #19
	ble	.L14
	b	.L15
.L12:
	ldr	r0, .L19+28
	bl	GARLIC_printf
	mov	r3, #0
	str	r3, [sp, #28]
	b	.L16
.L17:
	ldr	r0, .L19+32
	bl	aleatorio
	str	r0, [sp, #16]
	ldrb	r3, [sp, #23]	@ zero_extendqisi2
	ldr	r2, [sp, #16]
	mov	r1, r3
	ldr	r0, .L19+36
	bl	GARLIC_printf
	ldr	r2, [sp, #16]
	ldr	r3, [sp, #24]
	add	r3, r2, r3
	str	r3, [sp, #16]
	ldr	r0, [sp, #16]
	add	r3, sp, #8
	add	r2, sp, #12
	mov	r1, #23
	bl	GARLIC_divmod
	ldr	r3, [sp, #8]
	ldr	r2, .L19+20
	ldrb	r3, [r2, r3]	@ zero_extendqisi2
	mov	r1, r3
	ldr	r0, .L19+24
	bl	GARLIC_printf
	ldr	r3, [sp, #28]
	add	r3, r3, #1
	str	r3, [sp, #28]
.L16:
	ldr	r3, [sp, #28]
	cmp	r3, #19
	ble	.L17
.L15:
	mov	r3, #0
	mov	r0, r3
	add	sp, sp, #36
	@ sp needed
	ldr	pc, [sp], #4
.L20:
	.align	2
.L19:
	.word	10000000
	.word	20000000
	.word	.LC0
	.word	99999999
	.word	.LC1
	.word	crypt.4120
	.word	.LC2
	.word	.LC3
	.word	9999999
	.word	.LC4
	.size	_start, .-_start
	.section	.rodata
	.align	2
	.type	crypt.4120, %object
	.size	crypt.4120, 23
crypt.4120:
	.byte	84
	.byte	82
	.byte	87
	.byte	65
	.byte	71
	.byte	77
	.byte	89
	.byte	70
	.byte	80
	.byte	68
	.byte	88
	.byte	66
	.byte	78
	.byte	74
	.byte	90
	.byte	83
	.byte	81
	.byte	86
	.byte	72
	.byte	76
	.byte	67
	.byte	75
	.byte	69
	.ident	"GCC: (devkitARM release 46) 6.3.0"
