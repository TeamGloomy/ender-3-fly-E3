; ################# Home Z Preparation ################

G91 															; Relative mode
G1 H2 Z5 F5000													; Lower the bed
G90																; Back to absolute positioning
G1 X{(move.axes[0].max/2)+abs(sensors.probes[0].offsets[0])} Y{(move.axes[1].max/2)+abs(sensors.probes[0].offsets[1])} F10000

; ################# Home Z Preparation ################

M558 F250 				 										; Set the probing speed
G30					 											; Probe a single point