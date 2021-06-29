SIFA = { --objekt SIFA
	---------------SIFA CONSTANTS---------------
		LIGHT_ON = 30,
		LIGHT_OFF_SOUND_ON = 32.5,
		SOUND_OFF = 35,
	---------------SIFA VARIABLES---------------
		active = false,
		counter = 0,
		lastPedalValue = false,
		emergencyBrake = true,
	---------------SIFA FUNCTIONS---------------
		SetPedalValue = function(self, bool)
			if bool and not SIFA.lastPedalValue then
				SIFA.counter = 0
			end
			SIFA.lastPedalValue = bool
		end,
		Update = function(self, deltaTime)
			if PZB90.on then
				SIFA.active = true
			else
				SIFA.active = false
			end
			if SIFA.active then
				if math.abs(Call("GetSpeed") * 3.6) > 1 then
					SIFA.counter = SIFA.counter + deltaTime
				elseif not SIFA.emergencyBrake then
					SIFA.counter = 0
				end
				if SIFA.counter < SIFA.LIGHT_ON then
					Call("SetControlValue", "SIFA_LIGHT", 0, 0)
					Call("SetControlValue", "SIFA_SOUND", 0, 0)
					SIFA.emergencyBrake = false
				elseif SIFA.counter < SIFA.LIGHT_OFF_SOUND_ON then
					Call("SetControlValue", "SIFA_LIGHT", 0, 1)
					Call("SetControlValue", "SIFA_SOUND", 0, 0)
					SIFA.emergencyBrake = false
				elseif SIFA.counter < SIFA.SOUND_OFF then
					Call("SetControlValue", "SIFA_LIGHT", 0, 1)
					Call("SetControlValue", "SIFA_SOUND", 0, 1)
					SIFA.emergencyBrake = false
				else
					Call("SetControlValue", "SIFA_LIGHT", 0, 1)
					Call("SetControlValue", "SIFA_SOUND", 0, 2)
					SIFA.emergencyBrake = true
					SIFA.counter = 36
				end
			else
				Call("SetControlValue", "SIFA_LIGHT", 0, 0)
				Call("SetControlValue", "SIFA_SOUND", 0, 0)
				SIFA.emergencyBrake = false
			end
			if SIFA.emergencyBrake then
				ARR:vybeh()
				pomernyTah = -1
				Call("SetControlValue", "PomernyTah", 0, pomernyTah)
			end
		end
}
