#include "./PICAXE_BASIC_libs/rand_logic.basinc"
; https://github.com/CyberFlameGO/PICAXE_BASIC_libs

' This program was designed to be compiled and run on a PICAXE-20M2 chip
#picaxe 20m2

; Bind symbols to pins, in this case LEDs 
`(there was one for a button but I can't 
`get that all working in time for submission).
` 'g' means green, 'r' means red, 'y' means yellow, and 'bin' is short for
`binary. The number at the end is for how much it's "worth", to a max of 7.
Symbol gbin1 = B.7
Symbol rbin2 = B.6
Symbol ybin4 = B.5
' Assign human-readable symbols to variables
Symbol interval = w0
Symbol dice_in = b4

' Sets the interval at which the program is repeated (minimum value is 16)
let interval = 32767
; https://picaxe.com/basic-commands/advanced-picaxe-configuration/enablebod/
enablebod
; https://picaxe.com/basic-commands/advanced-picaxe-configuration/fvrsetup/
fvrsetup FVR4096
; https://picaxe.com/basic-commands/advanced-picaxe-configuration/setfreq/
`Higher frequency
setfreq m32

' A region just makes code cleaner to read on the PICAXE editor
#region "Main routine"
' The "entry-point" (I think that's the terminology in BASIC) of the program
main:
	; Looper since I don't have a button 
	`(and can't solder + set it up in time for submission)
	do
		; This macro comes from the BASIC include at the top of the file:
		; w1 is the variable containing the raw random number
		; The '7' means numbers between and including 0 and 6 will be generated 
		`which is the same as 1 to 7 (7 numbers)
		; 'dice_in' is a symbol for b4, which is the variable where 
		`the processed number goes.
		dice_gen(w1, 7, dice_in)
		debug
		; Go to the 'checker' subroutine, which is the logic for which LEDs 
		`get lit.
		gosub diceout_checker
		' Plays a sound on the speaker signifying completion
		tune C.0, 0,($00)
		' Pauses for specified interval at the top of the program
		pause interval
		' Turns off all LEDs
		low gbin1
		low rbin2
		low ybin4
		; This loops the program as long as the interval specified at the top 
		`is higher than '15'
	loop while interval > 15
	''' This will only get run if the interval is less than or equal to 15 '''
	' Turns off all LEDs
	low gbin1
	low rbin2
	low ybin4
	' Sets the interval to a sensible value
	let interval = 32767
	' Goes to the start of the program with the new interval.
	goto main
#endregion

#region "Checker subroutine"
' The subroutine for LED lighting logic
diceout_checker:
	; This is better than using 'if' statements. 
	; Gets a value from 'dice_in' and compares it to 
	`cases 0 to 6, lighting LEDs accordingly.
	` Green has a value of 1, red has a value of 2, and yellow has a value of 4.
	`If it matches none of these numbers (which it shouldn't), 
	`it plays an error sound. 
	` After all of this, 'endselect' marks the end of the conditional execution 
	`(the checker), and returns from the subroutine to the main program.
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
			tune C.0, 0,($00,$00,$00,$a0)
		endselect
	return
#endregion
