#include "./PICAXE_BASIC_libs/rand_logic.basinc"
; https://github.com/CyberFlameGO/PICAXE_BASIC_libs

`This program was designed to be compiled and run on a PICAXE-20M2 chip
#picaxe 20m2

`Bind symbols to pins
Symbol gbin1 = B.7
Symbol rbin2 = B.6
Symbol ybin4 = B.5
`Assign human-readable symbols to variables
Symbol interval = w0
Symbol dice_in = b4

; Sets the interval at which a random number is generated and processed (parsed)
let interval = 10000
; https://picaxe.com/basic-commands/advanced-picaxe-configuration/enablebod/
enablebod
; https://picaxe.com/basic-commands/advanced-picaxe-configuration/fvrsetup/
fvrsetup FVR4096
; https://picaxe.com/basic-commands/advanced-picaxe-configuration/setfreq/
`Higher frequency
setfreq m32

`A region just makes code cleaner to read on the PICAXE editor
#region "Main routine"
' The "entry-point" (I think that's the terminology in BASIC) of the program
main:
	` Looper since I don't have a button
	`(and can't solder + set it up in time for submission)
	do
		; This macro comes from the BASIC include at the top of the file
		; w1 is the variable containing the raw random number
		; 7 is the 
		dice_gen(w1, 7, dice_in)
		debug
		gosub diceout_checker
		;tune C.0, 0,($00)
		pause interval
		low gbin1
		low rbin2
		low ybin4
	loop while interval > 15
	low gbin1
	low rbin2
	low ybin4
	let interval = 250
	goto main
#endregion

#region "Checker subroutine"
diceout_checker:
	select case dice_in
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
		else
			tune c.0, 0,($00,$00,$00,$a0)
		endselect
	return
#endregion