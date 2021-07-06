blink_red_light = false
red_light_blink_timer = 0
red_light_blink_state = false

RED_LIGHT_LEFT_ON_TIME = 0.555
RED_LIGHT_RIGHT_ON_TIME = 0.555

blink_white_light = true
white_light_blink_timer = 0
white_light_blink_state = false

WHITE_LIGHT_ON_TIME = 0.746
WHITE_LIGHT_OFF_TIME = 0.746

--speed on tracks on crossing
speedOnCrossing = 40
--number of track crossing
NUMBER_OF_TRACKS = 2

--do not change!
CROSSING_LEN = 4+5*NUMBER_OF_TRACKS+2.5
if CROSSING_LEN > 25.5 then
	VEHICLE_SPEED = 5/3.6
	VEHICLE_LEN = 22
else
	VEHICLE_SPEED = 3/3.6
	VEHICLE_LEN = 3
end
SUM_LEN = CROSSING_LEN+VEHICLE_LEN
TIME_TO_ESCAPE_CROSSING = SUM_LEN/VEHICLE_SPEED
CROSSING_CLOSE_TO_TRAIN_PASS = TIME_TO_ESCAPE_CROSSING + 10
lenOfApproach = speedOnCrossing/3.6*CROSSING_CLOSE_TO_TRAIN_PASS

casUpdateLast = os.clock()
cas = 0

function Initialise()
	Call("BeginUpdate")
	Call("crossing:ActivateNode","light_left_red",0)
	Call("crossing:ActivateNode","light_right_red",0)
	Call("crossing:ActivateNode","light_down",0)
	Call("red_left:Activate",0)
	Call("red_right:Activate",0)
	Call("white:Activate",0)
end

nApproach = 0 --number of rail vehicles in approach section
nRetreat = 0 --number of rail vehicles in retreat section

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

function Update(time)
	casUpdate = os.clock()
	cas = casUpdate - casUpdateLast
	casUpdateLast = casUpdate

	if nRetreat > 0 or nApproach > 0 then --if there is a train in retreat or approach section
		nRetreat = 0 --reset counter
		blink_white_light = false --turn off white light
	else -- if both retreat and approach sections are clear - turn on positive lamp
		blink_white_light = true
	end
	
	if nApproach > 0 then --if train is in approach section
		nApproach = 0 --reset counter
		blink_white_light = false --disable positive lamp
		blink_red_light = true --start warning
	else --else turn off warning
		blink_red_light = false
	end

	if blink_red_light then
		red_light_blink_timer = red_light_blink_timer + cas
		if red_light_blink_timer > RED_LIGHT_LEFT_ON_TIME + RED_LIGHT_RIGHT_ON_TIME then
			red_light_blink_timer = 0
			red_light_blink_state = false
		elseif red_light_blink_timer > RED_LIGHT_LEFT_ON_TIME then
			red_light_blink_state = true
		else
			red_light_blink_state = false
		end
		Call("*:SetCrossingState",2)
	else
		red_light_blink_timer = 0
		Call("*:SetCrossingState",0)
	end

	if blink_white_light then
		white_light_blink_timer = white_light_blink_timer + cas
		if white_light_blink_timer > WHITE_LIGHT_ON_TIME + WHITE_LIGHT_OFF_TIME then
			white_light_blink_timer = 0
			white_light_blink_state = false
		elseif white_light_blink_timer > WHITE_LIGHT_ON_TIME then
			white_light_blink_state = true
		else
			white_light_blink_state = false
		end
	else
		white_light_blink_timer = 0
	end

	if blink_red_light then
		if red_light_blink_state then
			Call("crossing:ActivateNode","light_left_red",1)
			Call("crossing:ActivateNode","light_right_red",0)
			Call("red_left:Activate",1)
			Call("red_right:Activate",0)
			-- Print("Leve cervene sviti")
			-- Print("Prave cervene nesviti")
		else
			Call("crossing:ActivateNode","light_left_red",0)
			Call("crossing:ActivateNode","light_right_red",1)
			Call("red_left:Activate",0)
			Call("red_right:Activate",1)
			-- Print("Leve cervene nesviti")
			-- Print("Prave cervene sviti")
		end
	else
		Call("crossing:ActivateNode","light_left_red",0)
		Call("crossing:ActivateNode","light_right_red",0)
		Call("red_left:Activate",0)
		Call("red_right:Activate",0)
	end

	if blink_white_light and white_light_blink_state then
		Call("crossing:ActivateNode","light_down",1)
		Call("white:Activate",1)
		-- Print("Bile sviti")
	else
		Call("crossing:ActivateNode","light_down",0)
		Call("white:Activate",0)
		-- Print("Bile nesviti")
	end
end