blinkRed = false --warning in progress
tRed = 0 --time from blink period
elRed = false --turn on left lamp
erRed = false --turn on right lamp
lRedState = 0 --left lamp current emission
rRedState = 0 --right lamp current emission

dRED_ON = 0.2 --red lamp turning on time
dRED_OFF = 0.27 --red lamp turning off time

RED_ONl = 0.56 --left red lamp turn on time
RED_ONr = 0.73 --right red lamp turn on time

blinkWhite = true --positive light enabled
tWhite = 0 --time from blink period
eWhite = false --turn on positive lamp
whiteState = 0 --positive lamp current emission

dWHITE_ON = 0.3 --positive lamp turning on time
dWHITE_OFF = 0.16 --positive lamp turning off time

WHITE_ON = 0.7 --positive lamp turn on time
WHITE_OFF = 0.8 --positive lamp turn off time

pWHITE = WHITE_ON + WHITE_OFF --positive lamp period

speedOnCrossing = 40 --track speed at crossing
NUMBER_OF_TRACKS = 2 --number of tracks at crossing

--do not change!
CROSSING_LEN = 4+5*NUMBER_OF_TRACKS+2.5 --crossing length for approach length calculations
if CROSSING_LEN > 25.5 then
	VEHICLE_SPEED = 5/3.6
	VEHICLE_LEN = 22
else
	VEHICLE_SPEED = 3/3.6
	VEHICLE_LEN = 3
end
SUM_LEN = CROSSING_LEN+VEHICLE_LEN --sum length of crossing and passing road vehicle
TIME_TO_ESCAPE_CROSSING = SUM_LEN/VEHICLE_SPEED --safety time to escape rail crossing
CROSSING_CLOSE_TO_TRAIN_PASS = TIME_TO_ESCAPE_CROSSING + 10 --safe time needed before train pass
sApproach = speedOnCrossing/3.6*CROSSING_CLOSE_TO_TRAIN_PASS --safe distance needed before train pass

timeLast = os.clock() --proc time last update
dTime = 0 --delta time from last update

closeDelay = 0 --elapsed time from warning start
closeDelayTarget = math.random()*10 --tiem to elapse before road vehicle will stop - simulating road pirates

tWarning = 0 --buzzer elapsed time
WARNING_START = 0.052 --buzzer loop start

nApproach = 0 --number of rail vehicles in approach section
nRetreat = 0 --number of rail vehicles in retreat section

function Initialise()
	Call("BeginUpdate")
end

function OnConsistApproach(frontDistance, backDistance, speed)
	--we are actually not able to get track speed limit, so get the current game highest speed ever and pretend, that this is speed limit
		speedOnCrossing = math.max(speedOnCrossing, speed*3.6)

	--recalc length, where crossing should be at warning because we changed track speed at crossing
		sApproach = speedOnCrossing/3.6*CROSSING_CLOSE_TO_TRAIN_PASS

	--if train front is before crossing, but already in approach distance, add train to approach section
		if frontDistance > 0 and frontDistance < sApproach then
			nApproach = nApproach + 1
	--else-if train already passed crossing, but its end is still less than 15 meters after crossing, still occupying approach section
		elseif backDistance >= -15 and frontDistance <= 0 then
			nApproach = nApproach + 1
	--else-if train already passed crossing, but its end is still in approach section from opposite side - add to retreat section
		elseif frontDistance < 0 and backDistance > -sApproach then
			nRetreat = nRetreat + 1
		end
end

function Update(dTime_game)
	time = os.clock() --get current proc time
	dTime = time - timeLast --get delta from last proc time
	timeLast = time --save current one for next time

	if nRetreat > 0 or nApproach > 0 then --if there is a train in retreat or approach section
		nRetreat = 0 --reset counter
		blinkWhite = false --turn off white light
	else -- if both retreat and approach sections are clear - turn on positive lamp
		blinkWhite = true
	end
	
	if nApproach > 0 then --if train is in approach section
		nApproach = 0 --reset counter
		blinkWhite = false --disable positive lamp
		if not blinkRed then --if just entered
			tRed = 0.33 --simulate capacitors charging - thus shorter period
			closeDelay = 0 --reset elapsed time from warning start
			closeDelayTarget = math.random()*10 --set random delay before vehicles will stop
		end
		blinkRed = true --start warning
	else --else turn off warning
		blinkRed = false
	end

	if blinkRed then --if warning is enabled
		tRed = tRed + dTime --add delta time to red lamp counter
		if tRed > RED_ONl + RED_ONr then --if bigger than red lamp period
			tRed = 0 --reset counter
		end
		elRed = tRed < RED_ONl --left lamp powered if lamp counter smaller than left lamp threshold
		erRed = not elRed --right lamp powered when not left

		if closeDelay > closeDelayTarget then --if time elapsed from warning bigger than random delay
			Call("*:SetCrossingState",2) --stop vehicles
		else --else
			closeDelay = closeDelay + dTime --add to counter
			Call("*:SetCrossingState",0) --let vehicles still pass
		end
	else --if not warning
		tRed = 0 --reset left lamp elapsed time
		elRed = false --turn off both lamps
		erRed = false
		if closeDelay > 0 then --if elapsed time from warning stop bigger than zero, substract one
			closeDelay = math.max(closeDelay - dTime, 0)
		end
		if closeDelay < 0.2 then --if elapsed time from warning is almost zero
			Call("*:SetCrossingState",0) --let vehicles pass
		else
			Call("*:SetCrossingState",2) --stop vehicles
		end
	end

	if blinkWhite then --if positive lamp enabled
		tWhite = tWhite + dTime --add to its counter
		if tWhite > pWHITE then --if bigger than positive light period, reset
			tWhite = 0
		end
		eWhite = tWhite < WHITE_ON --turn on positive lamp power if time is smaller than its on time
	else --if white lamp disabled
		tWhite = 0 --reset time
		eWhite = false --turn off its power
	end

	if elRed then --if left red lamp powered
		if lRedState < 9.9 then --if less than max state
			lRedState = math.min(lRedState + (dTime/dRED_ON)*10, 9.9) --add time to state
		end
	else --else - left lamp not powered
		if lRedState > 0 then --if more than zero
			lRedState = math.max(lRedState - (dTime/dRED_OFF)*10, 0) --substract time from state
		end
	end

	if erRed then --if right red lamp powered
		if rRedState < 9.9 then --if less than max state
			rRedState = math.min(rRedState + (dTime/dRED_ON)*10, 9.9) --add time to state
		end
	else --else - right lamp not powered
		if rRedState > 0 then --if more than zero
			rRedState = math.max(rRedState - (dTime/dRED_OFF)*10, 0) --substract time from state
		end
	end

	if eWhite then --if white lamp powered
		if whiteState < 9.9 then --if less than max state
			whiteState = math.min(whiteState + (dTime/dWHITE_ON)*10, 9.9) --add time to state
		end
	else --else - white not powered
		if whiteState > 0 then --if more than zero
			whiteState = math.max(whiteState - (dTime/dWHITE_OFF)*10, 0) --substract time from state
		end
	end
	
	local outString = math.floor(lRedState)..math.floor(rRedState)..math.floor(whiteState) --concatenate lamp states for setting to decal
    Call("Crossing1:SetText", outString, 0) --set to first sign decal
    Call("Crossing2:SetText", outString, 0) --set to second sign decal
	
	Call("C1RL:SetColour", 0.0855*lRedState, 0.0153*lRedState, 0.0173*lRedState) --some rgb colors magic
	Call("C1RL:Activate", math.min(lRedState*10, 1)) --turn on lamp if state > 0.1

	Call("C1RR:SetColour", 0.0855*rRedState, 0.0153*rRedState, 0.0173*rRedState) --6 times same again
	Call("C1RR:Activate", math.min(rRedState*10, 1))

	Call("C1W:SetColour", 0.0949*whiteState, 0.1*whiteState, 0.0643*whiteState)
	Call("C1W:Activate", math.min(whiteState*10, 1))

	Call("C2RL:SetColour", 0.0855*lRedState, 0.0153*lRedState, 0.0173*lRedState)
	Call("C2RL:Activate", math.min(lRedState*10, 1))

	Call("C2RR:SetColour", 0.0855*rRedState, 0.0153*rRedState, 0.0173*rRedState)
	Call("C2RR:Activate", math.min(rRedState*10, 1))

	Call("C2W:SetColour", 0.0949*whiteState, 0.1*whiteState, 0.0643*whiteState)
	Call("C2W:Activate", math.min(whiteState*10, 1))

	if erRed then --if right red lamp is shining
		tWarning = tWarning + dTime --add time to counter from buzzer start
		if tWarning > WARNING_START then --if buzzer counter is bigger than buzzer start
			Call("Sounds:SetParameter", "vystraha", 2) --play loop
		else --else - buzzer is "starting" yet
			Call("Sounds:SetParameter", "vystraha", 1) --play start sound
		end
	else --red lamp is off
		tWarning = 0 --reset buzzer counter
		Call("Sounds:SetParameter", "vystraha", 0) --turn off sound - play turn off sound too, bcz defined as "value decrease past 0.5"
	end
end