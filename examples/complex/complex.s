
#include "textflag.h"

// func Real(x complex128) float64
TEXT ·Real(SB),0,$0-24
	MOVSD	x_real(FP), X0
	MOVSD	X0, ret+16(FP)
	RET

// func Imag(x complex128) float64
TEXT ·Imag(SB),0,$0-24
	MOVSD	x_imag+8(FP), X0
	MOVSD	X0, ret+16(FP)
	RET

// func Norm(x complex128) float64
TEXT ·Norm(SB),0,$0-24
	MOVSD	x_real(FP), X0
	MOVSD	x_imag+8(FP), X1
	MULSD	X0, X0
	MULSD	X1, X1
	ADDSD	X1, X0
	SQRTSD	X0, X2
	MOVSD	X2, ret+16(FP)
	RET
