EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 11 16
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
L SamacSys_Parts:TC62D748CFNAG(CEBH IC?
U 1 1 5E16DC57
P 3750 1900
AR Path="/5E16DC57" Ref="IC?"  Part="1" 
AR Path="/5E16A78A/5E16DC57" Ref="IC2"  Part="1" 
F 0 "IC2" H 4400 2165 50  0000 C CNN
F 1 "TC62D748CFNAG(CEBH" H 4400 2074 50  0000 C CNN
F 2 "SamacSys_Parts:SOP64P600X175-24N" H 4900 2000 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/TC62D748CFNAG(CEBH.pdf" H 4900 1900 50  0001 L CNN
F 4 "LED Lighting Drivers 16-output constant current LED Drvr 17V" H 4900 1800 50  0001 L CNN "Description"
F 5 "1.75" H 4900 1700 50  0001 L CNN "Height"
F 6 "757-TC62D748CFNAGCEB" H 4900 1600 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=757-TC62D748CFNAGCEB" H 4900 1500 50  0001 L CNN "Mouser Price/Stock"
F 8 "Toshiba" H 4900 1400 50  0001 L CNN "Manufacturer_Name"
F 9 "TC62D748CFNAG(CEBH" H 4900 1300 50  0001 L CNN "Manufacturer_Part_Number"
	1    3750 1900
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E16DC5D
P 4050 1400
AR Path="/5E16DC5D" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DC5D" Ref="#PWR0101"  Part="1" 
F 0 "#PWR0101" H 4050 1150 50  0001 C CNN
F 1 "GND" H 4055 1227 50  0000 C CNN
F 2 "" H 4050 1400 50  0001 C CNN
F 3 "" H 4050 1400 50  0001 C CNN
	1    4050 1400
	1    0    0    -1  
$EndComp
Text Label 5150 2700 2    50   ~ 0
a0
Text Label 5150 2800 2    50   ~ 0
a1
Text Label 3300 2300 2    50   ~ 0
a2
Text Label 3300 2400 2    50   ~ 0
a3
Text Label 5150 5200 2    50   ~ 0
a4
Text Label 3500 4800 2    50   ~ 0
a5
Text Label 5150 5400 2    50   ~ 0
a6
Text Label 3300 5250 0    50   ~ 0
a7
Wire Bus Line
	7100 5200 6050 5200
Wire Bus Line
	7100 5300 6300 5300
Wire Bus Line
	6300 5300 6300 6100
Wire Bus Line
	6300 6100 5500 6100
Entry Wire Line
	2900 2900 3000 2800
Entry Wire Line
	2900 3000 3000 2900
Entry Wire Line
	2900 3100 3000 3000
Entry Wire Line
	5500 5450 5400 5550
Entry Wire Line
	3300 5400 3400 5300
Entry Wire Line
	3300 5500 3400 5400
Entry Wire Line
	3300 5600 3400 5500
Entry Wire Line
	2900 2800 3000 2700
Text Label 3200 2700 2    50   ~ 0
b0
Text Label 3200 2800 2    50   ~ 0
b1
Text Label 3200 2900 2    50   ~ 0
b2
Text Label 3200 3000 2    50   ~ 0
b3
Text Label 5100 5550 0    50   ~ 0
b4
Text Label 3700 5300 2    50   ~ 0
b5
Text Label 3700 5400 2    50   ~ 0
b6
Text Label 3700 5500 2    50   ~ 0
b7
Wire Bus Line
	7100 5400 6450 5400
Entry Wire Line
	5600 2900 5700 2800
Entry Wire Line
	5600 3000 5700 2900
Entry Wire Line
	3550 2600 3650 2500
Entry Wire Line
	3550 2700 3650 2600
Entry Wire Line
	5500 5200 5400 5300
Entry Wire Line
	3350 5000 3450 4900
Entry Wire Line
	3350 5100 3450 5000
Entry Wire Line
	3350 5200 3450 5100
Wire Wire Line
	3650 2500 3750 2500
Wire Wire Line
	3750 2600 3650 2600
Text Label 5600 2900 2    50   ~ 0
c0
Text Label 5600 3000 2    50   ~ 0
c1
Text Label 3750 2500 2    50   ~ 0
c2
Text Label 3750 2600 2    50   ~ 0
c3
Text Label 5050 5300 0    50   ~ 0
c4
Text Label 3550 4900 2    50   ~ 0
c5
Text Label 3550 5000 2    50   ~ 0
c6
Text Label 3550 5100 2    50   ~ 0
c7
Text Label 6800 5200 2    50   ~ 0
a[0..7]
Text Label 6800 5300 2    50   ~ 0
b[0..7]
Text Label 6800 5400 2    50   ~ 0
c[0..7]
Wire Wire Line
	3750 5500 3400 5500
Wire Wire Line
	3400 5400 3750 5400
Wire Wire Line
	3750 5300 3400 5300
Wire Wire Line
	5400 5550 5050 5550
$Comp
L SamacSys_Parts:TC62D748CFNAG(CEBH IC?
U 1 1 5E16DCAC
P 3750 4400
AR Path="/5E16DCAC" Ref="IC?"  Part="1" 
AR Path="/5E16A78A/5E16DCAC" Ref="IC3"  Part="1" 
F 0 "IC3" H 4400 4665 50  0000 C CNN
F 1 "TC62D748CFNAG(CEBH" H 4400 4574 50  0000 C CNN
F 2 "SamacSys_Parts:SOP64P600X175-24N" H 4900 4500 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/TC62D748CFNAG(CEBH.pdf" H 4900 4400 50  0001 L CNN
F 4 "LED Lighting Drivers 16-output constant current LED Drvr 17V" H 4900 4300 50  0001 L CNN "Description"
F 5 "1.75" H 4900 4200 50  0001 L CNN "Height"
F 6 "757-TC62D748CFNAGCEB" H 4900 4100 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=757-TC62D748CFNAGCEB" H 4900 4000 50  0001 L CNN "Mouser Price/Stock"
F 8 "Toshiba" H 4900 3900 50  0001 L CNN "Manufacturer_Name"
F 9 "TC62D748CFNAG(CEBH" H 4900 3800 50  0001 L CNN "Manufacturer_Part_Number"
	1    3750 4400
	1    0    0    -1  
$EndComp
Entry Wire Line
	5250 2700 5350 2800
Entry Wire Line
	5250 2800 5350 2900
Entry Wire Line
	3100 2200 3200 2300
Entry Wire Line
	3100 2300 3200 2400
Entry Wire Line
	5250 5200 5350 5100
Entry Wire Line
	3100 4700 3200 4800
Entry Wire Line
	5250 5400 5350 5500
Entry Wire Line
	3200 5250 3100 5150
Wire Wire Line
	5050 2700 5250 2700
Wire Wire Line
	5250 2800 5050 2800
Wire Wire Line
	5050 5200 5250 5200
Wire Wire Line
	5250 5400 5050 5400
Wire Bus Line
	5350 5700 6050 5700
Wire Bus Line
	6050 5700 6050 5200
$Comp
L power:+3.3V #PWR?
U 1 1 5E16DCC4
P 5050 1400
AR Path="/5E16DCC4" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DCC4" Ref="#PWR0104"  Part="1" 
F 0 "#PWR0104" H 5050 1250 50  0001 C CNN
F 1 "+3.3V" H 5065 1573 50  0000 C CNN
F 2 "" H 5050 1400 50  0001 C CNN
F 3 "" H 5050 1400 50  0001 C CNN
	1    5050 1400
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E16DCDA
P 7050 2100
AR Path="/5E16DCDA" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DCDA" Ref="#PWR0106"  Part="1" 
F 0 "#PWR0106" H 7050 1850 50  0001 C CNN
F 1 "GND" H 7055 1927 50  0000 C CNN
F 2 "" H 7050 2100 50  0001 C CNN
F 3 "" H 7050 2100 50  0001 C CNN
	1    7050 2100
	1    0    0    -1  
$EndComp
Wire Wire Line
	5750 2000 5050 2000
$Comp
L power:GND #PWR?
U 1 1 5E16DCE8
P 5700 4750
AR Path="/5E16DCE8" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DCE8" Ref="#PWR0123"  Part="1" 
F 0 "#PWR0123" H 5700 4500 50  0001 C CNN
F 1 "GND" H 5705 4577 50  0000 C CNN
F 2 "" H 5700 4750 50  0001 C CNN
F 3 "" H 5700 4750 50  0001 C CNN
	1    5700 4750
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR?
U 1 1 5E16DCEE
P 5600 2200
AR Path="/5E16DCEE" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DCEE" Ref="#PWR0124"  Part="1" 
F 0 "#PWR0124" H 5600 1950 50  0001 C CNN
F 1 "GND" H 5605 2027 50  0000 C CNN
F 2 "" H 5600 2200 50  0001 C CNN
F 3 "" H 5600 2200 50  0001 C CNN
	1    5600 2200
	1    0    0    -1  
$EndComp
Wire Wire Line
	5050 2200 5600 2200
Wire Wire Line
	5700 4750 5700 4700
Wire Wire Line
	5700 4700 5050 4700
$Comp
L Device:C C?
U 1 1 5E16DCF7
P 4400 1400
AR Path="/5E16DCF7" Ref="C?"  Part="1" 
AR Path="/5E16A78A/5E16DCF7" Ref="C1"  Part="1" 
F 0 "C1" V 4148 1400 50  0000 C CNN
F 1 "4.7u" V 4239 1400 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4438 1250 50  0001 C CNN
F 3 "~" H 4400 1400 50  0001 C CNN
	1    4400 1400
	0    1    1    0   
$EndComp
Wire Wire Line
	5050 1900 5050 1400
Wire Wire Line
	5050 1400 4550 1400
Connection ~ 5050 1400
Wire Wire Line
	4250 1400 4050 1400
Wire Wire Line
	3550 1400 3550 1900
Wire Wire Line
	3550 1900 3750 1900
Connection ~ 4050 1400
Wire Wire Line
	4050 1400 3550 1400
$Comp
L power:GND #PWR?
U 1 1 5E16DD05
P 4250 3900
AR Path="/5E16DD05" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DD05" Ref="#PWR0125"  Part="1" 
F 0 "#PWR0125" H 4250 3650 50  0001 C CNN
F 1 "GND" H 4255 3727 50  0000 C CNN
F 2 "" H 4250 3900 50  0001 C CNN
F 3 "" H 4250 3900 50  0001 C CNN
	1    4250 3900
	1    0    0    -1  
$EndComp
$Comp
L power:+3.3V #PWR?
U 1 1 5E16DD0B
P 5100 3900
AR Path="/5E16DD0B" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E16DD0B" Ref="#PWR0126"  Part="1" 
F 0 "#PWR0126" H 5100 3750 50  0001 C CNN
F 1 "+3.3V" H 5115 4073 50  0000 C CNN
F 2 "" H 5100 3900 50  0001 C CNN
F 3 "" H 5100 3900 50  0001 C CNN
	1    5100 3900
	1    0    0    -1  
$EndComp
$Comp
L Device:C C?
U 1 1 5E16DD11
P 4600 3900
AR Path="/5E16DD11" Ref="C?"  Part="1" 
AR Path="/5E16A78A/5E16DD11" Ref="C2"  Part="1" 
F 0 "C2" V 4348 3900 50  0000 C CNN
F 1 "4.7u" V 4439 3900 50  0000 C CNN
F 2 "Capacitor_SMD:C_0805_2012Metric" H 4638 3750 50  0001 C CNN
F 3 "~" H 4600 3900 50  0001 C CNN
	1    4600 3900
	0    1    1    0   
$EndComp
Wire Wire Line
	5250 4400 5250 3900
Wire Wire Line
	5250 3900 5100 3900
Wire Wire Line
	4450 3900 4250 3900
Wire Wire Line
	3750 3900 3750 4400
Connection ~ 4250 3900
Wire Wire Line
	4250 3900 3750 3900
Wire Wire Line
	5250 4400 5050 4400
Text GLabel 3750 2100 0    50   Input ~ 0
SCK
Text GLabel 3750 4600 0    50   Input ~ 0
SCK
Text GLabel 3750 2200 0    50   Input ~ 0
SLAT
Text GLabel 3750 4700 0    50   Input ~ 0
SLAT
Text GLabel 3750 4500 0    50   Input ~ 0
SINA
Text HLabel 7100 5200 2    50   Input ~ 0
a[0..7]
Text HLabel 7100 5300 2    50   Input ~ 0
b[0..7]
Text HLabel 7100 5400 2    50   Input ~ 0
c[0..7]
Text GLabel 3750 2000 0    50   Input ~ 0
SINB
Connection ~ 5100 3900
Wire Wire Line
	5100 3900 4750 3900
Wire Bus Line
	6450 3200 6450 5100
Wire Bus Line
	3550 3200 5700 3200
$Comp
L SamacSys_Parts:TC33X-2-103E R17
U 1 1 5E1A3370
P 5750 2000
F 0 "R17" H 6300 2265 50  0000 C CNN
F 1 "TC33X-2-103E" H 6300 2174 50  0000 C CNN
F 2 "SamacSys_Parts:TC33X-2_1" H 6700 2100 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/TC33X-2-103E.pdf" H 6700 2000 50  0001 L CNN
F 4 "Cermet 3mm SMT trimmer,0.1W 10k Bourns TC33 Series SMD Cermet Trimmer Resistor with Solder Pad Terminations, 10k?? ??25% 1/10W ??250ppm/??C Top Adjust" H 6700 1900 50  0001 L CNN "Description"
F 5 "" H 6700 1800 50  0001 L CNN "Height"
F 6 "652-TC33X-2-103E" H 6700 1700 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=652-TC33X-2-103E" H 6700 1600 50  0001 L CNN "Mouser Price/Stock"
F 8 "Bourns" H 6700 1500 50  0001 L CNN "Manufacturer_Name"
F 9 "TC33X-2-103E" H 6700 1400 50  0001 L CNN "Manufacturer_Part_Number"
	1    5750 2000
	1    0    0    -1  
$EndComp
Wire Wire Line
	6850 2000 7050 2000
Wire Wire Line
	7050 2000 7050 2100
$Comp
L power:GND #PWR?
U 1 1 5E1AACCC
P 7950 4600
AR Path="/5E1AACCC" Ref="#PWR?"  Part="1" 
AR Path="/5E16A78A/5E1AACCC" Ref="#PWR0122"  Part="1" 
F 0 "#PWR0122" H 7950 4350 50  0001 C CNN
F 1 "GND" H 7955 4427 50  0000 C CNN
F 2 "" H 7950 4600 50  0001 C CNN
F 3 "" H 7950 4600 50  0001 C CNN
	1    7950 4600
	1    0    0    -1  
$EndComp
$Comp
L SamacSys_Parts:TC33X-2-103E R18
U 1 1 5E1AACD8
P 6650 4500
F 0 "R18" H 7200 4765 50  0000 C CNN
F 1 "TC33X-2-103E" H 7200 4674 50  0000 C CNN
F 2 "SamacSys_Parts:TC33X-2_1" H 7600 4600 50  0001 L CNN
F 3 "https://componentsearchengine.com/Datasheets/1/TC33X-2-103E.pdf" H 7600 4500 50  0001 L CNN
F 4 "Cermet 3mm SMT trimmer,0.1W 10k Bourns TC33 Series SMD Cermet Trimmer Resistor with Solder Pad Terminations, 10k?? ??25% 1/10W ??250ppm/??C Top Adjust" H 7600 4400 50  0001 L CNN "Description"
F 5 "" H 7600 4300 50  0001 L CNN "Height"
F 6 "652-TC33X-2-103E" H 7600 4200 50  0001 L CNN "Mouser Part Number"
F 7 "https://www.mouser.com/Search/Refine.aspx?Keyword=652-TC33X-2-103E" H 7600 4100 50  0001 L CNN "Mouser Price/Stock"
F 8 "Bourns" H 7600 4000 50  0001 L CNN "Manufacturer_Name"
F 9 "TC33X-2-103E" H 7600 3900 50  0001 L CNN "Manufacturer_Part_Number"
	1    6650 4500
	1    0    0    -1  
$EndComp
Wire Wire Line
	7750 4500 7950 4500
Wire Wire Line
	7950 4500 7950 4600
Wire Wire Line
	5050 4500 6650 4500
Wire Bus Line
	2900 4050 3300 4050
Wire Bus Line
	3550 4150 3550 3200
Wire Wire Line
	3000 2800 3750 2800
Wire Wire Line
	3000 2900 3750 2900
Wire Wire Line
	3000 3000 3750 3000
Wire Bus Line
	3350 4150 3550 4150
Wire Wire Line
	3750 4900 3450 4900
Wire Wire Line
	3450 5000 3750 5000
Wire Wire Line
	3450 5100 3750 5100
Connection ~ 5700 3200
Wire Bus Line
	5700 3200 6450 3200
Wire Wire Line
	5050 3000 5600 3000
Connection ~ 3550 3200
Wire Wire Line
	3450 2700 3450 2750
Wire Wire Line
	3450 2750 3750 2750
Wire Wire Line
	3750 2750 3750 2700
Wire Wire Line
	3000 2700 3450 2700
Wire Wire Line
	5050 2900 5200 2900
Wire Wire Line
	5200 2900 5200 2950
Wire Wire Line
	5200 2950 5450 2950
Wire Wire Line
	5450 2950 5450 2900
Wire Wire Line
	5450 2900 5600 2900
Wire Wire Line
	3200 2400 3750 2400
Wire Wire Line
	3200 2300 3750 2300
Wire Bus Line
	3100 3400 5350 3400
Connection ~ 5350 3400
Wire Wire Line
	5050 5300 5400 5300
Wire Bus Line
	5500 5200 5500 5100
Wire Bus Line
	5500 5100 6450 5100
Connection ~ 6450 5100
Wire Bus Line
	6450 5100 6450 5400
Connection ~ 3100 3400
Wire Wire Line
	3200 4800 3750 4800
Wire Wire Line
	5050 5500 5050 5550
Wire Bus Line
	5500 5450 5500 6100
Connection ~ 5500 6100
Wire Bus Line
	5500 6100 3300 6100
Wire Wire Line
	3750 5250 3750 5200
Wire Wire Line
	3200 5250 3750 5250
Wire Bus Line
	5700 2800 5700 3200
Wire Bus Line
	3550 2600 3550 3200
Wire Bus Line
	3100 2200 3100 3400
Wire Bus Line
	5350 2800 5350 3400
Wire Bus Line
	3100 3400 3100 5150
Wire Bus Line
	3350 4150 3350 5200
Wire Bus Line
	5350 3400 5350 5700
Wire Bus Line
	2900 2800 2900 4050
Wire Bus Line
	3300 4050 3300 6100
$EndSCHEMATC
