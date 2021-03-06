; homeall.g
; called to home all axes
;
; generated by RepRapFirmware Configuration Tool v3.1.10+4-LPC on Wed Jan 06 2021 14:08:16 GMT+0000 (Greenwich Mean Time)
G91                     ; relative positioning
G1 H2 Z5 F6000          ; lift Z relative to current position
G1 H1 X-240 Y-240 F1800 ; move quickly to X and Y axis endstops and stop there (first pass)
G1 H2 X5 Y5 F6000       ; go back a few mm
G1 H1 X-240 Y-240 F360  ; move slowly to X and Y axis endstops once more (second pass)
G1 H1 Z-265 F600		; move quickly to Z axis endstop (first pass)
G1 H2 Z5 F600			; go back a few mm
G1 H1 Z-265 F240		; move slowly to Z axis endstop once more (second pass)
G1 H2 Z5				; go back a few mm
G90						; absolute positioning