EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 15 16
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x02_Counter_Clockwise J?
U 1 1 5E1F8C6A
P 5150 3400
AR Path="/5E1F8C6A" Ref="J?"  Part="1" 
AR Path="/5E1B8DB7/5E1F8C6A" Ref="J?"  Part="1" 
AR Path="/5E1BB69E/5E1F8C6A" Ref="J?"  Part="1" 
AR Path="/5E1BBF11/5E1F8C6A" Ref="J?"  Part="1" 
AR Path="/5E1BC768/5E1F8C6A" Ref="J?"  Part="1" 
AR Path="/5E1F6C0D/5E1F8C6A" Ref="J2"  Part="1" 
AR Path="/5E1FB088/5E1F8C6A" Ref="J6"  Part="1" 
F 0 "J2" H 5200 3617 50  0000 C CNN
F 1 "PWR_I2C" H 5200 3526 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Horizontal" H 5150 3400 50  0001 C CNN
F 3 "~" H 5150 3400 50  0001 C CNN
	1    5150 3400
	1    0    0    -1  
$EndComp
Text GLabel 5550 3400 2    50   Input ~ 0
SCL
Text GLabel 5550 3500 2    50   Input ~ 0
SDA
Wire Wire Line
	4450 3400 4950 3400
$Comp
L power:+12V #PWR?
U 1 1 5E1F8C76
P 5750 3750
AR Path="/5E1F8C76" Ref="#PWR?"  Part="1" 
AR Path="/5E1B8DB7/5E1F8C76" Ref="#PWR?"  Part="1" 
AR Path="/5E1BB69E/5E1F8C76" Ref="#PWR?"  Part="1" 
AR Path="/5E1BBF11/5E1F8C76" Ref="#PWR?"  Part="1" 
AR Path="/5E1BC768/5E1F8C76" Ref="#PWR?"  Part="1" 
AR Path="/5E1F6C0D/5E1F8C76" Ref="#PWR0139"  Part="1" 
AR Path="/5E1FB088/5E1F8C76" Ref="#PWR0142"  Part="1" 
F 0 "#PWR0142" H 5750 3600 50  0001 C CNN
F 1 "+12V" H 5765 3923 50  0000 C CNN
F 2 "" H 5750 3750 50  0001 C CNN
F 3 "" H 5750 3750 50  0001 C CNN
	1    5750 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E1F8C7C
P 4950 4000
AR Path="/5E1F8C7C" Ref="#PWR?"  Part="1" 
AR Path="/5E1B8DB7/5E1F8C7C" Ref="#PWR?"  Part="1" 
AR Path="/5E1BB69E/5E1F8C7C" Ref="#PWR?"  Part="1" 
AR Path="/5E1BBF11/5E1F8C7C" Ref="#PWR?"  Part="1" 
AR Path="/5E1BC768/5E1F8C7C" Ref="#PWR?"  Part="1" 
AR Path="/5E1F6C0D/5E1F8C7C" Ref="#PWR0140"  Part="1" 
AR Path="/5E1FB088/5E1F8C7C" Ref="#PWR0150"  Part="1" 
F 0 "#PWR0150" H 4950 3750 50  0001 C CNN
F 1 "GND" H 4955 3827 50  0000 C CNN
F 2 "" H 4950 4000 50  0001 C CNN
F 3 "" H 4950 4000 50  0001 C CNN
	1    4950 4000
	1    0    0    -1  
$EndComp
Wire Wire Line
	5550 3500 5450 3500
$Comp
L Connector_Generic:Conn_02x02_Counter_Clockwise J?
U 1 1 5E1F8C84
P 5150 3850
AR Path="/5E1F8C84" Ref="J?"  Part="1" 
AR Path="/5E1B8DB7/5E1F8C84" Ref="J?"  Part="1" 
AR Path="/5E1BB69E/5E1F8C84" Ref="J?"  Part="1" 
AR Path="/5E1BBF11/5E1F8C84" Ref="J?"  Part="1" 
AR Path="/5E1BC768/5E1F8C84" Ref="J?"  Part="1" 
AR Path="/5E1F6C0D/5E1F8C84" Ref="J3"  Part="1" 
AR Path="/5E1FB088/5E1F8C84" Ref="J7"  Part="1" 
F 0 "J3" H 5200 4067 50  0000 C CNN
F 1 "PWR_BULK" H 5200 3976 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_2x02_P2.54mm_Horizontal" H 5150 3850 50  0001 C CNN
F 3 "~" H 5150 3850 50  0001 C CNN
	1    5150 3850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5450 3850 5450 3950
Wire Wire Line
	4950 3950 4950 3850
Wire Wire Line
	5450 3400 5550 3400
Text GLabel 4950 3500 0    50   Input ~ 0
SYNC
Wire Wire Line
	5450 3850 5750 3850
Wire Wire Line
	5750 3750 5750 3850
Connection ~ 5450 3850
Wire Wire Line
	4950 3950 4950 4000
Connection ~ 4950 3950
$Comp
L power:GND #PWR?
U 1 1 5E1FA5A4
P 4450 3400
AR Path="/5E1FA5A4" Ref="#PWR?"  Part="1" 
AR Path="/5E1B8DB7/5E1FA5A4" Ref="#PWR?"  Part="1" 
AR Path="/5E1BB69E/5E1FA5A4" Ref="#PWR?"  Part="1" 
AR Path="/5E1BBF11/5E1FA5A4" Ref="#PWR?"  Part="1" 
AR Path="/5E1BC768/5E1FA5A4" Ref="#PWR?"  Part="1" 
AR Path="/5E1F6C0D/5E1FA5A4" Ref="#PWR0141"  Part="1" 
AR Path="/5E1FB088/5E1FA5A4" Ref="#PWR0151"  Part="1" 
F 0 "#PWR0151" H 4450 3150 50  0001 C CNN
F 1 "GND" H 4455 3227 50  0000 C CNN
F 2 "" H 4450 3400 50  0001 C CNN
F 3 "" H 4450 3400 50  0001 C CNN
	1    4450 3400
	1    0    0    -1  
$EndComp
$EndSCHEMATC
