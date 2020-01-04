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
NUMBER_OF_TRACKS = 1

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
	--we are actually not able to get track speed limit, so get the highest speed and pretend, that this is speed limit
		speedOnCrossing = math.max(speedOnCrossing, speed*3.6)

	--recalc length, where crossing should be at warning
        lenOfApproach = speedOnCrossing/3.6*CROSSING_CLOSE_TO_TRAIN_PASS
        -- Print("Activating distance: "..lenOfApproach)

	--if front distance did not passed crossing yet, then frontDistance is significant
		if frontDistance > 0 then
			trainDist = math.min(trainDist, frontDistance)
            -- Print("Train rear before crossing!")
	--if already did, then if train end did not passed yet, or did, but its nearer than 15 meters use backDistance as significant distance
		elseif backDistance >= -15 or trainDist >= -15 then
			trainDist = math.min(trainDist, backDistance)
            -- Print("Train rear passed crossing, train back did not!")
	--if significant train passed crossing, open it
		elseif trainDist < 0 then
			blink_red_light = false
            blink_white_light = false
            -- Print("Train behind crossing!")
			if backDistance < -lenOfApproach then
				blink_white_light = true
                -- Print("Train freed approaching section!")
			end
		end

	--if actual occupiing train is further than 15 meters after crossing, and there is another train, set this train distance as the occupative one
		if trainDist < -15 and frontDistance > 0 then
			trainDist = frontDistance
            -- Print("Another train incomming!")
        end
        
        -- Print("Front distance: "..frontDistance)
        -- Print("Back distance: "..backDistance)
        -- Print("Decisive train distance: "..trainDist)
        -- Print("Speed: "..speed)
        -- Print("")

	--if signif. train distance is smaller, than approaching length, and it is possitive, then close crossing
		if trainDist < lenOfApproach and trainDist > 0 then
			blink_white_light = false
			blink_red_light = true
		end
end

function Update(time)
	casUpdate = os.clock()
	cas = casUpdate - casUpdateLast
	casUpdateLast = casUpdate

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