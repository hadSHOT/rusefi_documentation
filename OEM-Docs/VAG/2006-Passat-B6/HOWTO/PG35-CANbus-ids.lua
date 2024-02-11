AIRBAG = 0x050

-- 640
MOTOR_1 = 0x280
-- 644
MOTOR_BRE = 0x284
-- 648
MOTOR_2 = 0x288
-- 896
MOTOR_3 = 0x380
-- 1152
MOTOR_5 = 0x480
-- 1160
MOTOR_6 = 0x488
-- 1386
ACC_GRA = 0x56A
-- 1408 the one with variable payload
MOTOR_INFO = 0x580
-- 1416
MOTOR_7 = 0x588
ACC_GRA_Anzeige=1386
Motor_Flexia=1408


TCU_1088_440 = 0x440
TCU_1344_540 = 0x540
TCU_1352_548 = 0x548

-- 906
GRA_Neu = 0x38A

Komf_1_912 = 0x390
-- 1312
Kombi_3 = 0x520
-- 1488
Systeminfo_1 = 0x5D0

-- 1500
Soll_Verbauliste_neu = 0x5DC
-- 2000
Diagnose_1 = 0x7D0

BRAKE_1_416 = 0x1A0
BRAKE_2_1440 = 0x5A0
BRAKE_3_1184 = 0x4a0
BRAKE_5_1192 = 0x4a8
BRAKE_8_428 = 0x1AC

-- VAG TP 2.0
VWTP_OUT = 0x200
cuType = 0x02 -- TCU
VWTP_IN = 0x200 + cuType
VWTP_TESTER = 0x300
VPTP_TCU = 0x760
