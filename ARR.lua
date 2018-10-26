ARR = { --objekt ARR
	--PROMENNE:
		cilovaRychlost = 0,
		hodnotaTBC = 0,
		rucneNabrzdeneTBC = 0,
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
		zrychleni = 0,
		zrychleniMax = 0,
		EDB = 0,
		kladnyPT = 0,
		snizujTlakPP = false,
		zvysujTlakPP = true,
		parkovacka = true,
		blokujOdbrzdeniRucniVolba = false,
	--METODY:
		nastavCilovouRychlost = function(self,name,value,add)
			if value == 1 then
				if KPJ:getIsActive() then
					if string.find(name,"ARR_rych") ~= nil then
						if add+string.sub(name,9) > ARR.cilovaRychlost then
							KPJ:wasClickedWhenCounting(add+string.sub(name,9))
						else
							ARR.cilovaRychlost = add+string.sub(name,9)
						end
					end
				else
					if string.find(name,"ARR_rych") ~= nil then
						ARR.cilovaRychlost = add+string.sub(name,9)
					end
				end
			end
		end,
		nastavRychlostLZB = function(self,value)
			ARR.LZBrychlost = value
		end,
		zapniARR = function(self)
			ARR.cilovaRychlost = math.floor((Call("GetSpeed")*3.6)/5)*5+5
			ARR.aktivni = true
			ARR.pm = 0.7
			ARR.fm = 0.7
			ARR.kladnyPT = 0
			ARR.EDB = 0
		end,
		vypniARR = function(self)
			ARR.cilovaRychlost = 200
			ARR.aktivni = false
			Call("SetControlValue","ARRRychlost",0,0)
			ARR.kladnyPT = 0
			ARR.EDB = 0
		end,
		mainStack = function(self, pridavek, deltaTime, deltaUpdateTimeFromGame)
			if ARR.aktivni then
				Call("SetControlValue","ARRRychlost",0,ARR.cilovaRychlost)
				ARR.skutecnyPT = Call("GetControlValue","PomernyTah",0)
			else
				Call("SetControlValue","ARRRychlost",0,0)
				ARR.cilovaRychlost = 200
				ARR.pm = 1
				ARR.fm = 1
				ARR.souhlas = true
			end
			-- ARR.hmotnostVlaku = Call("GetConsistTotalMass")
			-- ARR.delkaVlaku = Call("GetConsistLength")
			-- ARR.stoupani = Call("GetGradient")
			local speed = math.abs(Call("GetSpeed")*3.6)
			-- local deltaSpeed = (speed-ARR.rychlostKMH)/deltaUpdateTimeFromGame*3.6
			-- if self.deltaSpeedUpdateCount < 10 then
			-- 	self.deltaSpeedUpdateCount = self.deltaSpeedUpdateCount + 1
			-- 	self.deltaSpeedCount = self.deltaSpeedCount + deltaSpeed
			-- else
			-- 	self.deltaSpeedUpdateCount = 0
			-- 	ARR.zrychleni = self.deltaSpeedCount/10
			-- 	self.deltaSpeedCount = 0
			-- end
			ARR.rychlostKMH = speed
			ARR.zrychleniMax = (math.min(ARR.cilovaRychlost, ARR.LZBrychlost) - ARR.rychlostKMH)/15
			
			if (Call("GetControlValue", "CisloKab", 0) == 1 and Call("GetControlValue", "Reverser", 0) == 1) or (Call("GetControlValue", "CisloKab", 0) == 0 and Call("GetControlValue", "Reverser", 0) == -1) then
				ARR.zrychleni = -Call("GetAcceleration")
			else
				ARR.zrychleni = Call("GetAcceleration")
			end

			if ARR.souhlas and pridavek == 0 then
				if ARR.zrychleni < ARR.zrychleniMax and ((ARR.rychlostKMH < 30 and ARR.kladnyPT < math.min(ARR.pm, ARR.fm)) or (ARR.rychlostKMH > 30 and ARR.kladnyPT < ARR.pm)) then
					if ARR.EDB == 0 and ARR.kladnyPT < 1 then
						if ARR.rychlostKMH < 30 then
							ARR.kladnyPT = math.min(ARR.kladnyPT + ARR.koeficientPohybuPT * deltaTime, 1, ARR.pm, ARR.fm)
						else
							ARR.kladnyPT = math.min(ARR.kladnyPT + ARR.koeficientPohybuPT * deltaTime, 1, ARR.pm)
						end
					elseif ARR.EDB ~= 0 then
						ARR.EDB = math.min(ARR.EDB + ARR.koeficientPohybuPT * deltaTime, 0)
					end
					ARR.snizujTlakPP = false
					ARR.zvysujTlakPP = true
				elseif ARR.zrychleni > ARR.zrychleniMax or ((ARR.rychlostKMH < 30 and ARR.kladnyPT > math.min(ARR.pm, ARR.fm)) or (ARR.rychlostKMH > 30 and ARR.kladnyPT > ARR.pm)) then
					if ARR.kladnyPT == 0 and ARR.EDB > -1 then
						ARR.EDB = math.max(ARR.EDB - ARR.koeficientPohybuPT * deltaTime, -1)
					elseif ARR.kladnyPT ~= 0 then
						ARR.kladnyPT = math.max(ARR.kladnyPT - ARR.koeficientPohybuPT * deltaTime, 0)
					end
					if ARR.EDB == -1 and ARR.zrychleni > -0.7 then
						ARR.snizujTlakPP = true
						ARR.zvysujTlakPP = false
					elseif ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBrychlost) > 20 then
						ARR.snizujTlakPP = true
						ARR.zvysujTlakPP = false
					else
						ARR.snizujTlakPP = false
					end
				end
			else
				if ARR.zrychleni > ARR.zrychleniMax then
					if ARR.kladnyPT == 0 and ARR.EDB > -1 then
						ARR.EDB = math.max(ARR.EDB - ARR.koeficientPohybuPT * deltaTime, -1)
					elseif ARR.kladnyPT ~= 0 then
						ARR.kladnyPT = math.max(ARR.kladnyPT - ARR.koeficientPohybuPT * deltaTime, 0)
					end
					if (ARR.EDB == -1 and ARR.zrychleni > -0.7) or (ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBrychlost) > 20) then
						ARR.snizujTlakPP = true
						ARR.zvysujTlakPP = false
					else
						ARR.snizujTlakPP = false
					end
				else
					ARR.snizujTlakPP = false
					ARR.zvysujTlakPP = true
					if ARR.kladnyPT ~= 0 then
						ARR.kladnyPT = math.max(ARR.kladnyPT - ARR.koeficientPohybuPT * deltaTime, 0)
					end
					if ARR.EDB ~= 0 and pridavek == 0 then
						ARR.EDB = math.min(ARR.EDB + ARR.koeficientPohybuPT * deltaTime, 0)
					elseif pridavek < 0 then
						if pridavek - ARR.EDB > 0.01 then
							ARR.EDB = math.min(ARR.EDB + ARR.koeficientPohybuPT * deltaTime, 0)
						elseif pridavek - ARR.EDB < -0.01 then
							ARR.EDB = math.max(ARR.EDB - ARR.koeficientPohybuPT * deltaTime, -1)
						else
							ARR.EDB = math.min(math.max(pridavek, -1), 1)
						end
					end
				end
			end

			if not ARR.parkovacka then
				if ARR.EDB < 0 then
					ARR.skutecnyPT = ARR.EDB
				elseif ARR.kladnyPT > 0 then
					ARR.skutecnyPT = ARR.kladnyPT
				else
					ARR.skutecnyPT = 0
				end
			else
				if ARR.EDB < 0 then
					ARR.EDB = math.min(ARR.EDB + ARR.koeficientPohybuPT * deltaTime, 0)
				elseif ARR.kladnyPT > 0 then
					ARR.skutecnyPT = ARR.kladnyPT
				else
					ARR.skutecnyPT = 0
				end
			end

			if ARR.rychlostKMH <= 3 then
				ARR.souhlas = false
			end
			-- local rozdilovaSlozka = (math.min(ARR.cilovaRychlost, ARR.LZBrychlost)-ARR.rychlostKMH)/10
			-- if rozdilovaSlozka > 0 then
			-- 	rozdilovaSlozka = rozdilovaSlozka*math.max(ARR.rychlostKMH/100, 1)
			-- end
			-- local koefZrychleni = math.min(math.abs(4/ARR.avgDeltaSpeed), 1)
			-- local gradientSlozka = 0
			-- local koefKladnyPT = 1
			-- local koefZapornyPT = 4
			-- local koefHmotnost = 550
			-- local hmotnostniSlozka = 0
			-- if Call("GetControlValue", "CisloKab", 0) == 1 or (Call("GetControlValue", "CisloKab", 0) == 0 and Call("GetControlValue", "Reverser", 0) == -1) then
			-- 	gradientSlozka = math.max(ARR.stoupani+1, 1) --/10
			-- else
			-- 	gradientSlozka = math.max(-ARR.stoupani+1, 1)--/10
			-- end
			-- if math.min(ARR.cilovaRychlost, ARR.LZBrychlost) > ARR.rychlostKMH and ARR.souhlas and pridavek == 0 and LZB.targetSpeed > ARR.rychlostKMH then
			-- 	if gradientSlozka >= 0 then
			-- 		hmotnostniSlozka = math.max((ARR.hmotnostVlaku+466)/koefHmotnost, 1)
			-- 	else
			-- 		hmotnostniSlozka = math.max(koefHmotnost/(ARR.hmotnostVlaku+466), 0)
			-- 	end
			-- 	ARR.cilovyPT = math.min((rozdilovaSlozka+math.max(((hmotnostniSlozka*gradientSlozka*koefKladnyPT)*rozdilovaSlozka),0))*koefZrychleni,1)
			-- 	ARR.hodnotaTBC = 5
			-- elseif math.min(ARR.cilovaRychlost, ARR.LZBrychlost) < ARR.rychlostKMH then
			-- 	if gradientSlozka >= 0 then
			-- 		hmotnostniSlozka = math.max(koefHmotnost/(ARR.hmotnostVlaku+466), 0)
			-- 	else
			-- 		hmotnostniSlozka = math.max((ARR.hmotnostVlaku+466)/koefHmotnost, 1)
			-- 	end
			-- 	rozdilovaSlozka = rozdilovaSlozka*4
			-- 	ARR.cilovyPT = math.min((rozdilovaSlozka+math.min(((hmotnostniSlozka*(-gradientSlozka)*koefZapornyPT)*rozdilovaSlozka),0))*koefZrychleni,pridavek)
			-- 	if ARR.cilovyPT < -10 or ARR.hodnotaTBC ~= 5 then
			-- 		ARR.hodnotaTBC = math.min(5-(ARR.cilovyPT + 10)/10,5)
			-- 	end
			-- 	ARR.cilovyPT = math.max(ARR.cilovyPT,-1)
			-- end
			-- if pridavek ~= 0 then
			-- 	ARR.cilovyPT = math.min(ARR.cilovyPT,pridavek)
			-- end
			-- if cilovyPT >= 0 then
			-- 	if ARR.rychlostKMH < 30 then
			-- 		cilovyPT = math.max(math.min(cilovyPT, ARR.fm), -ARR.fm)
			-- 	end
			-- 	ARR.cilovyPT = math.max(math.min(ARR.cilovyPT, ARR.pm), -ARR.pm)
			-- end
			-- Call("SetControlValue", "ARR_DEBUG_DIFFERENCIAL", 0, rozdilovaSlozka)
			-- Call("SetControlValue", "ARR_DEBUG_ACCELERATION", 0, koefZrychleni)
			-- Call("SetControlValue", "ARR_DEBUG_GRADIENT", 0, gradientSlozka)
			-- Call("SetControlValue", "ARR_DEBUG_MASS", 0, hmotnostniSlozka)
			-- Call("SetControlValue", "ARR_DEBUG_PT", 0, ARR.cilovyPT)
			-- if ARR.rychlostKMH <= 3 then
			-- 	ARR.souhlas = false
			-- end
			-- if math.abs(ARR.cilovyPT - ARR.skutecnyPT) > ARR.koeficientPohybuPT*deltaTime*2 then
			-- 	if ARR.cilovyPT > ARR.skutecnyPT then
			-- 		ARR.skutecnyPT = ARR.skutecnyPT + ARR.koeficientPohybuPT*deltaTime
			-- 	else
			-- 		ARR.skutecnyPT = ARR.skutecnyPT - ARR.koeficientPohybuPT*deltaTime
			-- 	end
			-- else
			-- 	ARR.skutecnyPT = ARR.cilovyPT
			-- end
			return(ARR.skutecnyPT)
		end,
		udelSouhlas = function(self)
			ARR.souhlas = true
		end,
		vybeh = function(self)
			ARR.souhlas = false
		end,
		nastavParkovacku = function(self, hodnota)
			ARR.parkovacka = hodnota
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
		rychPlus = function(self)
			ARR.cilovaRychlost = math.min(ARR.cilovaRychlost + 5, 200)
		end,
		rychMinus = function(self)
			ARR.cilovaRychlost = math.max(ARR.cilovaRychlost - 5, 0)
		end,
		getTBCvalue = function(self)
			return(ARR.hodnotaTBC or 0)
		end
};
KPJ = { --objekt KPJ
	remainingMeters = 0,
	isActive = false,
	afterTurnOFFCounter = 0,
	afterTurnOFFSpeed = -1,

	startCounting = function(self, metersToGo)
		KPJ.remainingMeters = metersToGo
		KPJ.isActive = true
		KPJ.afterTurnOFFSpeed = -1
	end,

	update = function(self, casUpdateGame, casUpdate)
		if KPJ.isActive then
			Call("SetControlValue", "KPJzobraz", 0, 1)
			local speed = math.abs(Call("GetSpeed")) or 0
			local metersFromLastUpdate = speed * casUpdateGame
			KPJ.remainingMeters = KPJ.remainingMeters - metersFromLastUpdate
			if KPJ.remainingMeters <= 0 then
				KPJ.isActive = false
				KPJ.remainingMeters = 0
				KPJ.afterTurnOFFCounter = 2
				if KPJ.afterTurnOFFSpeed ~= -1 and ARR.cilovaRychlost < KPJ.afterTurnOFFSpeed then
					ARR.cilovaRychlost = KPJ.afterTurnOFFSpeed
				end
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
