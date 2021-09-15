Symbol gbin1 = B.7
Symbol rbin2 = B.6
symbol ybin4 = B.5
Symbol interval = w0
Symbol rng = w1
Symbol diceout = b4
let interval = 500
enablebod
;setfreq m32
main:
	do
		debug
		;readinternaltemp IT_RAW_L,0,w1
		;tune C.0, 0,($00)
		random rng
		let diceout = rng // 6 + 1
		high gbin1
		low rbin2
		low ybin4
		pause interval
		low gbin1
		high rbin2
		low ybin4
		pause interval
		low gbin1
		low rbin2
		high ybin4
		pause interval
		if interval > 150 then
			let interval = interval - 5
		;endif
		;if 150 > interval > 75 then
		;	let interval = interval - 2
		else
			let interval = interval - 2
		endif
	loop while interval > 0
	low gbin1
	low rbin2
	low ybin4
	let interval = 250
	goto main
