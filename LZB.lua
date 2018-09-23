LZB = { --objekt LZB
	---------------LZB CONSTANTS---------------
	---------------LZB VARIABLES---------------
		active = false,
		maxSpeed = 0,
		distanceToNextSignificantRestriction = -1,
		speedOfNextSignificantRestriction = -1,
		restrictionsCount = 0,
		lastDistanceToRestriction = 0,
		minimalDistanceToBrake = 0,
		sourceSpeed = 0,
	---------------LZB FUNCTIONS---------------
		OnReceivedSignalMessage = function(self, message)
			if message == "LZBSTART" then
				LZB.active = true
				-- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now active!", 2, 0)
			elseif message == "LZBSTOP" then
				LZB.active = false
				-- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now deactive!", 2, 0)
			end
		end,
		Update = function(self)
			if LZB.active then
				LZB.lastDistanceToRestriction = 0
				typeOfRestriction = 100
				LZB.restrictionsCount = 0
				--check for every speed restriction in next 10km and write them to array
				while typeOfRestriction > 0 and LZB.lastDistanceToRestriction < 10000 do
					typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 0, LZB.lastDistanceToRestriction, 10000)
					restrictedSpeed = restrictedSpeed * 3.6
					if typeOfRestriction >= 0 and restrictedSpeed < LZB.sourceSpeed then
						if LZB.restrictionsCount == 0 then
							LZB.speedOfNextSignificantRestriction = restrictedSpeed
							LZB.distanceToNextSignificantRestriction = distanceToRestriction
						elseif LZB.distanceToNextSignificantRestriction == -1 or (distanceToRestriction-LZB.distanceToNextSignificantRestriction)+(restrictedSpeed-LZB.speedOfNextSignificantRestriction)*10 > 0 and restrictedSpeed < LZB.speedOfNextSignificantRestriction then
							LZB.speedOfNextSignificantRestriction = restrictedSpeed
							LZB.distanceToNextSignificantRestriction = distanceToRestriction
						end
						LZB.restrictionsCount = LZB.restrictionsCount + 1
					elseif LZB.restrictionsCount == 0 then
						LZB.speedOfNextSignificantRestriction = 0
						LZB.distanceToNextSignificantRestriction = -1
					end
					LZB.lastDistanceToRestriction = distanceToRestriction + 1
				end
				if LZB.speedOfNextSignificantRestriction < LZB.maxSpeed and LZB.distanceToNextSignificantRestriction ~= -1 then
					LZB.minimalDistanceToBrake = LZB.sourceSpeed * (LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction) / 3.6 - (3.6 * ((LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction) / 3.6)^2) / 2
				else
					LZB.minimalDistanceToBrake = 0
				end
				local trackMax = Call("GetCurrentSpeedLimit") * 3.6
				if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-10) and LZB.distanceToNextSignificantRestriction ~= -1 then
					LZB.maxSpeed = LZB.speedOfNextSignificantRestriction + ((LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction) * math.max(0, LZB.distanceToNextSignificantRestriction-10) / LZB.minimalDistanceToBrake)
					if trackMax < LZB.maxSpeed then
						Call("SetControlValue", "LZB_G_light", 0, 0)
						LZB.maxSpeed = trackMax
					else
						Call("SetControlValue", "LZB_G_light", 0, 1)
					end
				else
					Call("SetControlValue", "LZB_G_light", 0, 0)
					LZB.maxSpeed = trackMax
					LZB.sourceSpeed = Call("GetSpeed") * 3.6
				end
				if Call("GetControlValue", "Befehl40", 0) > 0.5 then
					Print("----------------")
					Print(LZB.distanceToNextSignificantRestriction)
					Print(LZB.minimalDistanceToBrake)
					Print(LZB.speedOfNextSignificantRestriction)
				end
				if LZB.distanceToNextSignificantRestriction ~= -1 then
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, math.min(1, LZB.distanceToNextSignificantRestriction/4000))
				else
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 1)
				end

				ARR:nastavRychlostLZB(LZB.maxSpeed, true)
				Call("SetControlValue", "LZB_SPEED_DIAL", 0, math.min(1, LZB.maxSpeed/200))
			else
				Call("SetControlValue", "LZB_G_light", 0, 0)
				Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
			end
			Call("SetControlValue", "LZB_ACTIVE", 0, ToBolAndBack(LZB.active))
		end
}
function Update(deltaUpdateTimeFromGame)
	deltaTime = math.abs(os.clock() - casMinuly)
	casMinuly = os.clock()
	if math.abs(deltaTime-deltaUpdateTimeFromGame) > 1 then
		deltaTime = deltaUpdateTimeFromGame
	end
  --------------LZB-------------------
		LZB:Update()
end
function OnCustomSignalMessage ( Parameter )
	LZB:OnReceivedSignalMessage(Parameter)
end
