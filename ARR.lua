ARR = { --objekt ARR
	--PROMENNE:
		cilovaRychlost = 0,
		hodnotaTBC = 0,
		rucneNabrzdeneTBC = 0,
        LZBrychlost = 10000,
        LZBcilovaRychlost = 10000,
		aktivni = false,
		rychlostKMH = 0,
		souhlas = false,
        pm = 0.8,
		fm = 0.8,
        fmThrottlePerc = 0,
        skutecnyPT = 0,
        koeficientPohybuPT = 0.25,
        zrychleni = 0,
		zrychleniMax = 0,
		EDB = 0,
		kladnyPT = 0,
		snizujTlakPP = false,
		zvysujTlakPP = true,
		parkovacka = true,
        blokujOdbrzdeniRucniVolba = false,
        delkaVlaku = 0,
        tlakPP = 0,
        najizdeni = false,
	--METODY:
		nastavCilovouRychlost = function(self,name,value,add)
            if value > 0.5 then
                ARR.najizdeni = false
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
            if narodniVolba <= 4 then
                ARR.cilovaRychlost = math.min(ARR.cilovaRychlost, 160)
            end
		end,
		nastavRychlostLZB = function(self,akt,cil)
            ARR.LZBrychlost = akt
            ARR.LZBcilovaRychlost = cil
		end,
		zapniARR = function(self)
			ARR.cilovaRychlost = math.floor(math.abs(Call("GetSpeed")*3.6)/5)*5+5
			ARR.aktivni = true
			ARR.pm = 0.8
			ARR.fm = 0.8
			ARR.kladnyPT = 0
			ARR.EDB = 0
            ARR.souhlas = false
		end,
		vypniARR = function(self)
			ARR.cilovaRychlost = 200
			ARR.aktivni = false
			Call("SetControlValue","ARRRychlost",0,0)
			ARR.kladnyPT = 0
            ARR.EDB = 0
            ARR.souhlas = false
		end,
        update = function(self, pridavek, deltaTime, deltaUpdateTimeFromGame)
            --zapis do kosticky ARR navolenou rychlost
            Call("SetControlValue","ARRRychlost",0,ARR.cilovaRychlost)
            --nacti skutecny PT
            ARR.skutecnyPT = Call("GetControlValue","PomernyTah",0)

            --nacti absolutni rychlost v kmh
            local speed = math.abs(Call("GetSpeed")*3.6)
            --zapis rychlost do objektove promenne
            ARR.rychlostKMH = speed
            --nacti delku vlaku, mozno nahradit poctem naprav /8
            ARR.delkaVlaku = Call("GetConsistLength")

            --spocti maximalni rozhodne zrychleni
            if math.min(ARR.cilovaRychlost, ARR.LZBrychlost) > ARR.rychlostKMH then
                ARR.zrychleniMax = (math.min(ARR.cilovaRychlost, ARR.LZBrychlost) - ARR.rychlostKMH)/10
            else
                ARR.zrychleniMax = math.max(
                    math.min((math.sqrt(Call("GetConsistTotalMass"))/80)-1, 0.2),
                    -3 * math.sqrt(ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost)) / (10 + 0.05*ARR.delkaVlaku),
                    (math.min(ARR.cilovaRychlost, ARR.LZBrychlost) - ARR.rychlostKMH)/10
                )
            end

            --nacti tlak v potrubi
            ARR.tlakPP = Call("GetControlValue","BrakePipePressureBAR",0)

            --pokud neni HJP v S a je aktivovane najizdeni, nebo neni aktivovane najizdeni a navolena rych = 1 - zrus rychlost
            if (not ARR.souhlas and ARR.najizdeni) or (ARR.cilovaRychlost == 1 and not ARR.najizdeni) then
                ARR.cilovaRychlost = 0
            end
            
            --pri jizde vzad, nebo z druheho stanoviste vynasob akceleraci -1
			if (rizeniCab2 > 0.5 and Call("GetControlValue", "Reverser", 0) == 1) or (rizeniCab1 > 0.5 and Call("GetControlValue", "Reverser", 0) == -1) then
				ARR.zrychleni = -Call("GetAcceleration")
			else
				ARR.zrychleni = Call("GetAcceleration")
            end

            if Call("GetControlValue","Regulator", 0) > 0 and math.abs(Call("GetTractiveEffort")) > 0 then
                local maximalniKn = math.abs(Call("GetTractiveEffort"))/Call("GetControlValue","Regulator",0)
                ARR.fmThrottlePerc = ARR.fm/maximalniKn
            else
                ARR.fmThrottlePerc = 1
            end

            --zrychleni je mensi, nez omezujici krivka, muzeme frcet
            if ARR.zrychleni < ARR.zrychleniMax then
                --mame souhlas, neni navolene rucni EDB, v potrubi je alespo 4.9 BAR, ve valcich je mene jak 0.3 BAR, neni blokovana jizda z LZB, PT je mensi, nez rozhodny Pm a Fm
                if ARR.souhlas and pridavek == 0 and ARR.tlakPP > 4.9 and not LZB.ARRblock then
                    --loko neni v EDB a zaroven je PT mensi jak 1
                    if ARR.EDB == 0 and ARR.kladnyPT < 1 then
                        if ARR.kladnyPT < math.min(ARR.pm, ARR.fmThrottlePerc) then
                            --zvysuj PT do maximalni hodnoty minima Pm, Fm rychlosti podle rozdilu zrychleni, maximalne vsak koeficientemPohybuPT
                            ARR.kladnyPT = math.min(ARR.kladnyPT + math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax) * deltaTime * 1), 1, math.min(ARR.pm, ARR.fmThrottlePerc))
                        elseif ARR.kladnyPT > math.min(ARR.pm, ARR.fmThrottlePerc) then
                            --zvysuj PT do maximalni hodnoty minima Pm, Fm rychlosti podle rozdilu zrychleni, maximalne vsak koeficientemPohybuPT
                            ARR.kladnyPT = math.min(ARR.kladnyPT - math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax) * deltaTime * 1), 1, math.max(ARR.pm, ARR.fmThrottlePerc))
                        end
                    end
                --pokud neni splnene vyse, puvodne a zaroven je prekrocene rozhodne Pm a Fm nebo je zaparkovane, nebo loko stoji, nebo neni souhlas
                elseif ARR.kladnyPT > 0 and ARR.souhlas and not ARR.parkovacka and ARR.rychlostKMH > 0.1 then --if ((ARR.rychlostKMH < 30 and ARR.kladnyPT > math.min(ARR.pm, ARR.fm)) or (ARR.rychlostKMH > 30 and ARR.kladnyPT > ARR.pm)) or ARR.parkovacka or ARR.rychlostKMH < 0.1 or not ARR.souhlas then
                    --snizuj PT
                    ARR.kladnyPT = math.max(ARR.kladnyPT - math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax) * deltaTime * 1), 0)
                else
                    --snizuj PT maximalni rychlosti
                    ARR.kladnyPT = math.max(ARR.kladnyPT - ARR.koeficientPohybuPT * deltaTime, 0)
                end

                -- --pokud je skutecne zrychleni o vice jak 0.1 m/ss mensi na kazdych 100m vlaku, nez rozhodne, a/nebo uz je tlak v potrubi vetsi nez 4.7 (necitlivost rozvadecu) = povol BSE
                -- if ARR.zrychleniMax - ARR.zrychleni > 0.1 or ARR.tlakPP > 4.7 or ARR.parkovacka or ARR.rychlostKMH < 0.1 then
                if ARR.zrychleni+0.2*math.max(0.25, (ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBrychlost))/5) < ARR.zrychleniMax then
                    ARR.snizujTlakPP = false
                    ARR.zvysujTlakPP = true
                else
                    ARR.snizujTlakPP = false
                    ARR.zvysujTlakPP = false
                end
                -- else
                --     --pokud je skutecne zrychleni o hodne mensi, nez rozhodne a zaroven je tlak jeste pod 4.7 BAR (necitlivost rozvadecu) - drz zabrzdene BSE
                --     ARR.snizujTlakPP = false
                --     ARR.zvysujTlakPP = false
                -- end

                -- if ARR.EDB > -0.3 or ARR.zrychleni < (Call("GetConsistTotalMass")/8000-0.9)*1.5 or math.abs(ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost)) < (20+ARR.delkaVlaku/20)+math.min(0,4/ARR.zrychleni) or ARR.kladnyPT > 0 or ARR.zrychleni - 0.2 > ARR.zrychleniMax then
                --     ARR.snizujTlakPP = false
                --     ARR.zvysujTlakPP = true
                -- else
                --     ARR.snizujTlakPP = false
                --     ARR.zvysujTlakPP = false
                -- end

                --pokud je nenulove EDB a zaroven neni navolene rucni EDB, nebo loko stoji, nebo je zaparkovana
                if ARR.EDB ~= 0 and (pridavek == 0 or ARR.parkovacka or ARR.rychlostKMH < 0.1) then
                    --povoluj EDB
                    ARR.EDB = math.min(ARR.EDB + math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax) * deltaTime * 1), 0)
                --jinak pokud je rucne nabrzdene
                elseif pridavek < 0 then
                    --ubirej EDB, dokud je vetsi, nez rucne navolene
                    if pridavek - ARR.EDB > 0.01 then
                        ARR.EDB = math.min(ARR.EDB + math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax) * deltaTime * 1), 0)
                    --pridavej EDB dokad je mensi, nez rucne navolene
                    elseif pridavek - ARR.EDB < -0.01 then
                        ARR.EDB = math.max(ARR.EDB - ARR.koeficientPohybuPT * deltaTime, -1)
                    --jinak - tj. pokud je temer shodne, opisuj hodnotu presne
                    else
                        ARR.EDB = math.min(math.max(pridavek, -1), 1)
                    end
                end
            --problem!! zrychleni je vetsi nez dovolene - musime neco udelat
            elseif ARR.zrychleni > ARR.zrychleniMax then
                --pokud je jeste kladny PT, tak se ho zbav
                if ARR.kladnyPT ~= 0 and ARR.souhlas and not ARR.parkovacka and ARR.rychlostKMH > 0.1 then
                    --snizuj PT s ohledem na rozdil
                    ARR.kladnyPT = math.max(ARR.kladnyPT - math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax) * deltaTime * 1), 0)
                else
                    --snizuj PT maximalni rychlosti
                    ARR.kladnyPT = math.max(ARR.kladnyPT - ARR.koeficientPohybuPT * deltaTime, 0)
                end

                --pokud loko nestoji a neni zaparkovana
                if not ARR.parkovacka and ARR.rychlostKMH > 0.1 then

                    --pokud uz loko neni v tahu a EDB je mensi, nez maximalni
                    if ARR.kladnyPT == 0 and ARR.EDB > -1 then
                        --pokud je rucne nabrzdena hodnota vetsi, nez aktualni, pridavej maximalni rychlosti pohybu PT
                        if pridavek - ARR.EDB < -0.01 then
                            ARR.EDB = math.max(ARR.EDB - ARR.koeficientPohybuPT * deltaTime, -1)
                        elseif pridavek - ARR.EDB > 0.01 then --if ARR.zrychleni < math.max(ARR.zrychleniMax, -0.8) then--pokud je rucne nabrzdena hodnota mensi, nez aktualni hodnota, pridavej rychlosti minima rozdilu ciloveho a rozhodneho zrychleni a maximalniho koeficientu pohybu
                            ARR.EDB = math.min(ARR.EDB - math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - ARR.zrychleniMax,0.8) * deltaTime * 1), 0)
                        -- else
                            ARR.EDB = math.max(ARR.EDB + ARR.koeficientPohybuPT * deltaTime, -1)
                        --     ARR.EDB = math.min(ARR.EDB + math.min(ARR.koeficientPohybuPT * deltaTime, math.abs(ARR.zrychleni - math.max(ARR.zrychleniMax,0.8)) * deltaTime * 1), 0)
                        end
                    end

                    -- if Call("GetControlValue", "Frei", 0) > 0.5 then
                    --     SysCall("ScenarioManager:ShowAlertMessageExt", "ARR_debug_message", ARR.zrychleni.."<br>"..-math.min(math.max(math.abs(ARR.zrychleniMax*200)/ARR.delkaVlaku), 0.6).."<br>"..-math.min(math.max(math.abs(ARR.zrychleniMax*240)/ARR.delkaVlaku), 0.8), 2, 0)
                    -- end

                    -- --pokud je v potrubi vice, nez 3.7 BAR a rozdil zrychleni je vetsi, nez 0.2m/ss deleno kazdymi 100m vlaku snizuj tlak a koriguj jenom s EDB
                    -- if ARR.zrychleni > -math.min(math.max(math.abs(ARR.zrychleniMax^2*50)/ARR.delkaVlaku), 0.6) and ARR.tlakPP > 3.7 and ARR.kladnyPT == 0 and (ARR.EDB < -0.3 or MIREL.odpadleSoupatkoVZ or PZB90.emergencyBrake or PZB90.overspeedEmergencyApplied or SIFA.emergencyBrake or LZB.emergencyBrake or stradac or Call("GetControlValue","LevyTah",0) ~= 1) then
                    if ARR.zrychleni > ARR.zrychleniMax+0.01 then
                        if ARR.kladnyPT == 0 and ARR.zrychleni > ARR.zrychleniMax+0.15 and ARR.tlakPP > 3.6 then
                            ARR.snizujTlakPP = true
                            ARR.zvysujTlakPP = false
                        elseif ARR.zrychleniMax > ARR.zrychleni or ARR.tlakPP <= 3.6 or ARR.kladnyPT ~= 0 then
                            ARR.snizujTlakPP = false
                            ARR.zvysujTlakPP = false
                        end
                    else
                        ARR.snizujTlakPP = false
                        ARR.zvysujTlakPP = false
                    end
                    -- elseif ARR.zrychleni < -math.min(math.max(math.abs(ARR.zrychleniMax^2*90)/ARR.delkaVlaku), 0.8) or ARR.tlakPP < 3.7 or (not MIREL.odpadleSoupatkoVZ and not PZB90.emergencyBrake and not PZB90.overspeedEmergencyApplied and not SIFA.emergencyBrake and not LZB.emergencyBrake and not stradac and Call("GetControlValue","LevyTah",0) == 1) then
                    --     ARR.snizujTlakPP = false
                    --     ARR.zvysujTlakPP = true--true
                    -- else
                    --     ARR.snizujTlakPP = false
                    --     ARR.zvysujTlakPP = false
                    -- end

                    --pokud je rozdil rychlosti vetsi, nez potrebny
                    -- if ARR.zrychleni > -math.max(60/ARR.delkaVlaku, 0.6)


                    -- if ((ARR.EDB < -0.4 and ARR.zrychleni > Call("GetConsistTotalMass")/8000-0.9) or math.abs(ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost)) > 20) and ARR.tlakPP > 3.5 and math.abs(ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost)) > (25+ARR.delkaVlaku/25)+math.min(0,4/ARR.zrychleni) and ARR.kladnyPT == 0 then
                    --     ARR.snizujTlakPP = true
                    --     ARR.zvysujTlakPP = false
                    -- elseif (ARR.EDB < -0.4 or Call("GetControlValue","LevyTah",0) ~= 1) and ARR.zrychleni > Call("GetConsistTotalMass")/8000-0.9 and (ARR.zrychleni - ARR.zrychleniMax > 0.2 and ARR.rychlostKMH > math.abs(math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost))) and ARR.tlakPP > 3.5 and math.abs(ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost)) > (25+ARR.delkaVlaku/25)+math.min(0,4/ARR.zrychleni) and ARR.kladnyPT == 0 then
                    --     ARR.snizujTlakPP = true
                    --     ARR.zvysujTlakPP = false
                    -- elseif ARR.zrychleni > Call("GetConsistTotalMass")/8000-0.9 and ARR.tlakPP > 3.5 and math.abs(ARR.rychlostKMH - math.min(ARR.cilovaRychlost, ARR.LZBcilovaRychlost)) > (25+ARR.delkaVlaku/25)+math.min(0,4/ARR.zrychleni) and ARR.kladnyPT == 0 then
                    --     ARR.snizujTlakPP = true
                    --     ARR.zvysujTlakPP = false
                    -- else
                    --     ARR.snizujTlakPP = false
                    --     ARR.zvysujTlakPP = false
                    -- end
                else
                --pokud je loko zabrzdena, nebo stoji, povol HP
					ARR.snizujTlakPP = false
                    ARR.zvysujTlakPP = true
                end
            end

            if ARR.parkovacka and ARR.rychlostKMH < 0.1 then
                --pokud je loko zabrzdena a stoji, povol HP
					ARR.snizujTlakPP = false
                    ARR.zvysujTlakPP = true
            end

            --zapis hodnot na vystup
			if not ARR.parkovacka then
				if ARR.EDB < 0 then
					ARR.skutecnyPT = ARR.EDB
				elseif ARR.kladnyPT > 0 then
					ARR.skutecnyPT = ARR.kladnyPT
				else
					ARR.skutecnyPT = 0
				end
			elseif ARR.EDB >= 0 and ARR.kladnyPT <= 0 then
                ARR.EDB = 0
                ARR.kladnyPT = 0
                ARR.skutecnyPT = 0
			end

            --zruseni souhlasu pri rychlosti mensi, nez 3kmh
			if ARR.rychlostKMH <= 3 then
				ARR.souhlas = false
            end
            
            --vrat skutecny PT
			return(ARR.skutecnyPT)
		end,
        udelSouhlas = function(self)
            ARR.souhlas = true
		end,
		vybeh = function(self)
            ARR.souhlas = false
            if ARR.najizdeni then
                ARR.najizdeni = false
                ARR.parkovacka = true
            end
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
            if ARR.souhlas and ARR.cilovaRychlost == 0 then
                ARR.najizdeni = true
                ARR.cilovaRychlost = 1
            else
                if ARR.cilovaRychlost == 1 then
                    ARR.cilovaRychlost = 5
                else
                    ARR.cilovaRychlost = math.min(ARR.cilovaRychlost + 5, 200)
                end
            end
		end,
        rychMinus = function(self)
            ARR.najizdeni = false
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
        if not KPJ.isActive then
            if math.abs(Call("GetSpeed")) > 0.1 then
                KPJ.remainingMeters = metersToGo
                KPJ.isActive = true
                KPJ.afterTurnOFFSpeed = -1
            end
        else
            KPJ.isActive = false
            KPJ.remainingMeters = 0
            KPJ.afterTurnOFFSpeed = -1
            KPJ.afterTurnOFFCounter = 2
        end
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
				if KPJ.afterTurnOFFSpeed ~= -1 then
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
		KPJ.afterTurnOFFSpeed = -1
	end
};

function Update(deltaUpdateTimeFromGame)
	deltaTime = math.abs(os.clock() - casMinuly)
	casMinuly = os.clock()
	if math.abs(deltaTime-deltaUpdateTimeFromGame) > 1 then
		deltaTime = deltaUpdateTimeFromGame
    end

    Call("SetControlValue","PomernyTah",0,ARR:update(rucEDB, deltaTime, deltaUpdateTimeFromGame))
	
    ----------------------KPJ----------------------
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
	if Call("GetControlValue", "ARR_horni", 0) > 0.5 then
        ARR:nastavCilovouRychlost(name,value,100)
        if value > 0.5 and string.find(name,"ARR_rych") ~= nil then
            LZB:ARRKeyPress()
        end
	else
        if value > 0.5 and string.find(name,"ARR_rych") ~= nil then
            LZB:ARRKeyPress()
            if 0+string.sub(name, 9) == 0 then
                if LZB:ConfirmARRspeedChange() then
                    ARR:nastavCilovouRychlost(name,value,0)
                end
            else
                ARR:nastavCilovouRychlost(name,value,0)
            end
        end
	end
end