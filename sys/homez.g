; ################# Home Z Preparation ################

G1 X0 Y0 F6000				; move X and Y to 0
G91							; relative positioning
G1 H1 Z-265 F600			; move quickly to Z axis endstop (first pass)
G1 H2 Z5 F600				; go back a few mm
G1 H1 Z-265 F240			; move slowly to Z axis endstop once more (second pass)
G1 H2 Z5					; go back a few mm
G90							; absolute positioning