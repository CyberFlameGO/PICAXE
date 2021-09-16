Symbol gbin1 = B.7
Symbol rbin2 = B.6
symbol ybin4 = B.5
Symbol interval = w0
Symbol rng = w1
Symbol diceout = b4
let interval = 5000
enablebod
setfreq m32
main:
	do
		debug
		;readinternaltemp IT_RAW_L,0,w1
		;tune C.0, 0,($00)
		random rng
		let diceout = rng // 7 + 1
		if diceout = 1 then 
			high gbin1
		endif
		if diceout = 2 then
			high rbin2
		endif
		if diceout = 3 then
			high rbin2
			high gbin1
		endif
		if diceout = 4 then
			high ybin4
		endif
		if diceout = 5 then
			high ybin4
			high gbin1
		endif
		if diceout = 6 then
			high ybin4
			high rbin2
		endif
		if diceout = 7 then
			high ybin4
			high rbin2
			high gbin1
		endif
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
