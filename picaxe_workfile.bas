Symbol gbin1 = B.7
Symbol rbin2 = B.6
symbol ybin4 = B.5
Symbol interval = w0
Symbol rng = w1
Symbol diceout = b4
let interval = 10000
enablebod
setfreq m32
main:
	do
		debug
		;readinternaltemp IT_RAW_L,0,w1
		random rng
		let diceout = rng // 7 + 1
		gosub diceout_checker
		tune C.0, 0,($00)
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
	select case b4
		case 1
			high gbin1
		case 2
			high rbin2
		case 3
			high rbin2
			high gbin1
		case 4
			high ybin4
		case 5
			high ybin4
			high gbin1
		case 6
			high ybin4
			high rbin2
		case 7
			high ybin4
			high rbin2
			high gbin1
		endselect
	return
		