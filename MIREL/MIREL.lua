MIREL = { --objekt MIRELu
	--POPIS METOD:
		--PoleFCE() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
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

		--BolToDecToBol() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--hodnota - vstupni promenna bool, or integer;
				--optional hranice - treshold, if integer is passed (everything bigger is true, smaller is false; 0.5 if itÂ´s not set);
			--VRACI:
				--boolean if integer is set; integer, if boolean is set;
			--konverze boolean na integer a integeru na boolean;

		--divMod() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
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

		--Minus() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called, when - button is pressed;

		--Plus() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called, when + button is pressed;

		--Enter() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called, when Enter button is pressed;

		--JednorazovaBdelostnaVyzva() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--opakovana -true, when itÂ´s repeated onetime acknowledgement;
			--VRACI:
				--nil;
			--function for onetime acknowledgement;

		--ModelujKrivku() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--navestNO -code from signal:
					--1 - warning signal;
					--2 - stop;
					--3 - clear;
					--4 - approach speedchange;
			--VRACI:
				--nil;
			--function which generates braking curve;

		--UkonciModelovaniKrivky() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which ends generating braking curve;

		--ZvysRychlost() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--novaRychlost -new speed limit;
			--VRACI:
				--nil;
			--function which is passed, when new speed limit is higher than old one;

		--NouzoveZastaveni() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL (except of NZ4 - radiostop)
			--PARAMETRY:
				--cislo -emergency brake code which is shown on display;
			--VRACI:
				--nil;
			--function which is passed, when automatic emergency braking is applied;

		--Bdelost() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
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

		--MirelInit() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every MIREL start;

		--OchranaPrekroceniRychlosti() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every Update;

		--OchranaNavolenehoSmeru() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
			--PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
			--function which is called every Update;

		--OchranaNezajisteni() - INTERNAL FUNCTION, COULD NOT BE CALLED OUTSIDE OF MIREL
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
            --SHOULD BE CALLED ONLY ONCE ON EVERY TIME DRIVER PRESSES BUTTON
                
        --Skluz()
            --PARAMETRY:
				--bez parametru;
			--VRACI:
				--nil;
            --function which is called every time, loco is in wheelslip;
                
        --NastavHodnotuBaterii()
            --PARAMETRY:
				--bool - true if bateries switch is on, otherwise false;
			--VRACI:
				--nil;
            --function which is called every time, batery switch changes;
                
        --NastavHodnotyRizeni()
            --PARAMETRY:
				--rizeniCab1 - true if cab switch in cab 1 is on, otherwise false;
				--rizeniCab2 - true if cab switch in cab 2 is on, otherwise false;
			--VRACI:
				--nil;
            --function which is called every time, cab switch changes;
                
        --NastavAktualniKabinu()
            --PARAMETRY:
				--cisloKabiny - number of actual cab, where driver is - IMPORTANT: DRIVER POSITION, NOT WHERE CAB IS ACTIVE!!!;
			--VRACI:
				--nil;
            --function which is called every time, driver position changes;
        
        --NastavSkutecnySmer()
            --PARAMETRY:
                --skutecnySmer - real reverser set according to actual cab where driver is
			--VRACI:
                --nil;
            --function which should be called every Update()
        
        --NastavOvladacSmeru()
            --PARAMETRY:
                --ovladacSmeru - reverser cab controller according to actual cab where driver is - -1 is backward, 0 neutral and 1 forward
			--VRACI:
                --nil;
            --function which should be called every Update()

        --NastavOvladacBP()
            --PARAMETRY:
                --ovladacBP - engine brake in actual cab where driver is - 0 equals to release, hold; 1 equals to apply
			--VRACI:
                --nil;
            --function which should be called every Update()

        --NastavHodnotuValcu()
            --PARAMETRY:
                --tlakBV - pressure in brake cylinder [BAR]
                --odbrzdenoTrigger - pressure in brake cylinder to trigger the "released" state [BAR]
                --zabrzdenoTrigger - pressure in brake cylinder to trigger the "applied" state [BAR]
			--VRACI:
                --nil;
            --function which should be called every Update()

        --NastavHodnotuPotrubi()
            --PARAMETRY:
                --tlakHP - main pipe pressure [BAR]
			--VRACI:
                --nil;
            --function which should be called every Update()

        --NastavHodnotuStradace()
            --PARAMETRY:
                --stradac - is the spring loaded brake active [boolean]
			--VRACI:
                --nil;
            --function which should be called every Update()

        --NastavPritomnostVozu()
            --PARAMETRY:
                --predLoko - is there anything connected in front of the loco [boolean]
                --zaLoko - is there anything connected behinf the loco [boolean]
			--VRACI:
                --nil;
            --function which should be called every Update()
            
		--ZpravyNavestidel()
			--PARAMETRY:
				--zprava -message from signal;
			--VRACI:
				--nil;
			--function which is called to push message from signal to MIREL;

	--MIREL SETTINGS
		isControlerMovementVigilanceAcknowledgement = true, --true if vigilance alert can be confirmed by control movement (Call function VybaveniBdelostiOvladacem() on every move)
		maxDesignSpeed = 160, --max design speed of loco, should not be bigger than 160
		displayChildName = "MIREL", --name of child, where text will be displayed
        MIRELversion = 4, --version of MIREL [3,4]
        displayNationalitySettings = false, --true if nationality settings can be set on display, false if nationality is selected by loco automaticly (f.e. based on display settings) - NastavNarodniVolbu() to set
		minusControlValueName = "NO12", --name of MIREL`s minus key ControlValue
		plusControlValueName = "NO13", --name of MIREL`s plus key ControlValue
        enterControlValueName = "NO14", --name of MIREL`s eneter key ControlValue
        canUseDeccel150mss = false, --true if MIREL can use decceleration 1.5m/ss instead of 0.94 (mostly high speed units)
        shouldUseLastRegime = false, --true if MIREL should use last selected regime instead of the default one after reboot
        functionToCallOnEmergencyApply = "emergencyBraking", --name of function which should be called on emergency brakes apply - called every frame when emergency brakes are applied
        functionToCallOnEmergencyRelease = "releaseEmergency", --name of function to be called on emergency brake release - called every frame when emergency brakes are not applied
		hasMaxPermissiveSpeedNeedle = false, --true if MIREL displays current max speed on display, or other gauge
		maxPermissiveSpeedNeedleControlValueName = "Displej_MIRELrucicka", --name of such display
        resetButtonControlValueName = "Bdelost", --vigillance button ControlValue name (every value higher than 0.5 triggers)
		okCharacter = "F", --do not change unless you use custom letter set ('✓' character)
		emptyCharacter = "B", --do not change unless you use custom letter set (' ' character)
		fullCharacter = "I", --do not change unless you use custom letter set ('█' character)
		narodniVolba = 1, --selected nationality - can be read for loco purposes
		afterInitSpeed = 100, --default speed which applies after boot
		DEBUG = false, --DEBUG - should be always false

	--MIREL CONSTANTS - DO NOT CHANGE!
		cesko = 1,
		slovensko = 2,
		madarsko = 3,
		polsko = 4,
		nemecko = 5,
        rakousko = 6,
        ZZO = 7,

	--MIREL INTERNAL VARIABLES - DO NOT CHANGE!
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
		odpadleSoupatkoVZ = false,
		D1_blokujPrenos = false,
		D1_zacatekBloku = nil,
		blokujPrenosNavesti = false,
		vyzadujVybavovani = false,
		lzeVybavitPohybemOvladace = false,
		ubehlyCasNZ5 = 0,
		pocitejCasNZ5 = false,
		manual = false,
		CZSK = "",
		HU = "",
		PL = "",
		krivkaDecceleration = 0.4,
        rychlostKMH = 0,
        rychlostKMHabs = 0,
		krivkaDelkaCas = 0,
		krivkaDelkaCasPred = 0,
		krivkaDelkaDraha = 0,
		krivkaDelkaDrahaPred = 0,
		krivkaCasUjety = 0,
		vychoziRychlost = 160,
		modelujKrivkuDo120 = false,
		casPredKrivkou = 0,
		modelujKrivku = false,
		posledniKodCas = os.clock(),
		kodovaneMezikruzi = false,
		mezikruziZvyseni = 0,
        kod = 0,
        kodOld = 0,
        stabilniKodOld = 0,
        vypadekKodu = false,
        casBdelost = 0,
        casBdelostJednorazova = -1,
        bdelostInterval = 24,
        bdelostBezModre = false,
		blokujBdelostVyzva = false,
		smerZS3 = false,
		nezabrzdenieZS3 = false,
		testRychlost = false,
		testTlak = false,
		maxManual = 160,
		prekroceniRychlosti = false,
        nulovaTolerancia = false,
        skutecnySmer = 0,
        SHPcounter = 0,
        SHPsignalCounter = 0,
        SHPstarted = false,
        SHPblinkCounter = 0,
        SHPresetCounter = 0,
        SHPnezabrzdenie = 0,
        rychlostniPrikaz = -1,
        zvysenaRychlost = false,
        bdelostnaVyzvaZmenaPrikazu = false,
        ZS1B = false,
        aktualniNZ = -1,
        prodlouzeniKodovaniStuj = -1,
        casPoRozjezdu = 0,
        bylaVyzvaPoRozjezdu = false,
        baterie = false,
        isCab1Active = false,
        isCab2Active = false,
        actualCab = 1,
        isThisCabActive = false,
        casDosahnutiKrivky = 10,
        bylaBdelostnaVyzvaKrivka = false,
        bylaOpakovanaVyzvaKrivka = false,
        casPrenasenehoKodu = 0,
        ovladacSmeru = 0,
        ovladacBP = 0,
        tlakBV = 0,
        odbrzdenoTrigger = 0,
        zabrzdenoTrigger = 0,
        tlakHP = 0,
        stradac = false,
        predLoko = false,
        zaLoko = false,

	NO = { --SIGNAL REPEATER OBJECT
		--SIGNAL REPEATER CONSTANTS
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
                TM = 18,
                R = 21,
                ZSR = 22,
                MAV = 23,
                PKP_VYBER = 24,
                CS = 25,
                H = 26,
                PL = 27,
                stav = 12,
			},

		--SIGNAL REPEATER VARIABLES
			dreimalEmptyChar = "BBB",
			dreimalFullChar = "III",
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
            textMadarsko = "",

		--METODY:
			-- UlozRezim = function(self,NOrezim)
			-- 	f = assert(io.open("Assets/CS_addon/Kal000px/RailVehicles/Electric/Common/380 Script/NO.rez", "w"))
			-- 	-- Print("Zapisuji do souboru NO.rez, vÃ½sledek operace: ")
			-- 	-- Print(f:write(NOrezim))
			-- 	f:close()
			-- 	MIREL.NO.rezimOld = NOrezim
			-- end,
	},

	--METHODS:
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
            if not MIREL.odpadleSoupatkoVZ then
                _G[MIREL.functionToCallOnEmergencyRelease]()
            else
                _G[MIREL.functionToCallOnEmergencyApply]()
            end
            --pokud jsou zapnute baterie a narodniVolba je v rozsahu, kde je MIREL aktivni
                if MIREL.baterie and MIREL.narodniVolba > 0 and MIREL.narodniVolba < 5 then
                    --promenne tlacitek
                        MIREL.NO.NO12old = MIREL.NO.NO12tlac
                        MIREL.NO.NO13old = MIREL.NO.NO13tlac
                        MIREL.NO.NO14old = MIREL.NO.NO14tlac
                        MIREL.NO.NO12 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.minusControlValueName,0)) --minus
                        MIREL.NO.NO13 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.plusControlValueName,0)) --plus
                        MIREL.NO.NO14 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.enterControlValueName,0)) --Enter
                        MIREL.NO.NO12tlac = MIREL.NO.NO12
                        MIREL.NO.NO13tlac = MIREL.NO.NO13
                        MIREL.NO.NO14tlac = MIREL.NO.NO14
                    
                    --citace
                        if MIREL.casD1_1testu <= 0.5 then
                            MIREL.casD1_1testu = MIREL.casD1_1testu + deltaTime
                        end

                        if MIREL.NO.casUloz <= 5 then
                            MIREL.NO.casUloz = MIREL.NO.casUloz + deltaTime
                        end

                        if MIREL.ubehlyCasNZ5 <= 25 then
                            MIREL.ubehlyCasNZ5 = MIREL.ubehlyCasNZ5 + deltaTime
                        end

                        if MIREL.NO.casMenu <= 5 then
                            MIREL.NO.casMenu = MIREL.NO.casMenu + deltaTime
                        end

                        if MIREL.NO.casBlikani <= 0.5 then
                            MIREL.NO.casBlikani = MIREL.NO.casBlikani + deltaTime
                        end

                        MIREL.NO.casRychloposuv = MIREL.NO.casRychloposuv + deltaTime

                        if MIREL.NO.casTlacitek <= 0.5 then
                            MIREL.NO.casTlacitek = MIREL.NO.casTlacitek + deltaTime
                        end

                        if MIREL.NO.casBlokovaniBlikani <= 0.7 then
                            MIREL.NO.casBlokovaniBlikani = MIREL.NO.casBlokovaniBlikani + deltaTime
                        end

                        if MIREL.modelujKrivku then
                            MIREL.casPredKrivkou = MIREL.casPredKrivkou + deltaTime
                            MIREL.krivkaCasUjety = MIREL.krivkaCasUjety + deltaTime
                        else
                            MIREL.casPredKrivkou = 0
                            MIREL.krivkaCasUjety = 0
                        end

                        if MIREL.NO.casBlikaniNO10 <= 0.5 then
                            MIREL.NO.casBlikaniNO10 = MIREL.NO.casBlikaniNO10 + deltaTime
                        end

                        if MIREL.kod ~= 0 then
                            if MIREL.casPrenasenehoKodu <= 5 then
                                MIREL.casPrenasenehoKodu = MIREL.casPrenasenehoKodu + deltaTime
                            end
                        else
                            MIREL.casPrenasenehoKodu = 0
                        end

                    --rychloposuv v menu
                        MIREL.NO.rychloposuv = false
                        if not (MIREL.NO.NO12 or MIREL.NO.NO13) then --pokud neni zmackle tlacitko, nepocita cas rychloposuvu
                            MIREL.NO.casTlacitek = 0
                        elseif MIREL.NO.casTlacitek > 0.5 then --pokud uziv. drzi tlacitko > 0.5 sec, je aktivovan rychloposuv
                            MIREL.NO.rychloposuv = true
                        end
                        if MIREL.NO.rychloposuv then --pokud je rychloposuv, spousti co 0.3 sec Fci prislusneho tlacitka
                            if MIREL.NO.casRychloposuv > 0.2 then
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
                    
                    --nacteni rychlosti
                        MIREL.rychlostKMH = Call("GetSpeed")*3.6
                        MIREL.rychlostKMHabs = math.abs(MIREL.rychlostKMH)

                    --nacteni skutecneho smeru
                        --MIREL.skutecnySmer = Call("GetControlValue", "Reverser", 0) --replaced with external call

                    --pokud je zapnuty spinac rizeni na stanovisti kde se prave nachazime, pak je to aktivni stanoviste
                        if (MIREL.actualCab == 1 and MIREL.isCab1Active) or (MIREL.actualCab == 2 and MIREL.isCab2Active) then
                            MIREL.isThisCabActive = true
                        else
                            MIREL.isThisCabActive = false
                        end

                    --testovaci vypisy
                        if MIREL.DEBUG then --DEBUG printy
                            if tostring(MIREL.modelujKrivku)..MIREL.rychlostKrivky..MIREL.NO.rezim..tostring(MIREL.manual)..MIREL.nastavenaRychlost ~= testOld then
                                testOld = tostring(MIREL.modelujKrivku)..MIREL.rychlostKrivky..MIREL.NO.rezim..tostring(MIREL.manual)..MIREL.nastavenaRychlost
                                Print("Modeluji krivku: "..tostring(MIREL.modelujKrivku))
                                Print("Rychlost absolutni: "..MIREL.rychlostKrivkyAbs)
                                Print("Rychlost z disp.: "..MIREL.rychlostKrivky)
                                Print("RezimNO: "..MIREL.NO.rezim)
                                Print("Cas od zacatku krivky: "..MIREL.krivkaCasUjety)
                                Print("Cas od zacatku brzdeni: "..MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred)
                                Print("Manual: "..tostring(MIREL.manual))
                                Print("Maximalni ryclost z manualu: "..MIREL.maxManual)
                                Print("Maximalni rychlost: "..MIREL.nastavenaRychlost)
                                Print("Cilova rychlost:"..MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
                                Print("Rychlost:"..MIREL.rychlostKMH)
                            end
                        end

                    --pokud loko ma rucicku pro maximalni rychlost, zapis do ni maximalni rychlost
                        if MIREL.hasMaxPermissiveSpeedNeedle then
                            Call("SetControlValue",MIREL.maxPermissiveSpeedNeedleControlValueName,0,math.min(MIREL.maxDesignSpeed,MIREL.rychlostRezimu,MIREL.nastavenaRychlost))
                        end
                
                    --zobrazeni rychlosti a tlaku v rezimu ZAV, nebo pri nedokoncenem D1 pri stisku plus/minus a enter
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
                        if MIREL.aktualniNZ == -1 then
                            MIREL.NO.NO11 = MIREL.emptyCharacter.."D1"
                        end
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.D1
                        if rizeniAkt == nil then
                            if Call("GetControlValue","ZS11",0) == 1 then
                                Call("SetControlValue","ZS11",0,0)
                            else
                                Call("SetControlValue","ZS11",0,1)
                            end
                            rizeniAkt = MIREL.isCab1Active or MIREL.isCab2Active
                            MIREL.casD1_1testu = 0
                            MIREL.NO.D1_1 = true
                            MIREL.NO.D1_2 = true
                            MIREL.NO.D1_3 = true
                            MIREL.NO.D1_4 = true
                            MIREL.NO.D1_5 = true
                            MIREL.NO.D1_6 = true
                            MIREL.NO.D1_7 = true
                            MIREL.D1_zacatekBloku = os.clock()
                            MIREL.D1_blokujPrenos = true
                            MIREL.odpadleSoupatkoVZ = false
                        end

                        MIREL.D1_ujetaVzdalenost = MIREL.D1_ujetaVzdalenost + MIREL.rychlostKMHabs/3.6 * deltaUpdateTimeFromGame
                        if MIREL.narodniVolba == MIREL.madarsko then
                            if MIREL.rychlostKMHabs > 0.1 then
                                MIREL:NouzoveZastaveni(3)
                            end
                        else
                            if MIREL.D1_ujetaVzdalenost > 10 then
                                MIREL.D1_ujetaVzdalenost = 0
                                MIREL:NouzoveZastaveni(3)
                            end
                        end

                        if MIREL.casD1_1testu > 0.5 and MIREL.NO.D1_1 then
                            MIREL.NO.D1_1 = false
                            MIREL.casD1_1testu = 0
                            -- Print("Test MIREL.NO.D1_1 uspesny!")
                        end

                        if not rizeniAkt then
                            if MIREL.isCab1Active or MIREL.isCab2Active and MIREL.NO.D1_2 then
                                MIREL.NO.D1_2 = false
                                -- Print("Test MIREL.NO.D1_2 uspesny!")
                            end
                        elseif rizeniAkt then
                            if not (MIREL.isCab1Active or MIREL.isCab2Active) and MIREL.NO.D1_2 then
                                MIREL.NO.D1_2 = false
                                -- Print("Test MIREL.NO.D1_2 uspesny!")
                            end
                        end

                        if MIREL.isCab1Active or MIREL.isCab2Active then --and gObrazovky == 1
                            if MIREL.isThisCabActive then
                                if MIREL.ovladacSmeru == 0 then
                                    MIREL.D1_smer0 = true
                                end
                                if MIREL.ovladacSmeru == 1 then
                                    MIREL.D1_smerP = true
                                end
                                if MIREL.D1_smer0 and MIREL.D1_smerP and MIREL.NO.D1_3 then
                                    MIREL.NO.D1_3 = false
                                    -- Print("Test MIREL.D1_3 uspesny!")
                                end

                                if MIREL.ovladacSmeru == 0 then
                                    MIREL.D1_smer0 = true
                                end
                                if MIREL.ovladacSmeru == -1 then
                                    MIREL.D1_smerZ = true
                                end
                                if MIREL.D1_smer0 and MIREL.D1_smerZ and MIREL.NO.D1_4 then
                                    MIREL.NO.D1_4 = false
                                    -- Print("Test MIREL.D1_4 uspesny!")
                                end
                                
                                if MIREL.ovladacBP > 0.98 and MIREL.tlakBV >= MIREL.zabrzdenoTrigger then
                                    MIREL.D1_BP_od = true
                                end
                                if MIREL.ovladacBP < 0.02 and MIREL.tlakBV <= MIREL.odbrzdenoTrigger then
                                    MIREL.D1_BP_za = true
                                end
                                if MIREL.D1_BP_od and MIREL.D1_BP_za and MIREL.NO.D1_5 then
                                    MIREL.NO.D1_5 = false
                                    -- Print("Test MIREL.D1_5 uspesny!")
                                end
                            end
                            
                            if MIREL.tlakHP >= 4.9 and MIREL.NO.D1_6 and not MIREL.blokujEPV_NZ then
                                MIREL.odpadleSoupatkoVZ = true
                                MIREL.D1_testEPV = true
                                -- Print("Zahajuji test MIREL.D1_6!")
                            end
                            if MIREL.D1_testEPV and MIREL.tlakHP < 3 and MIREL.NO.D1_6 then
                                MIREL.D1_testEPV = false
                                MIREL.odpadleSoupatkoVZ = false
                                MIREL.NO.D1_6 = false
                                -- Print("Test MIREL.D1_6 uspesny!")
                            end

                            if MIREL.tlakHP >= 4.9 and not MIREL.NO.D1_6 and MIREL.NO.D1_7 and not MIREL.blokujEPV_NZ then
                                MIREL.odpadleSoupatkoVZ = true
                                MIREL.D1_testEPV = true
                                -- Print("Zahajuji test MIREL.D1_7!")
                            end
                            if MIREL.D1_testEPV and MIREL.tlakHP < 3 and not MIREL.NO.D1_6 then
                                MIREL.D1_testEPV = false
                                MIREL.odpadleSoupatkoVZ = false
                                MIREL.NO.D1_7 = false
                                -- Print("Test MIREL.D1_7 uspesny!")
                            end
                        end
                        
                        if not MIREL.NO.D1_1 and not MIREL.NO.D1_2 and not MIREL.NO.D1_3 and not MIREL.NO.D1_4 and not MIREL.NO.D1_5 and not MIREL.NO.D1_6 and not MIREL.NO.D1_7 then
                            MIREL.uspesnyD1 = true
                        end
                    else --MIREL po D1 testu
                        --alespon jedno stanoviste aktivne - MIREL je aktivni
                            if MIREL.isCab1Active or MIREL.isCab2Active then
                                --pokud neni intervence systemu a je vyzadovano vybavovani, nebo uz probiha vyzva, pricitej cas bdelostne vyzvy
                                    if MIREL.aktualniNZ == -1 and (MIREL.vyzadujVybavovani or (MIREL.casBdelost >= 8.5 and MIREL.bdelostBezModre) or (MIREL.casBdelost >= MIREL.bdelostInterval/4 and not MIREL.bdelostBezModre)) then
                                        MIREL.casBdelost = MIREL.casBdelost + deltaTime
                                    end

                                --citac jednorazove bdelostne vyzvy
                                    if MIREL.casBdelostJednorazova >= 0 and MIREL.blokujBdelostVyzva then
                                        MIREL.casBdelostJednorazova = MIREL.casBdelostJednorazova + deltaTime
                                    elseif MIREL.casBdelostJednorazova < 0 then
                                        MIREL.casBdelostJednorazova = -1
                                    end

                                --pokud je soucasne stanoviste zaroven aktivni
                                    if MIREL.isThisCabActive then
                                        --pokud je aktivni zamek rychlosti
                                            if MIREL.zamekRychlosti then
                                                Call("SetControlValue","NO_bodka",1)
                                            else
                                                Call("SetControlValue","NO_bodka",0)
                                            end

                                        --stisk tlacitka -
                                            if MIREL.NO.NO12 and not MIREL.NO.NO12old then
                                                MIREL:Minus()
                                            end
                
                                        --stisk tlacitka +
                                            if MIREL.NO.NO13 and not MIREL.NO.NO13old then
                                                MIREL:Plus()
                                            end
                                            
                                        --stisk tlacitka Enter
                                            if MIREL.NO.NO14 and not MIREL.NO.NO14old then
                                                MIREL:Enter()
                                            end

                                        --vybaveni bdelosti
                                            if MIREL.bylaBdelost or MIREL.bylaBdelostOvladac then
                                                Call("SetControlValue","ZS1",0,0)
                                                Call("SetControlValue", "ZS20", 0, 0)
                                                --dalsi bdelostne vyzvy lze potvrdit i pohybem ovladace
                                                    if MIREL.vyzadujVybavovani then
                                                        MIREL.lzeVybavitPohybemOvladace = true
                                                    end
                
                                                --v NaVo HU se NZ resetuje zmacknutim pedalu/tlacitka
                                                    if MIREL.narodniVolba == MIREL.madarsko then
                                                        MIREL.odpadleSoupatkoVZ = false
                                                    end
                                                MIREL.bdelostnaVyzvaZmenaPrikazu = false
                                                MIREL.blokujBdelostVyzva = false
                
                                                --pokud je modelovana krivka, po potvrzeni zacne indikator blikat rychle
                                                    if MIREL.NO.blikejNO10 and MIREL.bylaBdelostnaVyzvaKrivka then
                                                        MIREL.NO.blikejRychleNO10 = true
                                                    end
                
                                                --citac CZ/SK bdelosti lze resetovat az po zhasnuti modreho svetla
                                                    if not MIREL.NO.NO5 then 
                                                        MIREL.casBdelost = 0
                                                    end
                                                MIREL.casBdelostJednorazova = -1
                
                                                --PKP
                                                    if MIREL.narodniVolba == MIREL.polsko and not MIREL.odpadleSoupatkoVZ and MIREL.bylaBdelost then
                                                        if MIREL.SHPsignalCounter > 0 then
                                                            MIREL.SHPsignalCounter = -1
                                                        else
                                                            MIREL.SHPcounter = 0
                                                        end
                                                        MIREL.SHPstarted = true
                                                    end
                
                                                --nevyzadane vybaveni
                                                    if MIREL.NO.NO5 and MIREL.bylaBdelost and MIREL.rychlostKMHabs > 0.1 then
                                                        if Call("GetControlValue","ZS8",0) == 1 then
                                                            Call("SetControlValue","ZS8",0,0)
                                                        else
                                                            Call("SetControlValue","ZS8",0,1)
                                                        end
                                                    end
                                                MIREL.bylaBdelost = false
                                                MIREL.bylaBdelostOvladac = false
                                            end
                
                                        --pokud byla bdelostna vyzva ZS1B a skoncil staly ton, aktivuj dve pipnuti
                                            if MIREL.ZS1B and Call("GetControlValue", "ZS1", 0) ~= 1 then
                                                MIREL.ZS1B = false
                                                if Call("GetControlValue", "ZS1B", 0) == 1 then
                                                    Call("SetControlValue", "ZS1B", 0, 0)
                                                else
                                                    Call("SetControlValue", "ZS1B", 0, 1)
                                                end
                                            end

                                        --zapis NZ
                                            if MIREL.aktualniNZ > 0 then
                                                MIREL.NO.NO11 = "NZ"..MIREL.aktualniNZ
                                            end
                                    else
                                        Call("SetControlValue","NO_bodka",0)
                                        Call("SetControlValue", "ZS20", 0, 0)
                                        Call("SetControlValue", "ZS1", 0, 0)
                                        Call("SetControlValue", "ZS2", 0, 0)
                                        Call("SetControlValue", "ZS3", 0, 0)
                                        MIREL.NO.NO5 = false
                                    end

                                --pokud nesedi narodni volba a pracovni rezim, nastav vychozi pracovni rezim pro danou NaVo
                                    if (MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko) and not MIREL.CZSK[MIREL.NO.rezim] then
                                        MIREL.NO.rezim = "POS"
                                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                                        MIREL.odpadleSoupatkoVZ = false
                                        MIREL.NO.casMenu = 10
                                    elseif MIREL.narodniVolba == MIREL.madarsko and not MIREL.HU[MIREL.NO.rezim] then
                                        MIREL.NO.rezim = "TOL"
                                        Call("SetControlValue", "ZS20", 0, 1)
                                        MIREL.blokujEPV_NZ = true
                                        MIREL.odpadleSoupatkoVZ = true
                                    elseif MIREL.narodniVolba == MIREL.polsko and not MIREL.PL[MIREL.NO.rezim] then
                                        MIREL.NO.rezim = "PKP"
                                        MIREL.odpadleSoupatkoVZ = false
                                        MIREL.SHPcounter = 0
                                        MIREL.SHPsignalCounter = 0
                                        MIREL.SHPstarted = false
                                        MIREL.SHPblinkCounter = 0
                                        MIREL.SHPresetCounter = 0
                                        MIREL.SHPnezabrzdenie = 0
                                    end

                                --pokud ubehlo mene, nez 90 sekund od zahajeni D1, neni dokonceny selftest kodovani - nezobrazuje se kod
                                    if MIREL.D1_blokujPrenos then -- blokovani prenosu po D1 testu
                                        if math.abs(MIREL.D1_zacatekBloku - os.clock()) > 90 then
                                            MIREL.D1_blokujPrenos = false
                                        end
                                        MIREL.casPrenasenehoKodu = 0
                                    end

                                --pokud nebyl inicializovany MIREL, zavolej MirelInit()
                                    if not MIREL.NO.init then
                                        MIREL:MirelInit()
                                    end

                                --MIREL podle specifikace CD/ZSR
                                    if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                                        if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.NEAKTIVNE then
                                            MIREL:MirelInit()
                                        end

                                        --citac prodlouzeni rychlosti 40 na 1000m pri nekodovani po kodovani stuj
                                            if MIREL.prodlouzeniKodovaniStuj > 0 then
                                                if MIREL.isCab1Active then
                                                    MIREL.prodlouzeniKodovaniStuj = MIREL.prodlouzeniKodovaniStuj - deltaUpdateTimeFromGame * MIREL.rychlostKMH
                                                elseif MIREL.isCab2Active then
                                                    MIREL.prodlouzeniKodovaniStuj = MIREL.prodlouzeniKodovaniStuj - deltaUpdateTimeFromGame * MIREL.rychlostKMH
                                                end
                                            else
                                                MIREL.prodlouzeniKodovaniStuj = -1
                                            end

                                        --ukonceni manualu pri rychlosti mensi, nez cilove
                                            if MIREL.rychlostKMHabs <= MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni then
                                                MIREL.manual = false
                                                MIREL.bdelostBezModre = false
                                            end
                                        
                                        --cas bdelostne vyzvy pred dosahnutim krivky (15 vterin pro rychlosti <= 100, 10 pro > 100)
                                            if math.min(MIREL.maxDesignSpeed,MIREL.rychlostRezimu,MIREL.nastavenaRychlost) > 100 then
                                                MIREL.casDosahnutiKrivky = 10
                                            else
                                                MIREL.casDosahnutiKrivky = 15
                                            end

                                        --pokud je modelovana krivka
                                            if MIREL.modelujKrivku then
                                                --pokud je skutecny ujety cas vetsi, nez cas pred krivkou - zacina snizovat rychlost dle krivky
                                                    if MIREL.krivkaCasUjety > MIREL.krivkaDelkaCasPred then
                                                        --je aktivni nulova tolerance
                                                            MIREL.nulovaTolerancia = true
                                                        
                                                        --pokud modelujes krivku do 0
                                                            if not MIREL.modelujKrivkuDo120 then
                                                                MIREL.rychlostKrivkyAbs = 120 - (MIREL.krivkaDecceleration*(MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred)*3.6)
                                                                --pokud aktualni rychlosti dosahneme krivky za mene nez 10s - jednorazova bdelostna vyzva
                                                                    if MIREL.rychlostKMHabs > 120 - (MIREL.krivkaDecceleration*(MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred+MIREL.casDosahnutiKrivky)*3.6) and not MIREL.bylaBdelostnaVyzvaKrivka and not MIREL.manual and MIREL.rychlostKMHabs > 40 + MIREL.mezikruziZvyseni then
                                                                        MIREL.bylaBdelostnaVyzvaKrivka = true
                                                                        MIREL:JednorazovaBdelostnaVyzva(false)
                                                                    end
                                                                
                                                                --pokud vyse zminene nastane za dele jak 10s - opakovana bdelostna vyzva
                                                                    if MIREL.rychlostKMHabs < 120 - (MIREL.krivkaDecceleration*(MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred+MIREL.casDosahnutiKrivky+10)*3.6) and not MIREL.bylaOpakovanaVyzvaKrivka and not MIREL.manual and MIREL.rychlostKMHabs > 40 + MIREL.mezikruziZvyseni then
                                                                        MIREL.bylaOpakovanaVyzvaKrivka = true
                                                                        MIREL:JednorazovaBdelostnaVyzva(true)
                                                                    end
                                                        --pokud do 120
                                                            else
                                                                MIREL.rychlostKrivkyAbs = 160 - (MIREL.krivkaDecceleration*(MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred)*3.6)
                                                                --pokud aktualni rychlosti dosahneme krivky za mene nez 10s - jednorazova bdelostna vyzva
                                                                    if MIREL.rychlostKMHabs > 160 - (MIREL.krivkaDecceleration*(MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred+MIREL.casDosahnutiKrivky)*3.6) and not MIREL.bylaBdelostnaVyzvaKrivka and not MIREL.manual and MIREL.rychlostKMHabs > 120 then
                                                                        MIREL.bylaBdelostnaVyzvaKrivka = true
                                                                        MIREL:JednorazovaBdelostnaVyzva(false)
                                                                    end
                                                                    
                                                                --pokud vyse zminene nastane za dele jak 10s - opakovana bdelostna vyzva
                                                                    if MIREL.rychlostKMHabs < 160 - (MIREL.krivkaDecceleration*(MIREL.krivkaCasUjety-MIREL.krivkaDelkaCasPred+MIREL.casDosahnutiKrivky+10)*3.6) and not MIREL.bylaOpakovanaVyzvaKrivka and not MIREL.manual and MIREL.rychlostKMHabs > 120 then
                                                                        MIREL.bylaOpakovanaVyzvaKrivka = true
                                                                        MIREL:JednorazovaBdelostnaVyzva(true)
                                                                    end
                                                            end
                                                    end

                                                --zaokrouhleni zobrazene rychlosti na 5km/h
                                                    MIREL.rychlostKrivky = MIREL:divMod(MIREL.rychlostKrivkyAbs,5)*5
                                            end

                                        --pokud je rychlost proti stuj mensi, nez 40, nebo uz je konec krivky, pak ukonci jeji modelovani
                                        if (MIREL.rychlostKMHabs <= MIREL.rychlostPodleNavesti and MIREL.kod == 2) or MIREL.zobrazenaRychlost <= MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni or MIREL.zobrazenaRychlost <= 40 or (MIREL.modelujKrivkuDo120 and MIREL.zobrazenaRychlost <= 120) then
                                            MIREL:UkonciModelovaniKrivky()
                                        end

                                        --zapisy zobrazenych rychlosti mimo rezim ZAV
                                            if MIREL.NO.rezim ~= "ZAV" then
                                                --pokud neni manual
                                                    if not MIREL.manual then
                                                        MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.rychlostKrivky,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
                                                --jinak pokud je manual, misto rychlsoti krivky se pouzije rychlsot manualu
                                                    else
                                                        MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.maxManual,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
                                                    end
                                        --v rezimu zav je rychlost omezena pouze konstrukcni rychlsoti loko
                                            else
                                                MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed
                                            end

                                        --cyklicka bdelost
                                            MIREL:Bdelost()

                                        --pri zastaveni vzdycky vypni piskani
                                            -- if MIREL.rychlostKMHabs < 0.1 then
                                            --     Call("SetControlValue", "ZS20", 0, 0)
                                            --     Call("SetControlValue","ZS1",0,0)
                                            --     MIREL.casBdelost = 0
                                            -- end

                                        --ztrata kodu pokud neprisel aktivni kod pred mene jak 5 sec
                                            if math.abs(os.clock()-MIREL.posledniKodCas) > 5 and MIREL.NO.rezim == "PRE" and MIREL.rychlostPodleNavesti >= 120 then
                                                MIREL.kod = 0
                                                MIREL.vypadekKodu = true
                                                Call("SetControlValue", "NO1", 0, 0)
                                                Call("SetControlValue", "NO2", 0, 0)
                                                Call("SetControlValue", "NO3", 0, 0)
                                                Call("SetControlValue", "NO4", 0, 0)
                                                if MIREL.NO.prenosNavesti then
                                                    MIREL.casBdelost = MIREL.bdelostInterval/4
                                                end
                                                MIREL.NO.prenosNavesti = false
                                                MIREL.kodovaneMezikruzi = false
                                                MIREL.NO.NO7 = false
                                                MIREL.NO.NO8 = false
                                                MIREL.mezikruziZvyseni = 0
                                                MIREL.casPrenasenehoKodu = 0
                                                MIREL.rychlostPodleNavesti = 120
                                                if MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni < MIREL.zobrazenaRychlost and not MIREL.modelujKrivku and not MIREL.manual then
                                                    MIREL:ModelujKrivku(MIREL.kod)
                                                elseif (not MIREL.modelujKrivku and not MIREL.manual) or MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni > MIREL.zobrazenaRychlost or MIREL.rychlostKMHabs < 5 then
                                                    MIREL:ZvysRychlost(MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
                                                end
                                        --ztrata kodu pri kodovani omezujiciho znaku, prodlouzeni platnosti na 23 sec a proti stuj jeste 1000m
                                            elseif math.abs(os.clock()-MIREL.posledniKodCas) > 23 and MIREL.NO.rezim == "PRE" and MIREL.prodlouzeniKodovaniStuj < 0 then
                                                MIREL.kod = 0
                                                MIREL.vypadekKodu = true
                                                Call("SetControlValue", "NO1", 0, 0)
                                                Call("SetControlValue", "NO2", 0, 0)
                                                Call("SetControlValue", "NO3", 0, 0)
                                                Call("SetControlValue", "NO4", 0, 0)
                                                if MIREL.NO.prenosNavesti then
                                                    MIREL.casBdelost = MIREL.bdelostInterval/4
                                                end
                                                MIREL.NO.prenosNavesti = false
                                                MIREL.kodovaneMezikruzi = false
                                                MIREL.NO.NO7 = false
                                                MIREL.NO.NO8 = false
                                                MIREL.mezikruziZvyseni = 0
                                                MIREL.casPrenasenehoKodu = 0
                                                MIREL.rychlostPodleNavesti = 120
                                                if MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni < MIREL.zobrazenaRychlost and not MIREL.modelujKrivku and not MIREL.manual then
                                                    MIREL:ModelujKrivku(MIREL.kod)
                                                elseif (not MIREL.modelujKrivku and not MIREL.manual) or MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni > MIREL.zobrazenaRychlost or MIREL.rychlostKMHabs < 5 then
                                                    MIREL:ZvysRychlost(MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
                                                end
                                        --zhasnuti aktivniho prenosu pokud je prekroceny cas 0.5 sec od posledniho stabilniho kodu
                                            elseif math.abs(os.clock()-MIREL.posledniKodCas) > 0.5 then
                                                MIREL.NO.NO7 = false
                                                MIREL.NO.NO8 = false
                                                if MIREL.NO.prenosNavesti then
                                                    MIREL.casBdelost = MIREL.bdelostInterval/4
                                                end
                                                MIREL.NO.prenosNavesti = false
                                                MIREL.casPrenasenehoKodu = 0
                                                Call("SetControlValue", "NO1", 0, 0)
                                                Call("SetControlValue", "NO2", 0, 0)
                                                Call("SetControlValue", "NO3", 0, 0)
                                                Call("SetControlValue", "NO4", 0, 0)
                                            end

                                        --pokud je aktivni manual
                                            if MIREL.manual then
                                                --sviti indikator NO9
                                                    MIREL.NO.NO9 = true

                                                --pokud je rychlost > 120, maximalni se snizuje jenom smerem dolu
                                                    if MIREL.maxManual > 120 then
                                                        MIREL.maxManual = math.min(MIREL.rychlostKMHabs,MIREL.maxManual)
                                                --jinak je maximalni rychlost prave 120
                                                    else
                                                        MIREL.maxManual = 120
                                                    end
                                        --jinak zhasni indikator NO9
                                            else
                                                MIREL.NO.NO9 = false
                                            end

                                        --pokud neni modelovana krivka, nastavuj hodnoty zpomaleni pro krivku
                                            if not MIREL.modelujKrivku then
                                                if MIREL.zobrazenaRychlost <= 80 then
                                                    MIREL.krivkaDecceleration = 0.40
                                                elseif MIREL.zobrazenaRychlost <= 100 then
                                                    MIREL.krivkaDecceleration = 0.60
                                                elseif MIREL.zobrazenaRychlost <= 140 then
                                                    MIREL.krivkaDecceleration = 0.82
                                                else
                                                    if MIREL.canUseDeccel150mss and MIREL.MIRELversion == 4 then
                                                        MIREL.krivkaDecceleration = 1.50
                                                    else
                                                        MIREL.krivkaDecceleration = 0.94
                                                    end
                                                end
                                            end

                                        --zapis noveho rezimu pro potreby nacteni pri startu
                                            -- if MIREL.NO.rezim ~= MIREL.NO.rezimOld then
                                            --     MIREL.NO:UlozRezim(MIREL.NO.rezim)
                                            -- end

                                        --pokud je nenulova rychlost a neni zobrazene NZ, zobraz rychlost
                                            if not MIREL.NO.blokujZobrazeniRychlosti and MIREL.rychlostKMHabs > 1 and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.NZ then
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

                                        --pokud uzivatel vice jak 5s nezmackl zadnou klavesu a neni zobrazene NZ, zobraz rychlost
                                            if MIREL.NO.casMenu > 5 and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.NZ then
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
                                                    if not MIREL.prekroceniRychlosti then
                                                        MIREL.NO.NO11 = MIREL.zobrazenaRychlost
                                                        MIREL.NO.DISPLEJ.blikej = false
                                                        MIREL.NO.DISPLEJ.blikejRychle = false
                                                    end
                                                else
                                                    MIREL.NO.NO11 = MIREL.rychlostKrivky
                                                    MIREL.NO.DISPLEJ.blikej = true
                                                    MIREL.NO.DISPLEJ.blikejRychle = true
                                                end
                                                MIREL.NO.blokujZobrazeniRychlosti = false
                                            end

                                        --zopakovani volby po zobrazeni troch plnych znaku
                                            if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ULOZ then
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

                                        --nulovani ZS3, pokud je alarm stale aktivny, zapise se nize
                                            MIREL.smerZS3 = false

                                        --REZIM POSUN
                                            if MIREL.NO.rezim == "POS" then
                                                --pokud je verze MIRELu 4, udelej po rozjezdu jednorazovou bdelostnou vyzvu
                                                    if MIREL.MIRELversion == 4 then
                                                        if MIREL.rychlostKMHabs > 1 then
                                                            if MIREL.casPoRozjezdu > 5 then
                                                                if not MIREL.bylaVyzvaPoRozjezdu then
                                                                    MIREL:JednorazovaBdelostnaVyzva(true)
                                                                    MIREL.bylaVyzvaPoRozjezdu = true
                                                                end
                                                            else
                                                                MIREL.casPoRozjezdu = MIREL.casPoRozjezdu + deltaTime
                                                            end
                                                        else
                                                            MIREL.casPoRozjezdu = 0
                                                            MIREL.bylaVyzvaPoRozjezdu = false
                                                        end
                                                --jinak nedelej nic
                                                    else
                                                        MIREL.bylaVyzvaPoRozjezdu = false
                                                        MIREL.casPoRozjezdu = 0
                                                    end

                                                --v rezime POS je blokovany prenos navesti
                                                    MIREL.blokujPrenosNavesti = true

                                                --ryhlost rezimu je 40
                                                    MIREL.rychlostRezimu = 40
                                                
                                                --pokud je rychlost vetsi, nez 20, je vyzadovane vybavovani vzdy
                                                    if MIREL.rychlostKMHabs > 20 then
                                                        MIREL.vyzadujVybavovani = true
                                                --jinak neni vyzadovane vybavovani
                                                    else
                                                        MIREL.vyzadujVybavovani = false
                                                    end

                                                --MIREL hlida prekroceni rychlosti
                                                    MIREL:OchranaPrekroceniRychlosti()

                                                --soulad navoleneho a skutecneho smeru
                                                    MIREL:OchranaNavolenehoSmeru()

                                                --i nezajisteni
                                                    MIREL:OchranaNezajisteni()

                                        --REZIM PREVADZKA
                                            elseif MIREL.NO.rezim == "PRE" then
                                                --pokud je verze MIRELu 4, udelej po rozjezdu jednorazovou bdelostnou vyzvu
                                                    if MIREL.MIRELversion == 4 then
                                                        if MIREL.rychlostKMHabs > 1 then
                                                            if MIREL.casPoRozjezdu > 5 then
                                                                if not MIREL.bylaVyzvaPoRozjezdu then
                                                                    MIREL:JednorazovaBdelostnaVyzva(true)
                                                                    MIREL.bylaVyzvaPoRozjezdu = true
                                                                end
                                                            else
                                                                MIREL.casPoRozjezdu = MIREL.casPoRozjezdu + deltaTime
                                                            end
                                                        else
                                                            MIREL.casPoRozjezdu = 0
                                                            MIREL.bylaVyzvaPoRozjezdu = false
                                                        end
                                                --jinak nedelej nic
                                                    else
                                                        MIREL.bylaVyzvaPoRozjezdu = false
                                                        MIREL.casPoRozjezdu = 0
                                                    end
                                                
                                                --neni blokovany prenos navesti
                                                    MIREL.blokujPrenosNavesti = false

                                                --maximalni rychlost rezimu je 160
                                                    MIREL.rychlostRezimu = 160

                                                --podminky pro vyzadovani bdelosti
                                                    if (not MIREL.NO.prenosNavesti or MIREL.bdelostBezModre or (MIREL.rychlostKrivky == 40 and MIREL.kod == 2) or (MIREL.rychlostKMHabs > 90 and MIREL.kod == 1 and MIREL.rychlostKrivky == 120) or (MIREL.kod == 4 and MIREL.mezikruziZvyseni > 0)) and not (MIREL.rychlostKMHabs < 1 or (MIREL.rychlostKMHabs < 15 and MIREL.tlakBV > 2)) then
                                                        MIREL.vyzadujVybavovani = true
                                                    else
                                                        MIREL.vyzadujVybavovani = false
                                                    end

                                                --ochrany stejne jako v POS
                                                    MIREL:OchranaPrekroceniRychlosti()

                                                    MIREL:OchranaNavolenehoSmeru()

                                                    MIREL:OchranaNezajisteni()

                                        --REZIM VYLUKA
                                            elseif MIREL.NO.rezim == "VYL" then
                                                --v rezime vylouceni neni aktivni prenos kodu - obviously
                                                    MIREL.blokujPrenosNavesti = true

                                                --maximalni rychlost je tedy 120
                                                    MIREL.rychlostRezimu = 120
                                                
                                                --za stati, nebo pri rychlosti mensi nez 15 a nabrzdenem neni potreva overovat bdelost
                                                    if MIREL.rychlostKMHabs < 1 or (MIREL.rychlostKMHabs < 15 and MIREL.tlakBV > 2) then
                                                        MIREL.vyzadujVybavovani = false
                                                --jinak je overovana
                                                    else
                                                        MIREL.vyzadujVybavovani = true
                                                    end

                                                --ochrany shodne s PRE a POS
                                                    MIREL:OchranaPrekroceniRychlosti()

                                                    MIREL:OchranaNavolenehoSmeru()

                                                    MIREL:OchranaNezajisteni()
                                                
                                        --REZIM ZAVES
                                            elseif MIREL.NO.rezim == "ZAV" then
                                                --neni prenos navesti
                                                    MIREL.blokujPrenosNavesti = true

                                                --rychlost je 160
                                                    MIREL.rychlostRezimu = 160
                                                
                                                --neni potrebne vybavovani
                                                    MIREL.vyzadujVybavovani = false

                                                --zobrazena rychlost je rovna kontrukcni
                                                    MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed

                                                --MIREL hlida pouze prekroceni rychlosti a soulad navoleneho a skutecneho smeru
                                                    MIREL:OchranaPrekroceniRychlosti()

                                                    MIREL:OchranaNavolenehoSmeru()
                                            end
                                        
                                        --pokud je aktivni stanovist, zapis piskani ZS3
                                            if MIREL.isThisCabActive then
                                                Call("SetControlValue","ZS3",0,math.max(MIREL:BolToDecToBol(MIREL.smerZS3),MIREL:BolToDecToBol(MIREL.nezabrzdenieZS3)))
                                        --pokud neni aktivni stanoviste, zapis ST1/2/-
                                            else
                                                if MIREL.isCab1Active then
                                                    MIREL.NO.NO11 = "ST1"
                                                else
                                                    MIREL.NO.NO11 = "ST2"
                                                end
                                            end

                                        --intervaly vybavovani bdelosti v zavislosti na rychlosti
                                            if not MIREL.bdelostBezModre then
                                                if MIREL.rychlostKMHabs > 110 then
                                                    MIREL.bdelostInterval = 16
                                                elseif MIREL.rychlostKMHabs > 40 then
                                                    MIREL.bdelostInterval = 24 - ((MIREL.rychlostKMHabs-40)/8.75)
                                                else
                                                    MIREL.bdelostInterval = 24
                                                end
                                            else
                                                MIREL.bdelostInterval = 12
                                            end
                                    end
                                
                                --MIREL podle specifikace PKP
                                    if MIREL.narodniVolba == MIREL.polsko then
                                        MIREL.ubehlyCasNZ5 = 0
                                        --MIREL.NO.casMenu = 0
                                        --MIREL.NO.casRychloposuv = 0
                                        MIREL.casPredKrivkou = 0

                                        --pokud je nenulova rychlost, zobraz rychlost, nebo pokud uzivatel vice jak 5s nezmackl zadnou klavesu, zobraz rychlost
                                        if (MIREL.rychlostKMHabs > 1 or MIREL.NO.casMenu > 5) and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.R and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.ZSR and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.CS and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.MAV and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.H and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.PKP_VYBER and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.PL then
                                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
                                        end
                                        if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP then
                                            MIREL.NO.NO11 = ""
                                        end
                                        MIREL.NO.NO1 = false
                                        MIREL.NO.NO3 = false
                                        MIREL.NO.NO4 = false
                                        MIREL.NO.NO5 = false
                                        MIREL.NO.NO7 = false
                                        MIREL.NO.NO8 = false
                                        MIREL.NO.NO9 = false
                                        MIREL.NO.NO10 = false
                                        Call("SetControlValue", "NO1", 0, 0)
                                        Call("SetControlValue", "NO3", 0, 0)
                                        Call("SetControlValue", "NO4", 0, 0)
                                        MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed

                                        --citace
                                            if MIREL.rychlostKMHabs > MIREL.maxDesignSpeed/10 then
                                                MIREL.SHPcounter = MIREL.SHPcounter + deltaTime
                                            end
                                            MIREL.SHPblinkCounter = MIREL.SHPblinkCounter + deltaTime
                                            MIREL.SHPnezabrzdenie = MIREL.SHPnezabrzdenie + deltaTime
                                            if MIREL.SHPsignalCounter >= 0 then
                                                MIREL.SHPsignalCounter = MIREL.SHPsignalCounter + deltaTime
                                            end

                                        if (MIREL.rychlostKMHabs > 1 or MIREL.tlakBV > 0.1 or MIREL.tlakHP < 4.5 or MIREL.stradac) and MIREL.SHPnezabrzdenie < 25 then
                                            MIREL.SHPnezabrzdenie = 0
                                        end

                                        if MIREL.SHPnezabrzdenie > 25 then
                                            Call("SetControlValue","ZS3",0,0)
                                            if MIREL.isThisCabActive then
                                                MIREL.NO.NO11 = "HAM"
                                            end
                                            MIREL.blokujEPV_NZ = true
                                            MIREL.odpadleSoupatkoVZ = true
                                            if MIREL.NO.NO14 and (MIREL.tlakBV > 0.1 or MIREL.tlakHP < 4.5 or MIREL.stradac) and MIREL.isThisCabActive then
                                                MIREL.odpadleSoupatkoVZ = false
                                                MIREL.SHPnezabrzdenie = 0
                                            end
                                        elseif MIREL.SHPnezabrzdenie > 15 then
                                            if MIREL.isThisCabActive then
                                                Call("SetControlValue","ZS3",0,1)
                                            end
                                        else
                                            Call("SetControlValue","ZS3",0,0)
                                        end

                                        if Call("GetControlValue",MIREL.resetButtonControlValueName,0) > 0.5 then
                                            if not MIREL.odpadleSoupatkoVZ then
                                                MIREL.SHPresetCounter = MIREL.SHPresetCounter + deltaTime
                                            end
                                        else
                                            if MIREL.SHPresetCounter > 5.5 then
                                                MIREL.SHPcounter = 0
                                                MIREL.odpadleSoupatkoVZ = false
                                            end
                                            MIREL.SHPresetCounter = 0
                                        end

                                        if MIREL.SHPresetCounter < 1 then
                                            if math.max(MIREL.SHPcounter, MIREL.SHPsignalCounter+60) > 64.5 and MIREL.SHPstarted then
                                                MIREL.blokujEPV_NZ = true
                                                MIREL.odpadleSoupatkoVZ = true
                                                Call("SetControlValue","ZS1",0,0)
                                                if MIREL.isThisCabActive then
                                                    if MIREL.SHPcounter > 60 and MIREL.SHPsignalCounter > 0 then
                                                        MIREL.NO.NO11 = "S+C"
                                                    elseif MIREL.SHPcounter > 60 then
                                                        MIREL.NO.NO11 = "CA"
                                                    else
                                                        MIREL.NO.NO11 = "SHP"
                                                    end
                                                end
                                            elseif math.max(MIREL.SHPcounter, MIREL.SHPsignalCounter+60) > 62.5 then
                                                if MIREL.isThisCabActive then
                                                    Call("SetControlValue","ZS1",0,1)
                                                    if MIREL.SHPcounter > 60 and MIREL.SHPsignalCounter > 0 then
                                                        MIREL.NO.NO11 = "S+C"
                                                    elseif MIREL.SHPcounter > 60 then
                                                        MIREL.NO.NO11 = "CA"
                                                    else
                                                        MIREL.NO.NO11 = "SHP"
                                                    end
                                                end
                                            elseif math.max(MIREL.SHPcounter, MIREL.SHPsignalCounter+60) > 60 then
                                                Call("SetControlValue","ZS1",0,0)
                                                if MIREL.isThisCabActive then
                                                    if MIREL.SHPcounter > 60 and MIREL.SHPsignalCounter > 0 then
                                                        MIREL.NO.NO11 = "S+C"
                                                    elseif MIREL.SHPcounter > 60 then
                                                        MIREL.NO.NO11 = "CA"
                                                    else
                                                        MIREL.NO.NO11 = "SHP"
                                                    end
                                                end
                                            else
                                                Call("SetControlValue","ZS1",0,0)
                                            end
                                        else
                                            if MIREL.SHPresetCounter > 5.5 then
                                                MIREL.blokujEPV_NZ = true
                                                MIREL.odpadleSoupatkoVZ = true
                                                Call("SetControlValue","ZS1",0,0)
                                            elseif MIREL.SHPresetCounter > 3.5 then
                                                if MIREL.isThisCabActive then
                                                    Call("SetControlValue","ZS1",0,1)
                                                end
                                            elseif MIREL.SHPresetCounter > 1 then
                                                Call("SetControlValue","ZS1",0,0)
                                            end
                                        end

                                        
                                        if MIREL.NO.NO12 and MIREL.isThisCabActive and MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP then --zobrazeni napisu PKP pri drzeni tlacitka -
                                            MIREL.NO.NO11 = "PKP"
                                        end

                                        if Call("GetControlValue",MIREL.resetButtonControlValueName,0) > 0.5 and MIREL.NO.NO13 and MIREL.NO.NO11 ~= "HAM" and MIREL.isThisCabActive then
                                            if MIREL.SHPsignalCounter > 4.5 then
                                                MIREL.SHPsignalCounter = -1
                                            end
                                            if MIREL.SHPcounter > 64.5 then
                                                MIREL.SHPcounter = 0
                                            end
                                            MIREL.odpadleSoupatkoVZ = false
                                        end

                                        if MIREL.SHPcounter > 60 or MIREL.SHPresetCounter > 1 or MIREL.SHPsignalCounter > 0 and MIREL.isThisCabActive then
                                            if MIREL.SHPblinkCounter > 0.4 then
                                                MIREL.SHPblinkCounter = 0
                                                MIREL.NO.NO2 = not MIREL.NO.NO2
                                            end
                                        else
                                            MIREL.NO.NO2 = false
                                        end
                                        Call("SetControlValue", "NO2", 0, MIREL:BolToDecToBol(MIREL.NO.NO2))

                                        if MIREL.rychlostKMHabs < MIREL.maxDesignSpeed/10 and MIREL.SHPcounter <= 60 then
                                            MIREL.SHPcounter = 60
                                        else
                                            MIREL.SHPstarted = true
                                        end
                                    else
                                        MIREL.SHPcounter = 0
                                        MIREL.SHPsignalCounter = 4.5
                                    end
                                
                                --MIREL podle specifikace MAV
                                    if MIREL.narodniVolba == MIREL.madarsko then --madarska verze
                                        MIREL.NO.NO1 = false
                                        MIREL.NO.NO2 = false
                                        MIREL.NO.NO3 = false
                                        MIREL.NO.NO5 = false
                                        MIREL.NO.NO7 = false
                                        MIREL.NO.NO8 = false
                                        MIREL.NO.NO9 = true
                                        MIREL.NO.NO10 = false
                                        Call("SetControlValue", "NO1", 0, 0)
                                        Call("SetControlValue", "NO2", 0, 0)
                                        Call("SetControlValue", "NO3", 0, 0)

                                        MIREL.zobrazenaRychlost = MIREL.maxDesignSpeed
                                        if MIREL.NO.rezim == "TOL" then
                                            MIREL.NO.textMadarsko = MIREL.emptyCharacter.."T"..MIREL.emptyCharacter
                                        else
                                            if MIREL.rychlostniPrikaz == 0 then
                                                MIREL.NO.textMadarsko = MIREL.emptyCharacter.."G"..MIREL.emptyCharacter
                                            elseif MIREL.rychlostniPrikaz == 1 then
                                                MIREL.NO.textMadarsko = MIREL.emptyCharacter.."0"..MIREL.emptyCharacter
                                            elseif MIREL.rychlostniPrikaz == 2 then
                                                MIREL.NO.textMadarsko = MIREL.emptyCharacter.."40"
                                            elseif MIREL.rychlostniPrikaz == 3 then
                                                MIREL.NO.textMadarsko = MIREL.emptyCharacter.."80"
                                            elseif MIREL.rychlostniPrikaz == 4 then
                                                MIREL.NO.textMadarsko = "MAX"
                                            else
                                                MIREL.NO.textMadarsko = "---"
                                            end
                                        end

                                        if not MIREL.NO.blokujZobrazeniRychlosti and (MIREL.rychlostKMHabs > 40 or MIREL.rychlostKMHabs-2 > MIREL.rychlostPodleNavesti) and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.NZ then -- zavreti MENU za jazdy
                                            MIREL.NO.NO11 = MIREL.NO.textMadarsko
                                            if not MIREL.prekroceniRychlosti then
                                                MIREL.NO.DISPLEJ.blikej = false
                                                MIREL.NO.DISPLEJ.blikejRychle = false
                                            end
                                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                                            MIREL.NO.casMenu = 0
                                        end

                                        if MIREL.NO.casMenu > 5 then -- zavreti MENU pri neaktivite
                                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                                            if not MIREL.prekroceniRychlosti then
                                                MIREL.NO.NO11 = MIREL.NO.textMadarsko
                                                MIREL.NO.DISPLEJ.blikej = false
                                                MIREL.NO.DISPLEJ.blikejRychle = false
                                            end
                                            MIREL.NO.blokujZobrazeniRychlosti = false
                                        end
                                        
                                        -- if MIREL.rychlostKMHabs > 40 or MIREL.rychlostKMHabs-2 < MIREL.rychlostPodleNavesti then
                                        --     MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                                        --     if not MIREL.prekroceniRychlosti then
                                        --         MIREL.NO.NO11 = MIREL.NO.textMadarsko
                                        --         MIREL.NO.DISPLEJ.blikej = false
                                        --         MIREL.NO.DISPLEJ.blikejRychle = false
                                        --     end
                                        --     MIREL.NO.blokujZobrazeniRychlosti = false
                                        -- end

                                        if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ULOZ then -- NO ulozenie a zopakovanie volby
                                            MIREL.NO.casMenu = 0
                                            if MIREL.NO.casUloz > 0.5 then
                                                MIREL.NO.NO11 = MIREL.NO.zopakujPriUlozeni
                                            end
                                            if MIREL.NO.casUloz > 5 then
                                                MIREL.NO.NO11 = MIREL.NO.textMadarsko
                                                MIREL.NO.DISPLEJ.blikej = false
                                                MIREL.NO.DISPLEJ.blikejRychle = false
                                                MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                                                MIREL.NO.blokujZobrazeniRychlosti = false
                                            end
                                        end

                                        MIREL:OchranaNezajisteni()
                                        
                                        if MIREL.NO.rezim == "TOL" then
                                            MIREL.rychlostRezimu = 40
                                            MIREL.nulovaTolerancia = true
                                            if MIREL.rychlostKMHabs >= 41 then
                                                Call("SetControlValue", "ZS20", 0, 1)
                                                MIREL.blokujEPV_NZ = true
                                                MIREL.odpadleSoupatkoVZ = true
                                            end
                                        elseif MIREL.NO.rezim == "MEN" then
                                            MIREL.rychlostRezimu = 160
                                            MIREL.nulovaTolerancia = false
                                            if MIREL.rychlostKMHabs > 167 then
                                                Call("SetControlValue", "ZS20", 0, 1)
                                                MIREL.blokujEPV_NZ = true
                                                MIREL.odpadleSoupatkoVZ = true
                                            end
                                            if MIREL.rychlostniPrikaz == 0 and MIREL.rychlostKMHabs > 17 then
                                                Call("SetControlValue", "ZS20", 0, 1)
                                                MIREL.blokujEPV_NZ = true
                                                MIREL.odpadleSoupatkoVZ = true
                                            end
                                        end

                                        if MIREL.rychlostKMHabs > 15 then
                                            MIREL.vyzadujVybavovani = true
                                        else
                                            MIREL.vyzadujVybavovani = false
                                        end

                                        if MIREL.rychlostKMHabs >= 123 then
                                            MIREL.zvysenaRychlost = true
                                        elseif MIREL.rychlostKMHabs <= 79 then
                                            MIREL.zvysenaRychlost = false
                                        end

                                        if MIREL.zvysenaRychlost then
                                            MIREL.NO.NO4 = true
                                            Call("SetControlValue", "NO4", 0, 1)
                                        else
                                            MIREL.NO.NO4 = false
                                            Call("SetControlValue", "NO4", 0, 0)
                                        end
                                    else
                                        Call("SetControlValue", "ZS20", 0, 0)
                                    end
                        --ani jedno stanoviste neni aktivni - MIREL je vypnuty
                            else
                                if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                                    if MIREL.aktualniNZ == -1 then
                                        MIREL.NO.NO11 = "ST-"
                                    end
                                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                    Call("SetControlValue", "ZS1", 0, 0)
                                    Call("SetControlValue", "ZS2", 0, 0)
                                    Call("SetControlValue", "ZS3", 0, 0)
                                    Call("SetControlValue", "ZS20", 0, 0)
                                elseif MIREL.narodniVolba == MIREL.madarsko then
                                    if MIREL.aktualniNZ == -1 then
                                        MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                    end
                                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                    if MIREL.rychlostKMHabs > 1 then
                                        Call("SetControlValue", "ZS20", 0, 1)
                                        MIREL.blokujEPV_NZ = true
                                        MIREL.odpadleSoupatkoVZ = true
                                    end
                                    Call("SetControlValue", "ZS2", 0, 0)
                                    Call("SetControlValue", "ZS3", 0, 0)
                                else
                                    if MIREL.aktualniNZ == -1 then
                                        MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                    end
                                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                    Call("SetControlValue", "ZS1", 0, 0)
                                    Call("SetControlValue", "ZS2", 0, 0)
                                    Call("SetControlValue", "ZS3", 0, 0)
                                    Call("SetControlValue", "ZS20", 0, 0)
                                end
                                if MIREL.rychlostKMHabs > 3 and not (MIREL.isCab1Active or MIREL.isCab2Active) then
                                	MIREL:NouzoveZastaveni(2)
                                end
                                --MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                MIREL.NO.casUloz = 0
                                MIREL.ubehlyCasNZ5 = 0
                                MIREL.NO.casMenu = 0
                                MIREL.NO.casRychloposuv = 0
                                MIREL.casPredKrivkou = 0
                                --MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
                                MIREL.NO.NO1 = false
                                MIREL.NO.NO3 = false
                                MIREL.NO.NO4 = false
                                MIREL.NO.NO5 = false
                                MIREL.NO.NO7 = false
                                MIREL.NO.NO8 = false
                                MIREL.NO.NO9 = false
                                MIREL.NO.NO10 = false
                                Call("SetControlValue", "NO1", 0, 0)
                                Call("SetControlValue", "NO2", 0, 0)
                                Call("SetControlValue", "NO3", 0, 0)
                                Call("SetControlValue", "NO4", 0, 0)
                                MIREL.NO.DISPLEJ.blikej = false
                                MIREL.NO.DISPLEJ.blikejRychle = false
                                MIREL.blokujPrenosNavesti = true
                                MIREL.ZS1B = false
                                MIREL.casBdelost = 0
                                MIREL.casPrenasenehoKodu = 0
                                MIREL.casBdelostJednorazova = -1
                                Call("SetControlValue","NO_bodka",0)
                            end
                    end
                    
                    --pokud neni modelovana krivka, indikator NO10 slouzi jako idnikace stati
                        if not MIREL.modelujKrivku then
                            if MIREL.rychlostKMHabs < 1 then
                                MIREL.NO.NO10 = true
                            else
                                MIREL.NO.NO10 = false
                            end
                    --jinak NO10 slouzi jako indikace krivky
                        else
                            if MIREL.NO.blikejNO10 then
                                --potvrzena krivka - blika rychle
                                    if MIREL.NO.blikejRychleNO10 then
                                        if MIREL.NO.casBlikaniNO10 > 0.2 then
                                            MIREL.NO.casBlikaniNO10 = 0
                                            if MIREL.NO.NO10 then
                                                MIREL.NO.NO10 = false
                                            else
                                                MIREL.NO.NO10 = true
                                            end
                                        end
                                --nepotvrzena krivka - blika pomalu
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

                    --reset vybaveni pohybem - nikdy nelze vybavit prvni vyzvu jinak, nez tlacitkem
                        if not MIREL.vyzadujVybavovani then
                            MIREL.lzeVybavitPohybemOvladace = false
                        end

                    --zablokuj na chvili blikani po zmene, aby se nestavalo, ze po zmene hodnota zrovna nesviti
                        if MIREL.NO.NO11 ~= MIREL.NO.NO11old then
                            MIREL.NO.blokujBlikaniPoZmene = true
                            MIREL.NO.casBlokovaniBlikani = 0
                            MIREL.NO.NO11old = MIREL.NO.NO11
                        end

                        if MIREL.NO.blokujBlikaniPoZmene and MIREL.NO.casBlokovaniBlikani > 0.3 then
                            MIREL.NO.blokujBlikaniPoZmene = false
                        end

                    --pokud jsou splnene podminky pro zobrazeni skutecne rychlosti
                        if MIREL.testRychlost then
                            MIREL.NO.NO11 = math.floor(MIREL.rychlostKMHabs)
                        end

                    --pokud jsou splnene podminky pro zobrazeni skutecneho tlaku
                        if MIREL.testTlak then
                            MIREL.NO.NO11 = string.sub(tostring(MIREL.tlakHP),0,3)
                        end

                    --pokud je napis kratsi, nez 3 znaky, dopln ho zleva prazdnymi poli
                        while string.len(MIREL.NO.NO11) < 3 do
                            MIREL.NO.NO11 = MIREL.emptyCharacter..MIREL.NO.NO11
                        end
                    
                    --pokud je displej v rezimu vyberu narodni volby a je nenulova rychlost - zavri menu
                        if (MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.R or MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZSR or MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.CS or MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAV
                        or MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.H or MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP_VYBER or MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PL) and MIREL.rychlostKMHabs > 0.1 then
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                        end

                    --pokud displej blika
                        if MIREL.NO.DISPLEJ.blikej and not MIREL.NO.blokujBlikaniPoZmene and not MIREL.NO.blokujBlikaniTest and MIREL.isThisCabActive then
                            --pokud blika pomalu
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
                            --pokud blika rychle
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
                    --pokud neni potvrzena bdelost po NZ1 ve V4, 1 v NZ1 blika
                        elseif MIREL.aktualniNZ == 1 and (MIREL.casBdelost > 0 or MIREL.casBdelostJednorazova > 0) and MIREL.MIRELversion == 4 and MIREL.isThisCabActive then
                            if MIREL.NO.casBlikani > 0.5 then
                                MIREL.NO.casBlikani = 0
                                if MIREL.NO.stavBlikani then
                                    MIREL.NO.stavBlikani = false
                                    Call("MIREL:SetText", "NZ"..MIREL.emptyCharacter, 0)
                                else
                                    MIREL.NO.stavBlikani = true
                                    Call("MIREL:SetText", MIREL.NO.NO11, 0)
                                end
                            end
                    --jinak zapis na displej nezmeneny vstup
                        else
                            Call("MIREL:SetText", MIREL.NO.NO11, 0)
                            MIREL.NO.stavBlikani = false
                        end
            --vypnute baterie, nebo neni narodni volba v rozsahu, kde je MIREL aktivni
                else
                    Call("MIREL:SetText", MIREL.NO.dreimalEmptyChar, 0)
                    MIREL.NO.blokujBlikaniTest = false
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.uspesnyD1 = false
                    MIREL.D1_smerP = false
                    MIREL.D1_smer0 = false
                    MIREL.D1_smerZ = false
                    MIREL.D1_BP_od = false
                    MIREL.D1_BP_za = false
                    MIREL.casD1_1testu = 0
                    MIREL.D1_testEPV = false
                    MIREL.D1_ujetaVzdalenost = 0
                    MIREL.odpadleSoupatkoVZ = false
                    MIREL.blokujEPV_NZ = false
                    MIREL.vyzadujVybavovani = false
                    MIREL:NouzoveZastaveni(0)
                    MIREL.NO.D1_1 = false
                    MIREL.NO.D1_2 = false
                    MIREL.NO.D1_3 = false
                    MIREL.NO.D1_4 = false
                    MIREL.NO.D1_5 = false
                    MIREL.NO.D1_6 = false
                    MIREL.NO.D1_7 = false
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
                    MIREL.ZS1B = false
                    MIREL.aktualniNZ = -1
                    MIREL.prodlouzeniKodovaniStuj = -1
                    MIREL.casBdelost = 0
                    MIREL.casBdelostJednorazova = -1
                    MIREL.casPrenasenehoKodu = 0
                    Call("SetControlValue","NO_bodka",0)
                    Call("SetControlValue", "NO1", 0, 0)
                    Call("SetControlValue", "NO2", 0, 0)
                    Call("SetControlValue", "NO3", 0, 0)
                    Call("SetControlValue", "NO4", 0, 0)
                    Call("SetControlValue", "ZS1", 0, 0)
                    Call("SetControlValue", "ZS2", 0, 0)
                    Call("SetControlValue", "ZS3", 0, 0)
                    Call("SetControlValue", "ZS20", 0, 0)
                    MIREL.NO.casMenu = 10
                end
			if not MIREL.NO.blokujBlikaniTest then
                Call("SetControlValue","D1_1",0,MIREL:BolToDecToBol(MIREL.NO.D1_1))
                Call("SetControlValue","D1_2",0,MIREL:BolToDecToBol(MIREL.NO.D1_2))
                Call("SetControlValue","D1_3",0,MIREL:BolToDecToBol(MIREL.NO.D1_3))
                Call("SetControlValue","D1_4",0,MIREL:BolToDecToBol(MIREL.NO.D1_4))
                Call("SetControlValue","D1_5",0,MIREL:BolToDecToBol(MIREL.NO.D1_5))
                Call("SetControlValue","D1_6",0,MIREL:BolToDecToBol(MIREL.NO.D1_6))
                Call("SetControlValue","D1_7",0,MIREL:BolToDecToBol(MIREL.NO.D1_7))
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
            if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                if MIREL.rychlostKMHabs < 0.1 then --zadavÃ¡nÃ­ do menu pri stati
                    MIREL.NO.casMenu = 0
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.REZ then
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
                            if not MIREL.prekroceniRychlosti then
                                MIREL.NO.NO11 = MIREL.zobrazenaRychlost
                                MIREL.NO.DISPLEJ.blikej = false
                                MIREL.NO.DISPLEJ.blikejRychle = false
                            end
                        else
                            MIREL.NO.NO11 = MIREL.rychlostKrivky
                            MIREL.NO.DISPLEJ.blikej = true
                            MIREL.NO.DISPLEJ.blikejRychle = true
                        end
                        MIREL.NO.blokujZobrazeniRychlosti = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.R then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAX
                        MIREL.NO.NO11 = "MAX"
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAX then
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
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.rychlostKMHabs > 10 and not MIREL.zamekRychlosti and MIREL.NO.rezim == "PRE" and MIREL.MIRELversion == 4 then --systÃ©m NajvyÅ¡Å¡ej dovolenej
                    MIREL.NO.casUloz = 0
                    MIREL.NO.casMenu = 0
                    local cele, zbytek = MIREL:divMod(MIREL.rychlostKMHabs,5)
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

                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.zamekRychlosti and MIREL.MIRELversion == 4 then
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
            elseif MIREL.narodniVolba == MIREL.madarsko then
                if MIREL.rychlostKMHabs < 40 and MIREL.rychlostKMHabs-2 < MIREL.rychlostPodleNavesti then
                    MIREL.NO.casMenu = 0
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.TM then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                        if not MIREL.prekroceniRychlosti then
                            MIREL.NO.NO11 = MIREL.NO.textMadarsko
                            MIREL.NO.DISPLEJ.blikej = false
                            MIREL.NO.DISPLEJ.blikejRychle = false
                        end
                        MIREL.NO.blokujZobrazeniRychlosti = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.R then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.TM
                        MIREL.NO.NO11 = "T/M"
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MEN then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.TOL
                        MIREL.NO.NO11 = "TOL"
                        MIREL.NO.DISPLEJ.blikej = false
                    end
                end
            elseif MIREL.narodniVolba == MIREL.polsko then
                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.R then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                    MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                    MIREL.NO.DISPLEJ.blikej = false
                end
            end
            if MIREL.rychlostKMHabs < 0.1 then
                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAV then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ZSR
                    MIREL.NO.NO11 = "ZSR"
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP_VYBER then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAV
                    MIREL.NO.NO11 = "MAV"
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.H then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.CS
                    MIREL.NO.NO11 = MIREL.emptyCharacter.."CS"
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PL then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.H
                    MIREL.NO.NO11 = MIREL.emptyCharacter.."H"..MIREL.emptyCharacter
                    MIREL.NO.DISPLEJ.blikej = true
                end
            end
		end,

        Plus = function(self)
            if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                if MIREL.rychlostKMHabs < 1 then --zadavÃ¡nÃ­ do menu pri stati
                    MIREL.NO.casMenu = 0
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.REZ
                        MIREL.NO.NO11 = "REZ"
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.REZ then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAX
                        MIREL.NO.NO11 = "MAX"
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAX and MIREL.displayNationalitySettings then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.R
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."R"..MIREL.emptyCharacter
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
                        if MIREL.nastavenaRychlost < MIREL.maxDesignSpeed then
                            MIREL.nastavenaRychlost = MIREL.nastavenaRychlost + 5
                            MIREL.NO.NO11 = MIREL.nastavenaRychlost
                        end
                        MIREL.NO.DISPLEJ.blikej = true
                    end
                elseif MIREL.kodovaneMezikruzi and MIREL.rychlostKMHabs > 1 and MIREL.mezikruziZvyseni < 80 and MIREL.aktualniNZ == -1 then -- zvysovanie maximalnej rychlosti pri kodovani medzikruzia
                    MIREL.NO.DISPLEJ.blikej = true
                    MIREL.NO.DISPLEJ.blikejRychle = false
                    MIREL.NO.casMenu = 0 -- zavre se za 2 vteriny
                    MIREL.NO.blokujZobrazeniRychlosti = true
                    -- if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.mezikruziRYCH
                    --     MIREL.NO.NO11 = MIREL.mezikruziZvyseni + 40
                    --     -- Print("Zapinam MIREL.NO.rezim zmeny rychlosti mezikruzi; Aktualni: "..MIREL.mezikruziZvyseni+40)
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.mezikruziRYCH then
                        if MIREL.mezikruziZvyseni < 80 then
                            MIREL.mezikruziZvyseni = MIREL.mezikruziZvyseni + 20
                            -- Print("Zvedam mezikruzi; Aktualni: "..MIREL.mezikruziZvyseni+40)
                            MIREL.NO.NO11 = MIREL.mezikruziZvyseni + 40
                        end
                    end
                end
            elseif MIREL.narodniVolba == MIREL.madarsko then
                if MIREL.rychlostKMHabs < 40 and MIREL.rychlostKMHabs-2 < MIREL.rychlostPodleNavesti then
                    MIREL.NO.casMenu = 0
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.TM and MIREL.displayNationalitySettings then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.R
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."R"..MIREL.emptyCharacter
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.TM
                        MIREL.NO.NO11 = "T/M"
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.TOL then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MEN
                        MIREL.NO.NO11 = "MEN"
                        MIREL.NO.DISPLEJ.blikej = false
                    end
                end
            elseif MIREL.narodniVolba == MIREL.polsko then
                if MIREL.rychlostKMHabs < 1 then --zadavÃ¡nÃ­ do menu pri stati
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP and MIREL.displayNationalitySettings then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.R
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."R"..MIREL.emptyCharacter
                        MIREL.NO.DISPLEJ.blikej = false
                    end
                end
            end
            if MIREL.rychlostKMHabs < 1 then
                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZSR then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAV
                    MIREL.NO.NO11 = "MAV"
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAV then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP_VYBER
                    MIREL.NO.NO11 = "PKP"
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.CS then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.H
                    MIREL.NO.NO11 = MIREL.emptyCharacter.."H"..MIREL.emptyCharacter
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.H then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PL
                    MIREL.NO.NO11 = MIREL.emptyCharacter.."PL"
                    MIREL.NO.DISPLEJ.blikej = true
                end
            end
		end,

		Enter = function(self)
			-- Print("Enter zmack")
            if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                if MIREL.rychlostKMHabs < 1 then --zadavÃ¡nÃ­ do menu pri stati
                    MIREL.NO.casUloz = 0
                    MIREL.NO.casMenu = 0
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.REZ then
                        if MIREL.NO.rezim == "PRE" then
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PRE
                            MIREL.NO.NO11 = "PRE"
                            MIREL.NO.DISPLEJ.blikej = true
                        elseif MIREL.NO.rezim == "VYL" then
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.VYL
                            MIREL.NO.NO11 = "VYL"
                            MIREL.NO.DISPLEJ.blikej = true
                        elseif MIREL.NO.rezim == "ZAV" then
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ZAV
                            MIREL.NO.NO11 = "ZAV"
                            MIREL.NO.DISPLEJ.blikej = true
                        else
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.POS
                            MIREL.NO.NO11 = "POS"
                            MIREL.NO.DISPLEJ.blikej = true
                        end
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
                    end
                elseif MIREL.modelujKrivku and MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and not MIREL.manual then
                    MIREL:Manual()
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.rychlostKMHabs > 10 and not MIREL.zamekRychlosti and MIREL.NO.rezim == "PRE" and MIREL.MIRELversion == 3 then --systÃ©m NajvyÅ¡Å¡ej dovolenej
                    MIREL.NO.casUloz = 0
                    MIREL.NO.casMenu = 0
                    local cele, zbytek = MIREL:divMod(MIREL.rychlostKMHabs,5)
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

                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.zamekRychlosti and MIREL.MIRELversion == 3 then
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
                
                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.NZ then
                    if MIREL.MIRELversion == 3 and MIREL.rychlostKMHabs < 1 then
                        if MIREL.aktualniNZ == 5 then
                            if MIREL.ovladacBP > 0.1 then
                                MIREL:NouzoveZastaveni(0)
                                MIREL.NO.casUloz = 0
                                MIREL.NO.casMenu = 0
                                MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                                MIREL.NO.NO11 = "NZ"..MIREL.okCharacter
                                MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.okCharacter
                                MIREL.NO.blokujZobrazeniRychlosti = true
                                MIREL.NO.DISPLEJ.blikej = false
                            end
                        else
                            MIREL:NouzoveZastaveni(0)
                            MIREL.NO.casUloz = 0
                            MIREL.NO.casMenu = 0
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = "NZ"..MIREL.okCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.okCharacter
                            MIREL.NO.blokujZobrazeniRychlosti = true
                            MIREL.NO.DISPLEJ.blikej = false
                        end
                    else
                        if MIREL.aktualniNZ == 1 and MIREL.casBdelost <= MIREL.bdelostInterval / 4 and MIREL.casBdelostJednorazova == -1 then
                            MIREL:NouzoveZastaveni(0)
                            MIREL.NO.casUloz = 0
                            MIREL.NO.casMenu = 0
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = "NZ"..MIREL.okCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.okCharacter
                            MIREL.NO.blokujZobrazeniRychlosti = true
                            MIREL.NO.DISPLEJ.blikej = false
                            MIREL.aktualniNZ = -1
                        elseif MIREL.aktualniNZ == 2 and MIREL.rychlostKMHabs < MIREL.zobrazenaRychlost+0.5 then
                            MIREL:NouzoveZastaveni(0)
                            MIREL.NO.casUloz = 0
                            MIREL.NO.casMenu = 0
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = "NZ"..MIREL.okCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.okCharacter
                            MIREL.NO.blokujZobrazeniRychlosti = true
                            MIREL.NO.DISPLEJ.blikej = false
                            MIREL.aktualniNZ = -1
                        elseif MIREL.aktualniNZ == 3 and 
                        ((MIREL.actualCab == 1 and ((MIREL.rychlostKMH > -5 and MIREL.skutecnySmer == 1) or (MIREL.rychlostKMH < 5 and MIREL.skutecnySmer == -1)))
                        or (MIREL.actualCab == 2 and ((MIREL.rychlostKMH < 5 and MIREL.skutecnySmer == 1) or (MIREL.rychlostKMH > -5 and MIREL.skutecnySmer == -1)))
                        or MIREL.rychlostKMHabs < 5) then
                            MIREL:NouzoveZastaveni(0)
                            MIREL.NO.casUloz = 0
                            MIREL.NO.casMenu = 0
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = "NZ"..MIREL.okCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.okCharacter
                            MIREL.NO.blokujZobrazeniRychlosti = true
                            MIREL.NO.DISPLEJ.blikej = false
                            MIREL.aktualniNZ = -1
                        elseif MIREL.aktualniNZ == 5 then
                            if MIREL.ovladacBP > 0.1 then
                                MIREL:NouzoveZastaveni(0)
                                MIREL.NO.casUloz = 0
                                MIREL.NO.casMenu = 0
                                MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                                MIREL.NO.NO11 = "NZ"..MIREL.okCharacter
                                MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.okCharacter
                                MIREL.NO.blokujZobrazeniRychlosti = true
                                MIREL.NO.DISPLEJ.blikej = false
                                MIREL.aktualniNZ = -1
                            end
                        end
                    end
                end
            elseif MIREL.narodniVolba == MIREL.madarsko then
                if MIREL.rychlostKMHabs < 40 and MIREL.rychlostKMHabs-2 < MIREL.rychlostPodleNavesti then
                    MIREL.NO.casMenu = 0
                    MIREL.NO.casUloz = 0
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.TM then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.TOL
                        MIREL.NO.NO11 = "TOL"
                        MIREL.NO.DISPLEJ.blikej = false
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.TOL then
                        MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                        MIREL.NO.zopakujPriUlozeni = "TOL"
                        MIREL.NO.DISPLEJ.blikej = false
                        MIREL.NO.rezim = "TOL"
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MEN then
                        MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                        MIREL.NO.zopakujPriUlozeni = "MEN"
                        MIREL.NO.DISPLEJ.blikej = false
                        MIREL.NO.rezim = "MEN"
                    end
                end
            end
            if MIREL.rychlostKMHabs < 1 then
                if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.R then
                    if MIREL.MIRELversion == 3 then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ZSR
                        MIREL.NO.NO11 = "ZSR"
                    else
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.CS
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."CS"
                    end
                    MIREL.NO.DISPLEJ.blikej = true
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZSR then
                    MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                    MIREL.NO.zopakujPriUlozeni = "ZSR"
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 1
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.CS then
                    MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                    MIREL.NO.zopakujPriUlozeni = MIREL.emptyCharacter.."CS"
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 1
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAV then
                    MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                    MIREL.NO.zopakujPriUlozeni = "MAV"
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 3
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.H then
                    MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                    MIREL.NO.zopakujPriUlozeni = MIREL.emptyCharacter.."H"..MIREL.emptyCharacter
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 3
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP_VYBER then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 4
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PL then
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 4
                end
            end
		end,

		JednorazovaBdelostnaVyzva = function(self,opakovana)
			MIREL.casBdelost = 0
            MIREL.blokujBdelostVyzva = true
            MIREL.casBdelostJednorazova = 0
            MIREL.NO.NO5 = false
            if MIREL.isThisCabActive then
                Call("SetControlValue","ZS1",0,1)
            end
            if not opakovana then
                MIREL.ZS1B = true
            else
                MIREL.ZS1B = false
			end
		end,

		Manual = function(self)
            MIREL.bdelostBezModre = true
            MIREL:UkonciModelovaniKrivky()
            if MIREL.rychlostKMHabs > 120 then
                MIREL.maxManual = MIREL.rychlostKMHabs
            else
                MIREL.maxManual = 120
            end
            MIREL.zobrazenaRychlost = math.min(MIREL.maxDesignSpeed,MIREL.maxManual,MIREL.rychlostRezimu,MIREL.nastavenaRychlost,MIREL.zamekRychlostiVal)
            if not MIREL.manual then
                MIREL.NO.casUloz = 0
                MIREL.NO.casMenu = 0
                -- Print(MIREL.maxManual)
                MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                MIREL.NO.zopakujPriUlozeni = "MAN"
                MIREL.NO.blokujZobrazeniRychlosti = true
                MIREL.NO.DISPLEJ.blikej = false
            end
            MIREL.manual = true
		end,

		ModelujKrivku = function(self,navestNO)
			if MIREL.rychlostKMHabs > 40 or navestNO ~= 2 then
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
				MIREL.krivkaDelkaDrahaPred = math.max(1050 - MIREL.krivkaDelkaDraha,0) --na test 1050 metru misto 900 metru
				MIREL.krivkaDelkaCasPred = MIREL.krivkaDelkaDrahaPred*3.6 / MIREL.zobrazenaRychlost
				MIREL.krivkaCasUjety = 0
				if MIREL.DEBUG then
					Print("RychlostNO: "..MIREL.zobrazenaRychlost)
					Print("Planovane zpomaleni: "..MIREL.krivkaDecceleration)
					Print("Delka krivky [s]: "..MIREL.krivkaDelkaCas)
					Print("Delka krivky [m]: "..MIREL.krivkaDelkaDraha)
					Print("Delka do zacatku krivky [m]: "..MIREL.krivkaDelkaDrahaPred)
					Print("Cas do zacatku krivky [s]: "..MIREL.krivkaDelkaCasPred)
				end
				MIREL:JednorazovaBdelostnaVyzva(false)
				MIREL.vychoziRychlost = MIREL.zobrazenaRychlost
				MIREL.casPredKrivkou = 0
				MIREL.NO.blikejNO10 = true
			elseif navestNO == 2 then
				MIREL.rychlostKrivky = 40
				MIREL.rychlostKrivkyAbs = 40
			end
		end,
		
		UkonciModelovaniKrivky = function(self)
			MIREL.rychlostKrivkyAbs = MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni
			MIREL.modelujKrivku = false
			MIREL.modelujKrivkuDo120 = true
			MIREL.rychlostKrivky = MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni
			MIREL.NO.blikejNO10 = false
            MIREL.NO.blikejRychleNO10 = false
            MIREL.bylaBdelostnaVyzvaKrivka = false
            MIREL.bylaOpakovanaVyzvaKrivka = false
		end,

		ZvysRychlost = function(self,novaRychlost)
			MIREL.manual = false
			MIREL.rychlostKrivky = novaRychlost
			MIREL.rychlostKrivkyAbs = novaRychlost
			MIREL.vychoziRychlost = novaRychlost
			MIREL.modelujKrivku = false
            MIREL.bdelostBezModre = false
		end,

		NouzoveZastaveni = function(self,cislo)
            if cislo ~= 0 then
                MIREL.lzeVybavitPohybemOvladace = false
				MIREL.blokujEPV_NZ = true
				MIREL.odpadleSoupatkoVZ = true
				MIREL.NO.NO11 = "NZ"..cislo
				MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NZ
                MIREL.NO.DISPLEJ.blikej = false
                MIREL.aktualniNZ = cislo
			else
                MIREL.odpadleSoupatkoVZ = false
                if MIREL.MIRELversion == 3 then
                    MIREL.casBdelost = 0
                end
				MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
                MIREL.NO.NO11 = MIREL.zobrazenaRychlost
                MIREL.aktualniNZ = -1
			end
		end,

        Bdelost = function(self) -- cyklicka bdelost
            -- if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
            if MIREL.aktualniNZ <= 1 then
                if not MIREL.blokujBdelostVyzva then
                    if MIREL.vyzadujVybavovani or (MIREL.casBdelost >= 8.5 and MIREL.bdelostBezModre) or (MIREL.casBdelost >= MIREL.bdelostInterval/4 and not MIREL.bdelostBezModre) then 
                        if MIREL.casBdelost > MIREL.bdelostInterval then
                            MIREL:NouzoveZastaveni(1)
                            if MIREL.MIRELversion == 3 then
                                Call("SetControlValue","ZS1",0,0)
                            end
                            MIREL.NO.NO5 = false
                        elseif MIREL.casBdelost > MIREL.bdelostInterval - 3.5 then
                            Call("SetControlValue","ZS1",0,1)
                            MIREL.NO.NO5 = false
                        elseif MIREL.casBdelost > MIREL.bdelostInterval / 4 and not MIREL.bdelostBezModre then
                            MIREL.NO.NO5 = false
                            if not MIREL.ZS1B then
                                Call("SetControlValue","ZS1",0,0)
                            end
                        elseif MIREL.casBdelost > 8.5 and MIREL.bdelostBezModre then
                            MIREL.NO.NO5 = false
                            if not MIREL.ZS1B then
                                Call("SetControlValue","ZS1",0,0)
                            end
                        elseif MIREL.aktualniNZ == -1 then
                            if MIREL.isThisCabActive then
                                MIREL.NO.NO5 = true
                            end
                            if not MIREL.ZS1B then
                                Call("SetControlValue","ZS1",0,0)
                            end
                        else
                            MIREL:NouzoveZastaveni(1)
                        end
                    else
                        if MIREL.aktualniNZ == -1 then
                            if MIREL.isThisCabActive then
                                MIREL.NO.NO5 = true
                            end
                            MIREL.casBdelost = 0
                        end
                        if not MIREL.ZS1B then
                            Call("SetControlValue","ZS1",0,0)
                        end
                    end
                else
                    if MIREL.casBdelostJednorazova > 3.5 then
                        MIREL:NouzoveZastaveni(1)
                        if MIREL.MIRELversion == 3 then
                            Call("SetControlValue","ZS1",0,0)
                        end
                    end
                    if MIREL.aktualniNZ == -1 then
                        MIREL.casBdelost = 0
                        MIREL.NO.NO5 = false
                    end
                end
                if MIREL.rychlostKMHabs < 1 and MIREL.aktualniNZ == -1 then
                    if MIREL.isThisCabActive then
                        MIREL.NO.NO5 = true
                    end
                    MIREL.casBdelost = 0
                    -- if not MIREL.ZS1B then
                    --     Call("SetControlValue","ZS1",0,0)
                    --     Call("SetControlValue", "ZS20", 0, 0)
                    -- end
                end
                -- else
                --     MIREL.casBdelost = 0
                --     if not MIREL.bdelostnaVyzvaZmenaPrikazu and not MIREL.ZS1B and not MIREL.blokujBdelostVyzva then
                --         Call("SetControlValue","ZS1",0,0)
                --         Call("SetControlValue", "ZS20", 0, 0)
                --     end
                -- end
            else
                MIREL.casBdelost = 0
                MIREL.NO.NO5 = true
                Call("SetControlValue","ZS1",0,0)
            end
        end,

		NastavNarodniVolbu = function(self,kod)
			MIREL.narodniVolba = kod
		end,

        MirelInit = function(self)
            if MIREL.aktualniNZ == -1 then
                MIREL.odpadleSoupatkoVZ = false
            end
            MIREL.NO.init = true
            -- if MIREL.shouldUseLastRegime then
            --     f = assert(io.open("Assets/CS_addon/Kal000px/RailVehicles/Electric/Common/380 Script/NO.rez", "r"))
            --     MIREL.NO.rezim = f:read("*all")
            --     f:close()
            -- end
			if MIREL.NO.rezim == "TOL" or MIREL.NO.rezim == "MEN" then
                if MIREL.isThisCabActive then
                    Call("SetControlValue","ZS20",0,1)
                end
				MIREL.blokujEPV_NZ = true
				MIREL.odpadleSoupatkoVZ = true
			end
			MIREL.nastavenaRychlost = MIREL.afterInitSpeed
			MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.RYCH
			MIREL.pocitejCasNZ5 = false
			MIREL.rychlostKrivky = MIREL.maxDesignSpeed
			MIREL.rychlostKrivkyAbs = MIREL.maxDesignSpeed
			MIREL.vychoziRychlost = MIREL.maxDesignSpeed
            MIREL.rychlostPodleNavesti = 120
            MIREL.NO.NO11 = MIREL.zobrazenaRychlost
            MIREL.prodlouzeniKodovaniStuj = -1
            MIREL.NO.casMenu = 10
		end,

        OchranaPrekroceniRychlosti = function(self)
            if MIREL.rychlostKrivkyAbs < MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni + 7 or MIREL.NO.rezim ~= "PRE" then
                MIREL.nulovaTolerancia = false
            end
            if (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 7 and not MIREL.nulovaTolerancia) or (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 1 and MIREL.nulovaTolerancia) then
                MIREL.manual = false
                MIREL.bdelostBezModre = false
                if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 2 then
                    MIREL:NouzoveZastaveni(2)
                end
                if MIREL.MIRELversion == 3 then
                    Call("SetControlValue","ZS2",0,0)
                end
            elseif (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 5) and not MIREL.nulovaTolerancia then
                Call("SetControlValue","ZS2",0,1)
            elseif MIREL.rychlostKMHabs < MIREL.zobrazenaRychlost+0.5 or MIREL.MIRELversion == 3 then
                Call("SetControlValue","ZS2",0,0)
            end
            if (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 3) and not MIREL.nulovaTolerancia then
                MIREL.NO.DISPLEJ.blikej = true
                MIREL.NO.DISPLEJ.blikejRychle = true
                MIREL.prekroceniRychlosti = true
            elseif not MIREL.manual and MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.rychlostKMHabs > 1 then
                MIREL.NO.DISPLEJ.blikej = false
                MIREL.NO.DISPLEJ.blikejRychle = false
                MIREL.prekroceniRychlosti = false
            end
		end,

		OchranaNavolenehoSmeru = function(self)
			if MIREL.isCab1Active then
                if MIREL.rychlostKMH > 5 and MIREL.skutecnySmer == -1 then
                    if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 3 then
                        MIREL:NouzoveZastaveni(3)
                    end
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH > 1 and MIREL.skutecnySmer == -1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMH < -5 and MIREL.skutecnySmer == 1 then
                    if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 3 then
                        MIREL:NouzoveZastaveni(3)
                    end
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH < -1 and MIREL.skutecnySmer == 1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMHabs > 5 and MIREL.skutecnySmer == 0 then
                    if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 3 then
                        MIREL:NouzoveZastaveni(3)
                    end
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMHabs > 1 and MIREL.skutecnySmer == 0 then
					MIREL.smerZS3 = true
				end
            elseif MIREL.isCab2Active then
				if MIREL.rychlostKMH > 5 and MIREL.skutecnySmer == 1 then
                    if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 3 then
                        MIREL:NouzoveZastaveni(3)
                    end
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH > 1 and MIREL.skutecnySmer == 1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMH < -5 and MIREL.skutecnySmer == -1 then
                    if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 3 then
                        MIREL:NouzoveZastaveni(3)
                    end
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH < -1 and MIREL.skutecnySmer == -1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMHabs > 5 and MIREL.skutecnySmer == 0 then
                    if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 3 then
                        MIREL:NouzoveZastaveni(3)
                    end
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMHabs > 1 and MIREL.skutecnySmer == 0 then
					MIREL.smerZS3 = true
				end
			end
		end,

		OchranaNezajisteni = function(self)
			if MIREL.rychlostKMHabs < 1 and MIREL.tlakBV < 0.1 then
				if not MIREL.pocitejCasNZ5 then
					MIREL.ubehlyCasNZ5 = 0
				end
				MIREL.pocitejCasNZ5 = true
                if MIREL.ubehlyCasNZ5 > 25 then
                    if MIREL.narodniVolba ~= MIREL.madarsko then
                        if MIREL.aktualniNZ == -1 or MIREL.aktualniNZ == 5 then
                            MIREL:NouzoveZastaveni(5)
                        end
                    else
                        Call("SetControlValue", "ZS20", 0, 1)
                        MIREL.blokujEPV_NZ = true
                        MIREL.odpadleSoupatkoVZ = true
                    end
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
			if MIREL.lzeVybavitPohybemOvladace == true then MIREL.bylaBdelostOvladac = true end
		end,

		VybaveniBdelosti = function(self)
			MIREL.bylaBdelost = true
        end,
        
        Skluz = function(self)
            if MIREL.modelujKrivku and not MIREL.manual then
                MIREL:Manual()
            end
        end,

        NastavHodnotuBaterii = function(self, bool)
            MIREL.baterie = bool
        end,

        NastavHodnotyRizeni = function(self, rizeniCab1, rizeniCab2)
            if rizeniCab1 and rizeniCab2 then
                MIREL.odpadleSoupatkoVZ = true
                MIREL.blokujEPV_NZ = true
            end
            MIREL.isCab1Active = rizeniCab1
            MIREL.isCab2Active = rizeniCab2
        end,

        NastavAktualniKabinu = function(self, cisloKabiny)
            MIREL.actualCab = cisloKabiny
        end,

        NastavSkutecnySmer = function(self, skutecnySmer)
            MIREL.skutecnySmer = skutecnySmer
        end,

        NastavOvladacSmeru = function(self, ovladacSmeru)
            MIREL.ovladacSmeru = ovladacSmeru
        end,

        NastavOvladacBP = function(self, ovladacBP)
            MIREL.ovladacBP = ovladacBP
        end,

        NastavHodnotuValcu = function(self, tlakBV, odbrzdenoTrigger, zabrzdenoTrigger)
            MIREL.tlakBV = tlakBV
            MIREL.odbrzdenoTrigger = odbrzdenoTrigger
            MIREL.zabrzdenoTrigger = zabrzdenoTrigger
        end,

        NastavHodnotuPotrubi = function(self, tlakHP)
            MIREL.tlakHP = tlakHP
        end,

        NastavHodnotuStradace = function(self, stradac)
            MIREL.stradac = stradac
        end,

        NastavPritomnostVozu = function(self, predLoko, zaLoko)
            MIREL.predLoko = predLoko
            MIREL.zaLoko = zaLoko
        end,

        ZpravyNavestidel = function(self,zprava)
            if not MIREL.blokujPrenosNavesti and MIREL.baterie and not MIREL.D1_blokujPrenos then
                if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                    if MIREL.NO.rezim == "PRE" and ((not MIREL.predLoko and MIREL.actualCab == 1) or (not MIREL.zaLoko and MIREL.actualCab == 2)) then
                        local NO
                        local vzdalenost
                        --vypis("OnCustomSignalMessage - zprava: "..tostring(zprava))
                        NO = tonumber(string.sub(zprava, 1, 2))
                        vzdalenost = tonumber(string.sub(zprava, 3))
                        if NO and vzdalenost then
                            if NO == -1 then
                                MIREL.nejblizsiNavestidlo = -1
                                NO = 0
                            end
                            if vzdalenost > 0 then
                                if (vzdalenost < MIREL.nejblizsiNavestidlo) or (math.abs(MIREL.nejblizsiNavestidlo - vzdalenost) < 20) then
                                    MIREL.nejblizsiNavestidlo = vzdalenost
                                elseif (MIREL.nejblizsiNavestidlo < 0) then
                                    MIREL.nejblizsiNavestidlo = vzdalenost
                                    MIREL.kod = 0
                                    MIREL.posledniKodCas = os.clock()
                                    NO = 0
                                end
                            end
                            --vypis("MIREL.nejblizsiNavestidlo: "..tostring(MIREL.nejblizsiNavestidlo))
                            if NO ~= 0 then
                                if MIREL.nejblizsiNavestidlo == vzdalenost and MIREL.ovladacSmeru > 0 then
                                    if NO == 15 then			-- Stuj
                                        MIREL.kod = 2
                                        MIREL.NO.prenosNavesti = true
                                        if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 then
                                            MIREL.rychlostPodleNavesti = 40
                                            MIREL.kodovaneMezikruzi = false
                                            MIREL.mezikruziZvyseni = 0
                                            if MIREL.rychlostKMHabs > 120 or (MIREL.vypadekKodu and MIREL.stabilniKodOld == MIREL.kod and MIREL.rychlostKMHabs > 40) then
                                                MIREL:Manual()
                                            end
                                            MIREL.stabilniKodOld = MIREL.kod
                                            MIREL.prodlouzeniKodovaniStuj = 1000
                                        end
                                        MIREL.posledniKodCas = os.clock()
                                    elseif NO == 30 then	    -- Opakovana Vystraha na 4AB
                                        MIREL.kod = 2
                                        MIREL.NO.prenosNavesti = true
                                        if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 then
                                            MIREL.rychlostPodleNavesti = 40
                                            MIREL.kodovaneMezikruzi = false
                                            MIREL.mezikruziZvyseni = 0
                                            if MIREL.rychlostKMHabs > 120 or (MIREL.vypadekKodu and MIREL.stabilniKodOld == MIREL.kod and MIREL.rychlostKMHabs > 40) then
                                                MIREL:Manual()
                                            end
                                            MIREL.stabilniKodOld = MIREL.kod
                                            MIREL.prodlouzeniKodovaniStuj = -1
                                        end
                                        MIREL.posledniKodCas = os.clock()
                                    elseif NO == 17 then		-- Vystraha
                                        MIREL.kod = 1
                                        MIREL.NO.prenosNavesti = true
                                        if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 120 then
                                            MIREL.stabilniKodOld = MIREL.kod
                                            MIREL.rychlostPodleNavesti = 120
                                            MIREL.kodovaneMezikruzi = false
                                            MIREL.mezikruziZvyseni = 0
                                            MIREL.prodlouzeniKodovaniStuj = -1
                                        end
                                        MIREL.posledniKodCas = os.clock()
                                    elseif NO == 16 then		-- Volno
                                        MIREL.kod = 3
                                        MIREL.NO.prenosNavesti = true
                                        if MIREL.casPrenasenehoKodu > 5 then
                                            MIREL.stabilniKodOld = MIREL.kod
                                            MIREL.rychlostPodleNavesti = 160
                                            MIREL.kodovaneMezikruzi = false
                                            MIREL.mezikruziZvyseni = 0
                                            MIREL.prodlouzeniKodovaniStuj = -1
                                        end
                                        MIREL.posledniKodCas = os.clock()
                                    elseif NO >= 19 and NO <= 24 or MIREL.rychlostPodleNavesti >= 40 then		-- omezene rychlosti
                                        MIREL.kod = 4
                                        MIREL.NO.prenosNavesti = true
                                        if MIREL.casPrenasenehoKodu > 5 then
                                            if MIREL.stabilniKodOld ~= 4 then
                                                MIREL.mezikruziZvyseni = 0
                                            end
                                            MIREL.rychlostPodleNavesti = 40
                                            MIREL.kodovaneMezikruzi = true
                                            if MIREL.rychlostKMHabs > 120 or (MIREL.vypadekKodu and MIREL.stabilniKodOld == MIREL.kod and MIREL.rychlostKMHabs > 40 + MIREL.mezikruziZvyseni) then
                                                MIREL:Manual()
                                            end
                                            MIREL.stabilniKodOld = MIREL.kod
                                            MIREL.prodlouzeniKodovaniStuj = -1
                                        end
                                        MIREL.posledniKodCas = os.clock()
                                    -- elseif NO == 0 then
                                    -- 	MIREL.kod = 0
                                    -- 	MIREL.kodovaneMezikruzi = false
                                    -- 	MIREL.mezikruziZvyseni = 0
                                    end
                                end

                                Call("SetControlValue", "NO1", 0, 0)
                                Call("SetControlValue", "NO2", 0, 0)
                                Call("SetControlValue", "NO3", 0, 0)
                                Call("SetControlValue", "NO4", 0, 0)
                                MIREL.NO.NO1 = false
                                MIREL.NO.NO2 = false
                                MIREL.NO.NO3 = false
                                MIREL.NO.NO4 = false
                                if MIREL.isThisCabActive then
                                    Call("SetControlValue", "NO"..MIREL.kod, 0, 1)
                                    if MIREL.kod == 1 then
                                        MIREL.NO.NO1 = true
                                    elseif MIREL.kod == 2 then
                                        MIREL.NO.NO2 = true
                                    elseif MIREL.kod == 3 then
                                        MIREL.NO.NO3 = true
                                    elseif MIREL.kod == 4 then
                                        MIREL.NO.NO4 = true
                                    end
                                    MIREL.NO.NO7 = true
                                end
                                MIREL.NO.NO8 = false

                                if MIREL.kod ~= MIREL.kodOld then
                                    MIREL.casPrenasenehoKodu = 0
                                end

                                if (MIREL.kodOld == 0 or MIREL.kodOld == 2) and MIREL.kod ~= 0 and MIREL.kod ~= 2 and MIREL.rychlostKMHabs < 5 then
                                    if Call("GetControlValue","ZS7",0) == 1 then
                                        Call("SetControlValue","ZS7",0,0)
                                    else
                                        Call("SetControlValue","ZS7",0,1)
                                    end
                                end
                                MIREL.kodOld = MIREL.kod
                        
                                if MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni < MIREL.zobrazenaRychlost and not MIREL.modelujKrivku and not MIREL.manual and MIREL.rychlostKMHabs > 5 then
                                    if math.abs(os.clock()-MIREL.posledniKodCas) > 5 and math.abs(os.clock()-MIREL.posledniKodCas) < 23 and MIREL.kod ~= 0 then
                                        MIREL:Manual()
                                    else
                                        MIREL:ModelujKrivku(MIREL.kod)
                                    end
                                elseif MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni > MIREL.zobrazenaRychlost or MIREL.rychlostKMHabs < 5 then
                                    MIREL:ZvysRychlost(MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni)
                                end
                            elseif MIREL.nejblizsiNavestidlo == vzdalenost then
                                Call("SetControlValue", "NO1", 0, 0)
                                Call("SetControlValue", "NO2", 0, 0)
                                Call("SetControlValue", "NO3", 0, 0)
                                Call("SetControlValue", "NO4", 0, 0)
                                MIREL.NO.NO1 = false
                                MIREL.NO.NO2 = false
                                MIREL.NO.NO3 = false
                                MIREL.NO.NO4 = false
                                MIREL.NO.NO7 = false
                                MIREL.NO.NO8 = false
                                MIREL.casPrenasenehoKodu = 0
                                MIREL.kod = 0
                            end
                            MIREL.vypadekKodu = false
                        end
                    else
                        Call("SetControlValue", "NO1", 0, 0)
                        Call("SetControlValue", "NO2", 0, 0)
                        Call("SetControlValue", "NO3", 0, 0)
                        Call("SetControlValue", "NO4", 0, 0)
                        MIREL.NO.NO1 = false
                        MIREL.NO.NO2 = false
                        MIREL.NO.NO3 = false
                        MIREL.NO.NO4 = false
                        MIREL.NO.NO7 = false
                        MIREL.NO.NO8 = false
                        MIREL.casPrenasenehoKodu = 0
                        MIREL.kod = 0
                        MIREL.stabilniKodOld = 0
                        MIREL.vypadekKodu = false
                        MIREL.manual = false
                    end
                elseif MIREL.narodniVolba == MIREL.madarsko then
                    local telegram = tonumber(string.sub(zprava, 1, string.find(zprava, "|")-1))
                    -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", telegram, 2, 0)

                    if telegram ~= nil then
                        if (MIREL.rychlostKMHabs < 15 and MIREL.rychlostniPrikaz == 0) or (MIREL.rychlostniPrikaz == 1 and 4-telegram > MIREL.rychlostniPrikaz) then --pri rychlosti < 15km/h a zmene prikazu vygeneruj bdelostnou vyzvu
                            MIREL.bdelostnaVyzvaZmenaPrikazu = true
                            Call("SetControlValue","ZS20",0,1)
                        end

                        if telegram == 4 then --rychlostny prikaz 0
                            MIREL.rychlostniPrikaz = 0
                            MIREL.rychlostPodleNavesti = 15
                            MIREL.NO.NO7 = false
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Rychlostny prikaz 0!", 2, 0)
                        elseif telegram == 3 then --rychlostny prikaz 1
                            MIREL.rychlostniPrikaz = 1
                            MIREL.rychlostPodleNavesti = 15
                            MIREL.NO.NO7 = true
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Rychlostny prikaz 1!", 2, 0)
                        elseif telegram == 2 then --rychlostny prikaz 2
                            MIREL.rychlostniPrikaz = 2
                            MIREL.rychlostPodleNavesti = 40
                            MIREL.NO.NO7 = true
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Rychlostny prikaz 2!", 2, 0)
                        elseif telegram == 1 then --rychlostny prikaz 3
                            MIREL.rychlostniPrikaz = 3
                            MIREL.rychlostPodleNavesti = 80
                            MIREL.NO.NO7 = true
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Rychlostny prikaz 3!", 2, 0)
                        elseif telegram == 0 then --rychlostny prikaz 4
                            MIREL.rychlostniPrikaz = 4
                            MIREL.rychlostPodleNavesti = 200
                            MIREL.NO.NO7 = true
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Rychlostny prikaz 3!", 2, 0)
                        else --bez signalu
                            MIREL.rychlostniPrikaz = -1
                            MIREL.rychlostPodleNavesti = 15
                            MIREL.NO.NO7 = false
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Bez signÃ¡lu!", 2, 0)
                        end
                    else --bez signalu
                        MIREL.rychlostniPrikaz = -1
                        MIREL.rychlostPodleNavesti = 15
                        MIREL.NO.NO7 = false
                    end
                end
            else
                Call("SetControlValue", "NO1", 0, 0)
                Call("SetControlValue", "NO2", 0, 0)
                Call("SetControlValue", "NO3", 0, 0)
                Call("SetControlValue", "NO4", 0, 0)
                MIREL.NO.NO7 = false
                MIREL.NO.NO8 = false
                MIREL.casPrenasenehoKodu = 0
                MIREL.kod = 0
                MIREL.stabilniKodOld = 0
                MIREL.vypadekKodu = false
                if MIREL.NO.prenosNavesti then
                    MIREL.casBdelost = MIREL.bdelostInterval/4
                end
                MIREL.NO.prenosNavesti = false
            end
            if MIREL.narodniVolba == MIREL.polsko then
                if zprava == "SHP" then
                    if MIREL.SHPsignalCounter < 0 then
                        MIREL.SHPsignalCounter = 0
                    end
                    MIREL.SHPstarted = true
                end
            end
		end
};
