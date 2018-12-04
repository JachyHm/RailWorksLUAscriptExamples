LZB = { --objekt LZB
	---------------LZB CONSTANTS---------------
		DECCEL_U = 0.25,
		DECCEL_M = 0.4,
		DECCEL_O = 0.5,
	---------------LZB VARIABLES---------------
		active = false,
		canBeActive = false,
		maxSpeed = 0,
		lastSpeedOfNextSignificantRestriction = 0,
		lastDistanceToNextSignificantRestriction = 0,
		distanceToNextSignificantRestriction = -1,
		speedOfNextSignificantRestriction = -1,
		targetSpeed = 200,
		restrictionsCount = 0,
		lastDistanceToRestriction = 0,
		minimalDistanceToBrake = 0,
		sourceSpeed = 0,
		metersFromLastRestriction = 0,
		blockedSpeedChangeCountdown = 0,
		koefDecceleration = 1,
		blockTraction = false,
		endZeroSpeedCountdown = -1,
		delayedSpeedEnterCountdown = -1,
		waitForZeroTractionBeforeTurnOff = false,
	---------------LZB FUNCTIONS---------------
		OnReceivedSignalMessage = function(self, message)
			if message == "LZBSTART" then
				LZB.canBeActive = true
				-- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now active!", 2, 0)
			elseif message == "LZBENDE" then
				LZB.blockTraction = true
				LZB.endZeroSpeedCountdown = 10
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
			Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
			LZB.targetSpeed = 10000
			Call("LZB_SPEED:SetText", "XXX", 0)
			Call("SetControlValue", "LZB_ACTIVE", 0, 0)
			LZB.active = false
			LZB.canBeActive = false
			LZB.blockTraction = false
		end,
		Update = function(self, deltaTime, deltaUpdateTimeFromGame, pomernyTah)
			if LZB.canBeActive and PZB90.on then
				LZB.active = true
				LZB.lastDistanceToRestriction = 0
				typeOfRestriction = 100
				LZB.restrictionsCount = 0
				LZB.lastSpeedOfNextSignificantRestriction = LZB.speedOfNextSignificantRestriction
				LZB.lastDistanceToNextSignificantRestriction = LZB.distanceToNextSignificantRestriction
				if LZB.endZeroSpeedCountdown > 0 then
					LZB.endZeroSpeedCountdown = LZB.endZeroSpeedCountdown - deltaTime
				else
					ARR:nastavCilovouRychlost(0)
					LZB.waitForZeroTractionBeforeTurnOff = true
					LZB.endZeroSpeedCountdown = -1
				end
				if LZB.delayedSpeedEnterCountdown > 0 then
					LZB.delayedSpeedEnterCountdown = LZB.delayedSpeedEnterCountdown - deltaTime
				else
					ARR:nastavCilovouRychlost(0)
					LZB.waitForZeroTractionBeforeTurnOff = true
					LZB.endZeroSpeedCountdownTimer = -1
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
				while typeOfRestriction > 0 and LZB.lastDistanceToRestriction < 10000 do
					if Call("GetControlValue", "Reverser", 0) > 0 then
						typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 0, LZB.lastDistanceToRestriction, 10000)
					elseif Call("GetControlValue", "Reverser", 0) < 0 then
						typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 1, LZB.lastDistanceToRestriction, 10000)
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
					-- if Call("GetControlValue", "Befehl40", 0) > 0.5 then
					-- 	Print("----------------")
					-- 	Print(typeOfRestriction)
					-- 	Print(restrictedSpeed)
					-- 	Print(distanceToRestriction)
					-- end
					LZB.lastDistanceToRestriction = distanceToRestriction + 1
				end
				if LZB.speedOfNextSignificantRestriction - LZB.lastSpeedOfNextSignificantRestriction > 1 or (LZB.distanceToNextSignificantRestriction - LZB.lastDistanceToNextSignificantRestriction > 1) then
					LZB.blockedSpeedChangeCountdown = 110
				end
				if LZB.speedOfNextSignificantRestriction < LZB.maxSpeed and LZB.distanceToNextSignificantRestriction ~= -1 then
					LZB.minimalDistanceToBrake = (LZB.sourceSpeed/3.6)*(LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction)/(3.6*LZB.koefDecceleration) - (LZB.koefDecceleration*((LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction)/(3.6*LZB.koefDecceleration))^2)/2
				else
					LZB.minimalDistanceToBrake = 0
				end
				if LZB.blockedSpeedChangeCountdown <= 0 then
					local trackMax = Call("GetCurrentSpeedLimit") * 3.6
					if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-100) and LZB.distanceToNextSignificantRestriction ~= -1 then
						LZB.maxSpeed = LZB.speedOfNextSignificantRestriction + ((LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction) * math.max(0, LZB.distanceToNextSignificantRestriction-100) / LZB.minimalDistanceToBrake)
						if trackMax < LZB.maxSpeed then
							Call("SetControlValue", "LZB_G_light", 0, 0)
							LZB.maxSpeed = math.min(trackMax, 200)
							LZB.targetSpeed = math.min(trackMax, 200)
						else
							Call("SetControlValue", "LZB_G_light", 0, 1)
							LZB.targetSpeed = LZB.speedOfNextSignificantRestriction
						end
					else
						Call("SetControlValue", "LZB_G_light", 0, 0)
						LZB.maxSpeed = math.min(trackMax, 200)
						-- LZB.sourceSpeed = Call("GetSpeed") * 3.6
						LZB.sourceSpeed = LZB.maxSpeed
						LZB.targetSpeed = math.min(trackMax, 200)
					end
				-- if Call("GetControlValue", "Frei", 0) > 0.5 then
				-- 	Print("----------------")
				-- 	Print(LZB.distanceToNextSignificantRestriction)
				-- 	Print(LZB.minimalDistanceToBrake)
				-- 	Print(LZB.speedOfNextSignificantRestriction)
				-- end
				else
					LZB.blockedSpeedChangeCountdown = LZB.blockedSpeedChangeCountdown - (Call("GetSpeed")*deltaUpdateTimeFromGame)
				end
				if LZB.distanceToNextSignificantRestriction ~= -1 then
					local typeOfRestriction, restrictedSpeed, distanceToRestriction = 0, 0, 0
					if Call("GetControlValue", "Reverser", 0) > 0 then
						typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 0, 0, 10000)
					elseif Call("GetControlValue", "Reverser", 0) < 0 then
						typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 1, 0, 10000)
					else
						typeOfRestriction = -1
						restrictedSpeed = 0
						distanceToRestriction = 0
					end
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, math.min(1, distanceToRestriction/4000))
				else
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 1)
				end

				while string.len(""..LZB.targetSpeed) < 3 do
					LZB.targetSpeed = "0"..LZB.targetSpeed
				end
				Call("LZB_SPEED:SetText", LZB.targetSpeed, 0)

				ARR:nastavRychlostLZB(math.max(LZB.maxSpeed-5, LZB.targetSpeed))
				Call("SetControlValue", "LZB_SPEED_DIAL", 0, math.min(1, LZB.maxSpeed/220))
				Call("SetControlValue", "PZB_ACTIVE", 0, 1)
			else
				Call("SetControlValue", "LZB_G_light", 0, 0)
				Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
				LZB.targetSpeed = 10000
				Call("LZB_SPEED:SetText", "XXX", 0)
				LZB.active = false
				LZB.blockTraction = false
			end
			Call("SetControlValue", "LZB_ACTIVE", 0, ToBolAndBack(LZB.active))
		end
}
