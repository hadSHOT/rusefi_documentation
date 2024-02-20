-- scriptname script_5_fake_torque_motor1.lua

-- sometimes we want to cut a CAN bus and install rusEFI into that cut
-- https://en.wikipedia.org/wiki/Man-in-the-middle_attack

-- include misc-util.lua
-- endinclude

-- include PG35-CANbus-ids.lua
-- endinclude

-- this controls onCanRx rate as well!
setTickRate(100)

VEHICLE_BUS = 1
TCU_BUS = 2

motor1Data = { 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 }

totalVehicleMessages = 0
totalTcuMessages = 0
totalDropped = 0
totalReplaced = 0

function relayFromVehicleToTcu(bus, id, dlc, data)
    totalVehicleMessages = totalVehicleMessages + 1
--    print('from ECU ' .. id .. " " .. arrayToString(data) .. " dropped=" .. totalDropped .. " replaced " .. totalReplaced)
    if id < 0x7FF then
        txCan(TCU_BUS, id, 0, data) -- relay non-TCU message to TCU
    end
end

function relayFromTcuToVehicle(bus, id, dlc, data)
    totalTcuMessages = totalTcuMessages + 1
    if id < 0x7FF then
        txCan(VEHICLE_BUS, id, 0, data) -- relay non-ECU message to ECU
    end
end

counter440 = 0
function onTcu440(bus, id, dlc, data)
	isShiftActive = getBitRange(data, 0, 1)
	tcuError = getBitRange(data, 1, 1)
	EGSRequirement = getBitRange(data, 7, 1)
	counter440 = counter440 + 1
	if counter440 % 40 == 0 then
		print("TCU isShiftActive=" ..isShiftActive .." tcuError=" ..tcuError .." EGSRequirement=" ..EGSRequirement)
	end
	relayFromTcuToVehicle(bus, id, dlc, data)
end

fakeTorque = 0
rpm = 0
tps = 0

function sendMotor1()
	engineTorque = fakeTorque * 0.9
	innerTorqWithoutExt = fakeTorque
	torqueLoss = 20
	requestedTorque = fakeTorque

	motor1Data[2] = engineTorque / 0.39
	setTwoBytes(motor1Data, 2, rpm / 0.25)
	motor1Data[5] = innerTorqWithoutExt / 0.4
	motor1Data[6] = tps / 0.4
	motor1Data[7] = torqueLoss / 0.39
	motor1Data[8] = requestedTorque / 0.39

	txCan(TCU_BUS, MOTOR_1, 0, motor1Data)
end

motor1counter = 0
function onMotor1(bus, id, dlc, data)
	rpm = getBitRange(data, 16, 16) * 0.25
	if rpm == 0 then
		canMotorInfoTotalCounter = 0
	end

	tps = getBitRange(data, 40, 8) * 0.4

	fakeTorque = interpolate(0, 6, 100, 60, tps)

	motor1counter = motor1counter + 1
	if motor1counter % 40 == 0 then
	    print('RPM=' .. rpm .. ' TPS=' .. tps)
    end

	sendMotor1()
end

canRxAdd(VEHICLE_BUS, Komf_1_912, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, ACC_GRA, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, GRA_Neu, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, Kombi_3, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, Soll_Verbauliste_neu, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, Systeminfo_1, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, Diagnose_1, relayFromVehicleToTcu) -- ?
canRxAdd(VEHICLE_BUS, BRAKE_1_416, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, BRAKE_2_1440, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, BRAKE_3_1184, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, BRAKE_5_1192, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, BRAKE_8_428, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, VWTP_OUT, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, VPTP_TCU, relayFromVehicleToTcu)

canRxAdd(VEHICLE_BUS, MOTOR_1, onMotor1)
canRxAdd(VEHICLE_BUS, MOTOR_2, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, MOTOR_3, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, MOTOR_5, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, MOTOR_6, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, MOTOR_7, relayFromVehicleToTcu)
canRxAdd(VEHICLE_BUS, Motor_Flexia, relayFromVehicleToTcu)

canRxAdd(TCU_BUS, VWTP_IN, relayFromTcuToVehicle)
canRxAdd(TCU_BUS, VWTP_TESTER, relayFromTcuToVehicle)
canRxAdd(TCU_BUS, TCU_1344_540, relayFromTcuToVehicle)
canRxAdd(TCU_BUS, TCU_1352_548, relayFromTcuToVehicle)
canRxAdd(TCU_BUS, TCU_1088_440, onTcu440)

-- count what do we drop
canRxAddMask(VEHICLE_BUS, 0, 0, silentDrop)
canRxAddMask(TCU_BUS, 0, 0, printAndDrop)

everySecondTimer = Timer.new()

function onTick()
    if everySecondTimer:getElapsedSeconds() > 1 then
        everySecondTimer:reset()
        print("Total from vehicle " .. totalVehicleMessages .. " from TCU " .. totalTcuMessages .. " dropped=" .. totalDropped .. " replaced " .. totalReplaced)
    end
end