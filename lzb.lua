LZB = { --objekt LZB
	---------------LZB CONSTANTS---------------
		DECCEL_U = 0.25,
		DECCEL_M = 0.4,
		DECCEL_O = 0.5,
	---------------LZB VARIABLES---------------
		active = false,
		canBeActive = false,
		maxSpeed = 0,
		distanceToNextSignificantRestriction = -1,
		speedOfNextSignificantRestriction = -1,
		targetSpeed = 200,
        restrictionsCount = 0,
        lastDistanceToRestriction = 0,
		lastDistanceToSignificantRestriction = 0,
        minimalDistanceToBrake = 0,
        minimalTimeToBrake = 0,
		sourceSpeed = 0,
		metersFromLastRestriction = 0,
		blockedSpeedChangeCountdown = 0,
		koefDecceleration = 0.5,
        blockTraction = false,
        ARRblock = false,
		endZeroSpeedCountdown = -1,
		delayedSpeedEnterCountdown = -1,
        waitForZeroTractionBeforeTurnOff = false,
        startAfter = -1,
        emergencyBrake = false,
        befehlprogramStartupCountdown = 3,
        befehlprogram = false,
        befehlprogramConsistPassCountdown = -1,
        befehl5sCounter = 0,
	---------------LZB FUNCTIONS---------------
		OnReceivedSignalMessage = function(self, message)
            -- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB_debug_message", message, 2, 0)
            if message == "LZBSTART" then
                if not LZB.canBeActive then
                    LZB.startAfter = Call("GetConsistLength")
                end
                -- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now active!", 2, 0)
            elseif message == "LZBEND" or message == "LZBENDEDNOW" then
                if LZB.active then
                    Call("SetControlValue", "LZB_ENDE", 0, 1)
                    LZB.blockTraction = true
                    ARR:vybeh()
                    LZB.endZeroSpeedCountdown = 10
                else
                    LZB.startAfter = -1
                end
				-- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now not active!", 2, 0)
			end
		end,
		ConfirmLZBend = function(self)
			if LZB.endZeroSpeedCountdown > 0 then
				LZB.endZeroSpeedCountdown = -1
				LZB.delayedSpeedEnterCountdown = 2
			end
		end,
		ARRKeyPress = function(self)
			if LZB.delayedSpeedEnterCountdown > 0 then
				LZB.waitForZeroTractionBeforeTurnOff = true
				LZB.delayedSpeedEnterCountdown = -1
			end
		end,
		TurnOff = function(self)
            ARR:nastavRychlostLZB(10000)
            Call("SetControlValue", "LZB_G_light", 0, 0)
            Call("SetControlValue", "LZB_ENDE", 0, 0)
			Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
			LZB.targetSpeed = 200
			Call("LZB_SPEED:SetText", "XXX", 0)
			Call("SetControlValue", "LZB_ACTIVE", 0, 0)
			LZB.active = false
			LZB.canBeActive = false
            LZB.blockTraction = false
            LZB.befehlprogramStartupCountdown = -1
            LZB.befehlprogram = false
            LZB.befehlprogramConsistPassCountdown = -1
		end,
		Update = function(self, deltaTime, deltaUpdateTimeFromGame, pomernyTah)
			if LZB.canBeActive and PZB90.on and PZB90.startCountdown == -1 then
                LZB.active = true
                local reverser = Call("GetControlValue", "Reverser", 0)
                if reverser < 0.5 then
                    LZB.active = false
                end
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    if (reverser > 0.5 and Call("GetSpeed") < -0.1) or (reverser < -0.5 and Call("GetSpeed") > 0.1) or (reverser < 0.5 and reverser > -0.5) then
                        LZB.active = false
                        if PZB90.trainSpeed > 0.1 then
                            LZB.emergencyBrake = true
                            pomernyTah = -1
                            Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                        end
                    end
                elseif rizeniCab1 < 0.5 and rizeniCab2 > 0.5 then
                    if (reverser > 0.5 and Call("GetSpeed") > 0.1) or (reverser < -0.5 and Call("GetSpeed") < -0.1) or (reverser < 0.5 and reverser > -0.5) then
                        LZB.active = false
                        if PZB90.trainSpeed > 0.1 then
                            LZB.emergencyBrake = true
                            pomernyTah = -1
                            Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                        end
                    end
                else
                    LZB.active = false
                    if PZB90.trainSpeed > 0.1 then
                        LZB.emergencyBrake = true
                        pomernyTah = -1
                        Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                    end
                end
            end
            if LZB.active then
				LZB.lastDistanceToRestriction = 0
				typeOfRestriction = 100
				typeOfSignal = 100
				LZB.restrictionsCount = 0
				if LZB.endZeroSpeedCountdown > 0 then
					LZB.endZeroSpeedCountdown = LZB.endZeroSpeedCountdown - deltaTime
                elseif LZB.endZeroSpeedCountdown ~= -1 then
					ARR:nastavCilovouRychlost("ARR_rych0",1,0)
					LZB.waitForZeroTractionBeforeTurnOff = true
					LZB.endZeroSpeedCountdown = -1
				end
				if LZB.delayedSpeedEnterCountdown > 0 then
					LZB.delayedSpeedEnterCountdown = LZB.delayedSpeedEnterCountdown - deltaTime
				elseif LZB.delayedSpeedEnterCountdown ~= -1 then
					ARR:nastavCilovouRychlost("ARR_rych0",1,0)
					LZB.waitForZeroTractionBeforeTurnOff = true
					LZB.delayedSpeedEnterCountdown = -1
				end
				if LZB.waitForZeroTractionBeforeTurnOff and pomernyTah <= 0 then
					LZB.waitForZeroTractionBeforeTurnOff = false
					LZB:TurnOff()
					return(0)
				end					
				if PZB90.trainType == PZB90.LOW then
					LZB.koefDecceleration = LZB.DECCEL_U
				elseif PZB90.trainType == PZB90.MIDDLE then
					LZB.koefDecceleration = LZB.DECCEL_M
				elseif PZB90.trainType == PZB90.HIGH then
					LZB.koefDecceleration = LZB.DECCEL_O
				end
				--check for every speed restriction in next 10km and write them to array
				while (typeOfRestriction > 0 or typeOfSignal > 0) and LZB.lastDistanceToRestriction < 10000 do
					if Call("GetControlValue", "Reverser", 0) > 0 then
                        typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 0, LZB.lastDistanceToRestriction, 10000)
                        typeOfSignal, stateOfSignal, distanceToSignal = Call("GetNextRestrictiveSignal", 0, LZB.lastDistanceToRestriction, 10000)
                        if typeOfRestriction + typeOfSignal >= 0 and stateOfSignal == 2 and distanceToSignal < distanceToRestriction then
                            typeOfRestriction = 0
                            restrictedSpeed = 0
                            distanceToRestriction = distanceToSignal
                        end
					elseif Call("GetControlValue", "Reverser", 0) < 0 then
						typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 1, LZB.lastDistanceToRestriction, 10000)
                        typeOfSignal, stateOfSignal, distanceToSignal = Call("GetNextRestrictiveSignal", 1, LZB.lastDistanceToRestriction, 10000)
                        if typeOfRestriction + typeOfSignal >= 0 and stateOfSignal == 2 and distanceToSignal < distanceToRestriction then
                            typeOfRestriction = 0
                            restrictedSpeed = 0
                            distanceToRestriction = distanceToSignal
                        end
					else
                        typeOfRestriction = -1
                        restrictedSpeed = 200/3.6
                        distanceToRestriction = 10000
					end
					restrictedSpeed = restrictedSpeed * 3.6
					if typeOfRestriction >= 0 then
						if restrictedSpeed < LZB.sourceSpeed and restrictedSpeed < 200 then
							if LZB.restrictionsCount == 0 then
								LZB.speedOfNextSignificantRestriction = restrictedSpeed
								LZB.distanceToNextSignificantRestriction = distanceToRestriction
							elseif (LZB.distanceToNextSignificantRestriction == -1 or (LZB.distanceToNextSignificantRestriction-distanceToRestriction)+(LZB.speedOfNextSignificantRestriction-restrictedSpeed)*(5/LZB.koefDecceleration) > 0 and restrictedSpeed < LZB.speedOfNextSignificantRestriction) and restrictedSpeed < LZB.speedOfNextSignificantRestriction then
								LZB.speedOfNextSignificantRestriction = restrictedSpeed
								LZB.distanceToNextSignificantRestriction = distanceToRestriction
							end
							LZB.restrictionsCount = LZB.restrictionsCount + 1
						end
					elseif LZB.restrictionsCount == 0 then
						LZB.speedOfNextSignificantRestriction = 0
                        LZB.distanceToNextSignificantRestriction = -1
					end
					if Call("GetControlValue", "Befehl40", 0) > 0.5 then
                        SysCall("ScenarioManager:ShowAlertMessageExt", "LZB_debug_message", typeOfRestriction.."<br>"..restrictedSpeed.."<br>"..distanceToRestriction, 2, 0)
						Print("----------------")
						Print(typeOfRestriction)
						Print(restrictedSpeed)
						Print(distanceToRestriction)
					end
					LZB.lastDistanceToRestriction = distanceToRestriction + 1
				end
                if LZB.speedOfNextSignificantRestriction <= LZB.maxSpeed and LZB.distanceToNextSignificantRestriction ~= -1 then
                    LZB.minimalTimeToBrake = (LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction)/(3.6*LZB.koefDecceleration)
					LZB.minimalDistanceToBrake = (LZB.sourceSpeed/3.6)*LZB.minimalTimeToBrake - (LZB.koefDecceleration*LZB.minimalTimeToBrake^2)/2
				else
					LZB.minimalDistanceToBrake = 0
				end
                local trackMax = Call("GetCurrentSpeedLimit") * 3.6
                if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-0) and LZB.distanceToNextSignificantRestriction ~= -1 then
                    LZB.maxSpeed = math.sqrt((LZB.sourceSpeed/3.6)^2 - 2*LZB.koefDecceleration*(LZB.minimalDistanceToBrake-math.max(LZB.distanceToNextSignificantRestriction-25,0)))*3.6
                    -- LZB.maxSpeed = LZB.speedOfNextSignificantRestriction + ((LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction) * math.max(0, LZB.distanceToNextSignificantRestriction-10) / LZB.minimalDistanceToBrake)
                else
                    LZB.maxSpeed = math.min(trackMax, 200)
                    -- LZB.sourceSpeed = Call("GetSpeed") * 3.6
                    LZB.sourceSpeed = LZB.maxSpeed
                end
                local currentSpeed = Call("GetSpeed")
                if LZB.distanceToNextSignificantRestriction ~= -1 then
                    if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-(currentSpeed*18)) and currentSpeed*3.6 > LZB.maxSpeed - ((((currentSpeed*3.6)-10)/19)+10) then
                        LZB.ARRblock = true
                        ARR:vybeh()
                    elseif currentSpeed*3.6 < LZB.maxSpeed then
                        LZB.ARRblock = false
                    end
                    if trackMax < LZB.maxSpeed then
                        LZB.maxSpeed = math.min(trackMax, 200)
                        LZB.targetSpeed = round(math.min(trackMax, 200))
                    else
                        LZB.targetSpeed = round(LZB.speedOfNextSignificantRestriction)
                    end
                    --distance is smaller then 10sec - turn G light on
                    if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-(currentSpeed*36)) then
                        Call("SetControlValue", "LZB_G_light", 0, 1)
                    else
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                    end
                else
                    LZB.ARRblock = false
                    LZB.targetSpeed = round(math.min(trackMax, 200))
                    Call("SetControlValue", "LZB_G_light", 0, 0)
                end

                if Call("GetControlValue", "Frei", 0) > 0.5 then
                    SysCall("ScenarioManager:ShowAlertMessageExt", "LZB_debug_message", LZB.distanceToNextSignificantRestriction.."<br>"..LZB.minimalDistanceToBrake.."<br>"..LZB.speedOfNextSignificantRestriction, 2, 0)
                    Print("----------------")
                    Print(LZB.distanceToNextSignificantRestriction)
                    Print(LZB.minimalDistanceToBrake)
                    Print(LZB.speedOfNextSignificantRestriction)
                end
				if LZB.distanceToNextSignificantRestriction ~= -1 and (currentSpeed > 0.05 or math.abs(Call("GetControlValue", "LZB_DISTANCE_BAR", 0) - LZB.distanceToNextSignificantRestriction/4000) > 0.0025) then
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, math.min(1, LZB.distanceToNextSignificantRestriction/4000))
                elseif LZB.distanceToNextSignificantRestriction == -1 then
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 1)
                end

                if LZB.endZeroSpeedCountdown > 0 then
                    Call("SetControlValue", "LZB_ENDE", 0, 1)
                else
                    Call("SetControlValue", "LZB_ENDE", 0, 0)
                end

                if PZB90.befehlLever and LZB.befehlprogramStartupCountdown > 0 and math.abs(currentSpeed) < 0.05 and LZB.speedOfNextSignificantRestriction == 0 then
                    LZB.befehlprogramStartupCountdown = LZB.befehlprogramStartupCountdown - deltaTime
                    LZB.befehlprogram = false
					Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 2)
                elseif not PZB90.befehlLever and LZB.befehlprogramStartupCountdown > 0 then
                    LZB.befehlprogramStartupCountdown = 3
                    LZB.befehlprogram = false
					Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 0)
                elseif LZB.befehlprogramStartupCountdown < 0 then
                    LZB.befehlprogramStartupCountdown = -1
                    LZB.befehlprogram = true
                    LZB.befehlprogramConsistPassCountdown = Call("GetConsistLength")
                end

                if math.abs(LZB.distanceToNextSignificantRestriction - LZB.lastDistanceToSignificantRestriction) > 50 then
                    LZB.befehlprogram = false
                    LZB.befehlprogramStartupCountdown = 3
                end

                if LZB.befehlprogramConsistPassCountdown > 0 and not LZB.befehlprogram then
                    LZB.befehlprogramConsistPassCountdown = LZB.befehlprogramConsistPassCountdown - currentSpeed * deltaUpdateTimeFromGame
                elseif LZB.befehlprogramConsistPassCountdown < 0 then
                    LZB.befehlprogramConsistPassCountdown = -1
                end

                if LZB.befehlprogram or LZB.befehlprogramConsistPassCountdown > 0 then
                    LZB.befehl5sCounter = LZB.befehl5sCounter + deltaTime
                    if LZB.befehl5sCounter > 5 then
                        LZB.befehl5sCounter = 0
                        Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 1)
                    else
                        Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 0)
                    end
                    LZB.maxSpeed = 40
                    LZB.targetSpeed = 40
                end

                if not ARR.aktivni and currentSpeed*3.6 > LZB.maxSpeed+2 then
                    LZB.emergencyBrake = true
                elseif currentSpeed*3.6 < LZB.maxSpeed-2 or not ARR.aktivni then
                    LZB.emergencyBrake = false
                end

                if LZB.targetSpeed > 999 then
                    LZB.targetSpeed = 999
                end
				while string.len(""..LZB.targetSpeed) < 3 do
					LZB.targetSpeed = "0"..LZB.targetSpeed
				end
                Call("LZB_SPEED:SetText", LZB.targetSpeed, 0)
                
                if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-(currentSpeed*18)) and currentSpeed*3.6 > LZB.maxSpeed - ((((currentSpeed*3.6)-10)/19)+10) and not (LZB.befehlprogram or LZB.befehlprogramConsistPassCountdown > 0) then
                    ARR:nastavRychlostLZB(math.max(LZB.maxSpeed-5, LZB.targetSpeed)) --kompenzace necitlivosti ARR, brzdí na rychlost -5
                else
                    ARR:nastavRychlostLZB(math.max(LZB.maxSpeed, LZB.targetSpeed))
                end
                
				Call("SetControlValue", "LZB_SPEED_DIAL", 0, math.min(1, LZB.maxSpeed/220))
                Call("SetControlValue", "PZB_ACTIVE", 0, 1)
                
                LZB.lastDistanceToSignificantRestriction = LZB.distanceToNextSignificantRestriction
            else
                if LZB.startAfter > 0 then
                    LZB.startAfter = LZB.startAfter - (Call("GetSpeed")*deltaUpdateTimeFromGame)
                elseif LZB.startAfter ~= -1 then
                    LZB.startAfter = -1
                    LZB.canBeActive = true
                end
                if PZB90.startCountdown == -1 then
                    Call("SetControlValue", "LZB_ENDE", 0, 0)
                    Call("SetControlValue", "LZB_G_light", 0, 0)
                end
				Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
				LZB.targetSpeed = 200
				Call("LZB_SPEED:SetText", "XXX", 0)
				LZB.active = false
                LZB.blockTraction = false
                LZB.befehlprogramStartupCountdown = 3
                LZB.befehlprogram = false
                LZB.befehlprogramConsistPassCountdown = -1
                Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 0)
			end
			Call("SetControlValue", "LZB_ACTIVE", 0, ToBolAndBack(LZB.active))
		end
}