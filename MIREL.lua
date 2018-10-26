MIREL = { --objekt MIRELu
	--POPIS METOD:
		--PoleFCE()
			--PARAMETRY:
				--table of allowed values;
			--VRACI:
				--objekt hodnot -> true pro obsazene hodnoty;
			--interna funkcia MIRELu;

		--NastavMirel() 
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--provede prvotni init MIRELu;

		--BolToDecToBol()
			--PARAMETRY:
				--hodnota - vstupni promenna bool, or integer;
				--optional hranice - treshold, if integer is passed (everything bigger is true, smaller is false; 0.5 if it´s not set);
			--VRACI:
				--boolean if integer is set; integer, if boolean is set;
			--konverze boolean na integer a integeru na boolean;

		--divMod()
			--PARAMETRY:
				--x -number to be divided;
				--y -number which is x divided by;
			--VRACI:
				--integer division;
				--rest after integer division;
			--nahrada Fce modulo;
		
		--Update()
			--PARAMETRY:
				--deltaTime -difference from last call in CPU seconds;
				--deltaUpdateTimeFromGame -difference from last call in ingame seconds (passed as first argument to function Update() by game);
			--VRACI:
				--nil;
			--MIREL main stack();

		--Minus()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called, when - button is pressed;

		--Plus()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called, when + button is pressed;

		--Enter()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called, when Enter button is pressed;

		--JednorazovaBdelostnaVyzva()
			--PARAMETRY:
				--opakovana -true, when it´s repeated onetime acknowledgement;
			--VRACI:
				--nil;
			--function for onetime acknowledgement;

		--ModelujKrivku()
			--PARAMETRY:
				--navestNO -code from signal:
					--1 - warning signal;
					--2 - stop;
					--3 - clear;
					--4 - approach speedchange;
			--VRACI:
				--nil;
			--function which generates braking curve;

		--UkonciModelovaniKrivky()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which ends generating braking curve;

		--ZvysRychlost()
			--PARAMETRY:
				--novaRychlost -new speed limit;
			--VRACI:
				--nil;
			--function which is passed, when new speed limit is higher than old one;

		--NouzoveZastaveni()
			--PARAMETRY:
				--cislo -emergency brake code which is shown on display;
			--VRACI:
				--nil;
			--function which is passed, when automatic emergency braking is applied;

		--Bdelost()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function Acknowledgement which is called every Update;

		--NastavNarodniVolbu()
			--PARAMETRY:
				--kod -code of national setting:
					--1 - Czech;
					--2 - Slovak;
					--3 - Hungarian;
					--4 - Polish;
					--5 - German -MIREL is deactivated;
					--6 - Austrian -MIREL is deactivated;
			--VRACI:
				--nil;
			--function to set national code;

		--MirelInit()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every MIREL start;

		--OchranaPrekroceniRychlosti()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every Update;

		--OchranaNavolenehoSmeru()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every Update;

		--OchranaNezajisteni()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every Update;

		--VybaveniBdelostiOvladacem()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called to reset acknowledgement counter by control movement;

		--VybaveniBdelosti()
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called to reset acknowledgement counter by acknowledgement button;

		--ZpravyNavestidel()
			--PARAMETRY:
				--zprava -message from signal;
			--VRACI:
				--nil;
			--function which is called to push message from signal to MIREL;
			

	--NASTAVENIE MIRELu
		isControlerMovementVigilanceAcknowledgement = true,
		maxDesignSpeed = 160,
		displayChildName = "MIREL",
		--MIRELversion = 3,
		minusControlValueName = "NO12",
		plusControlValueName = "NO13",
		enterControlValueName = "NO14",
		batteryVariableName = "gBaterie",
		isActiveCabControlValueName = "Rizeni",
		isAnywhereActiveCabVariableName = "gRizeni",
		hasMaxPermissiveSpeedNeedle = true,
		maxPermissiveSpeedNeedleControlValueName = "Displej_MIRELrucicka",
		cabNumberControlValueName = "CisloKab",
		fajfkaCharacter = "F",
		emptyCharacter = "B",
		fullCharacter = "C",
		narodniVolba = 1,
		afterInitSpeed = 100,
		DEBUG = false,

	--KONSTANTY potrebne pro MIREL
		cesko = 1,
		slovensko = 2,
		madarsko = 3,
		polsko = 4,
		nemecko = 5,
		rakousko = 6,

	--PREMENNE potrebne pro MIREL
		D1_smerP = false,
		D1_smer0 = false,
		D1_smerZ = false,
		D1_BP_od = false,
		D1_BP_za = false,
		uspesnyD1 = false,
		casD1_1testu = 0,
		D1_testEPV = false,
		blokujEPV_NZ = false,
		D1_ujetaVzdalenost = 0,
		NZ = 0,
		bylaBdelost = false,
		bylaBdelostOvladac = false,
		rychlostPodleNavesti = 120,
		rychlostKrivky = 160,
		rychlostKrivkyAbs = 160,
		nastavenaRychlost = 100,
		zamekRychlostiVal = 160,
		zamekRychlosti = false,
		zobrazenaRychlost = 0,
		rychlostRezimu = 0,
		nejblizsiNavestidlo = -1,
		odpadleSoupatkoVZ = true,
		D1_blokujPrenos = false,
		D1_zacatekBloku = nil,
		blokujPrenosNavesti = false,
		vyzadujVybavovani = false,
		vyzadujVybavovaniOld = false,
		ubehlyCasNZ5 = 0,
		pocitejCasNZ5 = false,
		manual = false,
		CZSK = "",
		HU = "",
		PL = "",
		krivkaDecceleration = 0.4,
		rychlostKMH = 0,
		krivkaDelkaCas = 0,
		krivkaDelkaCasPred = 0,
		krivkaDelkaDraha = 0,
		krivkaDelkaDrahaPred = 0,
		krivkaDrahaUjeta = 0,
		vychoziRychlost = 160,
		modelujKrivkuDo120 = false,
		casPredKrivkou = 0,
		modelujKrivku = false,
		posledniKodCas = os.clock(),
		kodovaneMezikruzi = false,
		mezikruziZvyseni = 0,
		kod = 0,
		kodOld = 0,
		casBdelost = 0,
		bdelostInterval = 24,
		blokujBdelostVyzva = false,
		budeOpakovanaBdelostnaVyzva = false,
		smerZS3 = false,
		nezabrzdenieZS3 = false,
		testRychlost = false,
		testTlak = false,
		maxManual = 160,
		prekroceniRychlosti = false,
		nulovaTolerancia = false,

	NO = { --objekt NAVESTNEHO OPAKOVACA

		--KONSTANTY potrebne pro NO MIRELu
			DISPLEJ = {
				REZ = 1,
				NZ = 2,
				NZok = 3,
				RYCH = 4,
				POS = 5,
				PRE = 6,
				VYL = 7,
				ZAV = 8,
				TOL = 9,
				MEN = 10,
				PKP = 11,
				D1 = 12,
				NEAKTIVNE = 13,
				ULOZ = 14,
				nastRYCH = 15,
				MAX = 16,
				mezikruziRYCH = 17,
			},

		--PREMENNE potrebne pro NO MIRELu
			dreimalEmptyChar = "BBB",
			dreimalFullChar = "CCC",
			NO1 = false,
			NO2 = false,
			NO3 = false,
			NO4 = false,
			NO5 = false,
			NO7 = false,
			NO8 = false,
			NO9 = false,
			NO10 = false,
			NO11 = dreimalEmptyChar,
			NO11old = dreimalEmptyChar,
			NO12 = false,
			NO12tlac = false,
			NO12old = NO12,
			NO13 = false,
			NO13tlac = false,
			NO13old = NO13,
			NO14 = false,
			NO14tlac = false,
			NO14old = NO14,
			D1_1 = false,
			D1_2 = false,
			D1_3 = false,
			D1_4 = false,
			D1_5 = false,
			D1_6 = false,
			D1_7 = false,
			casUloz = 0,
			zopakujPriUlozeni = dreimalEmptyChar,
			rezim = "POS",
			rezimOld = rezim,
			init = false,
			prenosNavesti = false,
			casMenu = 0,
			casBlikani = 0,
			stavBlikani = true,
			blokujBlikaniPoZmene = false,
			casBlokovaniBlikani = 0,
			casRychloposuv = 0,
			rychloposuv = false,
			casTlacitek = 0,
			blokujZobrazeniRychlosti = false,
			casBlikaniNO10 = 0,
			blikejNO10 = false,
			blikejRychleNO10 = false,
			blokujBlikaniTest = false,

		--METODY:
			UlozRezim = function(self,NOrezim)
				f = assert(io.open("Assets/CS_addon/Kal000px/RailVehicles/Electric/Common/380 Script/NO.rez", "w"))
				-- Print("Zapisuji do souboru NO.rez, výsledek operace: ")
				-- Print(f:write(NOrezim))
				f:close()
				MIREL.NO.rezimOld = NOrezim
			end,
	},

	--METODY:
		PoleFCE = function (self,list)
			local set = {}
			for _, l in ipairs(list) do set[l] = true end
			return set
		end,

		NastavMIREL = function(self)
			-- Print("MIREL init promenych OK!")
			MIREL.NO.DISPLEJ.stav = 0
			MIREL.NO.DISPLEJ.blikej = false
			MIREL.NO.DISPLEJ.blikejRychle = false
			MIREL.NO.dreimalEmptyChar = MIREL.emptyCharacter..MIREL.emptyCharacter..MIREL.emptyCharacter
			MIREL.NO.dreimalFullChar = MIREL.fullCharacter..MIREL.fullCharacter..MIREL.fullCharacter
			MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
			MIREL.NO.NO11old = MIREL.NO.dreimalEmptyChar
			MIREL.NO.zopakujPriUlozeni = MIREL.NO.dreimalEmptyChar
			-- f = assert(io.open("Assets/CS_addon/Kal000px/RailVehicles/Electric/Common/380 Script/NO.rez", "r"))
			-- MIREL.NO.rezim = f:read("*all")
			-- Print("Precteny rezim je: "..MIREL.NO.rezim)
			-- f:close()
			MIREL.NO.rezim = "POS"
			MIREL.zamekRychlostiVal = MIREL.maxDesignSpeed
			MIREL.vychoziRychlost = MIREL.rychlostPodleNavesti
			MIREL.CZSK = MIREL:PoleFCE {"POS","PRE","VYL","ZAV"}
			MIREL.HU = MIREL:PoleFCE {"TOL","MEN"}
			MIREL.PL = MIREL:PoleFCE {"PKP"}
			if MIREL.NO.rezim == "POS" then
				MIREL.rychlostRezimu = 40
			elseif MIREL.NO.rezim == "PRE" then
				MIREL.rychlostRezimu = 160
			elseif MIREL.NO.rezim == "VYL" then
				MIREL.rychlostRezimu = 120
			elseif MIREL.NO.rezim == "ZAV" then
				MIREL.rychlostRezimu = 160
			end
			return(true)
		end,

		BolToDecToBol = function(self,hodnota,hranice)
			if hodnota == true then return(1) elseif hodnota == false then return(0) else
				if hranice ~= nil then
					if hodnota > hranice then
						return(true) 
					else
						return(false)
					end
				else
					if hodnota > 0.5 then
						return(true)
					else
						return(false)
					end
				end
			end
		end,

		divMod = function(self,x,y)
			return math.floor(x / y), x - math.floor(x/y)*y
		end,

		Update = function(self,deltaTime,deltaUpdateTimeFromGame)
			MIREL.NO.NO12old = MIREL.NO.NO12tlac
			MIREL.NO.NO13old = MIREL.NO.NO13tlac
			MIREL.NO.NO14old = MIREL.NO.NO14tlac
			MIREL.NO.NO12 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.minusControlValueName,0)) --minus
			MIREL.NO.NO13 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.plusControlValueName,0)) --plus
			MIREL.NO.NO14 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.enterControlValueName,0)) --Enter
			MIREL.NO.NO12tlac = MIREL.NO.NO12
			MIREL.NO.NO13tlac = MIREL.NO.NO13
			MIREL.NO.NO14tlac = MIREL.NO.NO14

			MIREL.vyzadujVybavovaniOld = MIREL.vyzadujVybavovani
			
			--citace
				MIREL.casD1_1testu = MIREL.casD1_1testu + deltaTime
				MIREL.NO.casUloz = MIREL.NO.casUloz + deltaTime
				MIREL.ubehlyCasNZ5 = MIREL.ubehlyCasNZ5 + deltaTime
				MIREL.NO.casMenu = MIREL.NO.casMenu + deltaTime
				MIREL.NO.casBlikani = MIREL.NO.casBlikani + deltaTime
				MIREL.NO.casRychloposuv = MIREL.NO.casRychloposuv + deltaTime
				MIREL.NO.casTlacitek = MIREL.NO.casTlacitek + deltaTime
				MIREL.NO.casBlokovaniBlikani = MIREL.NO.casBlokovaniBlikani + deltaTime
				MIREL.casPredKrivkou = MIREL.casPredKrivkou + deltaTime
				MIREL.NO.casBlikaniNO10 = MIREL.NO.casBlikaniNO10 + deltaTime
				

			--rychloposuv
				MIREL.NO.rychloposuv = false
				if not (MIREL.NO.NO12 or MIREL.NO.NO13) then --pokud neni zmackle tlacitko, nepocita cas rychloposuvu
					MIREL.NO.casTlacitek = 0
				elseif MIREL.NO.casTlacitek > 0.5 then --pokud uziv. drzi tlacitko > 0.5 sec, je aktivovan rychloposuv
					MIREL.NO.rychloposuv = true
					MIREL.NO.casRychloposuv = 1
				end
				if MIREL.NO.rychloposuv then --pokud je rychloposuv, spousti co 0.3 sec Fci prislusneho tlacitka
					if MIREL.NO.casRychloposuv > 1 then
						if MIREL.NO.NO12 then
							MIREL:Minus()
						else
							MIREL:Plus()
						end
						MIREL.NO.casRychloposuv = 0
					end
				else --jinak anuluje cas
					MIREL.NO.casRychloposuv = 0
				end
			
			MIREL.rychlostKMH = Call("GetSpeed")*3.6
			MIREL.krivkaDrahaUjeta = MIREL.krivkaDrahaUjeta + math.abs(MIREL.rychlostKMH/3.6) * deltaUpdateTimeFromGame

			if MIREL.rychlostKMH <= MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni and MIREL.manual then
				-- Print("Rusim MANUAL protoze rychlost je nizsi, nez cilova")
				MIREL.manual = false
			end

			if MIREL.modelujKrivku then
				if Call("GetControlValue", "Wheelslip", 0) ~= 1 then
					MIREL:Manual()
				end
				if MIREL.krivkaDrahaUjeta > MIREL.krivkaDelkaDrahaPred then --zacina snizovat rychlost dle krivky
					MIREL.nulovaTolerancia = true
					if MIREL.budeOpakovanaBdelostnaVyzva then
						MIREL:JednorazovaBdelostnaVyzva(true)
					end
					if not MIREL.modelujKrivkuDo120 then --krivka do nuly
						MIREL.rychlostKrivkyAbs = MIREL.vychoziRychlost - ((MIREL.krivkaDrahaUjeta-MIREL.krivkaDelkaDrahaPred)/MIREL.krivkaDelkaDraha) * MIREL.vychoziRychlost
					else --krivka pro 120
						MIREL.rychlostKrivkyAbs = MIREL.vychoziRychlost - ((MIREL.krivkaDrahaUjeta-MIREL.krivkaDelkaDrahaPred)/MIREL.krivkaDelkaDraha) * math.max(MIREL.vychoziRychlost-120,0)
					end
				end
				MIREL.rychlostKrivky = MIREL:divMod(MIREL.rychlostKrivkyAbs,5)*5
			end

			if MIREL.zobrazenaRychlost <= MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni or MIREL.zobrazenaRychlost <= 40 or (MIREL.modelujKrivkuDo120 and MIREL.zobrazenaRychlost <= 120) then
				MIREL:UkonciModelovaniKrivky()
			end

			if math.abs(os.clock()-MIREL.posledniKodCas) > 5 and MIREL.NO.rezim == "PRE" and MIREL.rychlostPodleNavesti >= 120 then --ztrata kodu
				MIREL.kod = 0
				Call("SetControlValue", "NO1", 0, 0)
				Call("SetControlValue", "NO2", 0, 0)
				Call("SetControlValue", "NO3", 0, 0)
				Call("SetControlValue", "NO4", 0, 0)
				MIREL.NO.prenosNavesti = false
				MIREL.kodovaneMezikruzi = false
				MIREL.NO.NO7 = false
				MIREL.NO.NO8 = false
				MIREL.mezikruziZvyseni = 0
				MIREL.rychlostPodleNavesti = 120
				if MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni < MIREL.zobrazenaRychlost and not MIREL.modelujKrivku and not MIREL.manual then
					MIREL:ModelujKrivku(MIREL.kod)
				elseif (not MIREL.modelujKrivku and not MIREL.manual) or MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni > MIREL.zobrazenaRychlost or Call("GetSpeed") < 5 then
					MIREL:ZvysRychlost(MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
				end
			elseif math.abs(os.clock()-MIREL.posledniKodCas) > 23 and MIREL.NO.rezim == "PRE" then --ztrata kodu pri kodovani omezujiciho znaku
				MIREL.kod = 0
				Call("SetControlValue", "NO1", 0, 0)
				Call("SetControlValue", "NO2", 0, 0)
				Call("SetControlValue", "NO3", 0, 0)
				Call("SetControlValue", "NO4", 0, 0)
				MIREL.NO.prenosNavesti = false
				MIREL.kodovaneMezikruzi = false
				MIREL.NO.NO7 = false
				MIREL.NO.NO8 = false
				MIREL.mezikruziZvyseni = 0
				MIREL.rychlostPodleNavesti = 120
				if MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni < MIREL.zobrazenaRychlost and not MIREL.modelujKrivku and not MIREL.manual then
					MIREL:ModelujKrivku(MIREL.kod)
				elseif (not MIREL.modelujKrivku and not MIREL.manual) or MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni > MIREL.zobrazenaRychlost or Call("GetSpeed") < 5 then
					MIREL:ZvysRychlost(MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
				end
			elseif math.abs(os.clock()-MIREL.posledniKodCas) > 0.2 then
				MIREL.NO.NO7 = false
				MIREL.NO.NO8 = false
				Call("SetControlValue", "NO1", 0, 0)
				Call("SetControlValue", "NO2", 0, 0)
				Call("SetControlValue", "NO3", 0, 0)
				Call("SetControlValue", "NO4", 0, 0)
			end

			if MIREL.DEBUG then --DEBUG printy
				if tostring(MIREL.modelujKrivku)..MIREL.rychlostKrivky..MIREL.NO.rezim..tostring(MIREL.manual)..MIREL.nastavenaRychlost ~= testOld then
					testOld = tostring(MIREL.modelujKrivku)..MIREL.rychlostKrivky..MIREL.NO.rezim..tostring(MIREL.manual)..MIREL.nastavenaRychlost
					Print("Modeluji krivku: "..tostring(MIREL.modelujKrivku))
					Print("Rychlost absolutni: "..MIREL.rychlostKrivkyAbs)
					Print("Rychlost z disp.: "..MIREL.rychlostKrivky)
					Print("RezimNO: "..MIREL.NO.rezim)
					Print("Ujeta vzdalenost: "..MIREL.krivkaDrahaUjeta)
					Print("Manual: "..tostring(MIREL.manual))
					Print("Maximalni ryclost z manualu: "..MIREL.maxManual)
					Print("Maximalni rychlost: "..MIREL.nastavenaRychlost)
					Print("Cilova rychlost:"..MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
					Print("Rychlost:"..MIREL.rychlostKMH)
				end
			end

			if MIREL.hasMaxPermissiveSpeedNeedle then
				Call("SetControlValue",MIREL.maxPermissiveSpeedNeedleControlValueName,0,MIREL.rychlostKrivkyAbs)
			end
			
			if _G[MIREL.batteryVariableName] == 1 and MIREL.narodniVolba > 0 and MIREL.narodniVolba < 5 then
				MIREL.testRychlost = false
				MIREL.testTlak = false
				MIREL.NO.blokujBlikaniTest = false
				if (MIREL.uspesnyD1 == false or MIREL.NO.rezim == "ZAV") and (MIREL.NO.NO12 or MIREL.NO.NO13) and MIREL.NO.NO14 then
					MIREL.NO.NO14 = false
					if MIREL.NO.NO12 then
						MIREL.testRychlost = true
					elseif MIREL.NO.NO13 then
						MIREL.testTlak = true
					end
					MIREL.NO.NO12 = false
					MIREL.NO.NO13 = false
					MIREL.NO.blokujBlikaniTest = true
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
				end

				if not MIREL.uspesnyD1 then --D1 test
					MIREL.NO.NO11 = "BD1"
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.D1
					if rizeniAkt == nil then
						if Call("GetControlValue","ZS11",0) == 1 then
							Call("SetControlValue","ZS11",0,0)
						else
							Call("SetControlValue","ZS11",0,1)
						end
						rizeniAkt = _G[MIREL.isAnywhereActiveCabVariableName]
						MIREL.casD1_1testu = 0
						MIREL.D1_1 = true
						MIREL.D1_2 = true
						MIREL.D1_3 = true
						MIREL.D1_4 = true
						MIREL.D1_5 = true
						MIREL.D1_6 = true
						MIREL.D1_7 = true
						MIREL.D1_zacatekBloku = os.clock()
						MIREL.D1_blokujPrenos = true
						MIREL.odpadleSoupatkoVZ = false
					end

					MIREL.D1_ujetaVzdalenost = MIREL.D1_ujetaVzdalenost + math.abs(MIREL.rychlostKMH/3.6) * deltaUpdateTimeFromGame
					if MIREL.narodniVolba == MIREL.madarsko then
						if math.abs(MIREL.rychlostKMH) > 0.1 then
							MIREL:NouzoveZastaveni(3)
						end
					else
						if MIREL.D1_ujetaVzdalenost > 10 then
							MIREL.D1_ujetaVzdalenost = 0
							MIREL:NouzoveZastaveni(3)
						end
					end

					if MIREL.casD1_1testu > 0.5 and MIREL.D1_1 then
						MIREL.D1_1 = false
						MIREL.casD1_1testu = 0
						-- Print("Test MIREL.D1_1 uspesny!")
					end

					if rizeniAkt == 0 then
						if _G[MIREL.isAnywhereActiveCabVariableName] == 1 and MIREL.D1_2 then
							MIREL.D1_2 = false
							-- Print("Test MIREL.D1_2 uspesny!")
						end
					elseif rizeniAkt == 1 then
						if _G[MIREL.isAnywhereActiveCabVariableName] == 0 and MIREL.D1_2 then
							MIREL.D1_2 = false
							-- Print("Test MIREL.D1_2 uspesny!")
						end
					end

					if _G[MIREL.isAnywhereActiveCabVariableName] == 1 then
						if Call("GetControlValue","Reverser",0) == 0 then
							MIREL.D1_smer0 = true
						end
						if Call("GetControlValue","Reverser",0) == 1 then
							MIREL.D1_smerP = true
						end
						if MIREL.D1_smer0 and MIREL.D1_smerP and MIREL.D1_3 then
							MIREL.D1_3 = false
							-- Print("Test MIREL.D1_3 uspesny!")
						end

						if Call("GetControlValue","Reverser",0) == 0 then
							MIREL.D1_smer0 = true
						end
						if Call("GetControlValue","Reverser",0) == -1 then
							MIREL.D1_smerZ = true
						end
						if MIREL.D1_smer0 and MIREL.D1_smerZ and MIREL.D1_4 then
							MIREL.D1_4 = false
							-- Print("Test MIREL.D1_4 uspesny!")
						end
						
						if Call("GetControlValue","EngineBrakeControl",0) == 1 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) >= 3.5 then
							MIREL.D1_BP_od = true
						end
						if Call("GetControlValue","EngineBrakeControl",0) == 0 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) == 0 then
							MIREL.D1_BP_za = true
						end
						if MIREL.D1_BP_od and MIREL.D1_BP_za and MIREL.D1_5 then
							MIREL.D1_5 = false
							-- Print("Test MIREL.D1_5 uspesny!")
						end
						
						if Call("GetControlValue","BrakePipePressureBAR",0) >= 4.9 and MIREL.D1_6 and not MIREL.blokujEPV_NZ then
							MIREL.odpadleSoupatkoVZ = true
							MIREL.D1_testEPV = true
							-- Print("Zahajuji test MIREL.D1_6!")
						end
						if MIREL.D1_testEPV and Call("GetControlValue","BrakePipePressureBAR",0) < 3 and MIREL.D1_6 then
							MIREL.D1_testEPV = false
							MIREL.odpadleSoupatkoVZ = false
							MIREL.D1_6 = false
							-- Print("Test MIREL.D1_6 uspesny!")
						end

						if Call("GetControlValue","BrakePipePressureBAR",0) >= 4.9 and not MIREL.D1_6 and MIREL.D1_7 and not MIREL.blokujEPV_NZ then
							MIREL.odpadleSoupatkoVZ = true
							MIREL.D1_testEPV = true
							-- Print("Zahajuji test MIREL.D1_7!")
						end
						if MIREL.D1_testEPV and Call("GetControlValue","BrakePipePressureBAR",0) < 3 and not MIREL.D1_6 then
							MIREL.D1_testEPV = false
							MIREL.odpadleSoupatkoVZ = false
							MIREL.D1_7 = false
							-- Print("Test MIREL.D1_7 uspesny!")
						end
					end
					
					if not MIREL.D1_1 and not MIREL.D1_2 and not MIREL.D1_3 and not MIREL.D1_4 and not MIREL.D1_5 and not MIREL.D1_6 and not MIREL.D1_7 then
						MIREL.uspesnyD1 = true
					end
				else --MIREL po D1 testu
					if Call("GetControlValue",MIREL.isActiveCabControlValueName,0) == 1 then --stanoviste aktivne
						MIREL.casBdelost = MIREL.casBdelost + deltaTime

						if MIREL.zamekRychlosti then
							Call("SetControlValue","NO_bodka",1)
						else
							Call("SetControlValue","NO_bodka",0)
						end
						
						if MIREL.NO.rezim ~= "ZAV" then
							if not MIREL.manual then
								MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.rychlostKrivky,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
							else
								MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.maxManual,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
							end
						else
							MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed
						end

						if (MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko) and not MIREL.CZSK[MIREL.NO.rezim] then
							MIREL.NO.rezim = "POS"
						elseif MIREL.narodniVolba == MIREL.madarsko and not MIREL.HU[MIREL.NO.rezim] then
							MIREL.NO.rezim = "TOL"
							Call("SetControlValue","ZS1B",0,1)
							MIREL.blokujEPV_NZ = true
							MIREL.odpadleSoupatkoVZ = true
							MIREL.NO.NO7 = false
							MIREL.NO.NO8 = true
							MIREL.NO.NO9 = true
						elseif MIREL.narodniVolba == MIREL.polsko and not MIREL.PL[MIREL.NO.rezim] then
							MIREL.NO.rezim = "PKP"
						end

						if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then --ceska a slovenska verzia
							
							if MIREL.manual then
								MIREL.NO.NO9 = true
								if MIREL.maxManual > 120 then
									MIREL.maxManual = math.min(Call("GetSpeed")*3.6,MIREL.maxManual)
								end
							else
								MIREL.NO.NO9 = false
							end

							MIREL:Bdelost()

							if not MIREL.modelujKrivku then
								if MIREL.zobrazenaRychlost <= 80 then
									MIREL.krivkaDecceleration = 0.4
								elseif MIREL.zobrazenaRychlost <= 100 then
									MIREL.krivkaDecceleration = 0.6
								elseif MIREL.zobrazenaRychlost <= 140 then
									MIREL.krivkaDecceleration = 0.82
								else
									MIREL.krivkaDecceleration = 0.94
								end
							end

							if MIREL.NO.rezim ~= MIREL.NO.rezimOld then
								MIREL.NO:UlozRezim(MIREL.NO.rezim)
							end

							if not MIREL.NO.init then
								MIREL:MirelInit()
							end

							if MIREL.D1_blokujPrenos then -- blokovani prenosu po D1 testu
								if math.abs(MIREL.D1_zacatekBloku - os.clock()) > 90 then
									MIREL.D1_blokujPrenos = false
								end
							end

							if MIREL.NO.NO12 and not MIREL.NO.NO12old then -- MINUS
								MIREL:Minus()
							end

							if MIREL.NO.NO13 and not MIREL.NO.NO13old then -- PLUS
								MIREL:Plus()
							end
								
							if MIREL.NO.NO14 and not MIREL.NO.NO14old then -- ENTER
								MIREL:Enter()
							end

							if not MIREL.NO.blokujZobrazeniRychlosti and math.abs(MIREL.rychlostKMH) > 0.1 and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.NZ then -- zavreti MENU za jazdy
								if not MIREL.manual then
									MIREL.NO.NO11 = MIREL.zobrazenaRychlost
								else
									MIREL.NO.NO11 = MIREL.rychlostKrivky
									MIREL.NO.DISPLEJ.blikej = true
									MIREL.NO.DISPLEJ.blikejRychle = true
								end
								if not MIREL.prekroceniRychlosti and not MIREL.manual then
									MIREL.NO.DISPLEJ.blikej = false
									MIREL.NO.DISPLEJ.blikejRychle = false
								end
								MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
								MIREL.NO.casMenu = 0
							end

							if MIREL.NO.casMenu > 5 and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.NZ then -- zavreti MENU pri neaktivite
								MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
								if MIREL.NO.rezim ~= "ZAV" then
									if not MIREL.manual then
										MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.rychlostKrivky,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
									else
										MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.maxManual,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
									end
								else
									MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed
								end
								if not MIREL.manual then
									MIREL.NO.NO11 = MIREL.zobrazenaRychlost
									MIREL.NO.DISPLEJ.blikej = false
									MIREL.NO.DISPLEJ.blikejRychle = false
								else
									MIREL.NO.NO11 = MIREL.rychlostKrivky
									MIREL.NO.DISPLEJ.blikej = true
									MIREL.NO.DISPLEJ.blikejRychle = true
								end
								MIREL.NO.blokujZobrazeniRychlosti = false
							end

							if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ULOZ then -- NO ulozenie a zopakovanie volby
								MIREL.NO.casMenu = 0
								if MIREL.NO.casUloz > 0.5 then
									MIREL.NO.NO11 = MIREL.NO.zopakujPriUlozeni
								end
								if MIREL.NO.casUloz > 5 then
									if not MIREL.manual then
										MIREL.NO.NO11 = MIREL.zobrazenaRychlost
										MIREL.NO.DISPLEJ.blikej = false
										MIREL.NO.DISPLEJ.blikejRychle = false
									else
										MIREL.NO.NO11 = MIREL.rychlostKrivky
										MIREL.NO.DISPLEJ.blikej = true
										MIREL.NO.DISPLEJ.blikejRychle = true
									end
									MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
									MIREL.NO.blokujZobrazeniRychlosti = false
								end
							end

							MIREL.smerZS3 = false

							if MIREL.NO.rezim == "POS" then -- MIREL.NO.rezim POS
								MIREL.blokujPrenosNavesti = true
								MIREL.rychlostRezimu = 40
								if math.abs(MIREL.rychlostKMH) > 20 then
									MIREL.vyzadujVybavovani = true
								else
									MIREL.vyzadujVybavovani = false
								end

								MIREL:OchranaPrekroceniRychlosti()

								MIREL:OchranaNavolenehoSmeru()

								MIREL:OchranaNezajisteni()

							elseif MIREL.NO.rezim == "PRE" then -- MIREL.NO.rezim PRE
								MIREL.blokujPrenosNavesti = false
								MIREL.rychlostRezimu = 160
								if (not MIREL.NO.prenosNavesti or MIREL.manual or MIREL.rychlostKrivky == 40 or (MIREL.rychlostKMH > 90 and MIREL.kod == 1) or (MIREL.kod == 4 and MIREL.zobrazenaRychlost > 40)) and not (Call("GetSpeed") < 0.1 or (Call("GetSpeed")*3.6 < 15 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 2)) then
									MIREL.vyzadujVybavovani = true
								else
									MIREL.vyzadujVybavovani = false
								end

								MIREL:OchranaPrekroceniRychlosti()

								MIREL:OchranaNavolenehoSmeru()

								MIREL:OchranaNezajisteni()

							elseif MIREL.NO.rezim == "VYL" then -- MIREL.NO.rezim VYL
								MIREL.blokujPrenosNavesti = true
								MIREL.rychlostRezimu = 120
								if MIREL.rychlostKMH < 0.1 or (MIREL.rychlostKMH < 15 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 2) then
									MIREL.vyzadujVybavovani = false
								else
									MIREL.vyzadujVybavovani = true
								end

								MIREL:OchranaPrekroceniRychlosti()

								MIREL:OchranaNavolenehoSmeru()

								MIREL:OchranaNezajisteni()

							elseif MIREL.NO.rezim == "ZAV" then -- MIREL.NO.rezim ZAV
								MIREL.blokujPrenosNavesti = true
								MIREL.rychlostRezimu = 160
								MIREL.vyzadujVybavovani = false
								MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed

								MIREL:OchranaPrekroceniRychlosti()

								MIREL:OchranaNavolenehoSmeru()

							end

							Call("SetControlValue","ZS3",0,math.max(MIREL:BolToDecToBol(MIREL.smerZS3),MIREL:BolToDecToBol(MIREL.nezabrzdenieZS3)))

							if not MIREL.manual then
								if MIREL.rychlostKMH > 110 then
									MIREL.bdelostInterval = 16
								elseif MIREL.rychlostKMH > 40 then
									MIREL.bdelostInterval = 24 - ((MIREL.rychlostKMH-40)/8.75)
								else
									MIREL.bdelostInterval = 24
								end
							else
								MIREL.bdelostInterval = 12
							end
						end

					else -- vypnute stanoviste
						if MIREL.narodniVolba == MIREL.madarsko then
							MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
							MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
						else
							MIREL.NO.NO11 = "ST-"
							MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
						end
						if math.abs(MIREL.rychlostKMH) > 3 and _G[MIREL.isAnywhereActiveCabVariableName] == 1 then
							MIREL:NouzoveZastaveni(2)
						end
						MIREL.NO.DISPLEJ.blikej = false
						MIREL.NO.DISPLEJ.blikejRychle = false
						MIREL.blokujPrenosNavesti = true
						MIREL.NO.NO5 = false
						Call("SetControlValue","NO_bodka",0)
					end
				end
				

				if not MIREL.modelujKrivku then
					if math.abs(MIREL.rychlostKMH) < 0.1 then
						MIREL.NO.NO10 = true
					else
						MIREL.NO.NO10 = false
					end
				else
					if MIREL.NO.blikejNO10 then
						if MIREL.NO.blikejRychleNO10 then
							if MIREL.NO.casBlikaniNO10 > 0.2 then
								MIREL.NO.casBlikaniNO10 = 0
								if MIREL.NO.NO10 then
									MIREL.NO.NO10 = false
								else
									MIREL.NO.NO10 = true
								end
							end
						else
							if MIREL.NO.casBlikaniNO10 > 0.5 then
								MIREL.NO.casBlikaniNO10 = 0
								if MIREL.NO.NO10 then
									MIREL.NO.NO10 = false
								else
									MIREL.NO.NO10 = true
								end
							end
						end
					else
						MIREL.NO.NO10 = false
					end
				end

				if (Call("GetControlValue","AWSreset",0) ~= 1 and MIREL.bylaBdelost) or MIREL.bylaBdelostOvladac then
					MIREL.vyzadujVybavovaniOld = MIREL.vyzadujVybavovani
					Call("SetControlValue","ZS1",0,0)
					Call("SetControlValue","ZS1B",0,0)
					MIREL.blokujBdelostVyzva = false
					if MIREL.NO.blikejNO10 then
						MIREL.NO.blikejRychleNO10 = true
					end
					if MIREL.NZ == 0 then
						MIREL.casBdelost = 0
					end
					if MIREL.NO.NO5 and MIREL.bylaBdelost then
						if Call("GetControlValue","ZS8",0) == 1 then
							Call("SetControlValue","ZS8",0,0)
						else
							Call("SetControlValue","ZS8",0,1)
						end
					end
					MIREL.bylaBdelost = false
					MIREL.bylaBdelostOvladac = false
				end

				if MIREL.NO.NO11 ~= MIREL.NO.NO11old then
					MIREL.NO.blokujBlikaniPoZmene = true
					MIREL.NO.casBlokovaniBlikani = 0
					MIREL.NO.NO11old = MIREL.NO.NO11
				end

				if MIREL.NO.blokujBlikaniPoZmene and MIREL.NO.casBlokovaniBlikani > 0.7 then
					MIREL.NO.blokujBlikaniPoZmene = false
				end

				if MIREL.testRychlost then
					MIREL.NO.NO11 = math.floor(math.abs(Call("GetSpeed"))*3.6)
				end

				if MIREL.testTlak then
					MIREL.NO.NO11 = string.sub(tostring(Call("GetControlValue","BrakePipePressureBAR",0)),0,3)
				end

				while string.len(MIREL.NO.NO11) < 3 do
					MIREL.NO.NO11 = MIREL.emptyCharacter .. MIREL.NO.NO11
				end

				if MIREL.NO.DISPLEJ.blikej and not MIREL.NO.blokujBlikaniPoZmene and not MIREL.NO.blokujBlikaniTest then
					if not MIREL.NO.DISPLEJ.blikejRychle then
						if MIREL.NO.casBlikani > 0.5 then
							MIREL.NO.casBlikani = 0
							if MIREL.NO.stavBlikani then
								MIREL.NO.stavBlikani = false
								Call("MIREL:SetText", MIREL.NO.dreimalEmptyChar, 0)
							else
								MIREL.NO.stavBlikani = true
								Call("MIREL:SetText", MIREL.NO.NO11, 0)
							end
						end
					else
						if MIREL.NO.casBlikani > 0.2 then
							MIREL.NO.casBlikani = 0
							if MIREL.NO.stavBlikani then
								MIREL.NO.stavBlikani = false
								Call("MIREL:SetText", MIREL.NO.dreimalEmptyChar, 0)
							else
								MIREL.NO.stavBlikani = true
								Call("MIREL:SetText", MIREL.NO.NO11, 0)
							end
						end
					end
				else
					Call("MIREL:SetText", MIREL.NO.NO11, 0)
				end
			else
				Call("MIREL:SetText", MIREL.NO.dreimalEmptyChar, 0)
				MIREL.NO.DISPLEJ.blikej = false
				MIREL.uspesnyD1 = false
				MIREL.D1_smerP = false
				MIREL.D1_smer0 = false
				MIREL.D1_smerZ = false
				MIREL.D1_BP_od = false
				MIREL.D1_BP_za = false
				MIREL.casD1_1testu = 0
				MIREL.D1_testEPV = false
				MIREL.blokujEPV_NZ = false
				MIREL.D1_ujetaVzdalenost = 0
				-- Call("SetControlValue","PomernyTah",0,-1)
				-- PomernyTah = -1
				MIREL.odpadleSoupatkoVZ = false
				MIREL.blokujEPV_NZ = false
				MIREL.vyzadujVybavovani = true
				MIREL:NouzoveZastaveni(0)
				MIREL.D1_1 = false
				MIREL.D1_2 = false
				MIREL.D1_3 = false
				MIREL.D1_4 = false
				MIREL.D1_5 = false
				MIREL.D1_6 = false
				MIREL.D1_7 = false
				rizeniAkt = nil
				MIREL.NO.init = false
				MIREL.NO.NO1 = false
				MIREL.NO.NO2 = false
				MIREL.NO.NO3 = false
				MIREL.NO.NO4 = false
				MIREL.NO.NO5 = false
				MIREL.NO.NO7 = false
				MIREL.NO.NO8 = false
				MIREL.NO.NO9 = false
				MIREL.NO.NO10 = false
				MIREL.zamekRychlosti = false
				Call("SetControlValue","NO_bodka",0)
				Call("SetControlValue", "NO1", 0, 0)
				Call("SetControlValue", "NO2", 0, 0)
				Call("SetControlValue", "NO3", 0, 0)
				Call("SetControlValue", "NO4", 0, 0)
			end
			if not MIREL.NO.blokujBlikaniTest then
				Call("SetControlValue","D1_1",0,MIREL:BolToDecToBol(MIREL.D1_1))
				Call("SetControlValue","D1_2",0,MIREL:BolToDecToBol(MIREL.D1_2))
				Call("SetControlValue","D1_3",0,MIREL:BolToDecToBol(MIREL.D1_3))
				Call("SetControlValue","D1_4",0,MIREL:BolToDecToBol(MIREL.D1_4))
				Call("SetControlValue","D1_5",0,MIREL:BolToDecToBol(MIREL.D1_5))
				Call("SetControlValue","D1_6",0,MIREL:BolToDecToBol(MIREL.D1_6))
				Call("SetControlValue","D1_7",0,MIREL:BolToDecToBol(MIREL.D1_7))
			else
				Call("SetControlValue","D1_1",0,0)
				Call("SetControlValue","D1_2",0,0)
				Call("SetControlValue","D1_3",0,0)
				Call("SetControlValue","D1_4",0,0)
				Call("SetControlValue","D1_5",0,0)
				Call("SetControlValue","D1_6",0,0)
				Call("SetControlValue","D1_7",0,0)
			end
			Call("SetControlValue","NO5",0,MIREL:BolToDecToBol(MIREL.NO.NO5))
			Call("SetControlValue","NO7",0,MIREL:BolToDecToBol(MIREL.NO.NO7))
			Call("SetControlValue","NO8",0,MIREL:BolToDecToBol(MIREL.NO.NO8))
			Call("SetControlValue","NO9",0,MIREL:BolToDecToBol(MIREL.NO.NO9))
			Call("SetControlValue","NO10",0,MIREL:BolToDecToBol(MIREL.NO.NO10))
			Call("SetControlValue","NO_bodka",0,MIREL:BolToDecToBol(MIREL.zamekRychlosti))

		end,

		Minus = function(self)
			if math.abs(MIREL.rychlostKMH) < 0.1 then --zadavání do menu pri stati
				MIREL.NO.casMenu = 0
				if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAX then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.REZ
					MIREL.NO.NO11 = "REZ"
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PRE then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.POS
					MIREL.NO.NO11 = "POS"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.VYL then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PRE
					MIREL.NO.NO11 = "PRE"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZAV then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.VYL
					MIREL.NO.NO11 = "VYL"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.nastRYCH then
					if MIREL.nastavenaRychlost > 10 then
						MIREL.nastavenaRychlost = MIREL.nastavenaRychlost - 5
						MIREL.NO.NO11 = MIREL.nastavenaRychlost
					end
					MIREL.NO.DISPLEJ.blikej = true
				end
			end
		end,

		Plus = function(self)
			if math.abs(MIREL.rychlostKMH) < 0.1 then --zadavání do menu pri stati
				MIREL.NO.casMenu = 0
				if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.REZ
					MIREL.NO.NO11 = "REZ"
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.REZ then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAX
					MIREL.NO.NO11 = "MAX"
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.POS then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PRE
					MIREL.NO.NO11 = "PRE"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PRE then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.VYL
					MIREL.NO.NO11 = "VYL"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.VYL then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ZAV
					MIREL.NO.NO11 = "ZAV"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.nastRYCH then
					if MIREL.nastavenaRychlost < 160 then
						MIREL.nastavenaRychlost = MIREL.nastavenaRychlost + 5
						MIREL.NO.NO11 = MIREL.nastavenaRychlost
					end
					MIREL.NO.DISPLEJ.blikej = true
				end
			elseif MIREL.kodovaneMezikruzi and math.abs(MIREL.rychlostKMH) > 1 and MIREL.mezikruziZvyseni < 80 then -- zvysovanie maximalnej rychlosti pri kodovani medzikruzia
				MIREL.NO.DISPLEJ.blikej = true
				MIREL.NO.casMenu = 3 -- zavre se za 2 vteriny
				MIREL.NO.blokujZobrazeniRychlosti = true
				if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.mezikruziRYCH
					MIREL.NO.NO11 = MIREL.mezikruziZvyseni + 40
					-- Print("Zapinam MIREL.NO.rezim zmeny rychlosti mezikruzi; Aktualni: "..MIREL.mezikruziZvyseni+40)
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.mezikruziRYCH then
					if MIREL.mezikruziZvyseni < 80 then
						MIREL.mezikruziZvyseni = MIREL.mezikruziZvyseni + 20
						-- Print("Zvedam mezikruzi; Aktualni: "..MIREL.mezikruziZvyseni+40)
						MIREL.NO.NO11 = MIREL.mezikruziZvyseni + 40
					end
				end
			end
		end,

		Enter = function(self)
			-- Print("Enter zmack")
			if math.abs(MIREL.rychlostKMH) < 0.1 then --zadavání do menu pri stati
				MIREL.NO.casUloz = 0
				MIREL.NO.casMenu = 0
				if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.REZ then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.POS
					MIREL.NO.NO11 = "POS"
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAX then
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.nastRYCH
					MIREL.NO.NO11 = MIREL.nastavenaRychlost
					MIREL.NO.DISPLEJ.blikej = true
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.nastRYCH then
					MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
					MIREL.NO.zopakujPriUlozeni = MIREL.nastavenaRychlost
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.POS then
					MIREL.NO.rezim = "POS"
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
					MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
					MIREL.blokujPrenosNavesti = true
					MIREL.NO.zopakujPriUlozeni = "POS"
					MIREL.rychlostRezimu = 40
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PRE then
					MIREL.NO.rezim = "PRE"
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
					MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
					MIREL.blokujPrenosNavesti = false
					MIREL.NO.zopakujPriUlozeni = "PRE"
					MIREL.rychlostRezimu = 160
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.VYL then
					MIREL.NO.rezim = "VYL"
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
					MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
					MIREL.blokujPrenosNavesti = true
					MIREL.NO.zopakujPriUlozeni = "VYL"
					MIREL.rychlostRezimu = 120
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZAV then
					MIREL.NO.rezim = "ZAV"
					MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
					MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
					MIREL.blokujPrenosNavesti = true
					MIREL.NO.zopakujPriUlozeni = "ZAV"
					MIREL.rychlostRezimu = 160
					MIREL.NO.DISPLEJ.blikej = false
				elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.NZ then
					if MIREL.NO.NO11 == "NZ5" then
						if Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 0.1 then
							MIREL:NouzoveZastaveni(0)
							MIREL.NO.casUloz = 0
							MIREL.NO.casMenu = 0
							MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
							MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
							MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
							MIREL.NO.blokujZobrazeniRychlosti = true
							MIREL.NO.DISPLEJ.blikej = false
						end
					elseif MIREL.NO.NO11 == "NZ3" then
						if Call("GetSpeed") < 0.1 then
							MIREL:NouzoveZastaveni(0)
							MIREL.NO.casUloz = 0
							MIREL.NO.casMenu = 0
							MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
							MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
							MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
							MIREL.NO.blokujZobrazeniRychlosti = true
							MIREL.NO.DISPLEJ.blikej = false
						end
					else
						MIREL:NouzoveZastaveni(0)
						MIREL.NO.casUloz = 0
						MIREL.NO.casMenu = 0
						MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
						MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
						MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
						MIREL.NO.blokujZobrazeniRychlosti = true
						MIREL.NO.DISPLEJ.blikej = false
					end
				end
			elseif MIREL.modelujKrivku and MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and not MIREL.manual then
				MIREL:Manual()
			elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.rychlostKMH > 10 and not MIREL.zamekRychlosti and MIREL.NO.rezim == "PRE" then --systém Najvyššej dovolenej
				MIREL.NO.casUloz = 0
				MIREL.NO.casMenu = 0
				local cele, zbytek = MIREL:divMod(MIREL.rychlostKMH,5)
				if zbytek > 1 then
					MIREL.zamekRychlostiVal = cele*5 + 5
				else
					MIREL.zamekRychlostiVal = cele*5
				end
				MIREL.zamekRychlosti = true
				MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
				MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
				MIREL.NO.zopakujPriUlozeni = "ZAP"
				MIREL.NO.blokujZobrazeniRychlosti = true
				MIREL.NO.DISPLEJ.blikej = false
			end
			if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.zamekRychlosti then
				MIREL.NO.casUloz = 0
				MIREL.NO.casMenu = 0
				MIREL.zamekRychlosti = false
				MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
				MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
				MIREL.NO.zopakujPriUlozeni = "VYP"
				MIREL.zamekRychlostiVal = MIREL.maxDesignSpeed
				MIREL.NO.blokujZobrazeniRychlosti = true
				MIREL.NO.DISPLEJ.blikej = false
			end
		end,

		JednorazovaBdelostnaVyzva = function(self,opakovana)
			MIREL.casBdelost = 0
			MIREL.blokujBdelostVyzva = true
			if opakovana then
				Call("SetControlValue","ZS1",0,1)
				MIREL.budeOpakovanaBdelostnaVyzva = false
			else
				Call("SetControlValue","ZS1B",0,1)
			end
		end,

		Manual = function(self)
			MIREL.NO.casUloz = 0
			MIREL.NO.casMenu = 0
			MIREL.manual = true
			if Call("GetSpeed")*3.6 > 120 then
				MIREL.maxManual = Call("GetSpeed")*3.6
			else
				MIREL.maxManual = 120
			end
			-- Print(MIREL.maxManual)
			MIREL:UkonciModelovaniKrivky()
			MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
			MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
			MIREL.NO.zopakujPriUlozeni = "MAN"
			MIREL.NO.blokujZobrazeniRychlosti = true
			MIREL.NO.DISPLEJ.blikej = false
			MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.maxManual,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
		end,

		ModelujKrivku = function(self,navestNO)
			if (MIREL.rychlostKMH > 40 and (navestNO == 2 or navestNO == 4)) or MIREL.rychlostKMH > 120 then
				MIREL.modelujKrivku = true
				-- Print("NO kod: "..navestNO)
				if navestNO ~= 1 and navestNO ~= 0 then
					MIREL.krivkaDelkaCas = MIREL.zobrazenaRychlost/(MIREL.krivkaDecceleration*3.6)
					MIREL.krivkaDelkaDraha = ((MIREL.zobrazenaRychlost/3.6)*MIREL.krivkaDelkaCas) - (0.5 * MIREL.krivkaDecceleration * MIREL.krivkaDelkaCas^2)
					MIREL.modelujKrivkuDo120 = false
					-- Print("Cilova rychlost: 0")
				else
					MIREL.krivkaDelkaCas = (MIREL.zobrazenaRychlost-120)/(MIREL.krivkaDecceleration*3.6)
					MIREL.krivkaDelkaDraha = ((MIREL.zobrazenaRychlost/3.6)*MIREL.krivkaDelkaCas) - (0.5 * MIREL.krivkaDecceleration * MIREL.krivkaDelkaCas^2)
					MIREL.modelujKrivkuDo120 = true
					-- Print("Cilova rychlost: 120")
				end
				MIREL.krivkaDelkaDrahaPred = math.max(900 - MIREL.krivkaDelkaDraha,0)
				MIREL.krivkaDelkaCasPred = MIREL.krivkaDelkaDrahaPred / MIREL.zobrazenaRychlost
				MIREL.krivkaDrahaUjeta = 0
				if MIREL.DEBUG then
					Print("RychlostNO: "..MIREL.zobrazenaRychlost)
					Print("Planovane zpomaleni: "..MIREL.krivkaDecceleration)
					Print("Delka krivky [s]: "..MIREL.krivkaDelkaCas)
					Print("Delka krivky [m]: "..MIREL.krivkaDelkaDraha)
					Print("Delka do zacatku krivky [m]: "..MIREL.krivkaDelkaDrahaPred)
					Print("Cas do nouzoveho brzdeni [s]: "..MIREL.krivkaDelkaCasPred)
				end
				if MIREL.krivkaDelkaCasPred > 10 then
					MIREL.budeOpakovanaBdelostnaVyzva = true
				end
				MIREL:JednorazovaBdelostnaVyzva(false)
				MIREL.vychoziRychlost = MIREL.zobrazenaRychlost
				MIREL.casPredKrivkou = 0
				MIREL.NO.blikejNO10 = true
			elseif navestNO == 4 then
				MIREL.rychlostKrivky = 40 + MIREL.mezikruziZvyseni
				MIREL.rychlostKrivkyAbs = 40 + MIREL.mezikruziZvyseni
			elseif navestNO == 2 then
				MIREL.rychlostKrivky = 40
				MIREL.rychlostKrivkyAbs = 40
			else
				MIREL.rychlostKrivky = 120
				MIREL.rychlostKrivkyAbs = 120
			end
		end,
		
		UkonciModelovaniKrivky = function(self)
			MIREL.rychlostKrivkyAbs = MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni
			MIREL.modelujKrivku = false
			MIREL.modelujKrivkuDo120 = true
			MIREL.rychlostKrivky = MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni
			MIREL.NO.blikejNO10 = false
			MIREL.NO.blikejRychleNO10 = false
		end,

		ZvysRychlost = function(self,novaRychlost)
			MIREL.manual = false
			MIREL.rychlostKrivky = novaRychlost
			MIREL.rychlostKrivkyAbs = novaRychlost
			MIREL.vychoziRychlost = novaRychlost
			MIREL.modelujKrivku = false
		end,

		NouzoveZastaveni = function(self,cislo)
			if cislo ~= 0 then
				MIREL.blokujEPV_NZ = true
				MIREL.odpadleSoupatkoVZ = true
				Call("SetControlValue", "VykonPredTrCh", 0, -1)
				PomernyTah = -1
				Call("SetControlValue", "PomernyTah", 0, -1)
				MIREL.NO.NO11 = "NZ"..cislo
				MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NZ
				MIREL.NO.DISPLEJ.blikej = false
			else
				MIREL.odpadleSoupatkoVZ = false
				MIREL.casBdelost = 0
				MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
				MIREL.NO.NO11 = MIREL.zobrazenaRychlost
			end
		end,

		Bdelost = function(self) -- cyklicka bdelost
			if not MIREL.blokujBdelostVyzva then
				if MIREL.vyzadujVybavovani then 
					if MIREL.casBdelost > MIREL.bdelostInterval then
						MIREL:NouzoveZastaveni(1)
						Call("SetControlValue","ZS1",0,0)
						MIREL.NO.NO5 = false
					elseif MIREL.casBdelost > MIREL.bdelostInterval - 3.5 then
						Call("SetControlValue","ZS1",0,1)
						MIREL.NO.NO5 = false
					elseif MIREL.casBdelost > MIREL.bdelostInterval / 4 and not MIREL.manual then
						MIREL.NO.NO5 = false
					elseif MIREL.casBdelost > 8.5 and MIREL.manual then
						MIREL.NO.NO5 = false
					else
						MIREL.NO.NO5 = true
					end
				else
					MIREL.NO.NO5 = true
					MIREL.casBdelost = 0
				end
			else
				MIREL.casBdelost = 0
			end
		end,

		NastavNarodniVolbu = function(self,kod)
			MIREL.narodniVolba = kod
		end,

		MirelInit = function(self)
			MIREL.odpadleSoupatkoVZ = false
			MIREL.NO.init = true
			if MIREL.NO.rezim == "TOL" then
				Call("SetControlValue","ZS1B",0,1)
				MIREL.blokujEPV_NZ = true
				MIREL.odpadleSoupatkoVZ = true
			end
			MIREL.nastavenaRychlost = MIREL.afterInitSpeed
			MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
			MIREL.pocitejCasNZ5 = false
			MIREL.rychlostKrivky = 160
			MIREL.rychlostKrivkyAbs = 160
			MIREL.vychoziRychlost = 160
			MIREL.rychlostPodleNavesti = 120
		end,

		OchranaPrekroceniRychlosti = function(self)
			if MIREL.rychlostKrivkyAbs < MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni + 7 then
				MIREL.nulovaTolerancia = false
			end
			if (math.abs(MIREL.rychlostKMH) > MIREL.zobrazenaRychlost + 7 and not MIREL.nulovaTolerancia) or (math.abs(MIREL.rychlostKMH) > MIREL.zobrazenaRychlost + 1 and MIREL.nulovaTolerancia) then
				MIREL:NouzoveZastaveni(2)
			elseif (math.abs(MIREL.rychlostKMH) > MIREL.zobrazenaRychlost + 5) and not MIREL.nulovaTolerancia then
				Call("SetControlValue","ZS2",0,1)
			else
				Call("SetControlValue","ZS2",0,0)
			end
			if (math.abs(MIREL.rychlostKMH) > MIREL.zobrazenaRychlost + 3) and not MIREL.nulovaTolerancia then
				MIREL.NO.DISPLEJ.blikej = true
				MIREL.NO.DISPLEJ.blikejRychle = true
				MIREL.prekroceniRychlosti = true
			elseif not MIREL.manual then
				MIREL.NO.DISPLEJ.blikej = false
				MIREL.NO.DISPLEJ.blikejRychle = false
				MIREL.prekroceniRychlosti = false
			end
		end,

		OchranaNavolenehoSmeru = function(self)
			if Call("GetControlValue", "CisloKab", 0) == 0 then
				if MIREL.rychlostKMH > 5 and significantReverser == -1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH > 0.1 and significantReverser == -1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMH < -5 and significantReverser == 1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH < -0.1 and significantReverser == 1 then
					MIREL.smerZS3 = true
				end
				if math.abs(MIREL.rychlostKMH) > 5 and significantReverser == 0 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif math.abs(MIREL.rychlostKMH) > 0.1 and significantReverser == 0 then
					MIREL.smerZS3 = true
				end
			else
				if MIREL.rychlostKMH > 5 and significantReverser == 1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH > 0.1 and significantReverser == 1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMH < -5 and significantReverser == -1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH < -0.1 and significantReverser == -1 then
					MIREL.smerZS3 = true
				end
				if math.abs(MIREL.rychlostKMH) > 5 and significantReverser == 0 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif math.abs(MIREL.rychlostKMH) > 0.1 and significantReverser == 0 then
					MIREL.smerZS3 = true
				end
			end
		end,

		OchranaNezajisteni = function(self)
			if math.abs(MIREL.rychlostKMH) < 0.1 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) < 0.1 then
				if not MIREL.pocitejCasNZ5 then
					MIREL.ubehlyCasNZ5 = 0
				end
				MIREL.pocitejCasNZ5 = true
				if MIREL.ubehlyCasNZ5 > 25 then
					MIREL:NouzoveZastaveni(5)
					MIREL.nezabrzdenieZS3 = false
				elseif MIREL.ubehlyCasNZ5 > 15 then
					MIREL.nezabrzdenieZS3 = true
				end
			else
				MIREL.pocitejCasNZ5 = false
				MIREL.nezabrzdenieZS3 = false
			end
		end,

		VybaveniBdelostiOvladacem = function(self)
			if (MIREL.vyzadujVybavovaniOld == true or MIREL.rychlostKMH < 40) then MIREL.bylaBdelostOvladac = true end
		end,

		VybaveniBdelosti = function(self)
			MIREL.bylaBdelost = true
		end,

		ZpravyNavestidel = function(self,zprava)
			if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
				if MIREL.NO.rezim == "PRE" then
					local NO
					local vzdalenost
					MIREL.kodOld = MIREL.kod
					--vypis("OnCustomSignalMessage - zprava: "..tostring(zprava))
					NO = tonumber(string.sub(zprava, 1, 2))
					vzdalenost = tonumber(string.sub(zprava, 3))
					if NO == -1 then
						MIREL.nejblizsiNavestidlo = -1
					end
					if vzdalenost > 0 then
						if (vzdalenost < MIREL.nejblizsiNavestidlo) or	(math.abs(MIREL.nejblizsiNavestidlo - vzdalenost) < 2) then
							MIREL.nejblizsiNavestidlo = vzdalenost
						elseif (MIREL.nejblizsiNavestidlo < 0) then
							MIREL.nejblizsiNavestidlo = vzdalenost
							MIREL.kod = 0
							MIREL.posledniKodCas = os.clock()
						end
					end
					--vypis("MIREL.nejblizsiNavestidlo: "..tostring(MIREL.nejblizsiNavestidlo))
					if MIREL.nejblizsiNavestidlo == vzdalenost and Call("GetControlValue","Reverser",0) ~= 0 then
						if posledniKod ~= NO then
							posledniKod = NO
							SysCall("ScenarioManager:ShowAlertMessageExt", "380 Debug", "Kod je: "..NO, 2, 0)
						end
						if NO == 15 then			-- Stuj
							MIREL.kod = 2
							MIREL.NO.prenosNavesti = true
							MIREL.rychlostPodleNavesti = 40
							MIREL.posledniKodCas = os.clock()
							MIREL.kodovaneMezikruzi = false
							MIREL.mezikruziZvyseni = 0
						elseif NO == 30 then			-- Opakovana Vystraha na 4AB
							MIREL.kod = 2
							MIREL.NO.prenosNavesti = true
							MIREL.rychlostPodleNavesti = 40
							MIREL.posledniKodCas = os.clock()
							MIREL.kodovaneMezikruzi = false
							MIREL.mezikruziZvyseni = 0
						elseif NO == 17 then		-- Vystraha
							MIREL.kod = 1
							MIREL.NO.prenosNavesti = true
							MIREL.rychlostPodleNavesti = 120
							MIREL.posledniKodCas = os.clock()
							MIREL.kodovaneMezikruzi = false
							MIREL.mezikruziZvyseni = 0
						elseif NO == 16 then		-- Volno
							MIREL.kod = 3
							MIREL.NO.prenosNavesti = true
							MIREL.rychlostPodleNavesti = 160
							MIREL.posledniKodCas = os.clock()
							MIREL.kodovaneMezikruzi = false
							MIREL.mezikruziZvyseni = 0
						elseif NO >= 19 and NO <= 24 then		-- omezene rychlosti
							if MIREL.kodOld ~= 4 then
								MIREL.mezikruziZvyseni = 0
							end
							MIREL.kod = 4
							MIREL.NO.prenosNavesti = true
							MIREL.rychlostPodleNavesti = 40
							MIREL.posledniKodCas = os.clock()
							MIREL.kodovaneMezikruzi = true
						elseif NO == 0 then
							MIREL.kod = 0
							MIREL.kodovaneMezikruzi = false
							MIREL.mezikruziZvyseni = 0
						end
					end

					if not MIREL.blokujPrenosNavesti and _G[MIREL.batteryVariableName] == 1 and not MIREL.D1_blokujPrenos then
						Call("SetControlValue", "NO1", 0, 0)
						Call("SetControlValue", "NO2", 0, 0)
						Call("SetControlValue", "NO3", 0, 0)
						Call("SetControlValue", "NO4", 0, 0)
						if MIREL.kod ~= 0 then
							Call("SetControlValue", "NO"..MIREL.kod, 0, 1)
							MIREL.NO.NO7 = true
							MIREL.NO.NO8 = false
						else
							MIREL.NO.NO7 = false
							MIREL.NO.NO8 = false
						end
					else
						Call("SetControlValue", "NO1", 0, 0)
						Call("SetControlValue", "NO2", 0, 0)
						Call("SetControlValue", "NO3", 0, 0)
						Call("SetControlValue", "NO4", 0, 0)
						MIREL.rychlostPodleNavesti = 120
						MIREL.kod = 0
						MIREL.NO.NO7 = false
						MIREL.NO.NO8 = false
					end
					if (MIREL.kodOld == 0 or MIREL.kodOld == 2) and MIREL.kod ~= 0 and MIREL.kod ~= 2 and MIREL.rychlostKMH < 5 then
						if Call("GetControlValue","ZS7",0) == 1 then
							Call("SetControlValue","ZS7",0,0)
						else
							Call("SetControlValue","ZS7",0,1)
						end
					end
			
					if MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni < MIREL.zobrazenaRychlost and not MIREL.modelujKrivku and not MIREL.manual and Call("GetSpeed") > 5 then
						if math.abs(os.clock()-MIREL.posledniKodCas) > 5 and math.abs(os.clock()-MIREL.posledniKodCas) < 23 and MIREL.kod ~= 0 then
							MIREL:Manual()
						else
							MIREL:ModelujKrivku(MIREL.kod)
						end
					elseif MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni > MIREL.zobrazenaRychlost or Call("GetSpeed") < 5 then
						MIREL:ZvysRychlost(MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
					end
				else
					Call("SetControlValue", "NO1", 0, 0)
					Call("SetControlValue", "NO2", 0, 0)
					Call("SetControlValue", "NO3", 0, 0)
					Call("SetControlValue", "NO4", 0, 0)
					MIREL.kod = 0
					MIREL.kodovaneMezikruzi = false
				end
			end
		end
};
