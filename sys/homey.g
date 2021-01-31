; ################# Home Z Preparation ################

G91 															; Relative mode
G1 H2 Z5 F5000													; Lower the bed
G90																; Back to absolute positioning
G1 X157.5 Y129.5 F10000 		 										; Move to the center of the bed. Adjust to the co-ordinates required for the centre of your bed

; ################# Home Z Preparation ################

M558 F250 				 										; Set the probing speed
G30					 											; Probe a single point
M558 F30 				 										; Set a slower probing speed
G30					 											; Probe a single point