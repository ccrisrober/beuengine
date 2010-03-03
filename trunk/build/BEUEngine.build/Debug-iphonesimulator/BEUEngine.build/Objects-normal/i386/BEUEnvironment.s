	.section __DWARF,__debug_frame,regular,debug
Lsection__debug_frame:
	.section __DWARF,__debug_info,regular,debug
Lsection__debug_info:
	.section __DWARF,__debug_abbrev,regular,debug
Lsection__debug_abbrev:
	.section __DWARF,__debug_aranges,regular,debug
Lsection__debug_aranges:
	.section __DWARF,__debug_macinfo,regular,debug
Lsection__debug_macinfo:
	.section __DWARF,__debug_line,regular,debug
Lsection__debug_line:
	.section __DWARF,__debug_loc,regular,debug
Lsection__debug_loc:
	.section __DWARF,__debug_pubnames,regular,debug
Lsection__debug_pubnames:
	.section __DWARF,__debug_pubtypes,regular,debug
Lsection__debug_pubtypes:
	.section __DWARF,__debug_inlined,regular,debug
Lsection__debug_inlined:
	.section __DWARF,__debug_str,regular,debug
Lsection__debug_str:
	.section __DWARF,__debug_ranges,regular,debug
Lsection__debug_ranges:
	.section __DWARF,__debug_abbrev,regular,debug
Ldebug_abbrev0:
	.section __DWARF,__debug_info,regular,debug
Ldebug_info0:
	.section __DWARF,__debug_line,regular,debug
Ldebug_line0:
	.text
Ltext0:
	.const
_ccWHITE:
	.byte	-1
	.byte	-1
	.byte	-1
_ccYELLOW:
	.byte	-1
	.byte	-1
	.byte	0
_ccBLUE:
	.byte	0
	.byte	0
	.byte	-1
_ccGREEN:
	.byte	0
	.byte	-1
	.byte	0
_ccRED:
	.byte	-1
	.byte	0
	.byte	0
_ccMAGENTA:
	.byte	-1
	.byte	0
	.byte	-1
_ccBLACK:
	.space 3
_ccORANGE:
	.byte	-1
	.byte	127
	.byte	0
_ccGRAY:
	.byte	-90
	.byte	-90
	.byte	-90
	.cstring
LC0:
	.ascii "TestTile.png\0"
	.section __DATA, __cfstring
	.align 2
LC1:
	.long	___CFConstantStringClassReference
	.long	1992
	.long	LC0
	.long	12
	.text
"-[BEUEnvironment init]":
LFB191:
	.file 1 "/Users/chris/Projects/BEUEngine/BEUEngine/Classes/BEUEnvironment.m"
	.loc 1 15 0
	pushl	%ebp
LCFI0:
	movl	%esp, %ebp
LCFI1:
	pushl	%ebx
LCFI2:
	subl	$36, %esp
LCFI3:
	call	L5
"L00000000001$pb":
L5:
	popl	%ebx
LBB2:
	.loc 1 16 0
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	leal	L_OBJC_CLASS_BEUEnvironment-"L00000000001$pb"(%ebx), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	leal	-20(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_3-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSendSuper
	movl	%eax, 8(%ebp)
	cmpl	$0, 8(%ebp)
	je	L2
LBB3:
	.loc 1 18 0
	leal	L_OBJC_CLASS_REFERENCES_0-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_4-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_3-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %edx
	movl	8(%ebp), %eax
	movl	%edx, 148(%eax)
	.loc 1 20 0
	leal	L_OBJC_CLASS_REFERENCES_1-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_4-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%eax, %ecx
	leal	LC1-"L00000000001$pb"(%ebx), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_5-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movl	%eax, -12(%ebp)
	.loc 1 21 0
	movl	8(%ebp), %ecx
	leal	L_OBJC_SELECTOR_REFERENCES_6-"L00000000001$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	-12(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
L2:
LBE3:
LBE2:
	.loc 1 25 0
	movl	8(%ebp), %eax
	.loc 1 27 0
	addl	$36, %esp
	popl	%ebx
	leave
	ret
LFE191:
"-[BEUEnvironment addTile:]":
LFB192:
	.loc 1 30 0
	pushl	%ebp
LCFI4:
	movl	%esp, %ebp
LCFI5:
	pushl	%esi
LCFI6:
	pushl	%ebx
LCFI7:
	subl	$16, %esp
LCFI8:
	call	L8
"L00000000002$pb":
L8:
	popl	%ebx
	.loc 1 33 0
	leal	LC2-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	leal	LC2-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, (%esp)
	call	_CGPointMake
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	16(%ebp), %esi
	leal	L_OBJC_SELECTOR_REFERENCES_7-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_objc_msgSend
	.loc 1 34 0
	movl	8(%ebp), %eax
	movl	144(%eax), %eax
	movl	%eax, %ecx
	movl	16(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_8-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	.loc 1 36 0
	movl	8(%ebp), %ecx
	movl	16(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_9-"L00000000002$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	.loc 1 38 0
	addl	$16, %esp
	popl	%ebx
	popl	%esi
	leave
	ret
LFE192:
_CGPointMake:
LFB130:
	.file 2 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGGeometry.h"
	.loc 2 259 0
	pushl	%ebp
LCFI9:
	movl	%esp, %ebp
LCFI10:
	subl	$24, %esp
LCFI11:
	.loc 2 260 0
	movl	8(%ebp), %eax
	movl	%eax, -16(%ebp)
	movl	12(%ebp), %eax
	movl	%eax, -12(%ebp)
	movl	-16(%ebp), %eax
	movl	-12(%ebp), %edx
	.loc 2 261 0
	leave
	ret
LFE130:
"-[BEUEnvironment addCharacter:]":
LFB193:
	.loc 1 41 0
	pushl	%ebp
LCFI12:
	movl	%esp, %ebp
LCFI13:
	pushl	%ebx
LCFI14:
	subl	$20, %esp
LCFI15:
	call	L13
"L00000000003$pb":
L13:
	popl	%ebx
	.loc 1 42 0
	movl	8(%ebp), %eax
	movl	148(%eax), %eax
	movl	%eax, %ecx
	movl	16(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_8-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	.loc 1 43 0
	movl	8(%ebp), %ecx
	movl	16(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_9-"L00000000003$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	.loc 1 44 0
	addl	$20, %esp
	popl	%ebx
	leave
	ret
LFE193:
"-[BEUEnvironment moveObjects]":
LFB194:
	.loc 1 47 0
	pushl	%ebp
LCFI16:
	movl	%esp, %ebp
LCFI17:
	pushl	%edi
LCFI18:
	pushl	%esi
LCFI19:
	pushl	%ebx
LCFI20:
	subl	$236, %esp
LCFI21:
	call	L30
"L00000000004$pb":
L30:
	popl	%ebx
LBB4:
	.loc 1 48 0
	leal	-60(%ebp), %edi
	cld
	movl	$0, %edx
	movl	$8, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	rep
	stosl
	movl	8(%ebp), %eax
	movl	148(%eax), %eax
	movl	%eax, -188(%ebp)
	leal	L_OBJC_SELECTOR_REFERENCES_17-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	$16, 16(%esp)
	leal	-124(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-60(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-188(%ebp), %eax
	movl	%eax, (%esp)
	call	_objc_msgSend
	movl	%eax, -148(%ebp)
	cmpl	$0, -148(%ebp)
	je	L15
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -144(%ebp)
L17:
	movl	$0, -140(%ebp)
L18:
	movl	-52(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-144(%ebp), %eax
	je	L19
	movl	8(%ebp), %eax
	movl	148(%eax), %eax
	movl	%eax, (%esp)
	call	_objc_enumerationMutation
L19:
	movl	-56(%ebp), %edx
	movl	-140(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -28(%ebp)
	incl	-140(%ebp)
	.loc 1 50 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_18-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-184(%ebp)
	leal	LC3-"L00000000004$pb"(%ebx), %eax
	movss	(%eax), %xmm0
	movss	-184(%ebp), %xmm1
	ucomiss	%xmm0, %xmm1
	jne	L21
	jp	L21
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_19-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-180(%ebp)
	leal	LC3-"L00000000004$pb"(%ebx), %eax
	movss	(%eax), %xmm0
	movss	-180(%ebp), %xmm1
	ucomiss	%xmm0, %xmm1
	jne	L21
	jp	L21
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_20-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-176(%ebp)
	leal	LC3-"L00000000004$pb"(%ebx), %eax
	movss	(%eax), %xmm0
	movss	-176(%ebp), %xmm1
	ucomiss	%xmm0, %xmm1
	jne	L21
	jp	L21
	jmp	L24
L21:
	.loc 1 52 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_21-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-172(%ebp)
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_18-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-168(%ebp)
	movss	-172(%ebp), %xmm0
	addss	-168(%ebp), %xmm0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_10-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movss	%xmm0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	.loc 1 53 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_22-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-164(%ebp)
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_19-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-160(%ebp)
	movss	-164(%ebp), %xmm0
	addss	-160(%ebp), %xmm0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_11-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movss	%xmm0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	.loc 1 54 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_23-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-156(%ebp)
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_20-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-152(%ebp)
	movss	-156(%ebp), %xmm0
	addss	-152(%ebp), %xmm0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_12-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movss	%xmm0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	.loc 1 56 0
	movl	-28(%ebp), %ecx
	leal	L_OBJC_SELECTOR_REFERENCES_13-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %edx
	leal	LC3-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	%ecx, (%esp)
	call	_objc_msgSend
	movl	$0, %esi
	movl	-28(%ebp), %edx
	cvtsi2ss	%esi, %xmm0
	leal	L_OBJC_SELECTOR_REFERENCES_14-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movss	%xmm0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	movl	%esi, %eax
	movl	-28(%ebp), %edx
	cvtsi2ss	%eax, %xmm0
	leal	L_OBJC_SELECTOR_REFERENCES_15-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movss	%xmm0, 8(%esp)
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	.loc 1 58 0
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_22-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	fstps	-204(%ebp)
	movss	-204(%ebp), %xmm0
	movss	%xmm0, -204(%ebp)
	movl	-204(%ebp), %esi
	movl	-28(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_21-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend_fpret
	movl	%esi, 4(%esp)
	fstps	(%esp)
	call	_CGPointMake
	movl	%edx, %ecx
	movl	%eax, %edx
	movl	-28(%ebp), %esi
	leal	L_OBJC_SELECTOR_REFERENCES_16-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%edx, 8(%esp)
	movl	%ecx, 12(%esp)
	movl	%eax, 4(%esp)
	movl	%esi, (%esp)
	call	_objc_msgSend
L24:
	.loc 1 48 0
	movl	-148(%ebp), %eax
	cmpl	%eax, -140(%ebp)
	jb	L18
	leal	L_OBJC_SELECTOR_REFERENCES_17-"L00000000004$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	$16, 16(%esp)
	leal	-124(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-60(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-188(%ebp), %eax
	movl	%eax, (%esp)
	call	_objc_msgSend
	movl	%eax, -148(%ebp)
	cmpl	$0, -148(%ebp)
	jne	L17
	movl	$0, -28(%ebp)
	jmp	L29
L15:
	movl	$0, -28(%ebp)
L29:
LBE4:
	.loc 1 61 0
	addl	$236, %esp
	popl	%ebx
	popl	%esi
	popl	%edi
	leave
	ret
LFE194:
"-[BEUEnvironment step:]":
LFB195:
	.loc 1 64 0
	pushl	%ebp
LCFI22:
	movl	%esp, %ebp
LCFI23:
	pushl	%ebx
LCFI24:
	subl	$20, %esp
LCFI25:
	call	L33
"L00000000005$pb":
L33:
	popl	%ebx
	.loc 1 65 0
	movl	8(%ebp), %eax
	leal	L_OBJC_SELECTOR_REFERENCES_24-"L00000000005$pb"(%ebx), %edx
	movl	(%edx), %edx
	movl	%edx, 4(%esp)
	movl	%eax, (%esp)
	call	_objc_msgSend
	.loc 1 66 0
	addl	$20, %esp
	popl	%ebx
	leave
	ret
LFE195:
"-[BEUEnvironment dealloc]":
LFB196:
	.loc 1 69 0
	pushl	%ebp
LCFI26:
	movl	%esp, %ebp
LCFI27:
	pushl	%edi
LCFI28:
	pushl	%ebx
LCFI29:
	subl	$160, %esp
LCFI30:
	call	L45
"L00000000006$pb":
L45:
	popl	%ebx
LBB5:
	.loc 1 70 0
	leal	-52(%ebp), %edi
	cld
	movl	$0, %edx
	movl	$8, %eax
	movl	%eax, %ecx
	movl	%edx, %eax
	rep
	stosl
	movl	8(%ebp), %eax
	movl	144(%eax), %eax
	movl	%eax, -136(%ebp)
	leal	L_OBJC_SELECTOR_REFERENCES_17-"L00000000006$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	$16, 16(%esp)
	leal	-116(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-136(%ebp), %eax
	movl	%eax, (%esp)
	call	_objc_msgSend
	movl	%eax, -132(%ebp)
	cmpl	$0, -132(%ebp)
	je	L35
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	movl	%eax, -128(%ebp)
L37:
	movl	$0, -124(%ebp)
L38:
	movl	-44(%ebp), %eax
	movl	(%eax), %eax
	cmpl	-128(%ebp), %eax
	je	L39
	movl	8(%ebp), %eax
	movl	144(%eax), %eax
	movl	%eax, (%esp)
	call	_objc_enumerationMutation
L39:
	movl	-48(%ebp), %edx
	movl	-124(%ebp), %eax
	sall	$2, %eax
	leal	(%edx,%eax), %eax
	movl	(%eax), %eax
	movl	%eax, -12(%ebp)
	incl	-124(%ebp)
	.loc 1 71 0
	movl	-12(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_1-"L00000000006$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	.loc 1 70 0
	movl	-132(%ebp), %eax
	cmpl	%eax, -124(%ebp)
	jb	L38
	leal	L_OBJC_SELECTOR_REFERENCES_17-"L00000000006$pb"(%ebx), %eax
	movl	(%eax), %edx
	movl	$16, 16(%esp)
	leal	-116(%ebp), %eax
	movl	%eax, 12(%esp)
	leal	-52(%ebp), %eax
	movl	%eax, 8(%esp)
	movl	%edx, 4(%esp)
	movl	-136(%ebp), %eax
	movl	%eax, (%esp)
	call	_objc_msgSend
	movl	%eax, -132(%ebp)
	cmpl	$0, -132(%ebp)
	jne	L37
	movl	$0, -12(%ebp)
	jmp	L43
L35:
	movl	$0, -12(%ebp)
L43:
LBE5:
	.loc 1 74 0
	movl	8(%ebp), %eax
	movl	144(%eax), %eax
	movl	%eax, %edx
	leal	L_OBJC_SELECTOR_REFERENCES_1-"L00000000006$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSend
	.loc 1 76 0
	movl	8(%ebp), %eax
	movl	%eax, -20(%ebp)
	leal	L_OBJC_CLASS_BEUEnvironment-"L00000000006$pb"(%ebx), %eax
	movl	4(%eax), %eax
	movl	%eax, -16(%ebp)
	leal	-20(%ebp), %edx
	leal	L_OBJC_SELECTOR_REFERENCES_25-"L00000000006$pb"(%ebx), %eax
	movl	(%eax), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_msgSendSuper
	.loc 1 77 0
	addl	$160, %esp
	popl	%ebx
	popl	%edi
	leave
	ret
LFE196:
"-[BEUEnvironment tiles]":
LFB197:
	.loc 1 13 0
	pushl	%ebp
LCFI31:
	movl	%esp, %ebp
LCFI32:
	subl	$8, %esp
LCFI33:
	.loc 1 13 0
	movl	8(%ebp), %eax
	movl	144(%eax), %eax
	leave
	ret
LFE197:
"-[BEUEnvironment setTiles:]":
LFB198:
	.loc 1 13 0
	pushl	%ebp
LCFI34:
	movl	%esp, %ebp
LCFI35:
	subl	$40, %esp
LCFI36:
	.loc 1 13 0
	movl	16(%ebp), %eax
	movl	8(%ebp), %edx
	movl	$0, 20(%esp)
	movl	$0, 16(%esp)
	movl	%eax, 12(%esp)
	movl	$144, 8(%esp)
	movl	12(%ebp), %eax
	movl	%eax, 4(%esp)
	movl	%edx, (%esp)
	call	_objc_setProperty
	leave
	ret
LFE198:
	.objc_cat_cls_meth
	.objc_cat_inst_meth
	.objc_string_object
	.section __OBJC, __cstring_object, regular, no_dead_strip
	.objc_message_refs
	.section __OBJC, __sel_fixup, regular, no_dead_strip
	.objc_cls_refs
	.objc_class
	.objc_meta_class
	.objc_cls_meth
	.objc_inst_meth
	.objc_protocol
	.objc_class_names
	.objc_meth_var_types
	.objc_meth_var_names
	.objc_category
	.objc_class_vars
	.objc_instance_vars
	.objc_module_info
	.objc_symbols
	.section __OBJC, __protocol_ext, regular, no_dead_strip
	.section __OBJC, __class_ext, regular, no_dead_strip
	.section __OBJC, __property, regular, no_dead_strip
	.objc_symbols
	.align 2
L_OBJC_SYMBOLS:
	.long	0
	.long	0
	.word	1
	.word	0
	.long	L_OBJC_CLASS_BEUEnvironment
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_0:
	.ascii "tiles\0"
	.objc_meth_var_types
L_OBJC_METH_VAR_TYPE_0:
	.ascii "@\"NSMutableArray\"\0"
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_1:
	.ascii "objects\0"
	.objc_instance_vars
	.align 2
L_OBJC_INSTANCE_VARIABLES_BEUEnvironment:
	.long	2
	.long	L_OBJC_METH_VAR_NAME_0
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	144
	.long	L_OBJC_METH_VAR_NAME_1
	.long	L_OBJC_METH_VAR_TYPE_0
	.long	148
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_2:
	.ascii "setTiles:\0"
	.objc_meth_var_types
L_OBJC_METH_VAR_TYPE_1:
	.ascii "v12@0:4@8\0"
L_OBJC_METH_VAR_TYPE_2:
	.ascii "@8@0:4\0"
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_3:
	.ascii "dealloc\0"
	.objc_meth_var_types
L_OBJC_METH_VAR_TYPE_3:
	.ascii "v8@0:4\0"
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_4:
	.ascii "step:\0"
	.objc_meth_var_types
L_OBJC_METH_VAR_TYPE_4:
	.ascii "v12@0:4f8\0"
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_5:
	.ascii "moveObjects\0"
L_OBJC_METH_VAR_NAME_6:
	.ascii "addCharacter:\0"
L_OBJC_METH_VAR_NAME_7:
	.ascii "addTile:\0"
L_OBJC_METH_VAR_NAME_8:
	.ascii "init\0"
	.objc_inst_meth
	.align 2
L_OBJC_INSTANCE_METHODS_BEUEnvironment:
	.long	0
	.long	8
	.long	L_OBJC_METH_VAR_NAME_2
	.long	L_OBJC_METH_VAR_TYPE_1
	.long	"-[BEUEnvironment setTiles:]"
	.long	L_OBJC_METH_VAR_NAME_0
	.long	L_OBJC_METH_VAR_TYPE_2
	.long	"-[BEUEnvironment tiles]"
	.long	L_OBJC_METH_VAR_NAME_3
	.long	L_OBJC_METH_VAR_TYPE_3
	.long	"-[BEUEnvironment dealloc]"
	.long	L_OBJC_METH_VAR_NAME_4
	.long	L_OBJC_METH_VAR_TYPE_4
	.long	"-[BEUEnvironment step:]"
	.long	L_OBJC_METH_VAR_NAME_5
	.long	L_OBJC_METH_VAR_TYPE_3
	.long	"-[BEUEnvironment moveObjects]"
	.long	L_OBJC_METH_VAR_NAME_6
	.long	L_OBJC_METH_VAR_TYPE_1
	.long	"-[BEUEnvironment addCharacter:]"
	.long	L_OBJC_METH_VAR_NAME_7
	.long	L_OBJC_METH_VAR_TYPE_1
	.long	"-[BEUEnvironment addTile:]"
	.long	L_OBJC_METH_VAR_NAME_8
	.long	L_OBJC_METH_VAR_TYPE_2
	.long	"-[BEUEnvironment init]"
	.cstring
L_OBJC_PROP_NAME_ATTR_0:
	.ascii "tiles\0"
L_OBJC_PROP_NAME_ATTR_1:
	.ascii "T@\"NSMutableArray\",&,N,Vtiles\0"
	.data
	.align 2
l_OBJC_$_PROP_LIST_BEUEnvironment:
	.long	8
	.long	1
	.long	L_OBJC_PROP_NAME_ATTR_0
	.long	L_OBJC_PROP_NAME_ATTR_1
	.section __OBJC, __class_ext, regular, no_dead_strip
	.align 2
L_OBJC_CLASSEXT_BEUEnvironment:
	.long	12
	.long	0
	.long	l_OBJC_$_PROP_LIST_BEUEnvironment
	.objc_class_names
L_OBJC_CLASS_NAME_0:
	.ascii "BEUEnvironment\0"
L_OBJC_CLASS_NAME_1:
	.ascii "CCLayer\0"
L_OBJC_CLASS_NAME_2:
	.ascii "NSObject\0"
	.objc_meta_class
	.align 2
L_OBJC_METACLASS_BEUEnvironment:
	.long	L_OBJC_CLASS_NAME_2
	.long	L_OBJC_CLASS_NAME_1
	.long	L_OBJC_CLASS_NAME_0
	.long	0
	.long	2
	.long	48
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.long	0
	.objc_class
	.align 2
L_OBJC_CLASS_BEUEnvironment:
	.long	L_OBJC_METACLASS_BEUEnvironment
	.long	L_OBJC_CLASS_NAME_1
	.long	L_OBJC_CLASS_NAME_0
	.long	0
	.long	1
	.long	152
	.long	L_OBJC_INSTANCE_VARIABLES_BEUEnvironment
	.long	L_OBJC_INSTANCE_METHODS_BEUEnvironment
	.long	0
	.long	0
	.long	0
	.long	L_OBJC_CLASSEXT_BEUEnvironment
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_25:
	.long	L_OBJC_METH_VAR_NAME_3
	.align 2
L_OBJC_SELECTOR_REFERENCES_24:
	.long	L_OBJC_METH_VAR_NAME_5
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_9:
	.ascii "z\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_23:
	.long	L_OBJC_METH_VAR_NAME_9
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_10:
	.ascii "y\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_22:
	.long	L_OBJC_METH_VAR_NAME_10
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_11:
	.ascii "x\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_21:
	.long	L_OBJC_METH_VAR_NAME_11
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_12:
	.ascii "moveZ\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_20:
	.long	L_OBJC_METH_VAR_NAME_12
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_13:
	.ascii "moveY\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_19:
	.long	L_OBJC_METH_VAR_NAME_13
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_14:
	.ascii "moveX\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_18:
	.long	L_OBJC_METH_VAR_NAME_14
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_15:
	.ascii "countByEnumeratingWithState:objects:count:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_17:
	.long	L_OBJC_METH_VAR_NAME_15
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_16:
	.ascii "setPosition:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_16:
	.long	L_OBJC_METH_VAR_NAME_16
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_17:
	.ascii "setMoveX:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_15:
	.long	L_OBJC_METH_VAR_NAME_17
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_18:
	.ascii "setMoveY:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_14:
	.long	L_OBJC_METH_VAR_NAME_18
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_19:
	.ascii "setMoveZ:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_13:
	.long	L_OBJC_METH_VAR_NAME_19
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_20:
	.ascii "setZ:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_12:
	.long	L_OBJC_METH_VAR_NAME_20
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_21:
	.ascii "setY:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_11:
	.long	L_OBJC_METH_VAR_NAME_21
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_22:
	.ascii "setX:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_10:
	.long	L_OBJC_METH_VAR_NAME_22
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_23:
	.ascii "addChild:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_9:
	.long	L_OBJC_METH_VAR_NAME_23
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_24:
	.ascii "addObject:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_8:
	.long	L_OBJC_METH_VAR_NAME_24
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_25:
	.ascii "setAnchorPoint:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_7:
	.long	L_OBJC_METH_VAR_NAME_25
	.align 2
L_OBJC_SELECTOR_REFERENCES_6:
	.long	L_OBJC_METH_VAR_NAME_7
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_26:
	.ascii "initWithFile:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_5:
	.long	L_OBJC_METH_VAR_NAME_26
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_27:
	.ascii "alloc\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_4:
	.long	L_OBJC_METH_VAR_NAME_27
	.align 2
L_OBJC_SELECTOR_REFERENCES_3:
	.long	L_OBJC_METH_VAR_NAME_8
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_28:
	.ascii "performSelector:\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_2:
	.long	L_OBJC_METH_VAR_NAME_28
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_29:
	.ascii "release\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_1:
	.long	L_OBJC_METH_VAR_NAME_29
	.objc_meth_var_names
L_OBJC_METH_VAR_NAME_30:
	.ascii "retain\0"
	.objc_message_refs
	.align 2
L_OBJC_SELECTOR_REFERENCES_0:
	.long	L_OBJC_METH_VAR_NAME_30
	.section __OBJC, __image_info, regular, no_dead_strip
	.align 2
L_OBJC_IMAGE_INFO:
	.space 8
	.objc_class_names
L_OBJC_CLASS_NAME_3:
	.ascii "\0"
	.objc_module_info
	.align 2
L_OBJC_MODULES:
	.long	7
	.long	16
	.long	L_OBJC_CLASS_NAME_3
	.long	L_OBJC_SYMBOLS
	.lazy_reference .objc_class_name_NSMutableArray
	.objc_class_names
L_OBJC_CLASS_NAME_4:
	.ascii "NSMutableArray\0"
	.objc_cls_refs
	.align 2
L_OBJC_CLASS_REFERENCES_0:
	.long	L_OBJC_CLASS_NAME_4
	.lazy_reference .objc_class_name_BEUEnvironmentTile
	.objc_class_names
L_OBJC_CLASS_NAME_5:
	.ascii "BEUEnvironmentTile\0"
	.objc_cls_refs
	.align 2
L_OBJC_CLASS_REFERENCES_1:
	.long	L_OBJC_CLASS_NAME_5
	.lazy_reference .objc_class_name_CCLayer
	.objc_class_name_BEUEnvironment=0
.globl .objc_class_name_BEUEnvironment
	.literal4
	.align 2
LC2:
	.long	2147483648
	.align 2
LC3:
	.long	0
	.section __DWARF,__debug_frame,regular,debug
Lframe0:
	.set L$set$0,LECIE0-LSCIE0
	.long L$set$0
LSCIE0:
	.long	0xffffffff
	.byte	0x1
	.ascii "\0"
	.byte	0x1
	.byte	0x7c
	.byte	0x8
	.byte	0xc
	.byte	0x4
	.byte	0x4
	.byte	0x88
	.byte	0x1
	.align 2
LECIE0:
LSFDE0:
	.set L$set$1,LEFDE0-LASFDE0
	.long L$set$1
LASFDE0:
	.set L$set$2,Lframe0-Lsection__debug_frame
	.long L$set$2
	.long	LFB191
	.set L$set$3,LFE191-LFB191
	.long L$set$3
	.byte	0x4
	.set L$set$4,LCFI0-LFB191
	.long L$set$4
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$5,LCFI1-LCFI0
	.long L$set$5
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$6,LCFI3-LCFI1
	.long L$set$6
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE0:
LSFDE2:
	.set L$set$7,LEFDE2-LASFDE2
	.long L$set$7
LASFDE2:
	.set L$set$8,Lframe0-Lsection__debug_frame
	.long L$set$8
	.long	LFB192
	.set L$set$9,LFE192-LFB192
	.long L$set$9
	.byte	0x4
	.set L$set$10,LCFI4-LFB192
	.long L$set$10
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$11,LCFI5-LCFI4
	.long L$set$11
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$12,LCFI8-LCFI5
	.long L$set$12
	.byte	0x83
	.byte	0x4
	.byte	0x86
	.byte	0x3
	.align 2
LEFDE2:
LSFDE4:
	.set L$set$13,LEFDE4-LASFDE4
	.long L$set$13
LASFDE4:
	.set L$set$14,Lframe0-Lsection__debug_frame
	.long L$set$14
	.long	LFB130
	.set L$set$15,LFE130-LFB130
	.long L$set$15
	.byte	0x4
	.set L$set$16,LCFI9-LFB130
	.long L$set$16
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$17,LCFI10-LCFI9
	.long L$set$17
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE4:
LSFDE6:
	.set L$set$18,LEFDE6-LASFDE6
	.long L$set$18
LASFDE6:
	.set L$set$19,Lframe0-Lsection__debug_frame
	.long L$set$19
	.long	LFB193
	.set L$set$20,LFE193-LFB193
	.long L$set$20
	.byte	0x4
	.set L$set$21,LCFI12-LFB193
	.long L$set$21
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$22,LCFI13-LCFI12
	.long L$set$22
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$23,LCFI15-LCFI13
	.long L$set$23
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE6:
LSFDE8:
	.set L$set$24,LEFDE8-LASFDE8
	.long L$set$24
LASFDE8:
	.set L$set$25,Lframe0-Lsection__debug_frame
	.long L$set$25
	.long	LFB194
	.set L$set$26,LFE194-LFB194
	.long L$set$26
	.byte	0x4
	.set L$set$27,LCFI16-LFB194
	.long L$set$27
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$28,LCFI17-LCFI16
	.long L$set$28
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$29,LCFI21-LCFI17
	.long L$set$29
	.byte	0x83
	.byte	0x5
	.byte	0x86
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE8:
LSFDE10:
	.set L$set$30,LEFDE10-LASFDE10
	.long L$set$30
LASFDE10:
	.set L$set$31,Lframe0-Lsection__debug_frame
	.long L$set$31
	.long	LFB195
	.set L$set$32,LFE195-LFB195
	.long L$set$32
	.byte	0x4
	.set L$set$33,LCFI22-LFB195
	.long L$set$33
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$34,LCFI23-LCFI22
	.long L$set$34
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$35,LCFI25-LCFI23
	.long L$set$35
	.byte	0x83
	.byte	0x3
	.align 2
LEFDE10:
LSFDE12:
	.set L$set$36,LEFDE12-LASFDE12
	.long L$set$36
LASFDE12:
	.set L$set$37,Lframe0-Lsection__debug_frame
	.long L$set$37
	.long	LFB196
	.set L$set$38,LFE196-LFB196
	.long L$set$38
	.byte	0x4
	.set L$set$39,LCFI26-LFB196
	.long L$set$39
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$40,LCFI27-LCFI26
	.long L$set$40
	.byte	0xd
	.byte	0x5
	.byte	0x4
	.set L$set$41,LCFI30-LCFI27
	.long L$set$41
	.byte	0x83
	.byte	0x4
	.byte	0x87
	.byte	0x3
	.align 2
LEFDE12:
LSFDE14:
	.set L$set$42,LEFDE14-LASFDE14
	.long L$set$42
LASFDE14:
	.set L$set$43,Lframe0-Lsection__debug_frame
	.long L$set$43
	.long	LFB197
	.set L$set$44,LFE197-LFB197
	.long L$set$44
	.byte	0x4
	.set L$set$45,LCFI31-LFB197
	.long L$set$45
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$46,LCFI32-LCFI31
	.long L$set$46
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE14:
LSFDE16:
	.set L$set$47,LEFDE16-LASFDE16
	.long L$set$47
LASFDE16:
	.set L$set$48,Lframe0-Lsection__debug_frame
	.long L$set$48
	.long	LFB198
	.set L$set$49,LFE198-LFB198
	.long L$set$49
	.byte	0x4
	.set L$set$50,LCFI34-LFB198
	.long L$set$50
	.byte	0xe
	.byte	0x8
	.byte	0x85
	.byte	0x2
	.byte	0x4
	.set L$set$51,LCFI35-LCFI34
	.long L$set$51
	.byte	0xd
	.byte	0x5
	.align 2
LEFDE16:
	.text
Letext0:
	.section __DWARF,__debug_loc,regular,debug
Ldebug_loc0:
LLST0:
	.set L$set$52,LFB191-Ltext0
	.long L$set$52
	.set L$set$53,LCFI0-Ltext0
	.long L$set$53
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$54,LCFI0-Ltext0
	.long L$set$54
	.set L$set$55,LCFI1-Ltext0
	.long L$set$55
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$56,LCFI1-Ltext0
	.long L$set$56
	.set L$set$57,LFE191-Ltext0
	.long L$set$57
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST1:
	.set L$set$58,LFB192-Ltext0
	.long L$set$58
	.set L$set$59,LCFI4-Ltext0
	.long L$set$59
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$60,LCFI4-Ltext0
	.long L$set$60
	.set L$set$61,LCFI5-Ltext0
	.long L$set$61
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$62,LCFI5-Ltext0
	.long L$set$62
	.set L$set$63,LFE192-Ltext0
	.long L$set$63
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST2:
	.set L$set$64,LFB130-Ltext0
	.long L$set$64
	.set L$set$65,LCFI9-Ltext0
	.long L$set$65
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$66,LCFI9-Ltext0
	.long L$set$66
	.set L$set$67,LCFI10-Ltext0
	.long L$set$67
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$68,LCFI10-Ltext0
	.long L$set$68
	.set L$set$69,LFE130-Ltext0
	.long L$set$69
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST3:
	.set L$set$70,LFB193-Ltext0
	.long L$set$70
	.set L$set$71,LCFI12-Ltext0
	.long L$set$71
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$72,LCFI12-Ltext0
	.long L$set$72
	.set L$set$73,LCFI13-Ltext0
	.long L$set$73
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$74,LCFI13-Ltext0
	.long L$set$74
	.set L$set$75,LFE193-Ltext0
	.long L$set$75
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST4:
	.set L$set$76,LFB194-Ltext0
	.long L$set$76
	.set L$set$77,LCFI16-Ltext0
	.long L$set$77
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$78,LCFI16-Ltext0
	.long L$set$78
	.set L$set$79,LCFI17-Ltext0
	.long L$set$79
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$80,LCFI17-Ltext0
	.long L$set$80
	.set L$set$81,LFE194-Ltext0
	.long L$set$81
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST5:
	.set L$set$82,LFB195-Ltext0
	.long L$set$82
	.set L$set$83,LCFI22-Ltext0
	.long L$set$83
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$84,LCFI22-Ltext0
	.long L$set$84
	.set L$set$85,LCFI23-Ltext0
	.long L$set$85
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$86,LCFI23-Ltext0
	.long L$set$86
	.set L$set$87,LFE195-Ltext0
	.long L$set$87
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST6:
	.set L$set$88,LFB196-Ltext0
	.long L$set$88
	.set L$set$89,LCFI26-Ltext0
	.long L$set$89
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$90,LCFI26-Ltext0
	.long L$set$90
	.set L$set$91,LCFI27-Ltext0
	.long L$set$91
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$92,LCFI27-Ltext0
	.long L$set$92
	.set L$set$93,LFE196-Ltext0
	.long L$set$93
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST7:
	.set L$set$94,LFB197-Ltext0
	.long L$set$94
	.set L$set$95,LCFI31-Ltext0
	.long L$set$95
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$96,LCFI31-Ltext0
	.long L$set$96
	.set L$set$97,LCFI32-Ltext0
	.long L$set$97
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$98,LCFI32-Ltext0
	.long L$set$98
	.set L$set$99,LFE197-Ltext0
	.long L$set$99
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
LLST8:
	.set L$set$100,LFB198-Ltext0
	.long L$set$100
	.set L$set$101,LCFI34-Ltext0
	.long L$set$101
	.word	0x2
	.byte	0x74
	.byte	0x4
	.set L$set$102,LCFI34-Ltext0
	.long L$set$102
	.set L$set$103,LCFI35-Ltext0
	.long L$set$103
	.word	0x2
	.byte	0x74
	.byte	0x8
	.set L$set$104,LCFI35-Ltext0
	.long L$set$104
	.set L$set$105,LFE198-Ltext0
	.long L$set$105
	.word	0x2
	.byte	0x75
	.byte	0x8
	.long	0x0
	.long	0x0
	.file 3 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/usr/include/i386/_types.h"
	.file 4 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/usr/include/runetype.h"
	.file 5 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/usr/include/objc/objc.h"
	.file 6 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSObjCRuntime.h"
	.file 7 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSObject.h"
	.file 8 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSValue.h"
	.file 9 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSEnumerator.h"
	.file 10 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSArray.h"
	.file 11 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/Foundation.framework/Headers/NSDateFormatter.h"
	.file 12 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGBase.h"
	.file 13 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/CoreGraphics.framework/Headers/CGAffineTransform.h"
	.file 14 "<built-in>"
	.file 15 "/Developer/Platforms/iPhoneSimulator.platform/Developer/SDKs/iPhoneSimulator3.1.2.sdk/System/Library/Frameworks/OpenGLES.framework/Headers/ES1/gl.h"
	.file 16 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/ccTypes.h"
	.file 17 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCTexture2D.h"
	.file 18 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCNode.h"
	.file 19 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCCamera.h"
	.file 20 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCGrid.h"
	.file 21 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCTextureAtlas.h"
	.file 22 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCSprite.h"
	.file 23 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCSpriteSheet.h"
	.file 24 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCLayer.h"
	.file 25 "/Users/chris/Projects/BEUEngine/BEUEngine/libs/cocos2d/CCGrabber.h"
	.file 26 "/Users/chris/Projects/BEUEngine/BEUEngine/Classes/BEUObject.h"
	.file 27 "/Users/chris/Projects/BEUEngine/BEUEngine/Classes/BEUCharacter.h"
	.file 28 "/Users/chris/Projects/BEUEngine/BEUEngine/Classes/BEUEnvironmentTile.h"
	.file 29 "/Users/chris/Projects/BEUEngine/BEUEngine/Classes/BEUEnvironment.h"
	.section __DWARF,__debug_info,regular,debug
	.long	0x1b56
	.word	0x2
	.set L$set$106,Ldebug_abbrev0-Lsection__debug_abbrev
	.long L$set$106
	.byte	0x4
	.byte	0x1
	.ascii "GNU Objective-C 4.2.1 (Apple Inc. build 5646) (dot 1)\0"
	.byte	0x10
	.ascii "/Users/chris/Projects/BEUEngine/BEUEngine/Classes/BEUEnvironment.m\0"
	.byte	0x1
	.long	Ltext0
	.long	Letext0
	.set L$set$107,Ldebug_line0-Lsection__debug_line
	.long L$set$107
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "signed char\0"
	.byte	0x2
	.byte	0x1
	.byte	0x8
	.ascii "unsigned char\0"
	.byte	0x2
	.byte	0x2
	.byte	0x5
	.ascii "short int\0"
	.byte	0x2
	.byte	0x2
	.byte	0x7
	.ascii "short unsigned int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "int\0"
	.byte	0x3
	.ascii "__uint32_t\0"
	.byte	0x3
	.byte	0x2d
	.long	0xef
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "unsigned int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x5
	.ascii "long long int\0"
	.byte	0x2
	.byte	0x8
	.byte	0x7
	.ascii "long long unsigned int\0"
	.byte	0x2
	.byte	0x4
	.byte	0x5
	.ascii "long int\0"
	.byte	0x4
	.byte	0x4
	.byte	0x7
	.byte	0x2
	.byte	0x1
	.byte	0x6
	.ascii "char\0"
	.byte	0x3
	.ascii "__darwin_size_t\0"
	.byte	0x3
	.byte	0x5a
	.long	0x158
	.byte	0x2
	.byte	0x4
	.byte	0x7
	.ascii "long unsigned int\0"
	.byte	0x3
	.ascii "__darwin_wchar_t\0"
	.byte	0x3
	.byte	0x66
	.long	0xd6
	.byte	0x3
	.ascii "__darwin_rune_t\0"
	.byte	0x3
	.byte	0x6b
	.long	0x16d
	.byte	0x5
	.byte	0x4
	.byte	0x6
	.long	0x139
	.long	0x1ae
	.byte	0x7
	.long	0x136
	.byte	0x7
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x139
	.byte	0x9
	.byte	0x10
	.byte	0x4
	.byte	0x51
	.long	0x1ff
	.byte	0xa
	.ascii "__min\0"
	.byte	0x4
	.byte	0x52
	.long	0x185
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__max\0"
	.byte	0x4
	.byte	0x53
	.long	0x185
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "__map\0"
	.byte	0x4
	.byte	0x54
	.long	0x185
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "__types\0"
	.byte	0x4
	.byte	0x55
	.long	0x1ff
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xdd
	.byte	0x3
	.ascii "_RuneEntry\0"
	.byte	0x4
	.byte	0x56
	.long	0x1b4
	.byte	0x9
	.byte	0x8
	.byte	0x4
	.byte	0x58
	.long	0x247
	.byte	0xa
	.ascii "__nranges\0"
	.byte	0x4
	.byte	0x59
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__ranges\0"
	.byte	0x4
	.byte	0x5a
	.long	0x247
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x205
	.byte	0x3
	.ascii "_RuneRange\0"
	.byte	0x4
	.byte	0x5b
	.long	0x217
	.byte	0x9
	.byte	0x14
	.byte	0x4
	.byte	0x5d
	.long	0x28a
	.byte	0xa
	.ascii "__name\0"
	.byte	0x4
	.byte	0x5e
	.long	0x28a
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__mask\0"
	.byte	0x4
	.byte	0x5f
	.long	0xdd
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x6
	.long	0x139
	.long	0x29a
	.byte	0x7
	.long	0x136
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.ascii "_RuneCharClass\0"
	.byte	0x4
	.byte	0x60
	.long	0x25f
	.byte	0xb
	.word	0xc5c
	.byte	0x4
	.byte	0x62
	.long	0x416
	.byte	0xa
	.ascii "__magic\0"
	.byte	0x4
	.byte	0x63
	.long	0x19e
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "__encoding\0"
	.byte	0x4
	.byte	0x64
	.long	0x416
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "__sgetrune\0"
	.byte	0x4
	.byte	0x66
	.long	0x451
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0xa
	.ascii "__sputrune\0"
	.byte	0x4
	.byte	0x67
	.long	0x47c
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0xa
	.ascii "__invalid_rune\0"
	.byte	0x4
	.byte	0x68
	.long	0x185
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0xa
	.ascii "__runetype\0"
	.byte	0x4
	.byte	0x6a
	.long	0x482
	.byte	0x2
	.byte	0x23
	.byte	0x34
	.byte	0xa
	.ascii "__maplower\0"
	.byte	0x4
	.byte	0x6b
	.long	0x492
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x8
	.byte	0xa
	.ascii "__mapupper\0"
	.byte	0x4
	.byte	0x6c
	.long	0x492
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x10
	.byte	0xa
	.ascii "__runetype_ext\0"
	.byte	0x4
	.byte	0x73
	.long	0x24d
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x18
	.byte	0xa
	.ascii "__maplower_ext\0"
	.byte	0x4
	.byte	0x74
	.long	0x24d
	.byte	0x3
	.byte	0x23
	.byte	0xbc,0x18
	.byte	0xa
	.ascii "__mapupper_ext\0"
	.byte	0x4
	.byte	0x75
	.long	0x24d
	.byte	0x3
	.byte	0x23
	.byte	0xc4,0x18
	.byte	0xa
	.ascii "__variable\0"
	.byte	0x4
	.byte	0x77
	.long	0x19c
	.byte	0x3
	.byte	0x23
	.byte	0xcc,0x18
	.byte	0xa
	.ascii "__variable_len\0"
	.byte	0x4
	.byte	0x78
	.long	0xd6
	.byte	0x3
	.byte	0x23
	.byte	0xd0,0x18
	.byte	0xa
	.ascii "__ncharclasses\0"
	.byte	0x4
	.byte	0x7d
	.long	0xd6
	.byte	0x3
	.byte	0x23
	.byte	0xd4,0x18
	.byte	0xa
	.ascii "__charclasses\0"
	.byte	0x4
	.byte	0x7e
	.long	0x4a2
	.byte	0x3
	.byte	0x23
	.byte	0xd8,0x18
	.byte	0x0
	.byte	0x6
	.long	0x139
	.long	0x426
	.byte	0x7
	.long	0x136
	.byte	0x1f
	.byte	0x0
	.byte	0xc
	.byte	0x1
	.long	0x185
	.long	0x440
	.byte	0xd
	.long	0x440
	.byte	0xd
	.long	0x141
	.byte	0xd
	.long	0x44b
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x446
	.byte	0xe
	.long	0x139
	.byte	0x8
	.byte	0x4
	.long	0x440
	.byte	0x8
	.byte	0x4
	.long	0x426
	.byte	0xc
	.byte	0x1
	.long	0xd6
	.long	0x476
	.byte	0xd
	.long	0x185
	.byte	0xd
	.long	0x1ae
	.byte	0xd
	.long	0x141
	.byte	0xd
	.long	0x476
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1ae
	.byte	0x8
	.byte	0x4
	.long	0x457
	.byte	0x6
	.long	0xdd
	.long	0x492
	.byte	0x7
	.long	0x136
	.byte	0xff
	.byte	0x0
	.byte	0x6
	.long	0x185
	.long	0x4a2
	.byte	0x7
	.long	0x136
	.byte	0xff
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x29a
	.byte	0x3
	.ascii "_RuneLocale\0"
	.byte	0x4
	.byte	0x7f
	.long	0x2b0
	.byte	0x2
	.byte	0x4
	.byte	0x4
	.ascii "float\0"
	.byte	0x2
	.byte	0x8
	.byte	0x4
	.ascii "double\0"
	.byte	0xf
	.byte	0x4
	.ascii "Class\0"
	.long	0x4da
	.byte	0x10
	.ascii "objc_class\0"
	.byte	0x1
	.byte	0xf
	.byte	0x4
	.ascii "id\0"
	.long	0x4f0
	.byte	0x11
	.ascii "objc_object\0"
	.byte	0x4
	.byte	0xe
	.byte	0x0
	.long	0x513
	.byte	0xa
	.ascii "isa\0"
	.byte	0x5
	.byte	0x25
	.long	0x4ce
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x519
	.byte	0x10
	.ascii "objc_selector\0"
	.byte	0x1
	.byte	0x3
	.ascii "BOOL\0"
	.byte	0x5
	.byte	0x2b
	.long	0x93
	.byte	0x3
	.ascii "NSUInteger\0"
	.byte	0x6
	.byte	0x89
	.long	0xef
	.byte	0x12
	.ascii "NSObject\0"
	.byte	0x10
	.byte	0x4
	.byte	0x7
	.byte	0x43
	.long	0x569
	.byte	0x13
	.ascii "isa\0"
	.byte	0x7
	.byte	0x42
	.long	0x4ce
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x2
	.byte	0x0
	.byte	0x12
	.ascii "NSValue\0"
	.byte	0x10
	.byte	0x4
	.byte	0x8
	.byte	0xb
	.long	0x584
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x12
	.ascii "NSNumber\0"
	.byte	0x10
	.byte	0x4
	.byte	0x8
	.byte	0x26
	.long	0x5a0
	.byte	0x14
	.long	0x569
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x12
	.ascii "NSArray\0"
	.byte	0x10
	.byte	0x4
	.byte	0x9
	.byte	0x7
	.long	0x5bb
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x12
	.ascii "NSMutableArray\0"
	.byte	0x10
	.byte	0x4
	.byte	0xa
	.byte	0x51
	.long	0x5dd
	.byte	0x14
	.long	0x5a0
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x12
	.ascii "NSMutableDictionary\0"
	.byte	0x10
	.byte	0x4
	.byte	0xb
	.byte	0x8
	.long	0x604
	.byte	0x14
	.long	0x60a
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x5dd
	.byte	0x12
	.ascii "NSDictionary\0"
	.byte	0x10
	.byte	0x4
	.byte	0x8
	.byte	0x7
	.long	0x62a
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x3
	.ascii "CGFloat\0"
	.byte	0xc
	.byte	0x57
	.long	0x4bb
	.byte	0x15
	.set L$set$108,LASF0-Lsection__debug_str
	.long L$set$108
	.byte	0xd
	.byte	0x8
	.long	0x644
	.byte	0x16
	.set L$set$109,LASF0-Lsection__debug_str
	.long L$set$109
	.byte	0x18
	.byte	0xd
	.byte	0x8
	.long	0x69b
	.byte	0xa
	.ascii "a\0"
	.byte	0xd
	.byte	0xe
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "b\0"
	.byte	0xd
	.byte	0xe
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "c\0"
	.byte	0xd
	.byte	0xe
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "d\0"
	.byte	0xd
	.byte	0xe
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "tx\0"
	.byte	0xd
	.byte	0xf
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0xa
	.ascii "ty\0"
	.byte	0xd
	.byte	0xf
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x0
	.byte	0x11
	.ascii "CGPoint\0"
	.byte	0x8
	.byte	0x2
	.byte	0xd
	.long	0x6c4
	.byte	0xa
	.ascii "x\0"
	.byte	0x2
	.byte	0xe
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "y\0"
	.byte	0x2
	.byte	0xf
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "CGPoint\0"
	.byte	0x2
	.byte	0x11
	.long	0x69b
	.byte	0x11
	.ascii "CGSize\0"
	.byte	0x8
	.byte	0x2
	.byte	0x15
	.long	0x704
	.byte	0xa
	.ascii "width\0"
	.byte	0x2
	.byte	0x16
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "height\0"
	.byte	0x2
	.byte	0x17
	.long	0x62a
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "CGSize\0"
	.byte	0x2
	.byte	0x19
	.long	0x6d3
	.byte	0x11
	.ascii "CGRect\0"
	.byte	0x10
	.byte	0x2
	.byte	0x1d
	.long	0x742
	.byte	0xa
	.ascii "origin\0"
	.byte	0x2
	.byte	0x1e
	.long	0x6c4
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "size\0"
	.byte	0x2
	.byte	0x1f
	.long	0x704
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x0
	.byte	0x3
	.ascii "CGRect\0"
	.byte	0x2
	.byte	0x21
	.long	0x712
	.byte	0x8
	.byte	0x4
	.long	0x5bb
	.byte	0x3
	.ascii "GLenum\0"
	.byte	0xf
	.byte	0x2d
	.long	0xef
	.byte	0x3
	.ascii "GLint\0"
	.byte	0xf
	.byte	0x32
	.long	0xd6
	.byte	0x3
	.ascii "GLubyte\0"
	.byte	0xf
	.byte	0x34
	.long	0xa2
	.byte	0x3
	.ascii "GLushort\0"
	.byte	0xf
	.byte	0x35
	.long	0xc0
	.byte	0x3
	.ascii "GLuint\0"
	.byte	0xf
	.byte	0x36
	.long	0xef
	.byte	0x3
	.ascii "GLfloat\0"
	.byte	0xf
	.byte	0x37
	.long	0x4bb
	.byte	0x11
	.ascii "_ccColor3B\0"
	.byte	0x3
	.byte	0x10
	.byte	0x1b
	.long	0x7e5
	.byte	0xa
	.ascii "r\0"
	.byte	0x10
	.byte	0x1c
	.long	0x771
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "g\0"
	.byte	0x10
	.byte	0x1d
	.long	0x771
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.byte	0xa
	.ascii "b\0"
	.byte	0x10
	.byte	0x1e
	.long	0x771
	.byte	0x2
	.byte	0x23
	.byte	0x2
	.byte	0x0
	.byte	0x3
	.ascii "ccColor3B\0"
	.byte	0x10
	.byte	0x1f
	.long	0x7ad
	.byte	0x11
	.ascii "_ccColor4B\0"
	.byte	0x4
	.byte	0x10
	.byte	0x40
	.long	0x83a
	.byte	0xa
	.ascii "r\0"
	.byte	0x10
	.byte	0x41
	.long	0xa2
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "g\0"
	.byte	0x10
	.byte	0x42
	.long	0xa2
	.byte	0x2
	.byte	0x23
	.byte	0x1
	.byte	0xa
	.ascii "b\0"
	.byte	0x10
	.byte	0x43
	.long	0xa2
	.byte	0x2
	.byte	0x23
	.byte	0x2
	.byte	0xa
	.ascii "a\0"
	.byte	0x10
	.byte	0x44
	.long	0xa2
	.byte	0x2
	.byte	0x23
	.byte	0x3
	.byte	0x0
	.byte	0x3
	.ascii "ccColor4B\0"
	.byte	0x10
	.byte	0x45
	.long	0x7f6
	.byte	0x11
	.ascii "_ccVertex3F\0"
	.byte	0xc
	.byte	0x10
	.byte	0x62
	.long	0x884
	.byte	0xa
	.ascii "x\0"
	.byte	0x10
	.byte	0x63
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "y\0"
	.byte	0x10
	.byte	0x64
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "z\0"
	.byte	0x10
	.byte	0x65
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x0
	.byte	0x3
	.ascii "ccVertex3F\0"
	.byte	0x10
	.byte	0x66
	.long	0x84b
	.byte	0x11
	.ascii "_ccTex2F\0"
	.byte	0x8
	.byte	0x10
	.byte	0x6b
	.long	0x8c0
	.byte	0xa
	.ascii "u\0"
	.byte	0x10
	.byte	0x6c
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "v\0"
	.byte	0x10
	.byte	0x6d
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "ccTex2F\0"
	.byte	0x10
	.byte	0x6e
	.long	0x896
	.byte	0x11
	.ascii "_ccGridSize\0"
	.byte	0x8
	.byte	0x10
	.byte	0x8c
	.long	0x8fc
	.byte	0xa
	.ascii "x\0"
	.byte	0x10
	.byte	0x8d
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "y\0"
	.byte	0x10
	.byte	0x8e
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "ccGridSize\0"
	.byte	0x10
	.byte	0x8f
	.long	0x8cf
	.byte	0x11
	.ascii "_ccV3F_C4B_T2F\0"
	.byte	0x18
	.byte	0x10
	.byte	0xa6
	.long	0x95e
	.byte	0xa
	.ascii "vertices\0"
	.byte	0x10
	.byte	0xa8
	.long	0x884
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "colors\0"
	.byte	0x10
	.byte	0xac
	.long	0x83a
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "texCoords\0"
	.byte	0x10
	.byte	0xb0
	.long	0x8c0
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x3
	.ascii "ccV3F_C4B_T2F\0"
	.byte	0x10
	.byte	0xb1
	.long	0x90e
	.byte	0x11
	.ascii "_ccV3F_C4B_T2F_Quad\0"
	.byte	0x60
	.byte	0x10
	.byte	0xb5
	.long	0x9c4
	.byte	0xa
	.ascii "tl\0"
	.byte	0x10
	.byte	0xb7
	.long	0x95e
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "bl\0"
	.byte	0x10
	.byte	0xb9
	.long	0x95e
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0xa
	.ascii "tr\0"
	.byte	0x10
	.byte	0xbb
	.long	0x95e
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0xa
	.ascii "br\0"
	.byte	0x10
	.byte	0xbd
	.long	0x95e
	.byte	0x2
	.byte	0x23
	.byte	0x48
	.byte	0x0
	.byte	0x3
	.ascii "ccV3F_C4B_T2F_Quad\0"
	.byte	0x10
	.byte	0xbe
	.long	0x973
	.byte	0x11
	.ascii "_ccBlendFunc\0"
	.byte	0x8
	.byte	0x10
	.byte	0xcf
	.long	0xa10
	.byte	0xa
	.ascii "src\0"
	.byte	0x10
	.byte	0xd1
	.long	0x756
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "dst\0"
	.byte	0x10
	.byte	0xd3
	.long	0x756
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x3
	.ascii "ccBlendFunc\0"
	.byte	0x10
	.byte	0xd4
	.long	0x9de
	.byte	0x3
	.ascii "ccTime\0"
	.byte	0x10
	.byte	0xd8
	.long	0x4bb
	.byte	0x17
	.byte	0x4
	.byte	0x11
	.byte	0x45
	.long	0xaf7
	.byte	0x18
	.ascii "kTexture2DPixelFormat_Automatic\0"
	.byte	0x0
	.byte	0x18
	.ascii "kTexture2DPixelFormat_RGBA8888\0"
	.byte	0x1
	.byte	0x18
	.ascii "kTexture2DPixelFormat_RGB565\0"
	.byte	0x2
	.byte	0x18
	.ascii "kTexture2DPixelFormat_A8\0"
	.byte	0x3
	.byte	0x18
	.ascii "kTexture2DPixelFormat_RGBA4444\0"
	.byte	0x4
	.byte	0x18
	.ascii "kTexture2DPixelFormat_RGB5A1\0"
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.ascii "Texture2DPixelFormat\0"
	.byte	0x11
	.byte	0x51
	.long	0xa31
	.byte	0x12
	.ascii "CCTexture2D\0"
	.byte	0x10
	.byte	0x28
	.byte	0x11
	.byte	0x68
	.long	0xbd0
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "_name\0"
	.byte	0x11
	.byte	0x60
	.long	0x790
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "_size\0"
	.byte	0x11
	.byte	0x61
	.long	0x704
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "_width\0"
	.byte	0x11
	.byte	0x62
	.long	0x535
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "_height\0"
	.byte	0x11
	.byte	0x63
	.long	0x535
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "_format\0"
	.byte	0x11
	.byte	0x64
	.long	0xaf7
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "_maxS\0"
	.byte	0x11
	.byte	0x65
	.long	0x79e
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "_maxT\0"
	.byte	0x11
	.byte	0x66
	.long	0x79e
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "_hasPremultipliedAlpha\0"
	.byte	0x11
	.byte	0x67
	.long	0x529
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x0
	.byte	0x12
	.ascii "CCNode\0"
	.byte	0x10
	.byte	0x90
	.byte	0x12
	.byte	0x82
	.long	0xdfa
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "rotation_\0"
	.byte	0x12
	.byte	0x58
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "scaleX_\0"
	.byte	0x12
	.byte	0x5b
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "scaleY_\0"
	.byte	0x12
	.byte	0x5b
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "position_\0"
	.byte	0x12
	.byte	0x5e
	.long	0x6c4
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "visible_\0"
	.byte	0x12
	.byte	0x61
	.long	0x529
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "anchorPointInPixels_\0"
	.byte	0x12
	.byte	0x64
	.long	0x6c4
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "anchorPoint_\0"
	.byte	0x12
	.byte	0x66
	.long	0x6c4
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x13
	.ascii "isRelativeAnchorPoint_\0"
	.byte	0x12
	.byte	0x6a
	.long	0x529
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0x2
	.byte	0x13
	.ascii "contentSize_\0"
	.byte	0x12
	.byte	0x6d
	.long	0x704
	.byte	0x2
	.byte	0x23
	.byte	0x30
	.byte	0x2
	.byte	0x13
	.ascii "transform_\0"
	.byte	0x12
	.byte	0x70
	.long	0x639
	.byte	0x2
	.byte	0x23
	.byte	0x38
	.byte	0x2
	.byte	0x13
	.ascii "inverse_\0"
	.byte	0x12
	.byte	0x70
	.long	0x639
	.byte	0x2
	.byte	0x23
	.byte	0x50
	.byte	0x2
	.byte	0x13
	.ascii "vertexZ_\0"
	.byte	0x12
	.byte	0x73
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x68
	.byte	0x2
	.byte	0x13
	.ascii "camera_\0"
	.byte	0x12
	.byte	0x76
	.long	0xebd
	.byte	0x2
	.byte	0x23
	.byte	0x6c
	.byte	0x2
	.byte	0x13
	.ascii "grid_\0"
	.byte	0x12
	.byte	0x79
	.long	0xf53
	.byte	0x2
	.byte	0x23
	.byte	0x70
	.byte	0x2
	.byte	0x13
	.ascii "zOrder_\0"
	.byte	0x12
	.byte	0x7c
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.byte	0x74
	.byte	0x2
	.byte	0x13
	.ascii "children_\0"
	.byte	0x12
	.byte	0x7f
	.long	0x750
	.byte	0x2
	.byte	0x23
	.byte	0x78
	.byte	0x2
	.byte	0x13
	.ascii "parent_\0"
	.byte	0x12
	.byte	0x82
	.long	0xf59
	.byte	0x2
	.byte	0x23
	.byte	0x7c
	.byte	0x2
	.byte	0x13
	.ascii "tag_\0"
	.byte	0x12
	.byte	0x85
	.long	0xd6
	.byte	0x3
	.byte	0x23
	.byte	0x80,0x1
	.byte	0x2
	.byte	0x13
	.ascii "userData\0"
	.byte	0x12
	.byte	0x88
	.long	0x19c
	.byte	0x3
	.byte	0x23
	.byte	0x84,0x1
	.byte	0x2
	.byte	0x13
	.ascii "scheduledSelectors_\0"
	.byte	0x12
	.byte	0x8b
	.long	0x604
	.byte	0x3
	.byte	0x23
	.byte	0x88,0x1
	.byte	0x2
	.byte	0x13
	.ascii "isRunning_\0"
	.byte	0x12
	.byte	0x8e
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0x8c,0x1
	.byte	0x2
	.byte	0x19
	.ascii "isTransformDirty_\0"
	.byte	0x12
	.byte	0x91
	.long	0x529
	.byte	0x1
	.byte	0x1
	.byte	0x7
	.byte	0x3
	.byte	0x23
	.byte	0x8d,0x1
	.byte	0x2
	.byte	0x19
	.ascii "isInverseDirty_\0"
	.byte	0x12
	.byte	0x92
	.long	0x529
	.byte	0x1
	.byte	0x1
	.byte	0x6
	.byte	0x3
	.byte	0x23
	.byte	0x8d,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x12
	.ascii "CCCamera\0"
	.byte	0x10
	.byte	0x2c
	.byte	0x12
	.byte	0x1c
	.long	0xebd
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "eyeX\0"
	.byte	0x13
	.byte	0x25
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "eyeY\0"
	.byte	0x13
	.byte	0x26
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "eyeZ\0"
	.byte	0x13
	.byte	0x27
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "centerX\0"
	.byte	0x13
	.byte	0x29
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x13
	.ascii "centerY\0"
	.byte	0x13
	.byte	0x2a
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "centerZ\0"
	.byte	0x13
	.byte	0x2b
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "upX\0"
	.byte	0x13
	.byte	0x2d
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0x2
	.byte	0x13
	.ascii "upY\0"
	.byte	0x13
	.byte	0x2e
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x13
	.ascii "upZ\0"
	.byte	0x13
	.byte	0x2f
	.long	0x4bb
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0x2
	.byte	0x13
	.ascii "dirty\0"
	.byte	0x13
	.byte	0x31
	.long	0x529
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xdfa
	.byte	0x12
	.ascii "CCGridBase\0"
	.byte	0x10
	.byte	0x24
	.byte	0x12
	.byte	0x1d
	.long	0xf53
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "active_\0"
	.byte	0x14
	.byte	0x1c
	.long	0x529
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "reuseGrid_\0"
	.byte	0x14
	.byte	0x1d
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "gridSize_\0"
	.byte	0x14
	.byte	0x1e
	.long	0x8fc
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x1a
	.set L$set$110,LASF1-Lsection__debug_str
	.long L$set$110
	.byte	0x14
	.byte	0x1f
	.long	0x1005
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "step_\0"
	.byte	0x14
	.byte	0x20
	.long	0x6c4
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x13
	.ascii "grabber_\0"
	.byte	0x14
	.byte	0x21
	.long	0x1393
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xec3
	.byte	0x8
	.byte	0x4
	.long	0xbd0
	.byte	0x12
	.ascii "CCTextureAtlas\0"
	.byte	0x10
	.byte	0x20
	.byte	0x15
	.byte	0x28
	.long	0xff9
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "totalQuads_\0"
	.byte	0x15
	.byte	0x20
	.long	0x535
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "capacity_\0"
	.byte	0x15
	.byte	0x21
	.long	0x535
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x13
	.ascii "quads_\0"
	.byte	0x15
	.byte	0x22
	.long	0xff9
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0x2
	.byte	0x13
	.ascii "indices_\0"
	.byte	0x15
	.byte	0x23
	.long	0xfff
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x2
	.byte	0x1a
	.set L$set$111,LASF1-Lsection__debug_str
	.long L$set$111
	.byte	0x15
	.byte	0x24
	.long	0x1005
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0x2
	.byte	0x13
	.ascii "buffersVBO_\0"
	.byte	0x15
	.byte	0x26
	.long	0x100b
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x9c4
	.byte	0x8
	.byte	0x4
	.long	0x780
	.byte	0x8
	.byte	0x4
	.long	0xb13
	.byte	0x6
	.long	0x790
	.long	0x101b
	.byte	0x7
	.long	0x136
	.byte	0x1
	.byte	0x0
	.byte	0x17
	.byte	0x4
	.byte	0x16
	.byte	0x23
	.long	0x10af
	.byte	0x18
	.ascii "CC_HONOR_PARENT_TRANSFORM_TRANSLATE\0"
	.byte	0x1
	.byte	0x18
	.ascii "CC_HONOR_PARENT_TRANSFORM_ROTATE\0"
	.byte	0x2
	.byte	0x18
	.ascii "CC_HONOR_PARENT_TRANSFORM_SCALE\0"
	.byte	0x4
	.byte	0x18
	.ascii "CC_HONOR_PARENT_TRANSFORM_ALL\0"
	.byte	0x7
	.byte	0x0
	.byte	0x3
	.ascii "ccHonorParentTransform\0"
	.byte	0x16
	.byte	0x2e
	.long	0x101b
	.byte	0x1b
	.ascii "CCSprite\0"
	.byte	0x10
	.word	0x138
	.byte	0x16
	.byte	0x73
	.long	0x1296
	.byte	0x14
	.long	0xbd0
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x1a
	.set L$set$112,LASF2-Lsection__debug_str
	.long L$set$112
	.byte	0x16
	.byte	0x49
	.long	0x1296
	.byte	0x3
	.byte	0x23
	.byte	0x90,0x1
	.byte	0x2
	.byte	0x13
	.ascii "atlasIndex_\0"
	.byte	0x16
	.byte	0x4a
	.long	0x535
	.byte	0x3
	.byte	0x23
	.byte	0x94,0x1
	.byte	0x2
	.byte	0x13
	.ascii "spriteSheet_\0"
	.byte	0x16
	.byte	0x4b
	.long	0x12f6
	.byte	0x3
	.byte	0x23
	.byte	0x98,0x1
	.byte	0x2
	.byte	0x13
	.ascii "honorParentTransform_\0"
	.byte	0x16
	.byte	0x4c
	.long	0x10af
	.byte	0x3
	.byte	0x23
	.byte	0x9c,0x1
	.byte	0x2
	.byte	0x13
	.ascii "dirty_\0"
	.byte	0x16
	.byte	0x4d
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xa0,0x1
	.byte	0x2
	.byte	0x13
	.ascii "recursiveDirty_\0"
	.byte	0x16
	.byte	0x4e
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xa1,0x1
	.byte	0x2
	.byte	0x13
	.ascii "hasChildren_\0"
	.byte	0x16
	.byte	0x4f
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xa2,0x1
	.byte	0x2
	.byte	0x1a
	.set L$set$113,LASF3-Lsection__debug_str
	.long L$set$113
	.byte	0x16
	.byte	0x54
	.long	0xa10
	.byte	0x3
	.byte	0x23
	.byte	0xa4,0x1
	.byte	0x2
	.byte	0x1a
	.set L$set$114,LASF1-Lsection__debug_str
	.long L$set$114
	.byte	0x16
	.byte	0x55
	.long	0x1005
	.byte	0x3
	.byte	0x23
	.byte	0xac,0x1
	.byte	0x2
	.byte	0x13
	.ascii "usesSpriteSheet_\0"
	.byte	0x16
	.byte	0x5c
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xb0,0x1
	.byte	0x2
	.byte	0x13
	.ascii "rect_\0"
	.byte	0x16
	.byte	0x5f
	.long	0x742
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x1
	.byte	0x2
	.byte	0x13
	.ascii "offsetPosition_\0"
	.byte	0x16
	.byte	0x62
	.long	0x6c4
	.byte	0x3
	.byte	0x23
	.byte	0xc4,0x1
	.byte	0x2
	.byte	0x13
	.ascii "quad_\0"
	.byte	0x16
	.byte	0x65
	.long	0x9c4
	.byte	0x3
	.byte	0x23
	.byte	0xcc,0x1
	.byte	0x2
	.byte	0x13
	.ascii "opacity_\0"
	.byte	0x16
	.byte	0x68
	.long	0x771
	.byte	0x3
	.byte	0x23
	.byte	0xac,0x2
	.byte	0x2
	.byte	0x13
	.ascii "color_\0"
	.byte	0x16
	.byte	0x69
	.long	0x7e5
	.byte	0x3
	.byte	0x23
	.byte	0xad,0x2
	.byte	0x2
	.byte	0x13
	.ascii "opacityModifyRGB_\0"
	.byte	0x16
	.byte	0x6a
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xb0,0x2
	.byte	0x2
	.byte	0x13
	.ascii "flipX_\0"
	.byte	0x16
	.byte	0x6d
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xb1,0x2
	.byte	0x2
	.byte	0x13
	.ascii "flipY_\0"
	.byte	0x16
	.byte	0x6e
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0xb2,0x2
	.byte	0x2
	.byte	0x13
	.ascii "animations_\0"
	.byte	0x16
	.byte	0x72
	.long	0x604
	.byte	0x3
	.byte	0x23
	.byte	0xb4,0x2
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0xf5f
	.byte	0x12
	.ascii "CCSpriteSheet\0"
	.byte	0x10
	.byte	0xa0
	.byte	0x16
	.byte	0x13
	.long	0x12f6
	.byte	0x14
	.long	0xbd0
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x1a
	.set L$set$115,LASF2-Lsection__debug_str
	.long L$set$115
	.byte	0x17
	.byte	0x25
	.long	0x1296
	.byte	0x3
	.byte	0x23
	.byte	0x90,0x1
	.byte	0x2
	.byte	0x1a
	.set L$set$116,LASF3-Lsection__debug_str
	.long L$set$116
	.byte	0x17
	.byte	0x26
	.long	0xa10
	.byte	0x3
	.byte	0x23
	.byte	0x94,0x1
	.byte	0x2
	.byte	0x13
	.ascii "descendants_\0"
	.byte	0x17
	.byte	0x29
	.long	0x750
	.byte	0x3
	.byte	0x23
	.byte	0x9c,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x129c
	.byte	0x12
	.ascii "CCLayer\0"
	.byte	0x10
	.byte	0x90
	.byte	0x18
	.byte	0x23
	.long	0x1355
	.byte	0x14
	.long	0xbd0
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "isTouchEnabled\0"
	.byte	0x18
	.byte	0x21
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0x8e,0x1
	.byte	0x2
	.byte	0x13
	.ascii "isAccelerometerEnabled\0"
	.byte	0x18
	.byte	0x22
	.long	0x529
	.byte	0x3
	.byte	0x23
	.byte	0x8f,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x12
	.ascii "CCGrabber\0"
	.byte	0x10
	.byte	0xc
	.byte	0x14
	.byte	0x16
	.long	0x1393
	.byte	0x14
	.long	0x547
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "fbo\0"
	.byte	0x19
	.byte	0x18
	.long	0x790
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x2
	.byte	0x13
	.ascii "oldFBO\0"
	.byte	0x19
	.byte	0x19
	.long	0x764
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1355
	.byte	0x2
	.byte	0x1
	.byte	0x2
	.ascii "_Bool\0"
	.byte	0x1b
	.ascii "BEUObject\0"
	.byte	0x10
	.word	0x150
	.byte	0x1a
	.byte	0x13
	.long	0x1420
	.byte	0x14
	.long	0x10cd
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "x\0"
	.byte	0x1a
	.byte	0xc
	.long	0x62a
	.byte	0x3
	.byte	0x23
	.byte	0xb8,0x2
	.byte	0x2
	.byte	0x13
	.ascii "y\0"
	.byte	0x1a
	.byte	0xd
	.long	0x62a
	.byte	0x3
	.byte	0x23
	.byte	0xbc,0x2
	.byte	0x2
	.byte	0x13
	.ascii "z\0"
	.byte	0x1a
	.byte	0xe
	.long	0x62a
	.byte	0x3
	.byte	0x23
	.byte	0xc0,0x2
	.byte	0x2
	.byte	0x13
	.ascii "moveX\0"
	.byte	0x1a
	.byte	0x10
	.long	0x62a
	.byte	0x3
	.byte	0x23
	.byte	0xc4,0x2
	.byte	0x2
	.byte	0x13
	.ascii "moveY\0"
	.byte	0x1a
	.byte	0x11
	.long	0x62a
	.byte	0x3
	.byte	0x23
	.byte	0xc8,0x2
	.byte	0x2
	.byte	0x13
	.ascii "moveZ\0"
	.byte	0x1a
	.byte	0x12
	.long	0x62a
	.byte	0x3
	.byte	0x23
	.byte	0xcc,0x2
	.byte	0x2
	.byte	0x0
	.byte	0x1b
	.ascii "BEUCharacter\0"
	.byte	0x10
	.word	0x15c
	.byte	0x1b
	.byte	0xe
	.long	0x146c
	.byte	0x14
	.long	0x13a2
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "life\0"
	.byte	0x1b
	.byte	0xc
	.long	0x146c
	.byte	0x3
	.byte	0x23
	.byte	0xd0,0x2
	.byte	0x2
	.byte	0x13
	.ascii "movementSpeed\0"
	.byte	0x1b
	.byte	0xd
	.long	0x4c4
	.byte	0x3
	.byte	0x23
	.byte	0xd4,0x2
	.byte	0x2
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x584
	.byte	0x1b
	.ascii "BEUEnvironmentTile\0"
	.byte	0x10
	.word	0x138
	.byte	0x1c
	.byte	0xe
	.long	0x1499
	.byte	0x14
	.long	0x10cd
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1420
	.byte	0x12
	.ascii "BEUEnvironment\0"
	.byte	0x10
	.byte	0x98
	.byte	0x1d
	.byte	0x13
	.long	0x14e7
	.byte	0x14
	.long	0x12fc
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0x1
	.byte	0x13
	.ascii "tiles\0"
	.byte	0x1d
	.byte	0x11
	.long	0x750
	.byte	0x3
	.byte	0x23
	.byte	0x90,0x1
	.byte	0x2
	.byte	0x13
	.ascii "objects\0"
	.byte	0x1d
	.byte	0x12
	.long	0x750
	.byte	0x3
	.byte	0x23
	.byte	0x94,0x1
	.byte	0x2
	.byte	0x0
	.byte	0x1c
	.set L$set$117,LASF8-Lsection__debug_str
	.long L$set$117
	.byte	0x1
	.byte	0xf
	.byte	0x1
	.long	0x4e7
	.long	LFB191
	.long	LFE191
	.set L$set$118,LLST0-Lsection__debug_loc
	.long L$set$118
	.long	0x1551
	.byte	0x1d
	.set L$set$119,LASF4-Lsection__debug_str
	.long L$set$119
	.byte	0x1
	.byte	0xf
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$120,LASF5-Lsection__debug_str
	.long L$set$120
	.byte	0x1
	.byte	0xf
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x1e
	.long	LBB2
	.long	LBE2
	.byte	0x1f
	.set L$set$121,LASF6-Lsection__debug_str
	.long L$set$121
	.byte	0x1
	.byte	0x10
	.long	0x1557
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1e
	.long	LBB3
	.long	LBE3
	.byte	0x20
	.ascii "tile\0"
	.byte	0x1
	.byte	0x14
	.long	0x17f6
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x149f
	.byte	0x11
	.ascii "_objc_super\0"
	.byte	0x8
	.byte	0xe
	.byte	0x0
	.long	0x1588
	.byte	0x21
	.set L$set$122,LASF4-Lsection__debug_str
	.long L$set$122
	.byte	0xe
	.byte	0x0
	.long	0x4e7
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "cls\0"
	.byte	0xe
	.byte	0x0
	.long	0x166d
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x0
	.byte	0x11
	.ascii "_objc_class\0"
	.byte	0x30
	.byte	0xe
	.byte	0x0
	.long	0x166d
	.byte	0xa
	.ascii "isa\0"
	.byte	0xe
	.byte	0x0
	.long	0x166d
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "super_class\0"
	.byte	0xe
	.byte	0x0
	.long	0x166d
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0xa
	.ascii "name\0"
	.byte	0xe
	.byte	0x0
	.long	0x1ae
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "version\0"
	.byte	0xe
	.byte	0x0
	.long	0x12a
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "info\0"
	.byte	0xe
	.byte	0x0
	.long	0x12a
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0xa
	.ascii "instance_size\0"
	.byte	0xe
	.byte	0x0
	.long	0x12a
	.byte	0x2
	.byte	0x23
	.byte	0x14
	.byte	0xa
	.ascii "ivars\0"
	.byte	0xe
	.byte	0x0
	.long	0x1685
	.byte	0x2
	.byte	0x23
	.byte	0x18
	.byte	0xa
	.ascii "methods\0"
	.byte	0xe
	.byte	0x0
	.long	0x169f
	.byte	0x2
	.byte	0x23
	.byte	0x1c
	.byte	0xa
	.ascii "cache\0"
	.byte	0xe
	.byte	0x0
	.long	0x16b2
	.byte	0x2
	.byte	0x23
	.byte	0x20
	.byte	0x21
	.set L$set$123,LASF7-Lsection__debug_str
	.long L$set$123
	.byte	0xe
	.byte	0x0
	.long	0x1758
	.byte	0x2
	.byte	0x23
	.byte	0x24
	.byte	0xa
	.ascii "ivar_layout\0"
	.byte	0xe
	.byte	0x0
	.long	0x1ae
	.byte	0x2
	.byte	0x23
	.byte	0x28
	.byte	0xa
	.ascii "ext\0"
	.byte	0xe
	.byte	0x0
	.long	0x17f0
	.byte	0x2
	.byte	0x23
	.byte	0x2c
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1588
	.byte	0x10
	.ascii "_objc_ivar_list\0"
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x1673
	.byte	0x10
	.ascii "_objc_method_list\0"
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x168b
	.byte	0x10
	.ascii "objc_cache\0"
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x16a5
	.byte	0x11
	.ascii "_objc_protocol\0"
	.byte	0x14
	.byte	0xe
	.byte	0x0
	.long	0x1737
	.byte	0xa
	.ascii "isa\0"
	.byte	0xe
	.byte	0x0
	.long	0x1752
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "protocol_name\0"
	.byte	0xe
	.byte	0x0
	.long	0x1ae
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x21
	.set L$set$124,LASF7-Lsection__debug_str
	.long L$set$124
	.byte	0xe
	.byte	0x0
	.long	0x1758
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0xa
	.ascii "instance_methods\0"
	.byte	0xe
	.byte	0x0
	.long	0x1783
	.byte	0x2
	.byte	0x23
	.byte	0xc
	.byte	0xa
	.ascii "class_methods\0"
	.byte	0xe
	.byte	0x0
	.long	0x1783
	.byte	0x2
	.byte	0x23
	.byte	0x10
	.byte	0x0
	.byte	0x10
	.ascii "_objc_protocol_extension\0"
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x1737
	.byte	0x8
	.byte	0x4
	.long	0x175e
	.byte	0x8
	.byte	0x4
	.long	0x16b8
	.byte	0x10
	.ascii "_objc__method_prototype_list\0"
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x1764
	.byte	0x11
	.ascii "_objc_class_ext\0"
	.byte	0xc
	.byte	0xe
	.byte	0x0
	.long	0x17f0
	.byte	0xa
	.ascii "size\0"
	.byte	0x1
	.byte	0x4f
	.long	0xd6
	.byte	0x2
	.byte	0x23
	.byte	0x0
	.byte	0xa
	.ascii "weak_ivar_layout\0"
	.byte	0x1
	.byte	0x4f
	.long	0x1ae
	.byte	0x2
	.byte	0x23
	.byte	0x4
	.byte	0x10
	.ascii "_prop_list_t\0"
	.byte	0x1
	.byte	0xa
	.ascii "properties\0"
	.byte	0x1
	.byte	0x4f
	.long	0x1b53
	.byte	0x2
	.byte	0x23
	.byte	0x8
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x1789
	.byte	0x8
	.byte	0x4
	.long	0x1472
	.byte	0x22
	.set L$set$125,LASF10-Lsection__debug_str
	.long L$set$125
	.byte	0x1
	.byte	0x1e
	.byte	0x1
	.long	LFB192
	.long	LFE192
	.set L$set$126,LLST1-Lsection__debug_loc
	.long L$set$126
	.long	0x1840
	.byte	0x1d
	.set L$set$127,LASF4-Lsection__debug_str
	.long L$set$127
	.byte	0x1
	.byte	0x1e
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$128,LASF5-Lsection__debug_str
	.long L$set$128
	.byte	0x1
	.byte	0x1e
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x23
	.ascii "tile\0"
	.byte	0x1
	.byte	0x1e
	.long	0x17f6
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x24
	.set L$set$129,LASF9-Lsection__debug_str
	.long L$set$129
	.byte	0x2
	.word	0x103
	.byte	0x1
	.long	0x6c4
	.long	LFB130
	.long	LFE130
	.set L$set$130,LLST2-Lsection__debug_loc
	.long L$set$130
	.long	0x1885
	.byte	0x25
	.ascii "x\0"
	.byte	0x2
	.word	0x102
	.long	0x62a
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x25
	.ascii "y\0"
	.byte	0x2
	.word	0x102
	.long	0x62a
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x26
	.ascii "p\0"
	.byte	0x2
	.word	0x104
	.long	0x6c4
	.byte	0x2
	.byte	0x91
	.byte	0x68
	.byte	0x0
	.byte	0x22
	.set L$set$131,LASF11-Lsection__debug_str
	.long L$set$131
	.byte	0x1
	.byte	0x29
	.byte	0x1
	.long	LFB193
	.long	LFE193
	.set L$set$132,LLST3-Lsection__debug_loc
	.long L$set$132
	.long	0x18ce
	.byte	0x1d
	.set L$set$133,LASF4-Lsection__debug_str
	.long L$set$133
	.byte	0x1
	.byte	0x29
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$134,LASF5-Lsection__debug_str
	.long L$set$134
	.byte	0x1
	.byte	0x29
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x23
	.ascii "character\0"
	.byte	0x1
	.byte	0x29
	.long	0x1499
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x22
	.set L$set$135,LASF12-Lsection__debug_str
	.long L$set$135
	.byte	0x1
	.byte	0x2f
	.byte	0x1
	.long	LFB194
	.long	LFE194
	.set L$set$136,LLST4-Lsection__debug_loc
	.long L$set$136
	.long	0x191b
	.byte	0x1d
	.set L$set$137,LASF4-Lsection__debug_str
	.long L$set$137
	.byte	0x1
	.byte	0x2f
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$138,LASF5-Lsection__debug_str
	.long L$set$138
	.byte	0x1
	.byte	0x2f
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x1e
	.long	LBB4
	.long	LBE4
	.byte	0x20
	.ascii "obj\0"
	.byte	0x1
	.byte	0x30
	.long	0x191b
	.byte	0x2
	.byte	0x91
	.byte	0x5c
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0x4
	.long	0x13a2
	.byte	0x22
	.set L$set$139,LASF13-Lsection__debug_str
	.long L$set$139
	.byte	0x1
	.byte	0x40
	.byte	0x1
	.long	LFB195
	.long	LFE195
	.set L$set$140,LLST5-Lsection__debug_loc
	.long L$set$140
	.long	0x1966
	.byte	0x1d
	.set L$set$141,LASF4-Lsection__debug_str
	.long L$set$141
	.byte	0x1
	.byte	0x40
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$142,LASF5-Lsection__debug_str
	.long L$set$142
	.byte	0x1
	.byte	0x40
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x23
	.ascii "delta\0"
	.byte	0x1
	.byte	0x40
	.long	0xa23
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x22
	.set L$set$143,LASF14-Lsection__debug_str
	.long L$set$143
	.byte	0x1
	.byte	0x45
	.byte	0x1
	.long	LFB196
	.long	LFE196
	.set L$set$144,LLST6-Lsection__debug_loc
	.long L$set$144
	.long	0x19c2
	.byte	0x1d
	.set L$set$145,LASF4-Lsection__debug_str
	.long L$set$145
	.byte	0x1
	.byte	0x45
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$146,LASF5-Lsection__debug_str
	.long L$set$146
	.byte	0x1
	.byte	0x45
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x1f
	.set L$set$147,LASF6-Lsection__debug_str
	.long L$set$147
	.byte	0x1
	.byte	0x4c
	.long	0x1557
	.byte	0x2
	.byte	0x91
	.byte	0x64
	.byte	0x1e
	.long	LBB5
	.long	LBE5
	.byte	0x20
	.ascii "tile\0"
	.byte	0x1
	.byte	0x46
	.long	0x17f6
	.byte	0x2
	.byte	0x91
	.byte	0x6c
	.byte	0x0
	.byte	0x0
	.byte	0x1c
	.set L$set$148,LASF15-Lsection__debug_str
	.long L$set$148
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	0x750
	.long	LFB197
	.long	LFE197
	.set L$set$149,LLST7-Lsection__debug_loc
	.long L$set$149
	.long	0x19fb
	.byte	0x1d
	.set L$set$150,LASF4-Lsection__debug_str
	.long L$set$150
	.byte	0x1
	.byte	0xd
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$151,LASF5-Lsection__debug_str
	.long L$set$151
	.byte	0x1
	.byte	0xd
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x0
	.byte	0x22
	.set L$set$152,LASF16-Lsection__debug_str
	.long L$set$152
	.byte	0x1
	.byte	0xd
	.byte	0x1
	.long	LFB198
	.long	LFE198
	.set L$set$153,LLST8-Lsection__debug_loc
	.long L$set$153
	.long	0x1a41
	.byte	0x1d
	.set L$set$154,LASF4-Lsection__debug_str
	.long L$set$154
	.byte	0x1
	.byte	0xd
	.long	0x1551
	.byte	0x2
	.byte	0x91
	.byte	0x0
	.byte	0x1d
	.set L$set$155,LASF5-Lsection__debug_str
	.long L$set$155
	.byte	0x1
	.byte	0xd
	.long	0x513
	.byte	0x2
	.byte	0x91
	.byte	0x4
	.byte	0x23
	.ascii "_value\0"
	.byte	0x1
	.byte	0xd
	.long	0x750
	.byte	0x2
	.byte	0x91
	.byte	0x8
	.byte	0x0
	.byte	0x20
	.ascii "ccWHITE\0"
	.byte	0x10
	.byte	0x2a
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccWHITE
	.byte	0xe
	.long	0x7e5
	.byte	0x20
	.ascii "ccYELLOW\0"
	.byte	0x10
	.byte	0x2c
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccYELLOW
	.byte	0x20
	.ascii "ccBLUE\0"
	.byte	0x10
	.byte	0x2e
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccBLUE
	.byte	0x20
	.ascii "ccGREEN\0"
	.byte	0x10
	.byte	0x30
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccGREEN
	.byte	0x20
	.ascii "ccRED\0"
	.byte	0x10
	.byte	0x32
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccRED
	.byte	0x20
	.ascii "ccMAGENTA\0"
	.byte	0x10
	.byte	0x34
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccMAGENTA
	.byte	0x20
	.ascii "ccBLACK\0"
	.byte	0x10
	.byte	0x36
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccBLACK
	.byte	0x20
	.ascii "ccORANGE\0"
	.byte	0x10
	.byte	0x38
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccORANGE
	.byte	0x20
	.ascii "ccGRAY\0"
	.byte	0x10
	.byte	0x3a
	.long	0x1a56
	.byte	0x5
	.byte	0x3
	.long	_ccGRAY
	.byte	0x6
	.long	0xd6
	.long	0x1b0e
	.byte	0x27
	.byte	0x0
	.byte	0x28
	.ascii "__CFConstantStringClassReference\0"
	.long	0x1b03
	.byte	0x1
	.byte	0x1
	.byte	0x1
	.byte	0x29
	.ascii "_DefaultRuneLocale\0"
	.byte	0x4
	.byte	0x84
	.long	0x4a8
	.byte	0x1
	.byte	0x1
	.byte	0x8
	.byte	0x4
	.long	0x17cb
	.byte	0x0
	.section __DWARF,__debug_abbrev,regular,debug
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x25
	.byte	0x8
	.byte	0x13
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0xe5,0x7f
	.byte	0xb
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x10
	.byte	0x6
	.byte	0x0
	.byte	0x0
	.byte	0x2
	.byte	0x24
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x0
	.byte	0x0
	.byte	0x3
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x4
	.byte	0x24
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3e
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x5
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x6
	.byte	0x1
	.byte	0x1
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x7
	.byte	0x21
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x2f
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x8
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x9
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xa
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0xb
	.byte	0x13
	.byte	0x1
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xc
	.byte	0x15
	.byte	0x1
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xd
	.byte	0x5
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xe
	.byte	0x26
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0xf
	.byte	0xf
	.byte	0x0
	.byte	0xb
	.byte	0xb
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x10
	.byte	0x13
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x11
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x12
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xe6,0x7f
	.byte	0xb
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x13
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x14
	.byte	0x1c
	.byte	0x0
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x15
	.byte	0x16
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x16
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x17
	.byte	0x4
	.byte	0x1
	.byte	0xb
	.byte	0xb
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x18
	.byte	0x28
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x1c
	.byte	0xd
	.byte	0x0
	.byte	0x0
	.byte	0x19
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0xb
	.byte	0xb
	.byte	0xd
	.byte	0xb
	.byte	0xc
	.byte	0xb
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x1a
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x32
	.byte	0xb
	.byte	0x0
	.byte	0x0
	.byte	0x1b
	.byte	0x13
	.byte	0x1
	.byte	0x3
	.byte	0x8
	.byte	0xe6,0x7f
	.byte	0xb
	.byte	0xb
	.byte	0x5
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1c
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x1d
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x1e
	.byte	0xb
	.byte	0x1
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x0
	.byte	0x0
	.byte	0x1f
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x20
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x21
	.byte	0xd
	.byte	0x0
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x38
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x22
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x27
	.byte	0xc
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x23
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x24
	.byte	0x2e
	.byte	0x1
	.byte	0x3
	.byte	0xe
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x27
	.byte	0xc
	.byte	0x49
	.byte	0x13
	.byte	0x11
	.byte	0x1
	.byte	0x12
	.byte	0x1
	.byte	0x40
	.byte	0x6
	.byte	0x1
	.byte	0x13
	.byte	0x0
	.byte	0x0
	.byte	0x25
	.byte	0x5
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x26
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0x5
	.byte	0x49
	.byte	0x13
	.byte	0x2
	.byte	0xa
	.byte	0x0
	.byte	0x0
	.byte	0x27
	.byte	0x21
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.byte	0x28
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x34
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x29
	.byte	0x34
	.byte	0x0
	.byte	0x3
	.byte	0x8
	.byte	0x3a
	.byte	0xb
	.byte	0x3b
	.byte	0xb
	.byte	0x49
	.byte	0x13
	.byte	0x3f
	.byte	0xc
	.byte	0x3c
	.byte	0xc
	.byte	0x0
	.byte	0x0
	.byte	0x0
	.section __DWARF,__debug_pubtypes,regular,debug
	.long	0x445
	.word	0x2
	.set L$set$156,Ldebug_info0-Lsection__debug_info
	.long L$set$156
	.long	0x1b5a
	.long	0xdd
	.ascii "__uint32_t\0"
	.long	0x141
	.ascii "__darwin_size_t\0"
	.long	0x16d
	.ascii "__darwin_wchar_t\0"
	.long	0x185
	.ascii "__darwin_rune_t\0"
	.long	0x205
	.ascii "_RuneEntry\0"
	.long	0x24d
	.ascii "_RuneRange\0"
	.long	0x29a
	.ascii "_RuneCharClass\0"
	.long	0x4a8
	.ascii "_RuneLocale\0"
	.long	0x4ce
	.ascii "Class\0"
	.long	0x4f0
	.ascii "objc_object\0"
	.long	0x4e7
	.ascii "id\0"
	.long	0x529
	.ascii "BOOL\0"
	.long	0x535
	.ascii "NSUInteger\0"
	.long	0x547
	.ascii "NSObject\0"
	.long	0x569
	.ascii "NSValue\0"
	.long	0x584
	.ascii "NSNumber\0"
	.long	0x5a0
	.ascii "NSArray\0"
	.long	0x5bb
	.ascii "NSMutableArray\0"
	.long	0x60a
	.ascii "NSDictionary\0"
	.long	0x5dd
	.ascii "NSMutableDictionary\0"
	.long	0x62a
	.ascii "CGFloat\0"
	.long	0x69b
	.ascii "CGPoint\0"
	.long	0x6c4
	.ascii "CGPoint\0"
	.long	0x6d3
	.ascii "CGSize\0"
	.long	0x704
	.ascii "CGSize\0"
	.long	0x712
	.ascii "CGRect\0"
	.long	0x742
	.ascii "CGRect\0"
	.long	0x644
	.ascii "CGAffineTransform\0"
	.long	0x756
	.ascii "GLenum\0"
	.long	0x764
	.ascii "GLint\0"
	.long	0x771
	.ascii "GLubyte\0"
	.long	0x780
	.ascii "GLushort\0"
	.long	0x790
	.ascii "GLuint\0"
	.long	0x79e
	.ascii "GLfloat\0"
	.long	0x7ad
	.ascii "_ccColor3B\0"
	.long	0x7e5
	.ascii "ccColor3B\0"
	.long	0x7f6
	.ascii "_ccColor4B\0"
	.long	0x83a
	.ascii "ccColor4B\0"
	.long	0x84b
	.ascii "_ccVertex3F\0"
	.long	0x884
	.ascii "ccVertex3F\0"
	.long	0x896
	.ascii "_ccTex2F\0"
	.long	0x8c0
	.ascii "ccTex2F\0"
	.long	0x8cf
	.ascii "_ccGridSize\0"
	.long	0x8fc
	.ascii "ccGridSize\0"
	.long	0x90e
	.ascii "_ccV3F_C4B_T2F\0"
	.long	0x95e
	.ascii "ccV3F_C4B_T2F\0"
	.long	0x973
	.ascii "_ccV3F_C4B_T2F_Quad\0"
	.long	0x9c4
	.ascii "ccV3F_C4B_T2F_Quad\0"
	.long	0x9de
	.ascii "_ccBlendFunc\0"
	.long	0xa10
	.ascii "ccBlendFunc\0"
	.long	0xa23
	.ascii "ccTime\0"
	.long	0xaf7
	.ascii "Texture2DPixelFormat\0"
	.long	0xb13
	.ascii "CCTexture2D\0"
	.long	0xbd0
	.ascii "CCNode\0"
	.long	0xdfa
	.ascii "CCCamera\0"
	.long	0xf5f
	.ascii "CCTextureAtlas\0"
	.long	0x10af
	.ascii "ccHonorParentTransform\0"
	.long	0x10cd
	.ascii "CCSprite\0"
	.long	0x12fc
	.ascii "CCLayer\0"
	.long	0x129c
	.ascii "CCSpriteSheet\0"
	.long	0xec3
	.ascii "CCGridBase\0"
	.long	0x1355
	.ascii "CCGrabber\0"
	.long	0x13a2
	.ascii "BEUObject\0"
	.long	0x1420
	.ascii "BEUCharacter\0"
	.long	0x1472
	.ascii "BEUEnvironmentTile\0"
	.long	0x149f
	.ascii "BEUEnvironment\0"
	.long	0x16b8
	.ascii "_objc_protocol\0"
	.long	0x1588
	.ascii "_objc_class\0"
	.long	0x1557
	.ascii "_objc_super\0"
	.long	0x1789
	.ascii "_objc_class_ext\0"
	.long	0x0
	.section __DWARF,__debug_aranges,regular,debug
	.long	0x1c
	.word	0x2
	.set L$set$157,Ldebug_info0-Lsection__debug_info
	.long L$set$157
	.byte	0x4
	.byte	0x0
	.word	0x0
	.word	0x0
	.long	Ltext0
	.set L$set$158,Letext0-Ltext0
	.long L$set$158
	.long	0x0
	.long	0x0
	.section __DWARF,__debug_str,regular,debug
LASF12:
	.ascii "-[BEUEnvironment moveObjects]\0"
LASF15:
	.ascii "-[BEUEnvironment tiles]\0"
LASF14:
	.ascii "-[BEUEnvironment dealloc]\0"
LASF11:
	.ascii "-[BEUEnvironment addCharacter:]\0"
LASF5:
	.ascii "_cmd\0"
LASF3:
	.ascii "blendFunc_\0"
LASF6:
	.ascii "objc_super\0"
LASF0:
	.ascii "CGAffineTransform\0"
LASF13:
	.ascii "-[BEUEnvironment step:]\0"
LASF16:
	.ascii "-[BEUEnvironment setTiles:]\0"
LASF1:
	.ascii "texture_\0"
LASF2:
	.ascii "textureAtlas_\0"
LASF9:
	.ascii "CGPointMake\0"
LASF8:
	.ascii "-[BEUEnvironment init]\0"
LASF4:
	.ascii "self\0"
LASF10:
	.ascii "-[BEUEnvironment addTile:]\0"
LASF7:
	.ascii "protocol_list\0"
	.subsections_via_symbols
