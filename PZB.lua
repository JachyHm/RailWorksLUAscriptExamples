PZB90 = { --objekt PZB
	---------------PZB CONSTANTS---------------
		--trainType
			LOW = 0,
			MIDDLE = 1,
			HIGH = 2,
		--maxTrainSpeed - warning
			LOW_SPEED = 105,
			MIDDLE_SPEED = 125,
            HIGH_SPEED = 165,
        --maxTrainSpeed - emergency
            LOW_EMERGENCY_APPLY_SPEED = 109,
            MIDDLE_EMERGENCY_APPLY_SPEED = 129,
            HIGH_EMERGENCY_APPLY_SPEED = 169,
        --2000Hz restricted speeds
            LOW_2000HZ_RESTRICTED_SPEED = 15,
            MIDDLE_2000HZ_RESTRICTED_SPEED = 15,
            HIGH_2000HZ_RESTRICTED_SPEED = 15,
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
		STARTUP_TIME = 30,
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
        lightS = false,
		befehlLever = false,
		countdown1000HzLight = 0,
		countdown1000HzMonitoring = 0,
		slowdown1000HzCountdown = -1,
		restricted1000Hz = false,
		countdown500HzLight = 0,
		countdown500HzMonitoring = 0,
		slowdown500HzCountdown = -1,
		restricted500Hz = false,
		restrictedCounter = 0,
		blinkCounter = 0,
		emergencyBrakeReason = 0,
        startCountdown = 30,
        startSelfTestPosition = 0,
        startProgram = true,
        displayRestriction = false,
        restrictionToConfirm = {
            type = 0,
            countdownLight = 0,
            countdownMonitoring = 0,
            countdownSlowdown = 0
        },
        oneSecBeforeMagnetDisplaying = 0,
        overspeedEmergencyBrakeApplySpeed = 0,
        overspeedEmergencyBrakeReleaseSpeed = 0,
        warningDisplaySpeed = 0,
        overspeedWarning = false,
        overspeedEmergencyApplied = false,
        countdownBefehl40 = 0,
		befreiungCounter = -1,
	---------------PZB FUNCTIONS---------------
		OnReceivedSignalMessage = function(self, message)
			if message == "500" or message == "PZB500" then
				PZB90:Passing500Hz()
			elseif message == "1000" or message == "PZB1000" then
				PZB90:Passing1000Hz()
			elseif message == "2000" or message == "PZB2000" then
				PZB90:Passing2000Hz()
			end
		end,
		Passing500Hz = function(self)
			-- SysCall("ScenarioManager:ShowAlertMessageExt", "PZB90", "Passed 500Hz magnet!", 2, 0)
            if PZB90.active then
                if PZB90.befreiungCounter > 0 then
                    PZB90.emergencyBrake = true
                    PZB90.lightS = true
                    PZB90.emergencyBrakeReason = 500
                    PZB90.countdown500HzLight = 250
                    PZB90.countdown500HzMonitoring = 700
                    PZB90.slowdown500HzCountdown = 0
                    PZB90.restricted500Hz = true
                else
                    PZB90.countdown500HzLight = 250
                    PZB90.countdown500HzMonitoring = 700
                    PZB90.slowdown500HzCountdown = 153
                    if PZB90.restricted1000Hz or PZB90.restricted500Hz then
                        PZB90.restricted500Hz = true
                    else
                        PZB90.restricted500Hz = false
                    end
                end
                PZB90.countdown1000HzLight = 0
                PZB90.slowdown1000HzCountdown = -1
                PZB90.countdown1000HzMonitoring = 0
                PZB90.restricted1000Hz = false
			end
		end,
		Passing1000Hz = function(self)
			-- SysCall("ScenarioManager:ShowAlertMessageExt", "PZB90", "Passed 1000Hz magnet!", 2, 0)
			if PZB90.active then
                PZB90.acknowledgeCountdown = 4
                PZB90.restrictionToConfirm.type = 1000
                PZB90.restrictionToConfirm.countdownLight = 700
                PZB90.restrictionToConfirm.countdownMonitoring = 1250
                if PZB90.restricted1000Hz or PZB90.restricted500Hz then
                    PZB90.restrictionToConfirm.restricted = true
                else
                    PZB90.restrictionToConfirm.restricted = false
                end
				if PZB90.trainType == PZB90.LOW then
					PZB90.restrictionToConfirm.countdownSlowdown = 38
					-- if PZB90.trainSpeed < PZB90.LOW_1000HZ_RESTRICTED_SPEED then
					-- 	PZB90.restricted1000Hz = true
					-- end
				elseif PZB90.trainType == PZB90.MIDDLE then
					PZB90.restrictionToConfirm.countdownSlowdown = 29
					-- if PZB90.trainSpeed < PZB90.MIDDLE_1000HZ_RESTRICTED_SPEED then
					-- 	PZB90.restricted1000Hz = true
					-- end
				elseif PZB90.trainType == PZB90.HIGH then
					PZB90.restrictionToConfirm.countdownSlowdown = 23
					-- if PZB90.trainSpeed < PZB90.HIGH_1000HZ_RESTRICTED_SPEED then
					-- 	PZB90.restricted1000Hz = true
					-- end
				end
			end
		end,
		Passing2000Hz = function(self)
			-- SysCall("ScenarioManager:ShowAlertMessageExt", "PZB90", "Passed 2000Hz magnet!", 2, 0)
			if (not PZB90.befehlLever or PZB90.trainSpeed > 40) and PZB90.active then
				PZB90.emergencyBrake = true
                PZB90.lightS = true
                PZB90.emergencyBrakeReason = 2000
                PZB90.countdown1000HzLight = 0
                PZB90.slowdown1000HzCountdown = -1
                PZB90.countdown1000HzMonitoring = 0
                PZB90.restricted1000Hz = false
                PZB90.countdown500HzLight = 0
                PZB90.countdown500HzMonitoring = 0
                PZB90.slowdown500HzCountdown = -1
                PZB90.restricted500Hz = false
                PZB90.lightS = true
                pomernyTah = -1
                Call("SetControlValue", "PomernyTah", 0, pomernyTah)
            elseif PZB90.active then
                PZB90.countdownBefehl40 = 5
			end
		end,
        WachsamPressed = function(self)
            if PZB90.acknowledgeCountdown > 0 then
                PZB90.acknowledgeCountdown = -1
                PZB90.displayRestriction = true
                if (PZB90.countdown1000HzLight > 0 and PZB90.restrictionToConfirm.type == 1000) or (PZB90.countdown500HzLight > 0 and PZB90.restrictionToConfirm.type == 500) then
                    PZB90.oneSecBeforeMagnetDisplaying = 0.5
                end
                PZB90.countdown1000HzLight = 0
                PZB90.slowdown1000HzCountdown = -1
                PZB90.countdown1000HzMonitoring = 0
                PZB90.restricted1000Hz = false
                PZB90.countdown500HzLight = 0
                PZB90.countdown500HzMonitoring = 0
                PZB90.slowdown500HzCountdown = -1
                PZB90.restricted500Hz = false
                if PZB90.restrictionToConfirm.type == 1000 then
                    PZB90.countdown1000HzLight = PZB90.restrictionToConfirm.countdownLight
                    PZB90.countdown1000HzMonitoring = PZB90.restrictionToConfirm.countdownMonitoring
                    if PZB90.slowdown1000HzCountdown == -1 then
                        PZB90.slowdown1000HzCountdown = PZB90.restrictionToConfirm.countdownSlowdown
                    end
                    PZB90.restricted1000Hz = PZB90.restrictionToConfirm.restricted
                    PZB90.restricted500Hz = PZB90.restrictionToConfirm.restricted
                end
                PZB90.restrictionToConfirm.countdownLight = -1
                PZB90.restrictionToConfirm.countdownMonitoring = -1
            end
		end,
        FreiPressed = function(self)
            if PZB90.countdown1000HzMonitoring > 0 and not PZB90.emergencyBrake and PZB90.displayRestriction and PZB90.countdown1000HzLight == 0 then
                PZB90.countdown1000HzMonitoring = 0
                PZB90.slowdown1000HzCountdown = -1
				PZB90.befreiungCounter = 600
            elseif PZB90.countdown500HzMonitoring > 0 and not PZB90.emergencyBrake and PZB90.displayRestriction and PZB90.countdown500HzLight == 0 then
                PZB90.countdown500HzMonitoring = 0
                PZB90.slowdown500HzCountdown = -1
            end
			if PZB90.trainSpeed < 1 then
                if PZB90.emergencyBrake and not PZB90.startProgram then
                    if PZB90.emergencyBrakeReason == 1000 then
                        PZB90.slowdown1000HzCountdown = 0
                        PZB90.restricted1000Hz = true
                    elseif PZB90.emergencyBrakeReason == 500 then
                        PZB90.slowdown500HzCountdown = 0
                        PZB90.restricted500Hz = true
                    end
                end
                if PZB90.startCountdown <= 0 then
                    PZB90.displayRestriction = true
                    PZB90.lightS = false
                    PZB90.emergencyBrake = false
                    PZB90.emergencyBrakeReason = 0
                end
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
                pomernyTah = -1
				Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                PZB90.startProgram = true
			end
		end,
		SetPZBOff = function(self)
			PZB90.on = false
            PZB90.active = false
            PZB90.trainSpeed = 0
            PZB90.emergencyBrake = false
            PZB90.acknowledgeCountdown = -1
            PZB90.light55 = false
            PZB90.light55Inv = false
            PZB90.light70 = false
            PZB90.light70Inv = false
            PZB90.light85 = false
            PZB90.light85Inv = false
            PZB90.light1000Hz = false
            PZB90.light500Hz = false
            PZB90.lightBefehl = false
            PZB90.lightS = false
            PZB90.befehlLever = false
            PZB90.countdown1000HzLight = 0
            PZB90.countdown1000HzMonitoring = 0
            PZB90.slowdown1000HzCountdown = -1
            PZB90.restricted1000Hz = false
            PZB90.countdown500HzLight = 0
            PZB90.countdown500HzMonitoring = 0
            PZB90.slowdown500HzCountdown = -1
            PZB90.restricted500Hz = false
            PZB90.restrictedCounter = 0
            PZB90.emergencyBrakeReason = 0
            PZB90.startCountdown = PZB90.STARTUP_TIME
            PZB90.startSelfTestPosition = 0
            PZB90.startProgram = true
            PZB90.displayRestriction = false
            PZB90.oneSecBeforeMagnetDisplaying = 0
            PZB90.overspeedWarning = false
            PZB90.overspeedEmergencyApplied = false
            PZB90.countdownBefehl40 = 0
			PZB90.befreiungCounter = -1
		end,
		Update = function(self,deltaTime,deltaUpdateTimeFromGame)
			if PZB90.on then
				if not LZB.active and PZB90.startCountdown <= 0 then
					PZB90.active = true
				else
					PZB90.active = false
				end
				if PZB90.startCountdown > 0 then
					PZB90.startCountdown = PZB90.startCountdown - deltaTime
					PZB90.emergencyBrake = true
                    pomernyTah = -1
                    Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                elseif PZB90.startCountdown ~= -1 then
                    PZB90.light500Hz = false
                    PZB90.light1000Hz = false
                    Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                    Call("SetControlValue", "PZB500HZ", 0, 0)
                    Call("SetControlValue", "PZB1000HZ", 0, 0)
                    Call("SetControlValue", "PZB55", 0, 0)
                    Call("SetControlValue", "PZB70", 0, 0)
                    Call("SetControlValue", "PZB85", 0, 0)
                    Call("SetControlValue", "PZB_S_light", 0, 0)
					PZB90.startCountdown = -1
				end
                local reverser = Call("GetControlValue", "Reverser", 0)
                if reverser < 0.5 then
                    PZB90.active = false
                end
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    if (reverser > 0.5 and Call("GetSpeed") < -5) or (reverser < -0.5 and Call("GetSpeed") > 5) or (reverser < 0.5 and reverser > -0.5) then
                        PZB90.active = false
                        if PZB90.trainSpeed > 0.1 then
                            PZB90.emergencyBrake = true
                            PZB90.lightS = true
                            pomernyTah = -1
                            Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                        end
                    end
                elseif rizeniCab1 < 0.5 and rizeniCab2 > 0.5 then
                    if (reverser > 0.5 and Call("GetSpeed") > 5) or (reverser < -0.5 and Call("GetSpeed") < -5) or (reverser < 0.5 and reverser > -0.5) then
                        PZB90.active = false
                        if PZB90.trainSpeed > 0.1 then
                            PZB90.emergencyBrake = true
                            PZB90.lightS = true
                            pomernyTah = -1
                            Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                        end
                    end
                else
                    PZB90.active = false
                    if PZB90.trainSpeed > 0.1 then
                        PZB90.emergencyBrake = true
                        PZB90.lightS = true
                        pomernyTah = -1
                        Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                    end
                end
			else
                PZB90.active = false
                PZB90.trainSpeed = 0
                PZB90.emergencyBrake = false
                PZB90.acknowledgeCountdown = -1
                PZB90.light55 = false
                PZB90.light55Inv = false
                PZB90.light70 = false
                PZB90.light70Inv = false
                PZB90.light85 = false
                PZB90.light85Inv = false
                PZB90.light1000Hz = false
                PZB90.light500Hz = false
                PZB90.lightBefehl = false
                PZB90.lightS = false
                PZB90.befehlLever = false
                PZB90.countdown1000HzLight = 0
                PZB90.countdown1000HzMonitoring = 0
                PZB90.slowdown1000HzCountdown = -1
                PZB90.restricted1000Hz = false
                PZB90.countdown500HzLight = 0
                PZB90.countdown500HzMonitoring = 0
                PZB90.slowdown500HzCountdown = -1
                PZB90.restricted500Hz = false
                PZB90.restrictedCounter = 0
                PZB90.emergencyBrakeReason = 0
                PZB90.startCountdown = PZB90.STARTUP_TIME
                PZB90.startSelfTestPosition = 0
                PZB90.startProgram = true
                PZB90.displayRestriction = false
                PZB90.oneSecBeforeMagnetDisplaying = 0
                PZB90.overspeedWarning = false
                PZB90.overspeedEmergencyApplied = false
                PZB90.countdownBefehl40 = 0
				PZB90.befreiungCounter = -1
			end
			PZB90.trainSpeed = math.abs(Call("GetSpeed") * 3.6)
			if PZB90.active then
                local deltaMeters = 0
                if Call("GetControlValue", "RizeniCab1", 0) > 0.5 then
                    deltaMeters = Call("GetSpeed") * deltaUpdateTimeFromGame
                elseif Call("GetControlValue", "RizeniCab2", 0) > 0.5 then
                    deltaMeters = -Call("GetSpeed") * deltaUpdateTimeFromGame
                end
				-----------------COUNTDOWNS-----------------
                    if PZB90.countdown1000HzLight > 0 then
						PZB90.countdown1000HzLight = PZB90.countdown1000HzLight - deltaMeters
						if not PZB90.emergencyBrake and PZB90.displayRestriction and PZB90.oneSecBeforeMagnetDisplaying == 0 then
							PZB90.light1000Hz = true
                        elseif not PZB90.emergencyBrake and PZB90.displayRestriction and PZB90.oneSecBeforeMagnetDisplaying ~= 0 then
                            PZB90.light1000Hz = false
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
						if not PZB90.emergencyBrake and PZB90.displayRestriction and PZB90.oneSecBeforeMagnetDisplaying == 0 then
							PZB90.light500Hz = true
                        elseif not PZB90.emergencyBrake and PZB90.displayRestriction and PZB90.oneSecBeforeMagnetDisplaying ~= 0 then
                            PZB90.light500Hz = false
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
                            PZB90.lightS = true
							PZB90.acknowledgeCountdown = -1
                            PZB90.countdown1000HzLight = 0
                            PZB90.slowdown1000HzCountdown = -1
                            PZB90.countdown1000HzMonitoring = 0
                            PZB90.restricted1000Hz = false
                            PZB90.countdown500HzLight = 0
                            PZB90.countdown500HzMonitoring = 0
                            PZB90.slowdown500HzCountdown = -1
                            PZB90.restricted500Hz = false
                            if PZB90.restrictionToConfirm.type == 1000 then
                                PZB90.countdown1000HzLight = PZB90.restrictionToConfirm.countdownLight
                                PZB90.countdown1000HzMonitoring = PZB90.restrictionToConfirm.countdownMonitoring
                                if PZB90.slowdown1000HzCountdown == -1 then
                                    PZB90.slowdown1000HzCountdown = PZB90.restrictionToConfirm.countdownSlowdown
                                end
                                PZB90.restricted1000Hz = PZB90.restrictionToConfirm.restricted
                                PZB90.restricted500Hz = PZB90.restrictionToConfirm.restricted
                            end
                            PZB90.restrictionToConfirm.countdownLight = -1
                            PZB90.restrictionToConfirm.countdownMonitoring = -1
						end
                    end
                    if PZB90.oneSecBeforeMagnetDisplaying > 0 then
                        PZB90.oneSecBeforeMagnetDisplaying = PZB90.oneSecBeforeMagnetDisplaying - deltaTime
                    else
                        PZB90.oneSecBeforeMagnetDisplaying = 0
                    end
                    --countdown of an not confirmed yet monitoring
                    if PZB90.restrictionToConfirm.countdownLight > 0 then
                        PZB90.restrictionToConfirm.countdownLight = PZB90.restrictionToConfirm.countdownLight - deltaMeters
                    else
                        PZB90.restrictionToConfirm.countdownLight = -1
                    end
                    if PZB90.restrictionToConfirm.countdownMonitoring > 0 then
                        PZB90.restrictionToConfirm.countdownMonitoring = PZB90.restrictionToConfirm.countdownMonitoring - deltaMeters
                    else
                        PZB90.restrictionToConfirm.countdownMonitoring = -1
                    end
                    --countdown of befehl40 light after passing 2000Hz mag
                    if PZB90.countdownBefehl40 > 0 then
                        PZB90.countdownBefehl40 = PZB90.countdownBefehl40 - deltaTime
                    else
                        PZB90.countdownBefehl40 = -1
                    end
					--freeing counter (if passing 500Hz in 600m after befreiung, Emergency is applied)
					if PZB90.befreiungCounter > 0 then
						PZB90.befreiungCounter = PZB90.befreiungCounter - deltaMeters
					else
						PZB90.befreiungCounter = -1
					end

				------------------COUNTERS------------------
					if PZB90.trainSpeed < 10 then
						PZB90.restrictedCounter = PZB90.restrictedCounter + deltaTime
					else
						PZB90.restrictedCounter = 0
                    end
                    if PZB90.blinkCounter <= 0.5 then
                        PZB90.blinkCounter = PZB90.blinkCounter + deltaTime
                    end

                if PZB90.startProgram and PZB90.trainSpeed > 4 then
                    PZB90.startProgram = false
                    PZB90.displayRestriction = true
                    PZB90.countdown1000HzLight = 0
                    PZB90.countdown1000HzMonitoring = 550
                    PZB90.slowdown1000HzCountdown = 0
                    PZB90.restricted1000Hz = true
                end

                if (PZB90.restrictedCounter > 15 or PZB90.trainSpeed < 1) then
                    if PZB90.countdown500HzMonitoring > 0 then
                        PZB90.restricted500Hz = true
                        PZB90.slowdown500HzCountdown = 0
                    elseif PZB90.countdown1000HzMonitoring > 0 then
                        PZB90.restricted1000Hz = true
                        PZB90.slowdown1000HzCountdown = 0
                    end
				end

				-- if PZB90.trainSpeed < 1 and PZB90.countdown1000HzMonitoring > 0 then
				-- 	PZB90.restricted1000Hz = true
				-- 	PZB90.slowdown1000HzCountdown = 0
                -- end

                ZpravaDebug(PZB90.countdown500HzMonitoring)

                if PZB90.countdown1000HzMonitoring == 0 and PZB90.countdown500HzMonitoring == 0 then
                    PZB90.displayRestriction = false
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
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
						end
					else
						PZB90.maxTrainSpeed = -1
                    end
                    PZB90.overspeedEmergencyBrakeApplySpeed = PZB90.LOW_EMERGENCY_APPLY_SPEED
                    PZB90.overspeedEmergencyBrakeReleaseSpeed = 100
                    PZB90.warningDisplaySpeed = PZB90.LOW_SPEED
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
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_RESTRICTED_SPEED
						end
					else
						PZB90.maxTrainSpeed = -1
					end
                    PZB90.overspeedEmergencyBrakeApplySpeed = PZB90.MIDDLE_EMERGENCY_APPLY_SPEED
                    PZB90.overspeedEmergencyBrakeReleaseSpeed = 120
                    PZB90.warningDisplaySpeed = PZB90.MIDDLE_SPEED
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
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_RESTRICTED_SPEED
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_SPEED
						else
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_RESTRICTED_SPEED
						end
					else
						PZB90.maxTrainSpeed = -1
					end
                    PZB90.overspeedEmergencyBrakeApplySpeed = PZB90.HIGH_EMERGENCY_APPLY_SPEED
                    PZB90.overspeedEmergencyBrakeReleaseSpeed = 160
                    PZB90.warningDisplaySpeed = PZB90.HIGH_SPEED
				end

				if PZB90.trainSpeed > PZB90.maxTrainSpeed+1 and PZB90.maxTrainSpeed ~= -1 then
					PZB90.emergencyBrake = true
                    PZB90.lightS = true
                end

                if PZB90.trainSpeed > PZB90.warningDisplaySpeed then
                    PZB90.overspeedWarning = true
                else
                    PZB90.overspeedWarning = false
                end

                if PZB90.trainSpeed > PZB90.overspeedEmergencyBrakeApplySpeed then
                    PZB90.overspeedEmergencyApplied = true
                    PZB90.lightS = true
                elseif PZB90.trainSpeed < PZB90.overspeedEmergencyBrakeReleaseSpeed then
                    PZB90.overspeedEmergencyApplied = false
                    PZB90.lightS = false
                end

				-------------------LIGHTS-------------------
					if PZB90.trainType == PZB90.LOW and PZB90.countdown1000HzMonitoring == 0 and not PZB90.restricted500Hz then --and PZB90.countdown500HzMonitoring == 0 on 500hz monitoring icon does not blink??
						PZB90.light55 = true
						PZB90.light55Inv = false
						PZB90.light70 = false
						PZB90.light70Inv = false
						PZB90.light85 = false
						PZB90.light85Inv = false
					elseif PZB90.trainType == PZB90.MIDDLE and PZB90.countdown1000HzMonitoring == 0 and not PZB90.restricted500Hz then --and PZB90.countdown500HzMonitoring == 0 on 500hz monitoring icon does not blink??
						PZB90.light55 = false
						PZB90.light55Inv = false
						PZB90.light70 = true
						PZB90.light70Inv = false
						PZB90.light85 = false
						PZB90.light85Inv = false
					elseif PZB90.trainType == PZB90.HIGH and PZB90.countdown1000HzMonitoring == 0 and not PZB90.restricted500Hz then --and PZB90.countdown500HzMonitoring == 0 on 500hz monitoring icon does not blink??
						PZB90.light55 = false
						PZB90.light55Inv = false
						PZB90.light70 = false
						PZB90.light70Inv = false
						PZB90.light85 = true
						PZB90.light85Inv = false
					end
					if PZB90.blinkCounter > 0.5 then
						PZB90.blinkCounter = 0
						if PZB90.trainType == PZB90.LOW and PZB90.countdown1000HzMonitoring > 0 and not PZB90.restricted1000Hz and not PZB90.restricted500Hz and PZB90.displayRestriction then
							PZB90.light55 = PZB90.light55Inv
							PZB90.light55Inv = (not PZB90.light55Inv)
							PZB90.light70 = false
							PZB90.light70Inv = false
							PZB90.light85 = false
							PZB90.light85Inv = false
						end
						if PZB90.trainType == PZB90.MIDDLE and PZB90.countdown1000HzMonitoring > 0 and not PZB90.restricted1000Hz and not PZB90.restricted500Hz and PZB90.displayRestriction then
							PZB90.light55 = false
							PZB90.light55Inv = false
							PZB90.light70 = PZB90.light70Inv
							PZB90.light70Inv = (not PZB90.light70Inv)
							PZB90.light85 = false
							PZB90.light85Inv = false
						end
						if PZB90.trainType == PZB90.HIGH and PZB90.countdown1000HzMonitoring > 0 and not PZB90.restricted1000Hz and not PZB90.restricted500Hz and PZB90.displayRestriction then
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
                        if PZB90.overspeedWarning then
                            Call("SetControlValue", "LZB_G_light", 0, math.abs(Call("GetControlValue", "LZB_G_light", 0)-1))
                        end
					end

                    if PZB90.countdownBefehl40 > 0 then
                        PZB90.lightBefehl = true
                    else
                        PZB90.lightBefehl = false
                    end

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
                        PZB90.lightS = true
						if PZB90.emergencyBrakeReason == 1000 then
							PZB90.light500Hz = false
						elseif PZB90.emergencyBrakeReason == 500 then
                            PZB90.light1000Hz = false
						end
                    end
                    
                    if PZB90.overspeedEmergencyApplied then
                        PZB90.lightS = true
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
					Call("SetControlValue", "PZB_S_light", 0, ToBolAndBack(PZB90.lightS))
					Call("SetControlValue", "PZB_ACTIVE", 0, 1)

				if PZB90.slowdown1000HzCountdown == 0 then
					PZB90.slowdown1000HzCountdown = -1
				end
				if PZB90.slowdown500HzCountdown == 0 then
					PZB90.slowdown500HzCountdown = -1
				end

				if PZB90.emergencyBrake or PZB90.overspeedEmergencyApplied then
                    pomernyTah = -1
                    Call("SetControlValue", "PomernyTah", 0, pomernyTah)
				end
			else
                if PZB90.startCountdown > 0 and PZB90.on then
					PZB90.blinkCounter = PZB90.blinkCounter + deltaTime
					if PZB90.blinkCounter > 0.5 then
                        PZB90.blinkCounter = 0
                        if PZB90.startSelfTestPosition < 8 then
                            PZB90.startSelfTestPosition = PZB90.startSelfTestPosition + 1
                        else
                            PZB90.startSelfTestPosition = 0
                        end
                    end
                    if PZB90.startSelfTestPosition < 1 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 1)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 2 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 1)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 3 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 1)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 4 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 1)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 5 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 1)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 6 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 1)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 7 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 1)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 8 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 1)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    elseif PZB90.startSelfTestPosition < 9 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                        Call("SetControlValue", "PZB500HZ", 0, 0)
                        Call("SetControlValue", "PZB1000HZ", 0, 0)
                        Call("SetControlValue", "PZB55", 0, 0)
                        Call("SetControlValue", "PZB70", 0, 0)
                        Call("SetControlValue", "PZB85", 0, 0)
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "PZB_S_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 1)
                    end
                else
                    if not LZB.active then
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                        Call("SetControlValue", "LZB_ENDE", 0, 0)
                    end
                    PZB90.light500Hz = false
                    PZB90.light1000Hz = false
                    if not LZB.befehlprogram and LZB.befehlprogramConsistPassCountdown == -1 then
                        Call("SetControlValue", "PZB_BEFEHL", 0, 0)
                    else
                        Call("SetControlValue", "PZB_BEFEHL", 0, 1)
                    end
                    Call("SetControlValue", "PZB500HZ", 0, 0)
                    Call("SetControlValue", "PZB1000HZ", 0, 0)
                    Call("SetControlValue", "PZB55", 0, 0)
                    Call("SetControlValue", "PZB70", 0, 0)
                    Call("SetControlValue", "PZB85", 0, 0)
                    Call("SetControlValue", "PZB_S_light", 0, 0)
                end
                if not LZB.active then
                    Call("SetControlValue", "PZB_ACTIVE", 0, 0)
                end
                PZB90.slowdown1000HzCountdown = -1
                PZB90.slowdown500HzCountdown = -1
                PZB90.countdown1000HzLight = 0
                PZB90.countdown1000HzMonitoring = 0
                PZB90.countdown500HzLight = 0
                PZB90.countdown500HzMonitoring = 0
			end
			if PZB90.emergencyBrake or PZB90.overspeedEmergencyApplied then
				Call("SetControlValue", "PZB_EMERGENCY", 0, 1)
			else
				Call("SetControlValue", "PZB_EMERGENCY", 0, 0)
			end
		end
}