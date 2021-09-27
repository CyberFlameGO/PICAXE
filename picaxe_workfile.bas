#picaxe 20m2
Symbol gbin1 = B.7
Symbol rbin2 = B.6
symbol ybin4 = B.5
Symbol interval = w0
;Symbol rand = w1
;Symbol diceout = b4
let interval = 10000
enablebod
setfreq m32

;We use the macro directive in place of a function
#macro dice_gen( rand_w_var, mod_val, dice_var ) 
	Symbol rand_var = rand_w_var
	random rand_var
	Symbol dice_out = dice_var
	let dice_out = rand_w_var // mod_val
#endmacro

main:
	do
		debug
		dice_gen(w1, 7, b4)
		gosub diceout_checker
		;tune C.0, 0,($00)
		pause interval
		low gbin1
		low rbin2
		low ybin4
	loop while interval > 0
	low gbin1
	low rbin2
	low ybin4
	let interval = 250
	goto main

diceout_checker:
	select case dice_out
		case 0
			high gbin1
		case 1
			high rbin2
		case 2
			high rbin2
			high gbin1
		case 3
			high ybin4
		case 4
			high ybin4
			high gbin1
		case 5
			high ybin4
			high rbin2
		case 6
			high ybin4
			high rbin2
			high gbin1
		endselect
	return
		