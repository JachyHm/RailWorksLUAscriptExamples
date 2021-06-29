close_crossing = false
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
--barrier animation frames count
NUM_FRAMES = 181
FRAME_RATE = 30
ANIM_TIME = (NUM_FRAMES-1)/FRAME_RATE
ANIM_SPEED = 1

barrierTime = 0

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

timeUpdateLast = os.clock()
time = 0

trainDist = -100

function Initialise()
	Call("BeginUpdate")
	Call("crossing:ActivateNode","light_left_red",0)
	Call("crossing:ActivateNode","light_right_red",0)
	Call("crossing:ActivateNode","light_down",0)
	Call("red_left:Activate",0)
	Call("red_right:Activate",0)
	Call("white:Activate",0)
end

function OnConsistApproach(frontDistance,backDistance,speed)
	--we are actually not able to get track speed limit, so get the highest speed and preten, that this is speed limit
		speedOnCrossing = math.max(speedOnCrossing, speed*3.6)

	--recalc length, where crossing should be at warning
		lenOfApproach = speedOnCrossing/3.6*CROSSING_CLOSE_TO_TRAIN_PASS

	--if front distance did not passed crossing yet, than frontDistance is significant
		if frontDistance > 0 then
			trainDist = math.min(trainDist, frontDistance)
	--if already did, then if train end did not passed yet, or did, but its nearer than 15 meters use backDistance as significant distance
		elseif backDistance >= -15 or trainDist >= -15 then
			trainDist = math.min(trainDist, backDistance)
	--if significant train passed crossing, open it
		elseif trainDist < 0 then
            close_crossing = false
			blink_white_light = true
			if backDistance < -lenOfApproach then
				blink_white_light = true
			end
		end

	--if actual occupiing train is further than 15 meters after crossing, and there is another train, set this train distance as the occupative one
		if trainDist < -15 and frontDistance > 0 then
			trainDist = frontDistance
		end

	--if signif. train distance is smaller, than approaching length, and it is possitive, then close crossing
		if trainDist < lenOfApproach and trainDist > 0 then
            close_crossing = true
			blink_white_light = false
            close_crossing = false
		end
end

function Update(timeGame)
	timeUpdate = os.clock()
	time = timeUpdate - timeUpdateLast
    timeUpdateLast = timeUpdate
    
    if close_crossing then
        blink_red_light = true
        barrierTime = math.min(barrierTime+(time*ANIM_SPEED), ANIM_TIME)
    else
        barrierTime = math.max(barrierTime-(time*ANIM_SPEED), 0)
        if barrierTime > 0.9*ANIM_TIME then
            blink_red_light = false
        end
    end

	if blink_red_light then
		red_light_blink_timer = red_light_blink_timer + time
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
		white_light_blink_timer = white_light_blink_timer + time
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
    
    Call("barrier:SetTime", "barrier", barrierTime)
end