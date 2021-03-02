; Configuration file for Fly-E3 (firmware version 3)
; executed by the firmware on start-up
;
; generated by RepRapFirmware Configuration Tool v3.1.10+4-LPC on Mon Jan 04 2021 14:51:09 GMT+0800 (中国标准时间)

; General preferences
G90                                            	; send absolute coordinates...
M83                                            	; ...but relative extruder moves
M550 P"Ender 3"                             	; set printer name

; Network
M552 S1                                        	; enable network
M586 P0 S1                                     	; enable HTTP
M586 P1 S0                                     	; disable FTP
M586 P2 S0                                     	; disable Telnet

; Drives
M569 P0 S0 D3 V40                         		; physical drive 0 goes forwards using default driver timings
M569 P1 S0 D3 V40                         		; physical drive 1 goes forwards using default driver timings
M569 P2 S1 D3 V40                          		; physical drive 2 goes forwards using default driver timings
M569 P3 S0                                		; physical drive 3 goes forwards using default driver timings
M584 X0 Y1 Z2 E3                          		; set drive mapping
M350 X16 Y16 Z16 E16 I1                   		; configure microstepping with interpolation
M92 X80.00 Y80.00 Z400.00 E93.00          		; set steps per mm
M566 X1200.00 Y1200.00 Z60.00 E300.00     		; set maximum instantaneous speed changes (mm/min)
M203 X9000.00 Y9000.00 Z1800.00 E6000.00   		; set maximum speeds (mm/min)
M201 X500.00 Y500.00 Z100.00 E5000.00     		; set accelerations (mm/s^2)
M906 X1200 Y1200 Z1200 E1200 I30           		; set motor currents (mA) and motor idle factor in per cent
M84 S30                                        	; Set idle timeout

; Axis Limits
M208 X0 Y0 Z0 S1                          		; set axis minima
M208 X235 Y235 Z250 S0                    		; set axis maxima

; Endstops
M574 X1 S1 P"xstop"                   			; configure active-high endstop for low end on X via pin xstop
M574 Y1 S1 P"ystop"                     		; configure active-high endstop for low end on Y via pin ystop
M574 Z1 S1 P"zstop"                      		; configure active-high endstop for low end on Z via pin zstop

; Z-Probe
M558 P0 H6 F120 T8000 							; disable Z probe but set dive height, probe speed and travel speed
G31 X0 Y0 Z0									; no probe offsets

; Heaters
M308 S0 P"bedtemp" Y"thermistor" T100000 B4092 	; configure sensor 0 as thermistor on pin bedtemp
M950 H0 C"bed" T0                              	; create bed heater output on bed and map it to sensor 0
M307 H0 B0 S1.00                               	; disable bang-bang mode for the bed heater and set PWM limit
M140 H0                                        	; map heated bed to heater 0
M143 H0 S120                                   	; set temperature limit for heater 0 to 120C
M308 S1 P"e0temp" Y"thermistor" T100000 B4092  	; configure sensor 1 as thermistor on pin e0temp
M950 H1 C"e0heat" T1                           	; create nozzle heater output on e0heat and map it to sensor 1
M307 H1 B0 S1.00                               	; disable bang-bang mode for heater  and set PWM limit
M143 H1 S245                                   	; set temperature limit for heater 1 to 280C

; Fans
M950 F0 C"fan0" Q500                           	; create fan 0 on pin fan0 and set its frequency
M106 P0 S0 H-1                                 	; set fan 0 value. Thermostatic control is turned off
M950 F1 C"fan1" Q500                         	; create fan 1 on pin out4 and set its frequency
M106 P1 S1 H1 T45                            	; set fan 1 value. Thermostatic control is turned on

; Tools
M563 P0 D0 H1 F0                               	; define tool 0
G10 P0 X0 Y0 Z0                                	; set tool 0 axis offsets
G10 P0 R0 S0                                   	; set initial tool 0 active and standby temperatures to 0C

; Custom settings are not defined

M575 P1 S0 B57600								; Fly Screen setting
M207 S5 F2400 Z0.5								; Firmware retraction, 5mm with 0.5 z-hop
M918 P1 E4 F1000000								; Setup the 12864 screen
M572 D0 S1.3									; Add pressure advance for stock bowden
M501											; Load anything from config-override.g