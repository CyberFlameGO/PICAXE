Symbol green = B.7
Symbol red = B.6
symbol yellow = B.5
Symbol interval = w0
let interval = 25
enablebod

main:
	do
		high green
		high red
		high yellow
		pause interval
		low green
		low red
		low yellow
		pause interval
		;debug
		;readinternaltemp IT_RAW_L,0,w1
		;high green
		;low red
		;low yellow
		;pause interval
		;low green
		;high red
		;low yellow
		;pause interval
		;low green
		;low red
		;high yellow
		;pause interval
		;if interval > 150 then
		;let interval = interval - 5
		;else let interval = interval - 2
		;end if
	loop while interval > 0
	low green
	low red
	low yellow
	let interval = 250
	goto main
