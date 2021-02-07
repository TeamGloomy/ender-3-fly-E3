;Calibrate BL Touch trigger height
; When we get variables we can define one here
; Uncomment when ready to use
; var RunningTotal=0
; var average=0
  
; If the printer hasn't been homed, home it
if !move.axes[0].homed || !move.axes[1].homed || !move.axes[2].homed
  G28
  
M564 S0 H0 ; Allow movement beyond limits

G1 X{(move.axes[0].max/2)} Y{(move.axes[1].max/2)} F10000
 
if move.axes[2].machinePosition < 6 ; make sure we have probe clearance
	G1 Z6
M280 P0 S160 I1 ; reset BL Touch
G4 S0.5
M98 P"0:/sys/retractprobe.g" ; Ensure probe is retracted & reset
G4 S0.5
M290 R0 S0 ; clear any baby stepping
M561 ; clear any bed transform
; Jog head to position
M291 P"Jog nozzle to touch bed" R"Set nozzle to zero" S3 Z1
G92 Z0
M291 P"Press OK to begin" R"Ready?" S3; 
G1 X{(move.axes[0].max/2)+abs(sensors.probes[0].offsets[0])} Y{(move.axes[1].max/2)+abs(sensors.probes[0].offsets[1])} F10000
; carry out 10 probes
while iterations <= 9
	G1 Z6
	M400
	if sensors.probes[0].value[0]=1000 ; if probe is in error state
		echo "Probe in error state- resetting"
		M280 P0 S160 I1 ; reset BL Touch
		G4 S0.5
		M98 P"0:/sys/retractprobe.g" ; Ensure probe is retracted & reset
		G4 S0.5
	G30 S-1
	M400
	; Uncomment when variables allowed
	; RunningTotal=RunningTotal + move.axes[2].machinePosition
	;average=RunningTotal/(iterations+1)
	G4 S0.5
 
; Until variables come use this
M291 P"Check console for results and enter average value in G31 Z parameter of config.g"  R"Finished" S3 
 
;When variables come uncomment this
;G31 Z{average}
;M291 P"Trigger height set to : " ^ sensors.probes[0].triggerHeight ^ " Press OK to save to config, cancel to use until restart" R"Finished" S2 
;M500
 
 
M564 S0 H1 ; Reset limits	                                                            ; Home Z
