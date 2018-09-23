ARR = { --objekt ARR
	--PROMENNE:
		cilovaRychlost = 0,
		LZBrychlost = 200,
		LZBactive = false,
		aktivni = false,
		hmotnostVlaku = 0,
		delkaVlaku = 0,
		rychlostKMH = 0,
		stoupani = 0,
		souhlas = false,
		pm = 0.8,
		fm = 0.8,
		pmControlValueName = "PM",
		fmControlValueName = "FM",
		skutecnyPT = 0,
		koeficientPohybuPT = 0.25,
		deltaSpeed = 0,
		deltaSpeedUpdateCount = 0,
		deltaSpeedCount = 0,
		avgDeltaSpeed = 0,

	--METODY:
		nastavCilovouRychlost = function(self,name,value)
			if value == 1 then
				if KPJ:getIsActive() then
					if string.find(name,"ARR_rych") ~= nil then
						KPJ:wasClickedWhenCounting( 0+string.sub(name,9))
					end
				else
					if string.find(name,"ARR_rych") ~= nil then
						ARR.cilovaRychlost = 0+string.sub(name,9)
					end
				end
			end
		end,
		nastavRychlostLZB = function(self,value,active)
			ARR.LZBrychlost = value
		end,
		zapniARR = function(self)
			ARR.cilovaRychlost = math.floor((Call("GetSpeed")*3.6)/5)*5+5
			ARR.aktivni = true
			ARR.tlak = 5
		end,
		vypniARR = function(self)
			ARR.cilovaRychlost = 0
			ARR.aktivni = false
			Call("SetControlValue","ARRRychlost",0,0)
		end,
		mainStack = function(self, pridavek, deltaTime)
			Call("SetControlValue","ARRRychlost",0,ARR.cilovaRychlost)
			ARR.skutecnyPT = Call("GetControlValue","PomernyTah",0)
			ARR.hmotnostVlaku = Call("GetConsistTotalMass")
			ARR.delkaVlaku = Call("GetConsistLength")
			ARR.stoupani = Call("GetGradient")
			local speed = math.abs(Call("GetSpeed")*3.6)
			local deltaSpeed = (speed-ARR.rychlostKMH)/deltaTime
			if self.deltaSpeedUpdateCount < 10 then
				self.deltaSpeedUpdateCount = self.deltaSpeedUpdateCount + 1
				self.deltaSpeedCount = self.deltaSpeedCount + deltaSpeed
			else
				self.deltaSpeedUpdateCount = 0
				self.avgDeltaSpeed = self.deltaSpeedCount/10
				self.deltaSpeedCount = 0
			end
			ARR.rychlostKMH = speed
			local cilovyPT = 0
			local rozdilovaSlozka = (math.min(ARR.cilovaRychlost, ARR.LZBrychlost)-ARR.rychlostKMH)/10
			local koefZrychleni = math.min(math.abs(2/(ARR.avgDeltaSpeed)*rozdilovaSlozka),1)
			local gradientSlozka = 0
			local koefEDB = 500
			local koefHmotnost = 350 --550
			local hmotnostniSlozka = (ARR.hmotnostVlaku-84)/koefHmotnost
			if Call("GetControlValue", "CisloKab", 0) == 1 or (Call("GetControlValue", "CisloKab", 0) == 0 and Call("GetControlValue", "Reverser", 0) == -1) then
				gradientSlozka = ARR.stoupani / 100
			else
				gradientSlozka = -ARR.stoupani / 100
			end
			if math.min(ARR.cilovaRychlost, ARR.LZBrychlost) > ARR.rychlostKMH and ARR.souhlas and pridavek == 0 then
				cilovyPT = math.min((rozdilovaSlozka+math.max(((hmotnostniSlozka*gradientSlozka*koefEDB)*rozdilovaSlozka),0))*koefZrychleni,1)
				ARR.tlak = 5
			elseif math.min(ARR.cilovaRychlost, ARR.LZBrychlost) < ARR.rychlostKMH then
				cilovyPT = math.min(math.max((rozdilovaSlozka+math.min(((hmotnostniSlozka*(-gradientSlozka)*koefEDB)*rozdilovaSlozka),0))*koefZrychleni,-1),pridavek)
				if (ARR.skutecnyPT < -0.9 and ARR.avgDeltaSpeed > (-(((-rozdilovaSlozka*10+0.33)^(1/2.5))/1))+0.64) or ARR.tlak ~= 5 then
					if ARR.avgDeltaSpeed > (-(((-rozdilovaSlozka*10+0.33)^(1/2.5))/1))+0.64 then
						ARR.tlak = ARR.tlak - 0.01
					elseif ARR.avgDeltaSpeed-(-(((-rozdilovaSlozka*10+0.33)^(1/2.5))/1))+0.64 > 0.1 then
						ARR.tlak = ARR.tlak + 0.01
						if ARR.tlak > 5 then
							ARR.tlak = 5
						end
					end
				end
			end
			if pridavek ~= 0 and cilovyPT <= 0 then
				cilovyPT = math.min(cilovyPT,pridavek)
			end
			if ARR.rychlostKMH < 30 then
				cilovyPT = math.max(math.min(cilovyPT, ARR.fm), -ARR.fm)
			end
			cilovyPT = math.max(math.min(cilovyPT, ARR.pm), -ARR.pm)
			if ARR.rychlostKMH <= 3 then
				ARR.souhlas = false
			end
			if math.abs(cilovyPT - ARR.skutecnyPT) > ARR.koeficientPohybuPT*deltaTime*2 then
				if cilovyPT > ARR.skutecnyPT then
					ARR.skutecnyPT = ARR.skutecnyPT + ARR.koeficientPohybuPT*deltaTime
				else
					ARR.skutecnyPT = ARR.skutecnyPT - ARR.koeficientPohybuPT*deltaTime
				end
			else
				ARR.skutecnyPT = cilovyPT
			end
			return(ARR.skutecnyPT)
		end,
		udelSouhlas = function(self)
			ARR.souhlas = true
		end,
		vybeh = function(self)
			ARR.souhlas = false
		end,
		pmPlus = function(self)
			ARR.pm = ARR.pm + 0.1
			if ARR.pm > 1 then
				ARR.pm = 1
			end
		end,
		pmMinus = function(self)
			ARR.pm = ARR.pm - 0.1
			if ARR.pm < 0.3 then
				ARR.pm = 0.3
			end
		end,
		fmPlus = function(self)
			if ARR.fm < 0.4 then
				ARR.fm = ARR.fm + 0.05
			else
				ARR.fm = ARR.fm + 0.1
			end
			if ARR.fm > 1 then
				ARR.fm = 1
			end
		end,
		fmMinus = function(self)
			if ARR.fm <= 0.4 then
				ARR.fm = ARR.fm - 0.05
			else
				ARR.fm = ARR.fm - 0.1
			end
			if ARR.fm < 0.2 then
				ARR.fm = 0.2
			end
		end,
		getPM = function(self)
			return(ARR.pm)
		end,
		getFM = function(self)
			return(ARR.fm)
		end,
		getRequiredPress = function(self)
			return(ARR.tlak or 5)
		end
};
KPJ = { --objekt KPJ
	remainingMeters = 0,
	isActive = false,
	afterTurnOFFCounter = 0,
	afterTurnOFFSpeed = 0,

	startCounting = function(self, metersToGo)
		KPJ.remainingMeters = metersToGo
		KPJ.isActive = true
		KPJ.afterTurnOFFSpeed = ARR.cilovaRychlost
	end,

	update = function(self, casUpdateGame, casUpdate)
		if KPJ.isActive then
			Call("SetControlValue", "KPJzobraz", 0, 1)
			local speed = Call("GetSpeed") or 0
			local metersFromLastUpdate = speed * casUpdateGame
			KPJ.remainingMeters = KPJ.remainingMeters - metersFromLastUpdate
			if KPJ.remainingMeters <= 0 then
				KPJ.isActive = false
				KPJ.remainingMeters = 0
				KPJ.afterTurnOFFCounter = 2
				ARR.cilovaRychlost = KPJ.afterTurnOFFSpeed
			end
			return(KPJ.remainingMeters)
		end
		if KPJ.afterTurnOFFCounter > 0 then
			Call("SetControlValue", "KPJzobraz", 0, 2)
			KPJ.afterTurnOFFCounter = KPJ.afterTurnOFFCounter - casUpdate
		else
			Call("SetControlValue", "KPJzobraz", 0, 0)
		end
	end,

	getRemainingMeters = function(self)
		return(KPJ.remainingMeters)
	end,

	getIsActive = function(self)
		return(KPJ.isActive)
	end,

	wasClickedWhenCounting = function(self,speed)
		KPJ.afterTurnOFFSpeed = speed
	end,

	turnOff = function(self)
		KPJ.isActive = false
		KPJ.remainingMeters = 0
		KPJ.afterTurnOFFCounter = 0
		KPJ.afterTurnOFFSpeed = 0
	end
};
function Update(deltaUpdateTimeFromGame)
	deltaTime = math.abs(os.clock() - casMinuly)
	casMinuly = os.clock()
	if math.abs(deltaTime-deltaUpdateTimeFromGame) > 1 then
		deltaTime = deltaUpdateTimeFromGame
	end
	
  	Call("SetControlValue","PomernyTah",0,ARR:mainStack(rucEDB, deltaUpdateTimeFromGame))
	
	KPJ:update(deltaUpdateTimeFromGame,deltaTime)

	if KPJ:getIsActive() then
		local metry = math.ceil(KPJ:getRemainingMeters())
		if metry > 999 then
			metry = 999
		end
		metry = tostring(metry)
		while string.len(metry) < 3 do
			metry = "X"..metry
		end
		Call("OdpocetMetryP:SetText", metry, 0)
		Call("OdpocetMetryZ:SetText", metry, 0)
	else 
		Call("OdpocetMetryP:SetText", "XXX", 0)
		Call("OdpocetMetryZ:SetText", "XXX", 0)
	end
end
function OnControlValueChange ( name, index, value )
	if Call( "*:ControlExists", name, index ) then
		Call( "*:SetControlValue", name, index, value )
	end

	ARR:nastavCilovouRychlost(name,value)
end
