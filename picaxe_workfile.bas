Symbol green = B.7
Symbol interval=w0
let interval= 2000
main:
	'readinternaltemp IT_5V0,0,b1
	'debug
	high green
	low B.6
	low B.5
	pause interval
	low green
	high B.6
	low B.5
	pause interval
	low green
	low B.6
	high B.5
	pause interval
	let interval = interval -5
	debug
	goto main
