M671 x29:198:29:198 y35:35:204:204 P0.5                             ; The location of the four bed securing screws

G28 Z                                                               ; Home Z

M558 F240

G30 P0 X29 Y35 Z-99999 ; probe near an adjusting screw              ; Front left screw
G30 P1 X198 Y35 Z-99999 ; probe near an adjusting screw             ; Front right screw
G30 P2 X29 Y204 Z-99999 ; probe near an adjusting screw             ; Rear left screw
G30 P3 X198 Y204 Z-99999 S4 ; probe near an adjusting screw         ; Rear right screw

G28 Z                                                               ; Home Z