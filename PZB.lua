PZB90 = { --objekt PZB
	---------------PZB CONSTANTS---------------
		--trainType
			LOW = 0,
			MIDDLE = 1,
			HIGH = 2,
		--maxTrainSpeed
			LOW_SPEED = 105,
			MIDDLE_SPEED = 125,
			HIGH_SPEED = 165,
		--1000Hz standard speeds
			LOW_1000HZ_SPEED = 55,
			MIDDLE_1000HZ_SPEED = 70,
			HIGH_1000HZ_SPEED = 85,
		--1000Hz restricted speeds
			LOW_1000HZ_RESTRICTED_SPEED = 45,
			MIDDLE_1000HZ_RESTRICTED_SPEED = 45,
			HIGH_1000HZ_RESTRICTED_SPEED = 45,
		--500Hz standard speeds
			LOW_500HZ_SPEED = 25,
			MIDDLE_500HZ_SPEED = 35,
			HIGH_500HZ_SPEED = 45,
		--500Hz restricted speeds
			LOW_500HZ_RESTRICTED_SPEED = 25,
			MIDDLE_500HZ_RESTRICTED_SPEED = 25,
			HIGH_500HZ_RESTRICTED_SPEED = 25,
	---------------PZB VARIABLES---------------
		on = false,
		active = false,
		trainType = 2,
		maxTrainSpeed = 125,
		trainSpeed = 0,
		emergencyBrake = false,
		finalSpeed = 125,
		acknowledgeCountdown = -1,
		light55 = false,
		light55Inv = false,
		light70 = false,
		light70Inv = false,
		light85 = false,
		light85Inv = false,
		light1000Hz = false,
		light500Hz = false,
		lightBefehl = false,
		befehlLever = false,
		countdown1000HzLight = 0,
		countdown1000HzMonitoring = 0,
		slowdown1000HzCountdown = -1,
		restricted1000Hz = false,
		countdown500HzLight = 0,
		countdown500HzMonitoring = 0,
		slowdown500HzCountdown = -1,
		restricted500Hz = false,
		restricted500HzCounter = 0,
		blinkCounter = 0,
		emergencyBrakeReason = 0,
	---------------PZB FUNCTIONS---------------
		OnReceivedSignalMessage = function(self, message)
			if message == "500" then
				PZB90:Passing500Hz()
			elseif message == "1000" then
				PZB90:Passing1000Hz()
			elseif message == "2000" then
				PZB90:Passing2000Hz()
			end
		end,
		Passing500Hz = function(self)
			-- SysCall("ScenarioManager:ShowAlertMessageExt", "PZB90", "Passed 500Hz magnet!", 2, 0)
			if PZB90.active then
				if PZB90.countdown1000HzMonitoring > 0 then
					PZB90.countdown1000HzLight = 0
					PZB90.countdown1000HzMonitoring = 0
					PZB90.slowdown1000HzCountdown = 0
				end
				PZB90.countdown500HzLight = 250
				PZB90.countdown500HzMonitoring = 700
				PZB90.slowdown500HzCountdown = 153
			end
		end,
		Passing1000Hz = function(self)
			-- SysCall("ScenarioManager:ShowAlertMessageExt", "PZB90", "Passed 1000Hz magnet!", 2, 0)
			if PZB90.active then
				PZB90.acknowledgeCountdown = 4
				PZB90.countdown1000HzLight = 700
				PZB90.countdown1000HzMonitoring = 1250
				if PZB90.trainType == PZB90.LOW then
					PZB90.slowdown1000HzCountdown = 38
					if PZB90.trainSpeed < PZB90.LOW_1000HZ_RESTRICTED_SPEED then
						PZB90.restricted1000Hz = true
					end
				elseif PZB90.trainType == PZB90.MIDDLE then
					PZB90.slowdown1000HzCountdown = 29
					if PZB90.trainSpeed < PZB90.MIDDLE_1000HZ_RESTRICTED_SPEED then
						PZB90.restricted1000Hz = true
					end
				elseif PZB90.trainType == PZB90.HIGH then
					PZB90.slowdown1000HzCountdown = 23
					if PZB90.trainSpeed < PZB90.HIGH_1000HZ_RESTRICTED_SPEED then
						PZB90.restricted1000Hz = true
					end
				end
			end
		end,
		Passing2000Hz = function(self)
			-- SysCall("ScenarioManager:ShowAlertMessageExt", "PZB90", "Passed 2000Hz magnet!", 2, 0)
			if (not PZB90.befehlLever or PZB90.trainSpeed > 40) and PZB90.active then
				PZB90.emergencyBrake = true
				PZB90.emergencyBrakeReason = 2000
				Call("SetControlValue", "VykonPredTrCh", 0, -1)
				PomernyTah = -1
				Call("SetControlValue", "PomernyTah", 0, -1)
			end
		end,
		WachsamPressed = function(self)
			PZB90.acknowledgeCountdown = -1
		end,
		FreiPressed = function(self)
			if PZB90.countdown1000HzMonitoring > 0 and not PZB90.light1000Hz then
				PZB90.countdown1000HzMonitoring = 0
				PZB90.slowdown1000HzCountdown = -1
			elseif PZB90.countdown500HzMonitoring > 0 and not PZB90.light500Hz then
				PZB90.countdown500HzMonitoring = 0
				PZB90.slowdown500HzCountdown = -1
			end
			if PZB90.trainSpeed < 1 then
				if PZB90.emergencyBrake then
					PZB90.countdown500HzMonitoring = 700
					PZB90.slowdown500HzCountdown = 0
				end
				PZB90.emergencyBrake = false
				PZB90.emergencyBrakeReason = 0
			end
		end,
		SetBefehlLever = function(self, bool)
			PZB90.befehlLever = bool
		end,
		SetTrainType = function(self, type)
			if type == "U" then
				PZB90.trainType = PZB90.LOW
			elseif type == "M" then
				PZB90.trainType = PZB90.MIDDLE
			elseif type == "O" then
				PZB90.trainType = PZB90.HIGH
			end
		end,
		SetPZBOn = function(self)
			if not PZB90.on then
				PZB90.on = true
				PZB90.emergencyBrake = true
				Call("SetControlValue", "VykonPredTrCh", 0, -1)
				PomernyTah = -1
				Call("SetControlValue", "PomernyTah", 0, -1)
				PZB90.countdown500HzMonitoring = 700
				PZB90.slowdown500HzCountdown = 0
			end
		end,
		SetPZBOff = function(self)
			PZB90.on = false
			PZB90.emergencyBrake = false
		end,
		Update = function(self,deltaTime,deltaUpdateTimeFromGame)
			if PZB90.on and not LZB.active then
				PZB90.active = true
			else
				PZB90.active = false
			end
			PZB90.trainSpeed = math.abs(Call("GetSpeed") * 3.6)
			local reverser = Call("GetControlValue", "Reverser", 0)
			if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
				if (reverser > 0.5 and Call("GetSpeed") < -0.1) or (reverser < -0.5 and Call("GetSpeed") > 0.1) or (reverser < 0.5 and reverser > -0.5) then
					PZB90.active = false
					if PZB90.trainSpeed > 0.1 then
						PZB90.emergencyBrake = true
						Call("SetControlValue", "VykonPredTrCh", 0, -1)
						PomernyTah = -1
						Call("SetControlValue", "PomernyTah", 0, -1)
					end
				end
			elseif rizeniCab1 < 0.5 and rizeniCab2 > 0.5 then
				if (reverser > 0.5 and Call("GetSpeed") > 0.1) or (reverser < -0.5 and Call("GetSpeed") < -0.1) or (reverser < 0.5 and reverser > -0.5) then
					PZB90.active = false
					if PZB90.trainSpeed > 0.1 then
						PZB90.emergencyBrake = true
						Call("SetControlValue", "VykonPredTrCh", 0, -1)
						PomernyTah = -1
						Call("SetControlValue", "PomernyTah", 0, -1)
					end
				end
			else
				PZB90.active = false
				if PZB90.trainSpeed > 0.1 then
					PZB90.emergencyBrake = true
					Call("SetControlValue", "VykonPredTrCh", 0, -1)
					PomernyTah = -1
					Call("SetControlValue", "PomernyTah", 0, -1)
				end
			end
			if PZB90.active then
				local deltaMeters = Call("GetSpeed") * deltaUpdateTimeFromGame
				-----------------COUNTDOWNS-----------------
					if PZB90.countdown1000HzLight > 0 then
						PZB90.countdown1000HzLight = PZB90.countdown1000HzLight - deltaMeters
						if not PZB90.emergencyBrake and PZB90.acknowledgeCountdown == -1 then
							PZB90.light1000Hz = true
						end
					else
						PZB90.countdown1000HzLight = 0
						if not PZB90.emergencyBrake then
							PZB90.light1000Hz = false
						end
					end
					if PZB90.countdown1000HzMonitoring > 0 then
						PZB90.countdown1000HzMonitoring = PZB90.countdown1000HzMonitoring - deltaMeters
					else
						PZB90.countdown1000HzMonitoring = 0
						PZB90.restricted1000Hz = false
					end
					if PZB90.slowdown1000HzCountdown > 0 then
						PZB90.slowdown1000HzCountdown = PZB90.slowdown1000HzCountdown - deltaTime
					elseif PZB90.slowdown1000HzCountdown ~= -1 then
						PZB90.slowdown1000HzCountdown = 0
					end
					if PZB90.countdown500HzLight > 0 then
						PZB90.countdown500HzLight = PZB90.countdown500HzLight - deltaMeters
						if not PZB90.emergencyBrake then
							PZB90.light500Hz = true
						end
					else
						PZB90.countdown500HzLight = 0
						if not PZB90.emergencyBrake then
							PZB90.light500Hz = false
						end
					end
					if PZB90.countdown500HzMonitoring > 0 then
						PZB90.countdown500HzMonitoring = PZB90.countdown500HzMonitoring - deltaMeters
					else
						PZB90.countdown500HzMonitoring = 0
						PZB90.restricted500Hz = false
					end
					if PZB90.slowdown500HzCountdown > 0 then
						PZB90.slowdown500HzCountdown = PZB90.slowdown500HzCountdown - deltaTime
					elseif PZB90.slowdown500HzCountdown ~= -1 then
						PZB90.slowdown500HzCountdown = 0
					end
					if PZB90.acknowledgeCountdown > -1 then
						PZB90.acknowledgeCountdown = PZB90.acknowledgeCountdown - deltaTime
						if PZB90.acknowledgeCountdown < 0 then
							PZB90.emergencyBrake = true
							PZB90.acknowledgeCountdown = -1
						end
					end
				------------------COUNTERS------------------
					if PZB90.trainSpeed < 10 then
						PZB90.restricted500HzCounter = PZB90.restricted500HzCounter + deltaTime
					else
						PZB90.restricted500HzCounter = 0
					end
					PZB90.blinkCounter = PZB90.blinkCounter + deltaTime

				if (PZB90.restricted500HzCounter > 15 or PZB90.trainSpeed < 1) and PZB90.countdown500HzMonitoring > 0 then
					PZB90.restricted500Hz = true
					PZB90.slowdown500HzCountdown = 0
				end

				if PZB90.trainSpeed < 1 and PZB90.countdown1000HzMonitoring > 0 then
					PZB90.restricted1000Hz = true
					PZB90.slowdown1000HzCountdown = 0
				end

				if PZB90.trainType == PZB90.LOW then
					if PZB90.slowdown1000HzCountdown == 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown1000HzCountdown == -1 and PZB90.countdown1000HzMonitoring > 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
						end
					else
						PZB90.maxTrainSpeed = PZB90.LOW_SPEED
					end
				elseif PZB90.trainType == PZB90.MIDDLE then
					if PZB90.slowdown1000HzCountdown == 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_1000HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.MIDDLE_1000HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown1000HzCountdown == -1 and PZB90.countdown1000HzMonitoring > 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_1000HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.MIDDLE_1000HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_RESTRICTED_SPEED
						end
					else
						PZB90.maxTrainSpeed = PZB90.MIDDLE_SPEED
					end
				elseif PZB90.trainType == PZB90.HIGH then
					if PZB90.slowdown1000HzCountdown == 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_1000HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.HIGH_1000HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown1000HzCountdown == -1 and PZB90.countdown1000HzMonitoring > 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_1000HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.HIGH_1000HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted1000Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_RESTRICTED_SPEED
						end
					else
						PZB90.maxTrainSpeed = PZB90.HIGH_SPEED
					end
				end

				if PZB90.trainSpeed > PZB90.maxTrainSpeed then
					PZB90.emergencyBrake = true
				end

				-------------------LIGHTS-------------------
					if PZB90.trainType == PZB90.LOW and PZB90.countdown1000HzMonitoring == 0 and PZB90.countdown500HzMonitoring == 0 then
						PZB90.light55 = true
						PZB90.light55Inv = false
						PZB90.light70 = false
						PZB90.light70Inv = false
						PZB90.light85 = false
						PZB90.light85Inv = false
					elseif PZB90.trainType == PZB90.MIDDLE and PZB90.countdown1000HzMonitoring == 0 and PZB90.countdown500HzMonitoring == 0 then
						PZB90.light55 = false
						PZB90.light55Inv = false
						PZB90.light70 = true
						PZB90.light70Inv = false
						PZB90.light85 = false
						PZB90.light85Inv = false
					elseif PZB90.trainType == PZB90.HIGH and PZB90.countdown1000HzMonitoring == 0 and PZB90.countdown500HzMonitoring == 0 then
						PZB90.light55 = false
						PZB90.light55Inv = false
						PZB90.light70 = false
						PZB90.light70Inv = false
						PZB90.light85 = true
						PZB90.light85Inv = false
					end
					if PZB90.blinkCounter > 0.5 then
						PZB90.blinkCounter = 0
						if PZB90.trainType == PZB90.LOW and ((PZB90.countdown1000HzMonitoring > 0 and not PZB90.restricted1000Hz) or (PZB90.countdown500HzMonitoring > 0 and not PZB90.restricted500Hz)) and PZB90.acknowledgeCountdown == -1 then
							PZB90.light55 = PZB90.light55Inv
							PZB90.light55Inv = (not PZB90.light55Inv)
							PZB90.light70 = false
							PZB90.light70Inv = false
							PZB90.light85 = false
							PZB90.light85Inv = false
						end
						if PZB90.trainType == PZB90.MIDDLE and ((PZB90.countdown1000HzMonitoring > 0 and not PZB90.restricted1000Hz) or (PZB90.countdown500HzMonitoring > 0 and not PZB90.restricted500Hz)) and PZB90.acknowledgeCountdown == -1 then
							PZB90.light55 = false
							PZB90.light55Inv = false
							PZB90.light70 = PZB90.light70Inv
							PZB90.light70Inv = (not PZB90.light70Inv)
							PZB90.light85 = false
							PZB90.light85Inv = false
						end
						if PZB90.trainType == PZB90.HIGH and ((PZB90.countdown1000HzMonitoring > 0 and not PZB90.restricted1000Hz) or (PZB90.countdown500HzMonitoring > 0 and not PZB90.restricted500Hz)) and PZB90.acknowledgeCountdown == -1 then
							PZB90.light55 = false
							PZB90.light55Inv = false
							PZB90.light70 = false
							PZB90.light70Inv = false
							PZB90.light85 = PZB90.light85Inv
							PZB90.light85Inv = (not PZB90.light85Inv)
						end
						if PZB90.restricted1000Hz or PZB90.restricted500Hz then
							PZB90.light55 = false
							PZB90.light55Inv = false
							PZB90.light70 = PZB90.light85
							PZB90.light70Inv = (not PZB90.light85)
							PZB90.light85 = (not PZB90.light85)
							PZB90.light85Inv = (not PZB90.light85)
						end
						if PZB90.emergencyBrakeReason == 1000 then
							PZB90.light1000Hz = (not PZB90.light1000Hz)
						elseif PZB90.emergencyBrakeReason == 500 then
							PZB90.light500Hz = (not PZB90.light500Hz)
						end
					end

					PZB90.lightBefehl = PZB90.befehlLever

					if PZB90.emergencyBrake then
						if PZB90.emergencyBrakeReason == 0 then
							if PZB90.countdown1000HzMonitoring > 0 then
								PZB90.emergencyBrakeReason = 1000
							elseif PZB90.countdown500HzMonitoring > 0 then
								PZB90.emergencyBrakeReason = 500
							end
						end
						PZB90.light55 = false
						PZB90.light55Inv = false
						PZB90.light70 = false
						PZB90.light70Inv = false
						PZB90.light85 = false
						PZB90.light85Inv = false
						if PZB90.emergencyBrakeReason == 1000 then
							PZB90.light500Hz = false
						elseif PZB90.emergencyBrakeReason == 500 then
							PZB90.light1000Hz = false
						end
					end

					if PZB90.light55 then
						Call("SetControlValue", "PZB55", 0, 1)
					elseif PZB90.light55Inv then
						Call("SetControlValue", "PZB55", 0, 2)
					else
						Call("SetControlValue", "PZB55", 0, 0)
					end
					if PZB90.light70 then
						Call("SetControlValue", "PZB70", 0, 1)
					elseif PZB90.light70Inv then
						Call("SetControlValue", "PZB70", 0, 2)
					else
						Call("SetControlValue", "PZB70", 0, 0)
					end
					if PZB90.light85 then
						Call("SetControlValue", "PZB85", 0, 1)
					elseif PZB90.light85Inv then
						Call("SetControlValue", "PZB85", 0, 2)
					else
						Call("SetControlValue", "PZB85", 0, 0)
					end
					Call("SetControlValue", "PZB_BEFEHL", 0, ToBolAndBack(PZB90.lightBefehl))
					Call("SetControlValue", "PZB500HZ", 0, ToBolAndBack(PZB90.light500Hz))
					Call("SetControlValue", "PZB1000HZ", 0, ToBolAndBack(PZB90.light1000Hz))
					Call("SetControlValue", "PZB_ACTIVE", 0, 1)

				if PZB90.slowdown1000HzCountdown == 0 then
					PZB90.slowdown1000HzCountdown = -1
				end
				if PZB90.slowdown500HzCountdown == 0 then
					PZB90.slowdown500HzCountdown = -1
				end

				if PZB90.emergencyBrake then
					Call("SetControlValue", "VykonPredTrCh", 0, -1)
					PomernyTah = -1
					Call("SetControlValue", "PomernyTah", 0, -1)
				end
			else
				PZB90.light500Hz = false
				PZB90.light1000Hz = false
				PZB90.slowdown1000HzCountdown = -1
				PZB90.slowdown500HzCountdown = -1
				PZB90.countdown1000HzLight = 0
				PZB90.countdown1000HzMonitoring = 0
				PZB90.countdown500HzLight = 0
				PZB90.countdown500HzMonitoring = 0
				if not LZB.active then
					Call("SetControlValue", "PZB_ACTIVE", 0, 0)
				end
				Call("SetControlValue", "PZB_BEFEHL", 0, 0)
				Call("SetControlValue", "PZB500HZ", 0, 0)
				Call("SetControlValue", "PZB1000HZ", 0, 0)
				Call("SetControlValue", "PZB55", 0, 0)
				Call("SetControlValue", "PZB70", 0, 0)
				Call("SetControlValue", "PZB85", 0, 0)
			end
			if PZB90.emergencyBrake then
				Call("SetControlValue", "PZB_EMERGENCY", 0, 1)
			else
				Call("SetControlValue", "PZB_EMERGENCY", 0, 0)
			end
		end
}
