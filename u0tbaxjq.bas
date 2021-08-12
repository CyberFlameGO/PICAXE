Symbol green = B.7
Symbol red = B.6
symbol yellow = B.5
Symbol interval = w0
let interval = 770
enablebod

main:
	;debug
	;readinternaltemp IT_RAW_L,0,w1
	high green
	low red
	low yellow
	pause interval
	low green
	high red
	low yellow
	pause interval
	low green
	low red
	high yellow
	pause interval
	let interval = interval - 5
	goto main

