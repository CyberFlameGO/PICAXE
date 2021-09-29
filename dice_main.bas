#include "./PICAXE_BASIC_libs/rand_logic.basinc"

#picaxe 20m2

Symbol gbin1 = B.7
Symbol rbin2 = B.6
symbol ybin4 = B.5
Symbol interval = w0

let interval = 10000
enablebod
fvrsetup FVR4096
setfreq m32

#region "Main routine"
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
#endregion

#region "Checker subroutine"
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
#endregion
		