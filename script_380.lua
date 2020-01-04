-- 5.1.2016 21:43 --
significantKombiOld = 0
zpozdenyvykon = 0
zpozdeniedb = 0
pomernyTah = 0
automatika = 0
KiloNutony = 0
speedometerKPH = 0
bylaEDB = 0
vykon = 0
gBaterie = 0
gStartObrazovkaCas = 0
gOvladaniSberacu = 0
gObrazovky = 0
gCasNahozeni = 0
gRoletkaNahoru = 0
animaceSberac01 = 0
animaceSberac02 = 0
gSmerChybaCas = 0
gCasSberacePZ20 = 0
gCasDetekceNS = 0
NSdetekovana = false
casChybaHV = 0
casChybaLS = 0
gRizeniOld = 0
gRizeni = 0
CasZvednuti = 0
casMinuly = os.clock()

narodniVolba = 1
narodniVolbaPredvolba = 0
narodniVolbaPredvolena = false
narodniVolbaPredvolenaMenu = false
pendingRequestOnMIRELStart = false
pendingRequestOnPZBStart = false

koefDoJizdy = 0.125
koefZJizdy = 0.2
koefDoEDB = 0.1666
koefZEDB = 0.1666
koefVykon = 0.2
rezARRold = 0
rucEDB = 0
prevEDB = 1
animaceDvere01P = 0
animaceDvere01L = 0
lastTractiveEffort = 0
lastBrakeEffort = 0
UjetaVzdalenost = 0
koefBPE = 0.125
koefBPEMAX = 0.4
lastTlacPMPlus = 0
lastTlacPMMinus = 0
lastTlacFMPlus = 0
lastTlacFMMinus = 0
lastTlacARRPlus = 0
lastTlacARRMinus = 0
bylaBrzda = true
casOmezeniVykonu = 0
omezeniVykonu = 1
parkovacka = 0
primocinka = 0
casOdbrzdene = 0
parkovackaZap = true
posledniKod = 0

ciloveKombi = 0
t_byloA = false
t_byloD = false
p_ocekavana = false
p_ovladaneF4 = false
p_SO = 0
p_JI = 1
p_VY = 2
p_BE = 3
p_BP = 4
p_ZB = 5
p_last = p_VY

DISP_VYP = 0
DISP_INIT = 1
LD_NASTAVENI = 2
LD_INFO = 3
LD_SBERACE = 4
PD_INFO = 2
PD_NAVO = 3

local levyDisplejStav = DISP_VYP
local pravyDisplejStav = DISP_VYP

SMER_VZAD = 0
SMER_NENI = 1
SMER_VPRED = 2
SMER_NESOULAD = 3
SMER_HIDE = 4

SBERACE_BLOKOVANE = 0
SBERACE_ZADNI = 1
SBERACE_OBA = 2
SBERACE_PREDNI = 3
SBERACE_PORUCHA = 4
SBERACE_STAZENO = 5
SBERACE_OBA_CHYBA = 6
SBERACE_HIDE = 7

SYSTEM_NENI = 0
SYSTEM_3KV = 1
SYSTEM_15KV = 2
SYSTEM_25KV = 3
SYSTEM_HIDE = 4

HV_PORUCHA = 0
HV_VYP = 1
HV_ZAP = 2
HV_HIDE = 3

NAPETI_NENI = 0
NAPETI_OK = 1
NAPETI_UZEM = 2
NAPETI_HIDE = 3

LS_VYP = 0
LS_POZADAVEK = 1
LS_NABIJENI = 2
LS_ZAP = 3
LS_HIDE = 4

TOPENI_1KV = 0
TOPENI_3KV = 1
TOPENI_HIDE = 2

TOPENI_OVLADANI_HIDE = 0
TOPENI_OVLADANI_PRIPRAVENE = 1
TOPENI_OVLADANI_NESEPNUTO = 2
TOPENI_OVLADANI_ZAPNUTO = 3
TOPENI_OVLADANI_UZEMNENO = 4

pozadavekTopeni = false
lastOvladaniTopeni = 0
casTopeni = 0
casTopeniHold = 0
topeniSkutecne = false

ZVEDANI_HIDE = 0
ZVEDANI_VISIBLE = 1

VYBEH_HIDE = 0
VYBEH_VISIBLE = 1

PREFERENCE_HIDE = 0
PREFERENCE_VISIBLE = 1

TAH_NELZE = 0
TAH_LZE = 1
TAH_HIDE = 2

STAV_HIDE = 0
STAV_BLOKACE = 1
STAV_DOLE = 2
STAV_NAHORE = 3
STAV_BEZ_kN = 4
STAV_kN = 5

TOPENI_PREDNI_HIDE = 0
TOPENI_PREDNI_NESEPNUTO = 1
TOPENI_PREDNI_ZAP = 2
TOPENI_PREDNI_UZEM = 3

levySberaceLast = 0
zvolenySberac = 0

levy0last = 0
levy2last = 0

lastVykon = 0
odpocetCisticiSpaliky = 10
cisticiSpalikyCountdown = 300

stradac = true

uzemnenaLoko = true

napetiFiltru = 0
casZapnutychFiltru = 0
casVypnutychFiltru = 0
bylNabityFiltr = false
vychoziNapetiFiltru = 0
vychoziProudFiltru = 0

napetiFiltruLS = 0
napetiFiltruUzemneni = 0
napetiFiltruKompresorEDB = 0

proudKompresoru = 0
kompresor = 0
kompresorOld = 0
casBezicihoKompresoru = 0

lin_stykOld = 0
lin_styk = 0

Prechod = false
StanovisteLast = 0
CasProPrechod = 0

helpLast = false
vyplyMIRELomezeni = 200

HUDheadlightsOld = 0
HUDheadlights = 0
headlightsControlledByHUD = false
consistLength = 0
lastConsistLength = 0
significantKombi = 0
pred = false
za = false
rizeniCab1 = 0
rizeniCab2 = 0

vRCounterCheckForLoco = 0
vRZWS = false
vRPantograph = false
vRPantographRaised = false
vRPantographRaisedOld = false
vRMainSwitch = false

trainBrakeDirectValue = 0
trainBrakeRB = false
TBC_RYCHLOBRZDA_RATE = 0.3 --1
TBC_PLNENI_RATE = 0.06 --0.1
TBC_UPOUSTENI_RATE = 0.08 --0.2

neaktivniMenice = 0
casNeaktivniMenice = 0

sandAdhesionAddition = 0
brakeAdhesionAddition = 0

NaVoLast = false

predniSberacAI = false
zadniSberacAI = false
animaceSberac01AI = 0
animaceSberac02AI = 0

ADHESE_VYUZITI = 0.95
ADHESE_SUCHO = 1*ADHESE_VYUZITI
ADHESE_VLHKO_START = 0.5*ADHESE_VYUZITI
ADHESE_VLHKO_CAS_NABEH = 70
ADHESE_VLHKO = 0.7*ADHESE_VYUZITI
ADHESE_VLHKO_CAS_SNIZENI = 300
ADHESE_VLHKO_PODESTI = 700
ADHESE_SNIH = 0.5*ADHESE_VYUZITI
ADHESE_KOEF_LISTI = 0.3 --0.7 pouze na test!, jinak 0.3

adhese_casdeste = -1
adhese_caspodesti = -1

ambientAdhesion = 0
sourceAdhesion = 0

adheseRandomCtdn = math.random(40, 200)
adheseRandomLenCtu = 0

kpjOld = false

light_blink_counter = 0
light_blink_state = false

horn_blink_counter = 0
horn_blink_state = false

stradac = false

doplnkovaBrzda = 0
gDebug = false

checkedNapSys = false
checkedNaVo = false

freiOld = false

wasUserControlled = false

ujeteMetryAI = 0
reflektorAI = false

bdelostLast = false

napSysPredStazenim = -1

timerStradac = 0

jvjVybeh = false
jvjSouhlas = false

souhlasneNapeti = false

virtualBrakeCylinderPressureBAR = 0

BSE_plneni = false
BSE_upousteni = false

function ZpravaDebug(zprava)
	if gDebug then
        local printID = Call("GetRVNumber")
		Print("CD380 - ID"..printID)
		Print("Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))))
		Print("Zprava: "..zprava.."\n")
		f = assert(io.open("380.log", "a"))
		f:write("CD380 - ID: "..printID.." :: Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))).." :: Zprava: "..zprava.."\n")
		f:close()
	end
end

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
				--optional hranice - treshold, if integer is passed (everything bigger is true, smaller is false; 0.5 if it´s not set);
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
				--opakovana -true, when it´s repeated onetime acknowledgement;
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
		fajfkaCharacter = "F", --do not change unless you use custom letter set ('?' character)
		emptyCharacter = "B", --do not change unless you use custom letter set (' ' character)
		fullCharacter = "I", --do not change unless you use custom letter set ('?' character)
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
			UlozRezim = function(self,NOrezim)
				f = assert(io.open("Assets/CS_addon/Kal000px/RailVehicles/Electric/Common/380 Script/NO.rez", "w"))
				-- Print("Zapisuji do souboru NO.rez, výsledek operace: ")
				-- Print(f:write(NOrezim))
				f:close()
				MIREL.NO.rezimOld = NOrezim
			end,
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
                        else
                            MIREL.casPredKrivkou = 0
                        end
                        
                        if MIREL.modelujKrivku then
                            MIREL.krivkaCasUjety = MIREL.krivkaCasUjety + deltaTime
                        else
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
                        MIREL.skutecnySmer = Call("GetControlValue", "Reverser", 0)

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
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."D1"
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.D1
                        if rizeniAkt == nil then
                            if Call("GetControlValue","ZS11",0) == 1 then
                                Call("SetControlValue","ZS11",0,0)
                            else
                                Call("SetControlValue","ZS11",0,1)
                            end
                            rizeniAkt = MIREL.isCab1Active or MIREL.isCab2Active
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

                        if MIREL.casD1_1testu > 0.5 and MIREL.D1_1 then
                            MIREL.D1_1 = false
                            MIREL.casD1_1testu = 0
                            -- Print("Test MIREL.D1_1 uspesny!")
                        end

                        if not rizeniAkt then
                            if MIREL.isCab1Active or MIREL.isCab2Active and MIREL.D1_2 then
                                MIREL.D1_2 = false
                                -- Print("Test MIREL.D1_2 uspesny!")
                            end
                        elseif rizeniAkt then
                            if not (MIREL.isCab1Active or MIREL.isCab2Active) and MIREL.D1_2 then
                                MIREL.D1_2 = false
                                -- Print("Test MIREL.D1_2 uspesny!")
                            end
                        end

                        if MIREL.isCab1Active or MIREL.isCab2Active then --and gObrazovky == 1 
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
                            
                            if Call("GetControlValue","VirtualEngineBrakeControl",0) > 0.98 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) >= 3.6 then
                                MIREL.D1_BP_od = true
                            end
                            if Call("GetControlValue","VirtualEngineBrakeControl",0) < 0.02 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) < 0.05 then
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
                                            if MIREL.NO.rezim ~= MIREL.NO.rezimOld then
                                                MIREL.NO:UlozRezim(MIREL.NO.rezim)
                                            end

                                        --pokud je nenulova rychlost a neni zobrazene NZ, zobraz rychlost
                                            if not MIREL.NO.blokujZobrazeniRychlosti and MIREL.rychlostKMHabs > 0.1 and MIREL.NO.DISPLEJ.stav ~= MIREL.NO.DISPLEJ.NZ then
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
                                                        if MIREL.rychlostKMHabs > 0.1 then
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
                                                        if MIREL.rychlostKMHabs > 0.1 then
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
                                                    if (not MIREL.NO.prenosNavesti or MIREL.bdelostBezModre or (MIREL.rychlostKrivky == 40 and MIREL.kod == 2) or (MIREL.rychlostKMHabs > 90 and MIREL.kod == 1 and MIREL.rychlostKrivky == 120) or (MIREL.kod == 4 and MIREL.mezikruziZvyseni > 0)) and not (MIREL.rychlostKMHabs < 0.1 or (MIREL.rychlostKMHabs < 15 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 2)) then
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
                                                    if MIREL.rychlostKMHabs < 0.1 or (MIREL.rychlostKMHabs < 15 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 2) then
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

                                                --zobrazena rychlsot je rovna kontrukcni
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
                                        MIREL.NO.NO11 = ""
                                        MIREL.NO.casUloz = 0
                                        MIREL.ubehlyCasNZ5 = 0
                                        MIREL.NO.casMenu = 0
                                        MIREL.NO.casRychloposuv = 0
                                        MIREL.casPredKrivkou = 0
                                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
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

                                        if (MIREL.rychlostKMHabs > 0.1 or Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 0.1 or Call("GetControlValue","BrakePipePressureBAR",0) < 4.5 or stradac) and MIREL.SHPnezabrzdenie < 25 then
                                            MIREL.SHPnezabrzdenie = 0
                                        end

                                        if MIREL.SHPnezabrzdenie > 25 then
                                            Call("SetControlValue","ZS3",0,0)
                                            if MIREL.isThisCabActive then
                                                MIREL.NO.NO11 = "HAM"
                                            end
                                            MIREL.blokujEPV_NZ = true
                                            MIREL.odpadleSoupatkoVZ = true
                                            if MIREL.NO.NO14 and (Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 0.1 or Call("GetControlValue","BrakePipePressureBAR",0) < 4.5 or stradac) and MIREL.isThisCabActive then
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

                                        
                                        if MIREL.NO.NO12 and MIREL.isThisCabActive then --zobrazeni napisu PKP pri drzeni tlacitka -
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

                                        if MIREL.rychlostKMH > 15 then
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
                                    MIREL.NO.NO11 = "ST-"
                                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                    Call("SetControlValue", "ZS1", 0, 0)
                                    Call("SetControlValue", "ZS2", 0, 0)
                                    Call("SetControlValue", "ZS3", 0, 0)
                                    Call("SetControlValue", "ZS20", 0, 0)
                                elseif MIREL.narodniVolba == MIREL.madarsko then
                                    MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                    if MIREL.rychlostKMHabs > 0.1 then
                                        Call("SetControlValue", "ZS20", 0, 1)
                                        MIREL.blokujEPV_NZ = true
                                        MIREL.odpadleSoupatkoVZ = true
                                    end
                                    Call("SetControlValue", "ZS2", 0, 0)
                                    Call("SetControlValue", "ZS3", 0, 0)
                                else
                                    MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                    Call("SetControlValue", "ZS1", 0, 0)
                                    Call("SetControlValue", "ZS2", 0, 0)
                                    Call("SetControlValue", "ZS3", 0, 0)
                                    Call("SetControlValue", "ZS20", 0, 0)
                                end
                                -- if MIREL.rychlostKMHabs > 3 and not (MIREL.isCab1Active or MIREL.isCab2Active) then
                                -- 	MIREL:NouzoveZastaveni(2)
                                -- end
                                MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                MIREL.NO.casUloz = 0
                                MIREL.ubehlyCasNZ5 = 0
                                MIREL.NO.casMenu = 0
                                MIREL.NO.casRychloposuv = 0
                                MIREL.casPredKrivkou = 0
                                MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
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
                                MIREL.NO.NO5 = false
                                MIREL.ZS1B = false
                                MIREL.casBdelost = 0
                                MIREL.casPrenasenehoKodu = 0
                                MIREL.casBdelostJednorazova = -1
                                Call("SetControlValue","NO_bodka",0)
                            end
                    end
                    
                    --pokud neni modelovana krivka, indikator NO10 slouzi jako idnikace stati
                        if not MIREL.modelujKrivku then
                            if MIREL.rychlostKMHabs < 0.1 then
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

                        if MIREL.NO.blokujBlikaniPoZmene and MIREL.NO.casBlokovaniBlikani > 0.7 then
                            MIREL.NO.blokujBlikaniPoZmene = false
                        end

                    --pokud jsou splnene podminky pro zobrazeni skutecne rychlosti
                        if MIREL.testRychlost then
                            MIREL.NO.NO11 = math.floor(MIREL.rychlostKMHabs)
                        end

                    --pokud jsou splnene podminky pro zobrazeni skutecneho tlaku
                        if MIREL.testTlak then
                            MIREL.NO.NO11 = string.sub(tostring(Call("GetControlValue","BrakePipePressureBAR",0)),0,3)
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
            if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                if MIREL.rychlostKMHabs < 0.1 then --zadavání do menu pri stati
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
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.rychlostKMHabs > 10 and not MIREL.zamekRychlosti and MIREL.NO.rezim == "PRE" and MIREL.MIRELversion == 4 then --systém Najvyššej dovolenej
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
                if MIREL.rychlostKMHabs < 0.1 then --zadavání do menu pri stati
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
                        if MIREL.nastavenaRychlost < 160 then
                            MIREL.nastavenaRychlost = MIREL.nastavenaRychlost + 5
                            MIREL.NO.NO11 = MIREL.nastavenaRychlost
                        end
                        MIREL.NO.DISPLEJ.blikej = true
                    end
                elseif MIREL.kodovaneMezikruzi and MIREL.rychlostKMHabs > 1 and MIREL.mezikruziZvyseni < 80 then -- zvysovanie maximalnej rychlosti pri kodovani medzikruzia
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
                if MIREL.rychlostKMHabs < 0.1 then --zadavání do menu pri stati
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.displayNationalitySettings then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.R
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."R"..MIREL.emptyCharacter
                        MIREL.NO.DISPLEJ.blikej = false
                    end
                end
            end
            if MIREL.rychlostKMHabs < 0.1 then
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
                if MIREL.rychlostKMHabs < 0.1 then --zadavání do menu pri stati
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
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH and MIREL.rychlostKMHabs > 10 and not MIREL.zamekRychlosti and MIREL.NO.rezim == "PRE" and MIREL.MIRELversion == 3 then --systém Najvyššej dovolenej
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
                    if MIREL.MIRELversion == 3 and MIREL.rychlostKMHabs < 0.1 then
                        if MIREL.aktualniNZ == 5 then
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
                    else
                        if MIREL.aktualniNZ == 1 and MIREL.casBdelost <= MIREL.bdelostInterval / 4 and MIREL.casBdelostJednorazova == -1 then
                            MIREL:NouzoveZastaveni(0)
                            MIREL.NO.casUloz = 0
                            MIREL.NO.casMenu = 0
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
                            MIREL.NO.blokujZobrazeniRychlosti = true
                            MIREL.NO.DISPLEJ.blikej = false
                            MIREL.aktualniNZ = -1
                        elseif MIREL.aktualniNZ == 2 and MIREL.rychlostKMHabs < MIREL.zobrazenaRychlost+0.5 then
                            MIREL:NouzoveZastaveni(0)
                            MIREL.NO.casUloz = 0
                            MIREL.NO.casMenu = 0
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
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
                            MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
                            MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
                            MIREL.NO.blokujZobrazeniRychlosti = true
                            MIREL.NO.DISPLEJ.blikej = false
                            MIREL.aktualniNZ = -1
                        elseif MIREL.aktualniNZ == 5 then
                            if Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) > 0.1 then
                                MIREL:NouzoveZastaveni(0)
                                MIREL.NO.casUloz = 0
                                MIREL.NO.casMenu = 0
                                MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                                MIREL.NO.NO11 = "NZ"..MIREL.fajfkaCharacter
                                MIREL.NO.zopakujPriUlozeni = "NZ"..MIREL.fajfkaCharacter
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
            if MIREL.rychlostKMHabs < 0.1 then
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
                    MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                    MIREL.NO.zopakujPriUlozeni = "PKP"
                    MIREL.NO.DISPLEJ.blikej = false
                    MIREL.narodniVolba = 4
                elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PL then
                    MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                    MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                    MIREL.NO.zopakujPriUlozeni = MIREL.emptyCharacter.."PL"
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
			MIREL.NO.casUloz = 0
			MIREL.NO.casMenu = 0
            MIREL.manual = true
            MIREL.bdelostBezModre = true
			if MIREL.rychlostKMHabs > 120 then
				MIREL.maxManual = MIREL.rychlostKMHabs
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
            if MIREL.rychlostKMHabs < 0.1 and MIREL.aktualniNZ == -1 then
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
			MIREL.rychlostKrivky = 160
			MIREL.rychlostKrivkyAbs = 160
			MIREL.vychoziRychlost = 160
            MIREL.rychlostPodleNavesti = 120
            MIREL.prodlouzeniKodovaniStuj = -1
		end,

		OchranaPrekroceniRychlosti = function(self)
			if MIREL.rychlostKrivkyAbs < MIREL.rychlostPodleNavesti + MIREL.mezikruziZvyseni + 7 or MIREL.NO.rezim ~= "PRE" then
				MIREL.nulovaTolerancia = false
			end
			if (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 7 and not MIREL.nulovaTolerancia) or (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 1 and MIREL.nulovaTolerancia) then
                MIREL.manual = false
                MIREL.bdelostBezModre = false
                MIREL:NouzoveZastaveni(2)
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
			elseif not MIREL.manual then
				MIREL.NO.DISPLEJ.blikej = false
				MIREL.NO.DISPLEJ.blikejRychle = false
				MIREL.prekroceniRychlosti = false
			end
		end,

		OchranaNavolenehoSmeru = function(self)
			if MIREL.rizeniCab1 then
				if MIREL.rychlostKMH > 5 and MIREL.skutecnySmer == -1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH > 0.1 and MIREL.skutecnySmer == -1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMH < -5 and MIREL.skutecnySmer == 1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH < -0.1 and MIREL.skutecnySmer == 1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMHabs > 5 and MIREL.skutecnySmer == 0 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMHabs > 0.1 and MIREL.skutecnySmer == 0 then
					MIREL.smerZS3 = true
				end
            elseif MIREL.rizeniCab2 then
				if MIREL.rychlostKMH > 5 and MIREL.skutecnySmer == 1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH > 0.1 and MIREL.skutecnySmer == 1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMH < -5 and MIREL.skutecnySmer == -1 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMH < -0.1 and MIREL.skutecnySmer == -1 then
					MIREL.smerZS3 = true
				end
				if MIREL.rychlostKMHabs > 5 and MIREL.skutecnySmer == 0 then
					MIREL:NouzoveZastaveni(3)
					MIREL.smerZS3 = false
				elseif MIREL.rychlostKMHabs > 0.1 and MIREL.skutecnySmer == 0 then
					MIREL.smerZS3 = true
				end
			end
		end,

		OchranaNezajisteni = function(self)
			if MIREL.rychlostKMHabs < 0.1 and Call("GetControlValue","LocoBrakeCylinderPressureBAR",0) < 0.1 then
				if not MIREL.pocitejCasNZ5 then
					MIREL.ubehlyCasNZ5 = 0
				end
				MIREL.pocitejCasNZ5 = true
                if MIREL.ubehlyCasNZ5 > 25 then
                    if MIREL.narodniVolba ~= MIREL.madarsko then
                        MIREL:NouzoveZastaveni(5)
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

        ZpravyNavestidel = function(self,zprava)
            if not MIREL.blokujPrenosNavesti and MIREL.baterie and not MIREL.D1_blokujPrenos then
                if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                    if MIREL.NO.rezim == "PRE" and not pred then
                        local NO
                        local vzdalenost
                        --vypis("OnCustomSignalMessage - zprava: "..tostring(zprava))
                        NO = tonumber(string.sub(zprava, 1, 2))
                        vzdalenost = tonumber(string.sub(zprava, 3))
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
                            if MIREL.nejblizsiNavestidlo == vzdalenost and Call("GetControlValue","Reverser",0) ~= 0 then
                                if posledniKod ~= NO then
                                    posledniKod = NO
                                    -- SysCall("ScenarioManager:ShowAlertMessageExt", "380 Debug", "Kod je: "..NO, 2, 0)
                                end
                                if NO == 15 then			-- Stuj
                                    MIREL.kod = 2
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 then
                                        MIREL.stabilniKodOld = MIREL.kod
                                        MIREL.rychlostPodleNavesti = 40
                                        MIREL.kodovaneMezikruzi = false
                                        MIREL.mezikruziZvyseni = 0
                                        MIREL.prodlouzeniKodovaniStuj = 1000
                                    end
                                    MIREL.posledniKodCas = os.clock()
                                elseif NO == 30 then	    -- Opakovana Vystraha na 4AB
                                    MIREL.kod = 2
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 then
                                        MIREL.stabilniKodOld = MIREL.kod
                                        MIREL.rychlostPodleNavesti = 40
                                        MIREL.kodovaneMezikruzi = false
                                        MIREL.mezikruziZvyseni = 0
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
                                        MIREL.stabilniKodOld = MIREL.kod
                                        MIREL.rychlostPodleNavesti = 40
                                        MIREL.kodovaneMezikruzi = true
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
                            if MIREL.isThisCabActive then
                                Call("SetControlValue", "NO"..MIREL.kod, 0, 1)
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
                        else
                            Call("SetControlValue", "NO1", 0, 0)
                            Call("SetControlValue", "NO2", 0, 0)
                            Call("SetControlValue", "NO3", 0, 0)
                            Call("SetControlValue", "NO4", 0, 0)
                            MIREL.NO.NO7 = false
                            MIREL.NO.NO8 = false
                            MIREL.casPrenasenehoKodu = 0
                            MIREL.kod = 0
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
                    end
                elseif MIREL.narodniVolba == MIREL.madarsko then
                    local telegram = tonumber(string.sub(zprava, 1, string.find(zprava, "|")-1))
                    -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", telegram, 2, 0)

                    if MIREL.rychlostKMHabs < 15 and MIREL.rychlostniPrikaz == 0 or MIREL.rychlostniPrikaz == 1 and 4-telegram > MIREL.rychlostniPrikaz then --pri rychlosti < 15km/h a zmene prikazu vygeneruj bdelostnou vyzvu
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
                        -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", "Bez signálu!", 2, 0)
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

                -- ZpravaDebug(PZB90.countdown500HzMonitoring)

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
                            if PZB90.countdown500HzLight > 0 then
                                PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
                            else
                                PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
                            end
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.LOW_500HZ_SPEED
						else
                            if PZB90.countdown500HzLight > 0 then
                                PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
                            else
                                PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
                            end
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
                            if PZB90.countdown500HzLight > 0 then
                                PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
                            else
                                PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
                            end
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.MIDDLE_500HZ_SPEED
						else
                            if PZB90.countdown500HzLight > 0 then
                                PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
                            else
                                PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
                            end
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
                            if PZB90.countdown500HzLight > 0 then
                                PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
                            else
                                PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
                            end
						end
					elseif PZB90.slowdown500HzCountdown == -1 and PZB90.countdown500HzMonitoring > 0 then
						if not PZB90.restricted500Hz then
							PZB90.maxTrainSpeed = PZB90.HIGH_500HZ_SPEED
						else
                            if PZB90.countdown500HzLight > 0 then
                                PZB90.maxTrainSpeed = PZB90.LOW_500HZ_RESTRICTED_SPEED
                            else
                                PZB90.maxTrainSpeed = PZB90.LOW_1000HZ_RESTRICTED_SPEED
                            end
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
LZB = { --objekt LZB
	---------------LZB CONSTANTS---------------
		DECCEL_U = 0.25,
		DECCEL_M = 0.4,
		DECCEL_O = 0.5,
	---------------LZB VARIABLES---------------
		active = false,
		canBeActive = false,
        displayedMaxSpeed = 0,
        maxSpeed = 0,
		distanceToNextSignificantRestriction = -1,
		speedOfNextSignificantRestriction = -1,
		targetSpeed = 200,
        restrictionsCount = 0,
        lastDistanceToRestriction = 0,
		lastDistanceToSignificantRestriction = 0,
        minimalDistanceToBrake = 0,
        minimalTimeToBrake = 0,
		sourceSpeed = 0,
		metersFromLastRestriction = 0,
		blockedSpeedChangeCountdown = 0,
		koefDecceleration = 0.5,
        blockTraction = false,
        ARRblock = false,
        endConfirmCountdown = -1,
        endZeroSpeedCountdown = -1,
		delayedSpeedEnterCountdown = -1,
        waitForZeroTractionBeforeTurnOff = false,
        startAfter = -1,
        emergencyBrake = false,
        befehlprogramStartupCountdown = 3,
        befehlprogram = false,
        befehlprogramConsistPassCountdown = -1,
        befehl5sCounter = 0,
	---------------LZB FUNCTIONS---------------
		OnReceivedSignalMessage = function(self, message)
            -- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB_debug_message", message, 2, 0)
            if message == "LZBSTART" then
                if not LZB.canBeActive and LZB.startAfter == -1 then
                    LZB.startAfter = Call("GetConsistLength")
                end
                -- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now active!", 2, 0)
            elseif message == "LZBEND" or message == "LZBENDEDNOW" or message == "LZBENDNOW" then
                if LZB.active then
                    Call("SetControlValue", "LZB_ENDE", 0, 1)
                    LZB.blockTraction = true
                    ARR:vybeh()
                    LZB.endZeroSpeedCountdown = 10
                    LZB.endConfirmCountdown = 10
                end
                LZB.startAfter = -1
                LZB.canBeActive = false
				-- SysCall("ScenarioManager:ShowAlertMessageExt", "LZB", "LZB is now not active!", 2, 0)
			end
		end,
        ConfirmLZBend = function(self)
            if LZB.endConfirmCountdown > 0 then
                LZB.endConfirmCountdown = -1
                LZB.waitForZeroTractionBeforeTurnOff = true
            elseif math.abs(Call("GetSpeed")) < 0.1 and LZB.endConfirmCountdown ~= -1 then
                LZB.endConfirmCountdown = -1
                LZB.active = false
            end
        end,
        ConfirmARRspeedChange = function(self)
			if LZB.endZeroSpeedCountdown > 0 then
				LZB.endZeroSpeedCountdown = -1
                LZB.delayedSpeedEnterCountdown = 2
                return(false)
            else
                return(true)
			end
        end,
		ARRKeyPress = function(self)
			if LZB.delayedSpeedEnterCountdown > 0 then
				LZB.delayedSpeedEnterCountdown = -1
			end
		end,
		TurnOff = function(self)
            ARR:nastavRychlostLZB(10000,10000)
            Call("SetControlValue", "LZB_G_light", 0, 0)
            Call("SetControlValue", "LZB_ENDE", 0, 0)
			Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
			LZB.targetSpeed = 200
			Call("LZB_SPEED:SetText", "XXX", 0)
			Call("SetControlValue", "LZB_ACTIVE", 0, 0)
			LZB.active = false
            LZB.blockTraction = false
            LZB.befehlprogramStartupCountdown = -1
            LZB.befehlprogram = false
            LZB.befehlprogramConsistPassCountdown = -1
            LZB.ARRblock = false
            LZB.startAfter = -1
		end,
		Update = function(self, deltaTime, deltaUpdateTimeFromGame, pomernyTah)
            local currentSpeed = 0
            if Call("GetControlValue", "RizeniCab1", 0) > 0.5 then
                currentSpeed = Call("GetSpeed")
            elseif Call("GetControlValue", "RizeniCab2", 0) > 0.5 then
                currentSpeed = -Call("GetSpeed")
            end
			if LZB.canBeActive and PZB90.on and PZB90.startCountdown == -1 then --and Call("GetControlValue","OsvetleniPristroje",0) > 0.5 
                LZB.active = true
                local reverser = Call("GetControlValue", "Reverser", 0)
                if reverser < 0.5 then
                    LZB.active = false
                end
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    if (reverser > 0.5 and Call("GetSpeed") < -0.1) or (reverser < -0.5 and Call("GetSpeed") > 0.1) or (reverser < 0.5 and reverser > -0.5) then
                        LZB.active = false
                        if PZB90.trainSpeed > 0.1 then
                            LZB.emergencyBrake = true
                            pomernyTah = -1
                            Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                        end
                    end
                elseif rizeniCab1 < 0.5 and rizeniCab2 > 0.5 then
                    if (reverser > 0.5 and Call("GetSpeed") > 0.1) or (reverser < -0.5 and Call("GetSpeed") < -0.1) or (reverser < 0.5 and reverser > -0.5) then
                        LZB.active = false
                        if PZB90.trainSpeed > 0.1 then
                            LZB.emergencyBrake = true
                            pomernyTah = -1
                            Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                        end
                    end
                else
                    LZB.active = false
                    if PZB90.trainSpeed > 0.1 then
                        LZB.emergencyBrake = true
                        pomernyTah = -1
                        Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                    end
                end
            elseif not PZB90.on then
                LZB:TurnOff()
            end
            if LZB.waitForZeroTractionBeforeTurnOff and pomernyTah <= 0 then
                LZB.waitForZeroTractionBeforeTurnOff = false
                LZB:TurnOff()
            end
            if LZB.delayedSpeedEnterCountdown > 0 then
                LZB.delayedSpeedEnterCountdown = LZB.delayedSpeedEnterCountdown - deltaTime
            elseif LZB.delayedSpeedEnterCountdown ~= -1 then
                ARR:nastavCilovouRychlost("ARR_rych0",1,0)
                LZB.delayedSpeedEnterCountdown = -1
            end	
            if LZB.endZeroSpeedCountdown > 0 or LZB.delayedSpeedEnterCountdown > 0 then
                ARR:vybeh()
                LZB.ARRblock = true
            end
            if LZB.endZeroSpeedCountdown > 0 then
                LZB.endZeroSpeedCountdown = LZB.endZeroSpeedCountdown - deltaTime
            elseif LZB.endZeroSpeedCountdown ~= -1 then
                ARR:nastavCilovouRychlost("ARR_rych0",1,0)
                LZB.endZeroSpeedCountdown = -1
            end
            if (currentSpeed*3.6 < LZB.displayedMaxSpeed-2 or not ARR.aktivni) and (LZB.endConfirmCountdown > 0 or LZB.endConfirmCountdown == -1) then
                LZB.emergencyBrake = false
            end
            if LZB.endConfirmCountdown > 0 then
                LZB.endConfirmCountdown = LZB.endConfirmCountdown - deltaTime
            end	
            if LZB.active then
				LZB.lastDistanceToRestriction = 0
				typeOfRestriction = 100
				typeOfSignal = 100
				LZB.restrictionsCount = 0
				if PZB90.trainType == PZB90.LOW then
					LZB.koefDecceleration = LZB.DECCEL_U
				elseif PZB90.trainType == PZB90.MIDDLE then
					LZB.koefDecceleration = LZB.DECCEL_M
				elseif PZB90.trainType == PZB90.HIGH then
					LZB.koefDecceleration = LZB.DECCEL_O
				end
				--check for every speed restriction in next 10km and compare them
				while (typeOfRestriction > 0 or typeOfSignal > 0) and LZB.lastDistanceToRestriction < 10000 do
					if Call("GetControlValue", "Reverser", 0) > 0 and Call("GetControlValue", "RizeniCab1", 0) > 0.5 then
                        typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 0, LZB.lastDistanceToRestriction, 10000)
                        typeOfSignal, stateOfSignal, distanceToSignal = Call("GetNextRestrictiveSignal", 0, LZB.lastDistanceToRestriction, 10000)
                        if typeOfSignal >= 0 and (stateOfSignal == 2 or stateOfSignal == -1) and (distanceToSignal <= distanceToRestriction or typeOfRestriction < 0) then
                            typeOfRestriction = 0
                            restrictedSpeed = 0
                            distanceToRestriction = distanceToSignal
                        end
                    elseif Call("GetControlValue", "Reverser", 0) > 0 and Call("GetControlValue", "RizeniCab2", 0) > 0.5 then
                        typeOfRestriction, restrictedSpeed, distanceToRestriction = Call("GetNextSpeedLimit", 1, LZB.lastDistanceToRestriction, 10000)
                        typeOfSignal, stateOfSignal, distanceToSignal = Call("GetNextRestrictiveSignal", 1, LZB.lastDistanceToRestriction, 10000)
                        if typeOfSignal >= 0 and (stateOfSignal == 2 or stateOfSignal == -1) and (distanceToSignal <= distanceToRestriction or typeOfRestriction < 0) then
                            typeOfRestriction = 0
                            restrictedSpeed = 0
                            distanceToRestriction = distanceToSignal
                        end
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
							elseif (LZB.distanceToNextSignificantRestriction == -1 or (LZB.distanceToNextSignificantRestriction-distanceToRestriction)+(LZB.speedOfNextSignificantRestriction-restrictedSpeed)*(5/LZB.koefDecceleration) > 0) and restrictedSpeed < LZB.speedOfNextSignificantRestriction then
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
                    --     SysCall("ScenarioManager:ShowAlertMessageExt", "LZB_debug_message", typeOfRestriction.."<br>"..restrictedSpeed.."<br>"..distanceToRestriction, 2, 0)
						-- ZpravaDebug("----------------")
						-- ZpravaDebug("Typ omezeni: "..typeOfRestriction)
						-- ZpravaDebug("Rychlost omezeni: "..restrictedSpeed)
						-- ZpravaDebug("Vzdalenost k omezeni: "..distanceToRestriction)
					-- end
					LZB.lastDistanceToRestriction = distanceToRestriction + 1
				end
                if LZB.speedOfNextSignificantRestriction <= LZB.maxSpeed and LZB.distanceToNextSignificantRestriction ~= -1 then
                    LZB.minimalTimeToBrake = (LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction)/(3.6*LZB.koefDecceleration)
					LZB.minimalDistanceToBrake = (LZB.sourceSpeed/3.6)*LZB.minimalTimeToBrake - (LZB.koefDecceleration*LZB.minimalTimeToBrake^2)/2
				else
					LZB.minimalDistanceToBrake = 0
				end
                local trackMax = Call("GetCurrentSpeedLimit") * 3.6
                if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-140) and LZB.distanceToNextSignificantRestriction ~= -1 then
                    LZB.maxSpeed = math.max(LZB.targetSpeed, math.sqrt((LZB.sourceSpeed/3.6)^2 - 2*LZB.koefDecceleration*(LZB.minimalDistanceToBrake-math.max(LZB.distanceToNextSignificantRestriction-(60+currentSpeed*3*math.max(1,Call("GetConsistTotalMass")/1000-0.15)),0)))*3.6)
                    LZB.displayedMaxSpeed = math.max(LZB.targetSpeed, math.min(math.sqrt((LZB.sourceSpeed/3.6)^2 - 2*LZB.koefDecceleration*(LZB.minimalDistanceToBrake-math.max(LZB.distanceToNextSignificantRestriction-40,0)))*3.6,LZB.sourceSpeed))
                    -- LZB.displayedMaxSpeed = math.min(LZB.sourceSpeed, LZB.maxSpeed+10-math.min(math.max(10-(math.abs(currentSpeed*3.6-LZB.speedOfNextSignificantRestriction)/2),0),10))
                    -- LZB.maxSpeed = LZB.speedOfNextSignificantRestriction + ((LZB.sourceSpeed - LZB.speedOfNextSignificantRestriction) * math.max(0, LZB.distanceToNextSignificantRestriction-10) / LZB.minimalDistanceToBrake)
                else
                    LZB.maxSpeed = math.min(trackMax, 200)
                    LZB.displayedMaxSpeed = LZB.maxSpeed
                    -- LZB.sourceSpeed = Call("GetSpeed") * 3.6
                    LZB.sourceSpeed = LZB.maxSpeed
                end
                if LZB.distanceToNextSignificantRestriction ~= -1 then
                    if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-(60+currentSpeed*3*math.max(1,Call("GetConsistTotalMass")/1000-0.15))-(currentSpeed*10)) and currentSpeed*3.6 > LZB.maxSpeed - ((((currentSpeed*3.6)-10)/19)+10) and currentSpeed*3.6 > LZB.speedOfNextSignificantRestriction then
                        if not LZB.befehlprogram and LZB.befehlprogramConsistPassCountdown <= 0 then
                            LZB.ARRblock = true
                        else
                            LZB.ARRblock = false
                        end
                        -- ARR:vybeh()
                    elseif currentSpeed*3.6 < LZB.maxSpeed then
                        LZB.ARRblock = false
                    end
                    if trackMax < LZB.maxSpeed then
                        LZB.maxSpeed = math.min(trackMax, 200)
                        LZB.targetSpeed = round(math.min(trackMax, 200))
                    else
                        LZB.targetSpeed = round(LZB.speedOfNextSignificantRestriction)
                    end
                    if trackMax < LZB.displayedMaxSpeed then
                        LZB.displayedMaxSpeed = math.min(trackMax, 200)
                    end
                    --distance is smaller then 5sec - turn G light on
                    if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-(currentSpeed*18)) then
                        Call("SetControlValue", "LZB_G_light", 0, 1)
                    else
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                    end
                else
                    LZB.ARRblock = false
                    LZB.targetSpeed = round(math.min(trackMax, 200))
                    Call("SetControlValue", "LZB_G_light", 0, 0)
                end

                -- if Call("GetControlValue", "Frei", 0) > 0.5 then
                --     SysCall("ScenarioManager:ShowAlertMessageExt", "LZB_debug_message", LZB.distanceToNextSignificantRestriction.."<br>"..LZB.minimalDistanceToBrake.."<br>"..LZB.speedOfNextSignificantRestriction, 2, 0)
                -- ZpravaDebug("----------------")
                -- ZpravaDebug("Vzdalenost k omezeni: "..LZB.distanceToNextSignificantRestriction)
                -- ZpravaDebug("Brzdna draha: "..LZB.minimalDistanceToBrake)
                -- ZpravaDebug("Rychlost omezeni: "..LZB.speedOfNextSignificantRestriction)
                -- ZpravaDebug("Speed: "..currentSpeed*3.6)
                -- end

				if LZB.distanceToNextSignificantRestriction ~= -1 and (currentSpeed > 0.05 or math.abs(Call("GetControlValue", "LZB_DISTANCE_BAR", 0) - LZB.distanceToNextSignificantRestriction/4000) > 0.0025) then
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, math.min(1, LZB.distanceToNextSignificantRestriction/4000))
                elseif LZB.distanceToNextSignificantRestriction == -1 then
					Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 1)
                end

                if LZB.endZeroSpeedCountdown > 0 then
                    Call("SetControlValue", "LZB_ENDE", 0, 1)
                else
                    Call("SetControlValue", "LZB_ENDE", 0, 0)
                end

                if PZB90.befehlLever and LZB.befehlprogramStartupCountdown > 0 and math.abs(currentSpeed) < 0.05 and LZB.speedOfNextSignificantRestriction == 0 then
                    LZB.befehlprogramStartupCountdown = LZB.befehlprogramStartupCountdown - deltaTime
                    LZB.befehlprogram = false
					Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 2)
                elseif not PZB90.befehlLever and LZB.befehlprogramStartupCountdown > 0 then
                    LZB.befehlprogramStartupCountdown = 3
                    LZB.befehlprogram = false
					Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 0)
                elseif LZB.befehlprogramStartupCountdown < 0 then
                    LZB.befehlprogramStartupCountdown = -1
                    LZB.befehlprogram = true
                    LZB.befehlprogramConsistPassCountdown = Call("GetConsistLength")
                end

                if math.abs(LZB.distanceToNextSignificantRestriction - LZB.lastDistanceToSignificantRestriction) > 50 then
                    LZB.befehlprogram = false
                    LZB.befehlprogramStartupCountdown = 3
                end

                if LZB.befehlprogramConsistPassCountdown > 0 and not LZB.befehlprogram then
                    LZB.befehlprogramConsistPassCountdown = LZB.befehlprogramConsistPassCountdown - currentSpeed * deltaUpdateTimeFromGame
                elseif LZB.befehlprogramConsistPassCountdown < 0 then
                    LZB.befehlprogramConsistPassCountdown = -1
                end

                if LZB.befehlprogram or LZB.befehlprogramConsistPassCountdown > 0 then
                    LZB.befehl5sCounter = LZB.befehl5sCounter + deltaTime
                    if LZB.befehl5sCounter > 5 then
                        LZB.befehl5sCounter = 0
                        Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 1)
                    else
                        Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 0)
                    end
                    LZB.maxSpeed = 40
                    LZB.displayedMaxSpeed = 40
                    LZB.targetSpeed = 40
                end

                if (not ARR.aktivni and currentSpeed*3.6 > LZB.displayedMaxSpeed+2) or (LZB.endConfirmCountdown < 0 and LZB.endConfirmCountdown ~= -1) then
                    LZB.emergencyBrake = true
                elseif (currentSpeed*3.6 < LZB.displayedMaxSpeed-2 or not ARR.aktivni) and (LZB.endConfirmCountdown > 0 or LZB.endConfirmCountdown == -1) then
                    LZB.emergencyBrake = false
                end

                if LZB.targetSpeed > 999 then
                    LZB.targetSpeed = 999
                end
				while string.len(""..LZB.targetSpeed) < 3 do
					LZB.targetSpeed = "0"..LZB.targetSpeed
				end
                Call("LZB_SPEED:SetText", LZB.targetSpeed, 0)
                
                -- if LZB.minimalDistanceToBrake > math.max(0, LZB.distanceToNextSignificantRestriction-(currentSpeed*18)) and currentSpeed*3.6 > LZB.displayedMaxSpeed - ((((currentSpeed*3.6)-10)/19)+10) and not (LZB.befehlprogram or LZB.befehlprogramConsistPassCountdown > 0) then
                --     ARR:nastavRychlostLZB(math.max(LZB.maxSpeed-5, LZB.speedOfNextSignificantRestriction), LZB.targetSpeed) --kompenzace necitlivosti ARR, brzdí na rychlost -5
                -- else
                    ARR:nastavRychlostLZB(math.max(LZB.maxSpeed, LZB.targetSpeed), LZB.speedOfNextSignificantRestriction)
                -- end
                
				Call("SetControlValue", "LZB_SPEED_DIAL", 0, math.min(1, LZB.displayedMaxSpeed/220))
                Call("SetControlValue", "PZB_ACTIVE", 0, 1)
                
                LZB.lastDistanceToSignificantRestriction = LZB.distanceToNextSignificantRestriction
            else
                if LZB.startAfter > 0 then
                    LZB.startAfter = math.max(LZB.startAfter - (currentSpeed*deltaUpdateTimeFromGame),0)
                elseif LZB.startAfter ~= -1 then
                    LZB.startAfter = -1
                    LZB.canBeActive = true
                end
                if PZB90.startCountdown == -1 or not PZB90.on then
                    Call("SetControlValue", "LZB_ENDE", 0, 0)
                    if not PZB90.overspeedWarning then
                        Call("SetControlValue", "LZB_G_light", 0, 0)
                    end
                end
				Call("SetControlValue", "LZB_DISTANCE_BAR", 0, 0)
				LZB.targetSpeed = 200
				Call("LZB_SPEED:SetText", "XXX", 0)
                LZB.befehlprogramStartupCountdown = 3
                LZB.befehlprogram = false
                LZB.befehlprogramConsistPassCountdown = -1
                if not LZB.waitForZeroTractionBeforeTurnOff then
                    LZB.blockTraction = false
                end
                if LZB.endZeroSpeedCountdown == -1 and LZB.delayedSpeedEnterCountdown == -1 then
                    LZB.ARRblock = false
                end
                Call("EngineSound:SetParameter", "ZUGBEEINFLUSSUNG", 0)
                ARR:nastavRychlostLZB(10000,10000)
			end
			Call("SetControlValue", "LZB_ACTIVE", 0, ToBolAndBack(LZB.active))
		end
}
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
MIREL:NastavMIREL()
-- Print(MIREL:NastavMIREL())

function Initialise()
	Call("BeginUpdate")
	Call("SvetloSJR:Activate", 0 )
	Call("Bodovky1:Activate", 0 )	
	Call("Bodovky2:Activate", 0 )	
	Call("Bodovky3:Activate", 0 )
	Call("Zarivky:Activate", 0 )	
	Call("SvetloSJR02:Activate", 0 )
	Call("Bodovky4:Activate", 0 )	
	Call("Bodovky5:Activate", 0 )	
	Call("Bodovky6:Activate", 0 )
	Call("Zarivky02:Activate", 0 )	
	ZhasniSvetla()
	ZhasniCab()
	Call("SetControlValue", "HandBrake", 0, 1)
	Call("SendConsistMessage", 895951, "CheckFront", 0)
    Call("SendConsistMessage", 895951, "CheckFront", 1)
end
function checkIDforNapSys(id_to_parse)
    if string.find(id_to_parse, "03_") ~= nil then
        Call("SetControlValue","NapajeciSystemNav",0,3)
        Call("SetControlValue","NapajeciSystem",0,3)
        ZpravaDebug("Nastavuji jako vychozi napsys 3kV!")
    elseif string.find(id_to_parse, "15_") ~= nil then
        Call("SetControlValue","NapajeciSystemNav",0,15)
        Call("SetControlValue","NapajeciSystem",0,15)
        ZpravaDebug("Nastavuji jako vychozi napsys 15kV!")
    elseif string.find(id_to_parse, "25_") ~= nil then
        Call("SetControlValue","NapajeciSystemNav",0,25)
        Call("SetControlValue","NapajeciSystem",0,25)
        ZpravaDebug("Nastavuji jako vychozi napsys 25kV!")
    end
    checkedNapSys = true
end
function checkIDforNaVo(id_to_parse)
    if string.find(id_to_parse, "CZ_") ~= nil then
        narodniVolba = 1
        narodniVolbaPredvolba = 0
        ZpravaDebug("Nastavuji jako vychozi NaVo CZ!")
    elseif string.find(id_to_parse, "SK_") ~= nil then
        narodniVolba = 2
        narodniVolbaPredvolba = 0
        ZpravaDebug("Nastavuji jako vychozi NaVo SK!")
    elseif string.find(id_to_parse, "HU_") ~= nil then
        narodniVolba = 3
        narodniVolbaPredvolba = 0
        ZpravaDebug("Nastavuji jako vychozi NaVo HU!")
    elseif string.find(id_to_parse, "PL_") ~= nil then
        narodniVolba = 4
        narodniVolbaPredvolba = 0
        ZpravaDebug("Nastavuji jako vychozi NaVo PL!")
    elseif string.find(id_to_parse, "DE_") ~= nil then
        narodniVolba = 5
        narodniVolbaPredvolba = 0
        ZpravaDebug("Nastavuji jako vychozi NaVo DE!")
    elseif string.find(id_to_parse, "AT_") ~= nil then
        narodniVolba = 6
        narodniVolbaPredvolba = 0
        ZpravaDebug("Nastavuji jako vychozi NaVo AT!")
    end
    checkedNaVo = true
end
--PRENASENE ZPRAVY
	--vR ZWS
		--895000 - MainSwitch
		--895001 - Throttle
		--895002 - Unknown
		--895003 - TrainBrakeControl
		--895004 - DynamicBrake
		--895005 - Unknown
		--895006 - Unknown - appearead thirth update after Throttle
		--895007 - TractiveEffort
		--895008 - Current?
		--895050 - ZDS status
		--895053 - ZWS activate request
		--895054 - ZWS activated
		--895055 - Unknown - sended after ZWS activation with 2
		--895056 - Unknown
		--895057 - PantographControl
		--895059 - Voltage?
		--895060 - Auxilair compressor
		--895850 - BrakeCylinderPressureBAR
		--895951 - ZDS status request
function OnConsistMessage(message, arg, dir)
	Call("SendConsistMessage", message, arg, dir)
	--if message ~= 895850 and message ~= 895951 and message ~= 895007 and message ~= 895008 then
		--if dir == 1 then
			--SysCall("ScenarioManager:ShowAlertMessageExt", "Masina "..tostring(message), arg, 2, 0)
			--ZpravaDebug("Masina:  ID: "..message.." Zprava: "..arg)
		--else
			--SysCall("ScenarioManager:ShowAlertMessageExt", "Ridicak "..tostring(message), arg, 2, 0)
			--ZpravaDebug("Ridicak: ID: "..message.." Zprava: "..arg)
		--end
	--end
	--ZWS main switch
		if message == 895000 then
			if arg == "1" then
				vRMainSwitch = true
			else
				vRMainSwitch = false
			end
		end
	--ZWS throttle
		if message == 895001 then
			Call("SetControlValue", "PomernyTah", 0, tonumber(arg))
		end
	--ZWS brake
		if message == 895003 then
			Call("SetControlValue", "TrainBrakeControlNonHUD", 0, tonumber(arg))
		end
	--ZWS dynamic brake
		if message == 895004 then
            pomernyTah = math.max(arg, math.min(0, -Call("GetSpeed")*3.6/10+0.5))
			Call("SetControlValue", "PomernyTah", 0, -tonumber(arg))
		end
	--ZDS status
		if message == 895951 then
			vRCounterCheckForLoco = vRCounterCheckForLoco + 1
			if vRCounterCheckForLoco >= 5 then
				vRCounterCheckForLoco = 0
				if not vRZWS then
					if dir == 0 then
						Call("SendConsistMessage", 895050, "ZDS-present", 1)
					else
						Call("SendConsistMessage", 895050, "ZDS-present", 0)
					end
				elseif gBaterie == 1 then
					if dir == 0 then
						Call("SendConsistMessage", 895050, "ZDS-alive", 1)
					else
						Call("SendConsistMessage", 895050, "ZDS-alive", 0)
					end
				else
					if dir == 0 then
						Call("SendConsistMessage", 895050, "ZDS-present", 1)
						Call("SendConsistMessage", 895054, "ZWS-activate-false", 1)
					else
						Call("SendConsistMessage", 895050, "ZDS-present", 0)
						Call("SendConsistMessage", 895054, "ZWS-activate-false", 0)
					end
				end
			end
		end
	--ZWS activate request
		if message == 895053 then
			if arg == "ZWS-activate" and gBaterie == 1 then
				vRZWS = true
				if dir == 0 then
					Call("SendConsistMessage", 895054, "ZWS-activate-true", 1)
					Call("SendConsistMessage", 895055, "2", 1)
					Call("SendConsistMessage", 895050, "ZDS-alive", 1)
				else
					Call("SendConsistMessage", 895054, "ZWS-activate-true", 0)
					Call("SendConsistMessage", 895055, "2", 0)
					Call("SendConsistMessage", 895050, "ZDS-alive", 0)
				end
			elseif gBaterie ~= 1 then
				if dir == 0 then
					Call("SendConsistMessage", 895050, "ZDS-present", 1)
					Call("SendConsistMessage", 895054, "ZWS-activate-false", 1)
				else
					Call("SendConsistMessage", 895050, "ZDS-present", 0)
					Call("SendConsistMessage", 895054, "ZWS-activate-false", 0)
				end
			else
				--SysCall("ScenarioManager:ShowAlertMessageExt", "380 ZWS Debug", arg, 2, 0)
				-- ZpravaDebug("380 ZWS Debug Zprava: "..arg)
			end
		end
	--ZWS pantograph control
		if message == 895057 then
			if arg == "up" then
				vRPantograph = true
			elseif arg == "down" then
				vRPantograph = false
			else
				--SysCall("ScenarioManager:ShowAlertMessageExt", "Pantograph "..tostring(message), arg, 2, 0)
			end
		end
	
end
function TwoSecondTick()
	if Call("GetIsPlayerEngine") == 1 then
		Call("SendConsistMessage", 895951, "SSTF", 0)
		Call("SendConsistMessage", 895951, "SSTF", 1)
		Call("SendConsistMessage", 895951, "1", 0)
		Call("SendConsistMessage", 895951, "1", 1)
	end
end
function OnCameraEnter(cabEndWithCamera, carriageCamera)
	if cabEndWithCamera == 1 then
		gKabina = 1
		gKameraEx = false
		Call("SetControlValue", "CisloKab", 0, 0)
		Call("Kabina:Activate", 0)
		Call("SetControlValue","VirtualThrottleAndBrake",0,Call("GetControlValue", "VirtualThrottleAndBrakeCab1", 0))
		Call("SetControlValue","UserVirtualReverser",0,Call("GetControlValue", "UserVirtualReverserCab1", 0))
		Call("SetControlValue","VirtualEngineBrakeControl",0,Call("GetControlValue", "VirtualEngineBrakeControlCab1", 0))
		Call("SetControlValue","Reflektory",0,Call("GetControlValue", "ReflektoryCab1", 0))
		Call("SetControlValue","Rizeni",0,Call("GetControlValue", "RizeniCab1", 0))
		Call("SetControlValue","Klic",0,Call("GetControlValue", "KlicCab1", 0))
		Call("SetControlValue","Svetla",0,Call("GetControlValue", "SvetlaCab1", 0))
		Call("SetControlValue","OsvetleniPristroje",0,Call("GetControlValue", "OsvetleniPristrojeCab1", 0))
		Call("SetControlValue","OsvetleniSJR",0,Call("GetControlValue", "OsvetleniSJRCab1", 0))
		Call("SetControlValue","RezimARR",0,Call("GetControlValue", "RezimARRCab1", 0))
		Call("SetControlValue","OvladaniSberacu",0,Call("GetControlValue", "OvladaniSberacuCab1", 0))
		Call("SetControlValue","OvladacVN",0,Call("GetControlValue", "OvladacVNCab1", 0))
		Call("SetControlValue","RezimBrzdeni",0,Call("GetControlValue", "RezimBrzdeniCab1", 0))
		Call("SetControlValue","PozPL",0,Call("GetControlValue", "PozPLCab1", 0))
		Call("SetControlValue","PozPP",0,Call("GetControlValue", "PozPPCab1", 0))
		Call("SetControlValue","PozZL",0,Call("GetControlValue", "PozZLCab1", 0))
		Call("SetControlValue","PozZP",0,Call("GetControlValue", "PozZPCab1", 0))
		Call("SetControlValue","PozHorni",0,Call("GetControlValue", "PozHorniCab1", 0))
		Call("SetControlValue","OvladaniSterace",0,Call("GetControlValue", "OvladaniSteraceCab1", 0))
		Call("SetControlValue","OvladaniKompresor",0,Call("GetControlValue", "OvladaniKompresorCab1", 0))
		Call("SetControlValue","OsvetleniVlaku",0,Call("GetControlValue", "OsvetleniVlakuCab1", 0))
		Call("SetControlValue","Roletka",0,Call("GetControlValue", "RoletkaCab1", 0))
		Call("SetControlValue","DvereL",0,Call("GetControlValue", "DvereLcab1", 0))
		Call("SetControlValue","DvereP",0,Call("GetControlValue", "DverePcab1", 0))
	elseif cabEndWithCamera == 2 then
		gKabina = 2
		gKameraEx = false
		Call("SetControlValue", "CisloKab", 0, 1)
		Call("Kabina:Activate", 0)
		Call("SetControlValue","VirtualThrottleAndBrake",0,Call("GetControlValue", "VirtualThrottleAndBrakeCab2", 0))
		Call("SetControlValue","UserVirtualReverser",0,Call("GetControlValue", "UserVirtualReverserCab2", 0))
		Call("SetControlValue","VirtualEngineBrakeControl",0,Call("GetControlValue", "VirtualEngineBrakeControlCab2", 0))
		Call("SetControlValue","Reflektory",0,Call("GetControlValue", "ReflektoryCab2", 0))
		Call("SetControlValue","Rizeni",0,Call("GetControlValue", "RizeniCab2", 0))
		Call("SetControlValue","Klic",0,Call("GetControlValue", "KlicCab2", 0))
		Call("SetControlValue","Svetla",0,Call("GetControlValue", "SvetlaCab2", 0))
		Call("SetControlValue","OsvetleniPristroje",0,Call("GetControlValue", "OsvetleniPristrojeCab2", 0))
		Call("SetControlValue","OsvetleniSJR",0,Call("GetControlValue", "OsvetleniSJRCab2", 0))
		Call("SetControlValue","RezimARR",0,Call("GetControlValue", "RezimARRCab2", 0))
		Call("SetControlValue","OvladaniSberacu",0,Call("GetControlValue", "OvladaniSberacuCab2", 0))
		Call("SetControlValue","OvladacVN",0,Call("GetControlValue", "OvladacVNCab2", 0))
		Call("SetControlValue","RezimBrzdeni",0,Call("GetControlValue", "RezimBrzdeniCab2", 0))
		Call("SetControlValue","PozPL",0,Call("GetControlValue", "PozPLCab2", 0))
		Call("SetControlValue","PozPP",0,Call("GetControlValue", "PozPPCab2", 0))
		Call("SetControlValue","PozZL",0,Call("GetControlValue", "PozZLCab2", 0))
		Call("SetControlValue","PozZP",0,Call("GetControlValue", "PozZPCab2", 0))
		Call("SetControlValue","PozHorni",0,Call("GetControlValue", "PozHorniCab2", 0))
		Call("SetControlValue","OvladaniSterace",0,Call("GetControlValue", "OvladaniSteraceCab2", 0))
		Call("SetControlValue","OvladaniKompresor",0,Call("GetControlValue", "OvladaniKompresorCab2", 0))
		Call("SetControlValue","OsvetleniVlaku",0,Call("GetControlValue", "OsvetleniVlakuCab2", 0))
		Call("SetControlValue","Roletka",0,Call("GetControlValue", "RoletkaCab2", 0))
		Call("SetControlValue","DvereL",0,Call("GetControlValue", "DvereLcab2", 0))
		Call("SetControlValue","DvereP",0,Call("GetControlValue", "DverePcab2", 0))
	elseif cabEndWithCamera == 0 then
		gKameraEx = true
		Call("Kabina:Activate", 1)
	elseif carriageCamera == 1 then
		gKameraEx = true
		Call("Kabina:Activate", 1)
	end
end
function Update(deltaUpdateTimeFromGame)
	deltaTime = math.abs(os.clock() - casMinuly)
	casMinuly = os.clock()
	if math.abs(deltaTime-deltaUpdateTimeFromGame) > 1 then
		deltaTime = deltaUpdateTimeFromGame
	end
	hh, necojakomm = MIREL:divMod(SysCall("ScenarioManager:GetTimeOfDay"),3600)
	mm, ss = MIREL:divMod(necojakomm,60)
	ss=math.floor(ss)
	if hh < 10 then hh = "0"..tostring(hh) end
	if mm < 10 then mm = "0"..tostring(mm) end
	if ss < 10 then ss = "0"..tostring(ss) end
	dennicas = tonumber(hh..mm..ss)
	hh = tonumber(hh)
	mm = tonumber(mm)
	ss = tonumber(ss)
	if math.floor(ss/2) == ss/2 then
		TwoSecondTick()
    end

    local id = Call("GetRVNumber")

    if id ~= nil then
        if not checkedNapSys then
            checkIDforNapSys(id)
        end
        if not checkedNaVo then
            checkIDforNaVo(id)
        end
    else
        checkedNaVo = false
        checkedNapSys = false
    end

    lastConsistLength = consistLength
    consistLength = Call("GetConsistLength")
    if consistLength ~= lastConsistLength or gRizeniOld ~= gRizeni then
        pred = false
        za = false
        if rizeniCab1 > 0.5 then
            if Call("SendConsistMessage", 380999, "DUMMY", 0) == 1 then
                pred = true
            end
            if Call("SendConsistMessage", 380999, "DUMMY", 1) == 1 then
                za = true
            end
        elseif rizeniCab2 > 0.5 then
            if Call("SendConsistMessage", 380999, "DUMMY", 0) == 1 then
                za = true
            end
            if Call("SendConsistMessage", 380999, "DUMMY", 1) == 1 then
                pred = true
            end
        else
            if Call("SendConsistMessage", 380999, "DUMMY", 0) == 1 then
                pred = true
            end
            if Call("SendConsistMessage", 380999, "DUMMY", 1) == 1 then
                za = true
            end
        end
    end

    BSE_plneni = false
    BSE_upousteni = false
    
    if ToBolAndBack(Call("GetIsNearCamera")) then
        if Call("GetIsPlayer") == 1 or wasUserControlled then
            wasUserControlled = true
            animaceSberac01AI = 0
            animaceSberac02AI = 0
            --------------CTENI OVLADACU--------
                significantKombiOld = significantKombi
                kombi = Call("GetControlValue","VirtualThrottleAndBrake",0)
                reverser = Call("GetControlValue","UserVirtualReverser",0)
                bpe = Call("GetControlValue","VirtualEngineBrakeControl",0)
                HUDheadlightsOld = HUDheadlights
                HUDheadlights = Call("GetControlValue","VirtualHeadlights",0)
                NS = Call("GetControlValue","NapajeciSystem",0)
                if NS < 3 then
                    NS = 3
                    Call("SetControlValue", "NapajeciSystem", 0, 3)
                    Call("SetControlValue", "NapajeciSystemNav", 0, -1)
                end
                if HUDheadlights ~= HUDheadlightsOld and gRizeni == 1 then
                    if HUDheadlights == 0 then
                        Call("SetControlValue","Reflektory",0,0)
                    elseif HUDheadlights == 1 then
                        Call("SetControlValue","Reflektory",0,1)
                    else
                        Call("SetControlValue","Reflektory",0,1)
                    end
                    HUDheadlightsOld = HUDheadlights
                    lastConsistLength = 0
                    headlightsControlledByHUD = true
                end
                if headlightsControlledByHUD and (lastConsistLength ~= consistLength or gRizeniOld ~= gRizeni) then
                    if rizeniCab1 > 0.5 then
                        if HUDheadlights == 1 then
                            if pred and za then
                                Call("SetControlValue","Svetla",0,11)
                            elseif pred then
                                Call("SetControlValue","Svetla",0,5)
                            elseif za then
                                Call("SetControlValue","Svetla",0,3)
                            else
                                Call("SetControlValue","Svetla",0,4)
                            end
                        elseif HUDheadlights == 2 then
                            if pred and za then
                                Call("SetControlValue","Svetla",0,11)
                            elseif pred then
                                Call("SetControlValue","Svetla",0,3)
                            elseif za then
                                Call("SetControlValue","Svetla",0,7)
                            else
                                Call("SetControlValue","Svetla",0,6)
                            end
                        end
                    elseif rizeniCab2 > 0.5 then
                        if HUDheadlights == 1 then
                            if pred and za then
                                Call("SetControlValue","Svetla",0,11)
                            elseif pred then
                                Call("SetControlValue","Svetla",0,7)
                            elseif za then
                                Call("SetControlValue","Svetla",0,3)
                            else
                                Call("SetControlValue","Svetla",0,6)
                            end
                        elseif HUDheadlights == 2 then
                            if pred and za then
                                Call("SetControlValue","Svetla",0,11)
                            elseif pred then
                                Call("SetControlValue","Svetla",0,3)
                            elseif za then
                                Call("SetControlValue","Svetla",0,5)
                            else
                                Call("SetControlValue","Svetla",0,4)
                            end
                        end
                    end
                end	
                headlights = Call("GetControlValue","Reflektory",0)
                horn = Call("GetControlValue","VirtualHorn",0)
                bell = Call("GetControlValue","VirtualBell",0)
                rizeni = Call("GetControlValue","Rizeni",0)
                baterie = Call("GetControlValue","Klic",0)
                svetla = Call("GetControlValue","Svetla",0)
                osvetleniPristroje = Call("GetControlValue","OsvetleniPristroje",0)
                osvetleniSJR = Call("GetControlValue","OsvetleniSJR",0)
                rezimARR = Call("GetControlValue","RezimARR",0)
                ovladaniSberacu = Call("GetControlValue","OvladaniSberacu",0)
                ovladacVN = Call("GetControlValue","OvladacVN",0)
                rezimBrzdeni = Call("GetControlValue","RezimBrzdeni",0)
                pozPL = Call("GetControlValue","PozPL",0)
                pozPP = Call("GetControlValue","PozPP",0)
                pozZL = Call("GetControlValue","PozZL",0)
                pozZP = Call("GetControlValue","PozZP",0)
                pozHorni = Call("GetControlValue","PozHorni",0)
                ovladaniSterace = Call("GetControlValue","OvladaniSterace",0)
                ovladaniKompresor = Call("GetControlValue","OvladaniKompresor",0)
                osvetleniVlaku = Call("GetControlValue","OsvetleniVlaku",0)
                roletka = Call("GetControlValue","Roletka",0)
                dvereL = Call("GetControlValue", "DvereL", 0)
                dvereP = Call("GetControlValue", "DvereP", 0)

                if Call("GetControlValue", "CisloKab", 0) == 0 then
                    Call("SetControlValue", "VirtualThrottleAndBrakeCab1", 0, kombi)
                    kombiCab1 = kombi
                    Call("SetControlValue", "UserVirtualReverserCab1", 0, reverser)
                    reverserCab1 = reverser
                    Call("SetControlValue", "VirtualEngineBrakeControlCab1", 0, bpe)
                    bpeCab1 = bpe
                    Call("SetControlValue", "ReflektoryCab1", 0, headlights)
                    headlightsCab1 = headlights
                    Call("SetControlValue", "RizeniCab1", 0, rizeni)
                    rizeniCab1 = rizeni
                    Call("SetControlValue", "KlicCab1", 0, baterie)
                    baterieCab1 = baterie
                    Call("SetControlValue", "SvetlaCab1", 0, svetla)
                    svetlaCab1 = svetla
                    Call("SetControlValue", "OsvetleniPristrojeCab1", 0, osvetleniPristroje)
                    osvetleniPristrojeCab1 = osvetleniPristroje
                    Call("SetControlValue", "OsvetleniSJRCab1", 0, osvetleniSJR)
                    osvetleniSJRCab1 = osvetleniSJR
                    Call("SetControlValue", "RezimARRCab1", 0, rezimARR)
                    rezimARRCab1 = rezimARR
                    Call("SetControlValue", "OvladaniSberacuCab1", 0, ovladaniSberacu)
                    ovladaniSberacuCab1 = ovladaniSberacu
                    Call("SetControlValue", "OvladacVNCab1", 0, ovladacVN)
                    ovladacVNCab1 = ovladacVN
                    Call("SetControlValue", "RezimBrzdeniCab1", 0, rezimBrzdeni)
                    rezimBrzdeniCab1 = rezimBrzdeni
                    Call("SetControlValue", "PozPLCab1", 0, pozPL)
                    pozPLCab1 = pozPL
                    Call("SetControlValue", "PozPPCab1", 0, pozPP)
                    pozPPCab1 = pozPP
                    Call("SetControlValue", "PozZLCab1", 0, pozZL)
                    pozZLCab1 = pozZL
                    Call("SetControlValue", "PozZPCab1", 0, pozZP)
                    pozZPCab1 = pozZP
                    Call("SetControlValue", "PozHorniCab1", 0, pozHorni)
                    pozHorniCab1 = pozHorni
                    Call("SetControlValue", "OvladaniSteraceCab1", 0, ovladaniSterace)
                    ovladaniSteraceCab1 = ovladaniSterace
                    Call("SetControlValue", "OvladaniKompresorCab1", 0, ovladaniKompresor)
                    ovladaniKompresorCab1 = ovladaniKompresor
                    Call("SetControlValue", "OsvetleniVlakuCab1", 0, osvetleniVlaku)
                    Call("SetControlValue", "RoletkaCab1", 0, roletka)
                    roletkaCab1 = roletka
                    Call("SetControlValue", "DvereLcab1", 0, dvereL)
                    dvereLcab1 = dvereL
                    Call("SetControlValue", "DverePcab1", 0, dvereP)
                    dverePcab1 = dvereP
                else
                    Call("SetControlValue", "VirtualThrottleAndBrakeCab2", 0, kombi)
                    kombiCab2 = kombi
                    Call("SetControlValue", "UserVirtualReverserCab2", 0, reverser)
                    reverserCab2 = reverser
                    Call("SetControlValue", "VirtualEngineBrakeControlCab2", 0, bpe)
                    bpeCab2 = bpe
                    Call("SetControlValue", "ReflektoryCab2", 0, headlights)
                    headlightsCab2 = headlights
                    Call("SetControlValue", "RizeniCab2", 0, rizeni)
                    rizeniCab2 = rizeni
                    Call("SetControlValue", "KlicCab2", 0, baterie)
                    baterieCab2 = baterie
                    Call("SetControlValue", "SvetlaCab2", 0, svetla)
                    svetlaCab2 = svetla
                    Call("SetControlValue", "OsvetleniPristrojeCab2", 0, osvetleniPristroje)
                    osvetleniPristrojeCab2 = osvetleniPristroje
                    Call("SetControlValue", "OsvetleniSJRCab2", 0, osvetleniSJR)
                    osvetleniSJRCab2 = osvetleniSJR
                    Call("SetControlValue", "RezimARRCab2", 0, rezimARR)
                    rezimARRCab2 = rezimARR
                    Call("SetControlValue", "OvladaniSberacuCab2", 0, ovladaniSberacu)
                    ovladaniSberacuCab2 = ovladaniSberacu
                    Call("SetControlValue", "OvladacVNCab2", 0, ovladacVN)
                    ovladacVNCab2 = ovladacVN
                    Call("SetControlValue", "RezimBrzdeniCab2", 0, rezimBrzdeni)
                    rezimBrzdeniCab2 = rezimBrzdeni
                    Call("SetControlValue", "PozPLCab2", 0, pozPL)
                    pozPLCab2 = pozPL
                    Call("SetControlValue", "PozPPCab2", 0, pozPP)
                    pozPPCab2 = pozPP
                    Call("SetControlValue", "PozZLCab2", 0, pozZL)
                    pozZLCab2 = pozZL
                    Call("SetControlValue", "PozZPCab2", 0, pozZP)
                    pozZPCab2 = pozZP
                    Call("SetControlValue", "PozHorniCab2", 0, pozHorni)
                    pozHorniCab2 = pozHorni
                    Call("SetControlValue", "OvladaniSteraceCab2", 0, ovladaniSterace)
                    ovladaniSteraceCab2 = ovladaniSterace
                    Call("SetControlValue", "OvladaniKompresorCab2", 0, ovladaniKompresor)
                    ovladaniKompresorCab2 = ovladaniKompresor
                    Call("SetControlValue", "OsvetleniVlakuCab2", 0, osvetleniVlaku)
                    Call("SetControlValue", "RoletkaCab2", 0, roletka)
                    roletkaCab2 = roletka
                    Call("SetControlValue", "DvereLcab2", 0, dvereL)
                    dvereLcab2 = dvereL
                    Call("SetControlValue", "DverePcab2", 0, dvereP)
                    dverePcab2 = dvereP
                end

                kombiCab1 = Call("GetControlValue", "VirtualThrottleAndBrakeCab1", 0)
                kombiCab2 = Call("GetControlValue", "VirtualThrottleAndBrakeCab2", 0)
                reverserCab1 = Call("GetControlValue", "UserVirtualReverserCab1", 0)
                reverserCab2 = Call("GetControlValue", "UserVirtualReverserCab2", 0)
                bpeCab1 = Call("GetControlValue", "VirtualEngineBrakeControlCab1", 0)
                bpeCab2 = Call("GetControlValue", "VirtualEngineBrakeControlCab2", 0)
                headlightsCab1 = Call("GetControlValue", "ReflektoryCab1", 0)
                headlightsCab2 = Call("GetControlValue", "ReflektoryCab2", 0)
                rizeniCab1 = Call("GetControlValue", "RizeniCab1", 0)
                rizeniCab2 = Call("GetControlValue", "RizeniCab2", 0)
                baterieCab1 = Call("GetControlValue", "KlicCab1", 0)
                baterieCab2 = Call("GetControlValue", "KlicCab2", 0)
                svetlaCab1 = Call("GetControlValue", "SvetlaCab1", 0)
                svetlaCab2 = Call("GetControlValue", "SvetlaCab2", 0)
                osvetleniPristrojeCab1 = Call("GetControlValue", "OsvetleniPristrojeCab1", 0)
                osvetleniPristrojeCab2 = Call("GetControlValue", "OsvetleniPristrojeCab2", 0)
                osvetleniSJRCab1 = Call("GetControlValue", "OsvetleniSJRCab1", 0)
                osvetleniSJRCab2 = Call("GetControlValue", "OsvetleniSJRCab2", 0)
                rezimARRCab1 = Call("GetControlValue", "RezimARRCab1", 0)
                rezimARRCab2 = Call("GetControlValue", "RezimARRCab2", 0)
                ovladaniSberacuCab1 = Call("GetControlValue", "OvladaniSberacuCab1", 0)
                ovladaniSberacuCab2 = Call("GetControlValue", "OvladaniSberacuCab2", 0)
                ovladacVNCab1 = Call("GetControlValue", "OvladacVNCab1", 0)
                ovladacVNCab2 = Call("GetControlValue", "OvladacVNCab2", 0)
                rezimBrzdeniCab1 = Call("GetControlValue", "RezimBrzdeniCab1", 0)
                rezimBrzdeniCab2 = Call("GetControlValue", "RezimBrzdeniCab2", 0)
                pozPLCab1 = Call("GetControlValue", "PozPLCab1", 0)
                pozPLCab2 = Call("GetControlValue", "PozPLCab2", 0)
                pozPPCab1 = Call("GetControlValue", "PozPPCab1", 0)
                pozPPCab2 = Call("GetControlValue", "PozPPCab2", 0)
                pozZLCab1 = Call("GetControlValue", "PozZLCab1", 0)
                pozZLCab2 = Call("GetControlValue", "PozZLCab2", 0)
                pozZPCab1 = Call("GetControlValue", "PozZPCab1", 0)
                pozZPCab2 = Call("GetControlValue", "PozZPCab2", 0)
                pozHorniCab1 = Call("GetControlValue", "PozHorniCab1", 0)
                pozHorniCab2 = Call("GetControlValue", "PozHorniCab2", 0)
                ovladaniSteraceCab1 = Call("GetControlValue", "OvladaniSteraceCab1", 0)
                ovladaniSteraceCab2 = Call("GetControlValue", "OvladaniSteraceCab2", 0)
                ovladaniKompresorCab1 = Call("GetControlValue", "OvladaniKompresorCab1", 0)
                ovladaniKompresorCab2 = Call("GetControlValue", "OvladaniKompresorCab2", 0)
                roletkaCab1 = Call("GetControlValue", "RoletkaCab1", 0)
                roletkaCab2 = Call("GetControlValue", "RoletkaCab2", 0)
                dvereLcab1 = Call("GetControlValue", "DvereLcab1", 0)
                dvereLcab2 = Call("GetControlValue", "DvereLcab2", 0)
                dverePcab1 = Call("GetControlValue", "DverePcab1", 0)
                dverePcab2 = Call("GetControlValue", "DverePcab2", 0)

                gRizeniOld = gRizeni
                if rizeniCab1 >= 0.5 or rizeniCab2 >= 0.5 then
                    gRizeni = 1
                else
                    if CasProPrechod > 0.5 then
                        gRizeni = 1
                    else
                        gRizeni = 0
                    end
                end
                
                if baterieCab1 >= 0.5 or baterieCab2 >= 0.5 then
                    gBaterie = 1
                else
                    gBaterie = 0
                end

                if gBaterie == 1 and gRizeni == 1 then
                    if horn_blink_state then
                        Call("SetControlValue", "Horn", 0, 1)
                    else
                        Call("SetControlValue", "Horn", 0, horn)
                    end
                    Call("SetControlValue", "Bell", 0, bell)
                end

                if math.min(kombiCab1, kombiCab2) < -0.75 then
                    significantKombi = -1
                elseif rizeniCab1 >= 0.5 and rizeniCab2 >= 0.5 then
                    significantKombi = -1
                elseif rizeniCab1 >= 0.5 then
                    significantKombi = kombiCab1
                elseif rizeniCab2 >= 0.5 then
                    significantKombi = kombiCab2
                else 
                    significantKombi = 0
                end

                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantReverser = reverserCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantReverser = reverserCab2
                else
                    significantReverser = 0
                end

                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantBPE = bpeCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantBPE = bpeCab2
                else
                    significantBPE = 0.5
                end

                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantHeadlights = headlightsCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantHeadlights = headlightsCab2
                else
                    significantHeadlights = 0
                end

                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantSvetla = svetlaCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantSvetla = svetlaCab2
                else
                    significantSvetla = 0
                end

                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantRezimARR = rezimARRCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantRezimARR = rezimARRCab2
                else
                    significantRezimARR = 0
                end

                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantOvladaniSberacu = ovladaniSberacuCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantOvladaniSberacu = ovladaniSberacuCab2
                else
                    if not Prechod or (rizeniCab2 > 0.5 and rizeniCab1 > 0.5) then
                        significantOvladaniSberacu = 0
                    end
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantOvladacVN = ovladacVNCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantOvladacVN = ovladacVNCab2
                else
                    if not Prechod then
                        significantOvladacVN = 0
                    end
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantRezimBrzdeni = rezimBrzdeniCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantRezimBrzdeni = rezimBrzdeniCab2
                else
                    significantRezimBrzdeni = 0
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantPozPL = pozPLCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantPozPL = pozPLCab2
                else
                    significantPozPL = 0
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantPozPP = pozPPCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantPozPP = pozPPCab2
                else
                    significantPozPP = 0
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantPozZL = pozZLCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantPozZL = pozZLCab2
                else
                    significantPozZL = 0
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantPozZP = pozZPCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantPozZP = pozZPCab2
                else
                    significantPozZP = 0
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantPozHorni = pozHorniCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantPozHorni = pozHorniCab2
                else
                    significantPozHorni = 0
                end
                
                if rizeniCab1 > 0.5 and rizeniCab2 < 0.5 then
                    significantOvladaniKompresor = ovladaniKompresorCab1
                elseif rizeniCab2 > 0.5 and rizeniCab1 < 0.5 then
                    significantOvladaniKompresor = ovladaniKompresorCab2
                else
                    significantOvladaniKompresor = 0
                end

                if math.abs(Call("GetSpeed")) < 0.1 then
                    Call("SetControlValue", "Reverser", 0, significantReverser)
                end

                vykon = Call("GetControlValue", "ThrottleAndBrake", 0)
                pomernyTah = Call("GetControlValue","PomernyTah",0)
                KiloNutony = Call("GetControlValue","Accelerometer",0)
                speedometerKPH = Call("GetControlValue","SpeedometerKPH",0)
                hl_vyp = Call("GetControlValue","HV",0)
                lin_styk = Call("GetControlValue","LinkoveStykace",0)
                Ammeter = Call("GetControlValue","Ammeter",0)
                if Call("GetConsistLength") < 20 then
                    ridiciKonstantaBrzd = 0.3
                else
                    ridiciKonstantaBrzd = math.min((7*(Call("GetConsistLength")-17.534)/(Call("GetConsistTotalMass")-86)-7*0.57)^2+0.3, 1)
                end
                --rych 0.57 m/t
                --sgnss 0.325 m/t
                --eas prazdny 0.61 m/t
                --eas lozeny 0.1755 m/t
            --local podminkaJizdy = ToBolAndBack(hl_vyp*lin_styk)

            local podminkaJizdy = Call("GetControlValue","LevyTah",0)
            if podminkaJizdy == 1 then podminkaJizdy = true else podminkaJizdy = false end
            
            setTacho(Call("GetSpeed"))
            setTah(Call("GetTractiveEffort"),Call("GetControlValue", "DynamicBrake", 0))
            --------------Train Brake-----------
                trainBrakeDirectValue = Call("GetControlValue", "TrainBrakeControlNonHUD", 0)
            --------------Zachranna brzda-------
                if significantKombi <= -0.850 then --poloha NB
                    if vykon > 0 then
                        vykon = -vykon
                    end
                    trainBrakeRB = true
                    pomernyTah = -1
                    ARR.kladnyPT = 0
                    ARR.EDB = -1
                    Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                else
                    trainBrakeRB = false
                end
                if trainBrakeRB or MIREL.odpadleSoupatkoVZ or PZB90.emergencyBrake or PZB90.overspeedEmergencyApplied or SIFA.emergencyBrake or LZB.emergencyBrake or gRizeni < 0.5 or gBaterie < 0.5 then
                    if Call("GetControlValue","BrakePipePressureBAR",0) > 0.05 then
                        Call("EngineSound:SetParameter", "BSE_RB", 1)
                    else
                        Call("EngineSound:SetParameter", "BSE_RB", 0)
                    end
                    bylaBrzda = true
                    trainBrakeDirectValue = math.min(trainBrakeDirectValue + (deltaTime * TBC_RYCHLOBRZDA_RATE * math.sqrt(1-trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),1)
                    Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                    ARR.rucneNabrzdeneTBC = trainBrakeDirectValue
                    if ARR.hodnotaTBC ~= 0 then
                        ARR.blokujOdbrzdeniRucniVolba = true
                    end
                else
                    Call("EngineSound:SetParameter", "BSE_RB", 0)
                end
            --------------Adhese koeficienty----
                if SysCall("ScenarioManager:GetCurrentPrecipitationType") ~= nil then
                    if SysCall("ScenarioManager:GetCurrentPrecipitationType") < 3 then --nesnezi
                        if SysCall("ScenarioManager:GetPrecipitationDensity") > 0.3 then --prsi hodne
                            if adhese_casdeste == -1 then
                                adhese_casdeste = 0
                            end
                            if adhese_casdeste <= 370 then
                                adhese_casdeste = adhese_casdeste + deltaTime
                            end
                            adhese_caspodesti = -1
                        elseif SysCall("ScenarioManager:GetPrecipitationDensity") ~= 0 then --prsi trochenc
                            if adhese_casdeste == -1 then
                                adhese_casdeste = 0
                            end
                            adhese_caspodesti = -1
                        else --neprsi vubec
                            if adhese_casdeste ~= -1 then
                                adhese_caspodesti = adhese_casdeste*10
                                adhese_casdeste = -1
                            end
                            if adhese_caspodesti > 0 then
                                adhese_caspodesti = adhese_caspodesti - deltaTime
                            else
                                adhese_caspodesti = -1
                            end
                        end
                        --defaultne adhese za sucha
                        ambientAdhesion = ADHESE_SUCHO
                        if adhese_casdeste ~= -1 then --pokud prsi
                            if adhese_casdeste < ADHESE_VLHKO_CAS_NABEH then --a prsi mene jak ADHESE_VLHKO_CAS_NABEH (70 vterin) - adhese se znizuje az na ADHESE_VLHKO_START (0.5)
                                ambientAdhesion = ADHESE_SUCHO - (ADHESE_SUCHO-ADHESE_VLHKO_START)*(adhese_casdeste/ADHESE_VLHKO_CAS_NABEH)
                            elseif adhese_casdeste < ADHESE_VLHKO_CAS_SNIZENI then --nebo prsi mene jak ADHESE_VLHKO_CAS_SNIZENI (370 vterin) - adhese se zvysuje na ADHESE_VLHKO (0.7)
                                ambientAdhesion = ADHESE_VLHKO_START - (ADHESE_VLHKO_START-ADHESE_VLHKO)*(adhese_casdeste/(ADHESE_VLHKO_CAS_NABEH+ADHESE_VLHKO_CAS_SNIZENI))
                            else --jinak uz je adhese stala ADHESE_VLHKO (0.7)
                                ambientAdhesion = ADHESE_VLHKO
                            end
                        elseif adhese_caspodesti ~= -1 then --pokud prselo pred mene jak 10 minutami, adhese se zvysuje od aktualni k ADHESE_SUCHO (0.9)
                            if sourceAdhesion == -1 then
                                sourceAdhesion = ambientAdhesion
                            end
                            ambientAdhesion = sourceAdhesion - (sourceAdhesion-ADHESE_SUCHO)*(adhese_caspodesti/ADHESE_VLHKO_PODESTI)
                        end
                    else --snezi, tak nejsou casy deste
                        adhese_casdeste = -1
                        adhese_caspodesti = -1
                        ambientAdhesion = ADHESE_SNIH
                    end
                else --nedeje se nic
                    adhese_caspodesti = -1
                    ambientAdhesion = ADHESE_SUCHO
                end

                if adhese_caspodesti == -1 then --pokud uz neprsi vice jak 10*casDeste vynuluj vychozi pocitadla - koleje uz jsou urcite suche
                    sourceAdhesion = -1
                end

                if SysCall("ScenarioManager:GetSeason") == 2 then --pokud je podzim, vsade jsou listy - klouze to 3x tolik
                    ambientAdhesion = ambientAdhesion * ADHESE_KOEF_LISTI
                elseif SysCall("ScenarioManager:GetSeason") == 3 then --pokud je zima, je snih - sankuje to 2x tolik jak obvykle
                    ambientAdhesion = ADHESE_SNIH
                end
                    
                if Call("GetControlValue","Sander",0) > 0.1 then
                    if sandAdhesionAddition < 0.15 then
                        sandAdhesionAddition = sandAdhesionAddition + 0.25*deltaTime
                    else
                        sandAdhesionAddition = 0.15
                    end
                else
                    if sandAdhesionAddition > 0 then
                        sandAdhesionAddition = (sandAdhesionAddition - 0.12*deltaTime)
                    else
                        sandAdhesionAddition = 0
                    end
                end
                
                if Call("GetControlValue","CisticiSpaliky",0) > 0.1 then
                    if brakeAdhesionAddition < 0.15 then
                        brakeAdhesionAddition = brakeAdhesionAddition + 0.25*deltaTime
                    else
                        brakeAdhesionAddition = 0.15
                    end
                else
                    if brakeAdhesionAddition > 0 then
                        brakeAdhesionAddition = (brakeAdhesionAddition - 0.00333*deltaTime)
                    else
                        brakeAdhesionAddition = 0
                    end
                end                    
                
                decisiveAdhesion = ambientAdhesion + math.max(math.min(sandAdhesionAddition, (5/Call("GetSpeed"))-0.15), 0) + brakeAdhesionAddition
                
                if adheseRandomCtdn > 0 then
                    if math.abs(Call("GetSpeed")) > 0.1 and math.abs(Call("GetSpeed")) < 38 then
                        adheseRandomCtdn = adheseRandomCtdn - deltaTime
                    end
                    adheseRandomLenCtu = 0
                elseif adheseRandomLenCtu < 1 then
                    decisiveAdhesion = decisiveAdhesion * 0.7
                    adheseRandomLenCtu = adheseRandomLenCtu + deltaTime
                else
                    adheseRandomCtdn = math.random(40,200)
                end

                Call("SetControlValue", "Adheze", 0, ambientAdhesion)
                Call("SetControlValue", "AdhezeControl", 0, decisiveAdhesion)
            --------------Adheze a skluz--------
                positiveTractiveEffortForWheelslip = Call("GetControlValue", "KoleckoTah", 0)
                negativeTractiveEffortForWheelslip = Call("GetControlValue", "DynamicBrake", 0)*150
                if positiveTractiveEffortForWheelslip ~= 0 then
                    tractiveEffortForWheelslip = positiveTractiveEffortForWheelslip
                else
                    tractiveEffortForWheelslip = negativeTractiveEffortForWheelslip
                end
                
                custom_wheelslip = Call("GetControlValue", "Skluz", 0)
                adhesiveTractiveForce = (785*((7500/(speedometerKPH+44))+161)*0.001)*decisiveAdhesion+35
                
                -- if Call("GetControlValue", "Befehl40", 0) > 0.5 then
                --     SysCall("ScenarioManager:ShowAlertMessageExt", "Vysledna adhesni sila", adhesiveTractiveForce, 2, 0)
                -- end
                
                if tractiveEffortForWheelslip > adhesiveTractiveForce then
                    custom_wheelslip = math.min(custom_wheelslip + deltaTime,1)
                else
                    custom_wheelslip = math.max(custom_wheelslip - deltaTime,0)
                end
                Call("SetControlValue", "TaznaSilaLimit", 0, adhesiveTractiveForce)
                Call("SetControlValue", "Skluz", 0, custom_wheelslip)
            
            --------------PREVODNIK EDB---------
                prevEDB = -math.min(5-Call("GetControlValue","BrakePipePressureBAR",0),1.5)/1.5
                if prevEDB > -0.05 then
                    prevEDB = 1
                end
                local gameCylinder = math.max(Call("GetControlValue", "TrainBrakeCylinderPressureBAR", 0), Call("GetControlValue", "LocoBrakeCylinderPressureBAR", 0))
                local cylinderKoef = 1
                if vykon < 0 and math.abs(pomernyTah -vykon) < 0.05 then
                    if virtualBrakeCylinderPressureBAR > 0 then
                        virtualBrakeCylinderPressureBAR = math.max(virtualBrakeCylinderPressureBAR - math.sqrt(virtualBrakeCylinderPressureBAR) * deltaTime * cylinderKoef, 0)
                    end
                else
                    if math.abs(virtualBrakeCylinderPressureBAR - gameCylinder) > 0 then
                        if virtualBrakeCylinderPressureBAR > gameCylinder then
                            virtualBrakeCylinderPressureBAR = math.max(virtualBrakeCylinderPressureBAR - math.sqrt(math.abs(virtualBrakeCylinderPressureBAR - gameCylinder)) * deltaTime * cylinderKoef, 0)
                        else
                            virtualBrakeCylinderPressureBAR = math.max(virtualBrakeCylinderPressureBAR + math.sqrt(math.abs(virtualBrakeCylinderPressureBAR - gameCylinder)) * deltaTime * cylinderKoef, 0)
                        end
                    end
                end
                Call("SetControlValue", "VirtualBrakeCylinderPressureBAR", 0, virtualBrakeCylinderPressureBAR)
            --------------HJP a PT--------------
                if significantRezimARR == 0 and not MIREL.odpadleSoupatkoVZ and not PZB90.emergencyBrake and not PZB90.overspeedEmergencyApplied and not SIFA.emergencyBrake and not LZB.emergencyBrake and gRizeni == 1 then 
                    bylaBrzda = false
                    jvjVybeh = false
                    jvjSouhlas = false
                    if significantKombi <= 0.250 then -- neutrál a brzdné polohy
                        if pomernyTah >= 0.01 then --sjetí z jízdy
                            Call("SetControlValue","PomernyTah",0,pomernyTah-(koefZJizdy*deltaTime))
                        elseif pomernyTah > 0 and pomernyTah < 0.01 then
                            Call("SetControlValue","PomernyTah",0,0)
                        end
                        -- if Call("GetControlValue","TrainBrakeControlNonHUD",0) ~= 0.3 and significantKombi == 0 then -- Neutrál poloha brzdy
                        -- 	Call("SetControlValue","TrainBrakeControlNonHUD",0,0.3)
                        -- end
                    end
                    if significantKombi > 0.250 then -- kladné polohy
                        BSE_plneni = true
                        trainBrakeDirectValue = math.max(trainBrakeDirectValue - (deltaTime * TBC_PLNENI_RATE * math.sqrt(trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),0)
                        Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                        if pomernyTah <= -0.01 then --sjetí z EDB
                            Call("SetControlValue","PomernyTah",0,pomernyTah+(koefZEDB*deltaTime))
                        elseif pomernyTah < 0 and pomernyTah > -0.01 then
                            Call("SetControlValue","PomernyTah",0,0)
                        end
                        if significantReverser == 0 or stradac or not podminkaJizdy or Call("GetControlValue","BrakePipePressureBAR",0) < 4.9 or LZB.blockTraction then
                            if pomernyTah > 2*koefZJizdy*deltaTime then
                                Call("SetControlValue","PomernyTah",0,pomernyTah-(koefZJizdy*deltaTime))
                            elseif pomernyTah > -2*koefZJizdy*deltaTime then
                                Call("SetControlValue","PomernyTah",0,0)
                            end
                        end
                    end
                    if significantKombi >= 0.75 and not stradac then --poloha Souhlas
                        if vykon >= 0 and significantReverser ~= 0 and not stradac and podminkaJizdy and Call("GetControlValue","BrakePipePressureBAR",0) > 4.9 and not LZB.blockTraction then --najetí do jízdy
                            if pomernyTah < 1 then
                                Call("SetControlValue","PomernyTah",0,pomernyTah+(koefDoJizdy*deltaTime))
                            else
                                Call("SetControlValue","PomernyTah",0,1)
                            end
                        elseif pomernyTah > 0 then
                            Call("SetControlValue","PomernyTah",0,pomernyTah-(koefZJizdy*deltaTime))
                        end
                    end
                    if significantKombi <= -0.150 and significantKombi >= -0.450 then --poloha BE
                        if Call("GetControlValue", "TlacARRminus", 0) > 0.5 then
                            parkovackaZap = false
                        end
                        if Call("GetControlValue", "TlacARRplus", 0) > 0.5 then
                            parkovackaZap = true
                        end
                        
                        if pomernyTah > 0 then
                            pomernyTah = -pomernyTah
                            Call("SetControlValue","PomernyTah",0,pomernyTah)
                            zpozdeniedb = 2
                        end

                        zpozdeniedb = zpozdeniedb + deltaTime
                        if zpozdeniedb >= 1 then
                            bylaEDB = 1
                            if pomernyTah > -1 and pomernyTah <= 0 and vykon <= 0 then --najetí do EDB
                                Call("SetControlValue","PomernyTah",0,pomernyTah-(koefDoEDB*deltaTime))
                            end
                        else
                            bylaEDB = 0
                        end
                    else
                        zpozdeniedb = 0
                    end
                    if significantKombi <= -0.450 and significantKombi >= -0.850 then --poloha BP
                        BSE_upousteni = true
                        trainBrakeDirectValue = math.min(trainBrakeDirectValue + (deltaTime * TBC_UPOUSTENI_RATE * math.sqrt(1-trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),1)
                        Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                        -- Call("SetControlValue","PomernyTah",0,pomernyTah-(koefDoEDB*deltaTime))
                        -- zpozdeniedb = zpozdeniedb + deltaTime
                        --if zpozdeniedb >= 1 then
                        --	bylaEDB = 1
                        --	if pomernyTah > -1 and pomernyTah <= 0 and vykon <= 0 then --najetí do EDB
                        --		Call("SetControlValue","PomernyTah",0,pomernyTah-(koefDoEDB*deltaTime))
                        --	end
                        --else
                        --	bylaEDB = 0
                        --end
                    end
                    if significantKombi <= -0.850 then --poloha NB
                        bylaBrzda = true
                        if vykon > 0 then
                            vykon = -vykon
                        end
                        Call("SetControlValue", "PomernyTah", 0, -1)
                        pomernyTah = -1
                    end
                    pomernyTah = math.min(prevEDB, Call("GetControlValue", "PomernyTah", 0))
                    -- pomernyTah = math.min(pomernyTah, ARR:update(0, deltaTime, deltaUpdateTimeFromGame))
                    Call("SetControlValue", "PomernyTah", 0, pomernyTah)
                end
                if significantRezimARR == 0 and rezARRold == 1 then
                    ARR:vypniARR()
                    rezARRold = 0
                elseif significantRezimARR == 1 then
                    parkovackaZap = true
                    if not MIREL.odpadleSoupatkoVZ and not PZB90.emergencyBrake and not PZB90.overspeedEmergencyApplied and not SIFA.emergencyBrake and not LZB.emergencyBrake and gRizeni == 1 then
                        if (significantKombi <= -0.450 and significantKombi >= -0.850) then --poloha BP
                            BSE_upousteni = true
                            bylaBrzda = true
                            jvjVybeh = false
                            jvjSouhlas = false
                            trainBrakeDirectValue = math.min(trainBrakeDirectValue + (deltaTime * TBC_UPOUSTENI_RATE * math.sqrt(1-trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),1)
                            Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                            ARR.rucneNabrzdeneTBC = trainBrakeDirectValue
                            -- Call("SetControlValue","PomernyTah",0,pomernyTah-(koefDoEDB*deltaTime))
                            if ARR.hodnotaTBC ~= 0 then
                                ARR.blokujOdbrzdeniRucniVolba = true
                            end
                            --zpozdeniedb = zpozdeniedb + deltaTime
                            --if zpozdeniedb >= 1 then
                            --	bylaEDB = 1
                            --	if pomernyTah > -1 and pomernyTah <= 0 and vykon <= 0 then --najetí do EDB
                            --		Call("SetControlValue","PomernyTah",0,pomernyTah-(koefDoEDB*deltaTime))
                            --	end
                            --else
                            --	bylaEDB = 0
                            --end
                        elseif ARR.snizujTlakPP then
                            BSE_upousteni = true
                            ARR.hodnotaTBC = Call("GetControlValue","TrainBrakeControlNonHUD",0)
                            trainBrakeDirectValue = math.min(trainBrakeDirectValue + (deltaTime * TBC_UPOUSTENI_RATE * math.sqrt(1-trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),1)
                            Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                        end
                        if significantKombi >= 0.75 and significantReverser ~= 0 and not stradac and podminkaJizdy and Call("GetControlValue","BrakePipePressureBAR",0) > 4.9 and not LZB.blockTraction then --poloha Souhlas --or (significantKombi > 0.25 and speedometerKPH > 3 and not bylaBrzda) 
                            bylaBrzda = false
                            ARR:udelSouhlas()
                        end
                        if significantKombi < 0.25 then
                            ARR:vybeh()
                            if significantKombi > -0.150 then --poloha Vybeh
                                jvjVybeh = true
                                if ARR.zvysujTlakPP and not ARR.blokujOdbrzdeniRucniVolba and ARR.rucneNabrzdeneTBC < Call("GetControlValue","TrainBrakeControlNonHUD",0) then
                                    BSE_plneni = true
                                    trainBrakeDirectValue = math.max(trainBrakeDirectValue - (deltaTime * TBC_PLNENI_RATE * math.sqrt(trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),0)
                                    Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                                    ARR.hodnotaTBC = trainBrakeDirectValue
                                end
                            end
                        end
                        if significantKombi > 0.25 then --kladné polohy
                            if Call("GetControlValue","BrakePipePressureBAR",0) > 4.9 then
                                jvjSouhlas = true
                                if jvjVybeh and jvjSouhlas and speedometerKPH > 3 then
                                    jvjVybeh = false
                                    bylaBrzda = false
                                    ARR:udelSouhlas()
                                end
                            else
                                jvjSouhlas = false
                            end
                            jvjVybeh = false
                            if ARR.zvysujTlakPP then
                                BSE_plneni = true
                                trainBrakeDirectValue = math.max(trainBrakeDirectValue - (deltaTime * TBC_PLNENI_RATE * math.sqrt(trainBrakeDirectValue)) / math.min(math.max((Call("GetConsistLength")-17)/100, 1)*ridiciKonstantaBrzd,1.7),0)
                                Call("SetControlValue", "TrainBrakeControlNonHUD", 0, trainBrakeDirectValue)
                                ARR.hodnotaTBC = trainBrakeDirectValue
                                ARR.rucneNabrzdeneTBC = trainBrakeDirectValue
                            end
                            ARR.blokujOdbrzdeniRucniVolba = false
                            if rucEDB < 0 then --sjetí z EDB
                                rucEDB = math.min(rucEDB+(koefZEDB*deltaTime),0)
                            else
                                rucEDB = 0
                            end
                            if significantReverser == 0 or stradac or not podminkaJizdy or Call("GetControlValue","BrakePipePressureBAR",0) < 4.9 or LZB.blockTraction then
                                if pomernyTah > 2*koefZJizdy*deltaTime then
                                    Call("SetControlValue","PomernyTah",0,pomernyTah-(koefZJizdy*deltaTime))
                                elseif pomernyTah > -2*koefZJizdy*deltaTime then
                                    Call("SetControlValue","PomernyTah",0,0)
                                end
                            end
                        end
                        if significantKombi <= -0.850 then --poloha NB
                            bylaBrzda = true
                            jvjVybeh = false
                            jvjSouhlas = false
                            if vykon > 0 then
                                vykon = -vykon
                            end
                            Call("SetControlValue", "PomernyTah", 0, -1)
                            pomernyTah = -1
                        end
                        if significantKombi <= -0.150 and significantKombi >= -0.450 and not stradac then --poloha BE
                            jvjVybeh = false
                            jvjSouhlas = false
                            if pomernyTah > 0 then
                                ARR.EDB = -ARR.kladnyPT
                                ARR.kladnyPT = 0
                                pomernyTah = -pomernyTah
                                Call("SetControlValue","PomernyTah",0,pomernyTah)
                                zpozdeniedb = 2
                            end
                            if zpozdeniedb >= 1 then
                                bylaBrzda = true
                                bylaEDB = 1
                                rucEDB = math.min(pomernyTah,0)
                                if vykon <= 0 then --najetí do EDB
                                    rucEDB = math.max(rucEDB-(koefDoEDB*deltaTime),-1)
                                end
                            else
                                zpozdeniedb = zpozdeniedb + deltaTime
                                bylaEDB = 0
                            end
                        else
                            zpozdeniedb = 0
                        end
                    else
                        ARR:vybeh()
                        jvjVybeh = false
                        jvjSouhlas = false
                    end
                    if rezARRold == 0 then
                        rezARRold = 1
                        ARR:zapniARR()
                        if not MIREL.odpadleSoupatkoVZ and not PZB90.emergencyBrake and not PZB90.overspeedEmergencyApplied and not SIFA.emergencyBrake and not LZB.emergencyBrake and gRizeni == 1 then
                            bylaBrzda = false
                        else
                            bylaBrzda = true
                        end
                    end
                    if not MIREL.odpadleSoupatkoVZ and not PZB90.emergencyBrake and not PZB90.overspeedEmergencyApplied and not SIFA.emergencyBrake and not LZB.emergencyBrake and gRizeni == 1 and not stradac and not trainBrakeRB then
                        pomernyTah = ARR:update(math.min(rucEDB, prevEDB), deltaTime, deltaUpdateTimeFromGame)
                        Call("SetControlValue","PomernyTah",0,pomernyTah)
                    else
                        ARR:update(math.min(rucEDB, prevEDB), deltaTime, deltaUpdateTimeFromGame)
                    end
                end

                if BSE_plneni and Call("GetControlValue","BrakePipePressureBAR",0) < 4.95 then
                    Call("EngineSound:SetParameter", "BSE_PLNENI", 1)
                else
                    Call("EngineSound:SetParameter", "BSE_PLNENI", 0)
                end

                if BSE_upousteni and Call("GetControlValue","BrakePipePressureBAR",0) > 0.05 then
                    Call("EngineSound:SetParameter", "BSE_UPOUSTENI", 1)
                else
                    Call("EngineSound:SetParameter", "BSE_UPOUSTENI", 0)
                end

                if vykon <= 0 and speedometerKPH < 2 then
                    omezeniVykonu = 0.2
                    casOmezeniVykonu = 0
                else
                    casOmezeniVykonu = casOmezeniVykonu + deltaTime
                    if casOmezeniVykonu > 2 then
                        omezeniVykonu = 1
                    end
                end

                --rozhozeni jizdy pri tlaku ve valcich
                if pomernyTah > 0 and (Call("GetControlValue","BrakePipePressureBAR",0) < 4.9) then
                    pomernyTah = 0
                    ARR.kladnyPT = 0
                end
                Call("SetControlValue","PomernyTah",0,pomernyTah)

                --kompenzace EDB v nizkych rychlostech
                -- pomernyTah = math.max(pomernyTah, math.min(0, -speedometerKPH/10+0.5))
                -- Call("SetControlValue", "PomernyTah", 0, pomernyTah)

                if pomernyTah > 0 and podminkaJizdy then --PT - kladny
                    if custom_wheelslip > 0.3 then
                        vykon = math.max(math.min(vykon-(koefVykon*deltaTime*2), omezeniVykonu),0)
                    else
                        if pomernyTah > vykon then
                            if math.abs(pomernyTah - vykon) > koefVykon*deltaTime*2 then
                                vykon = math.min(vykon+(koefVykon*deltaTime), omezeniVykonu)
                            else
                                vykon = pomernyTah
                            end
                        elseif pomernyTah < vykon then
                            if math.abs(pomernyTah - vykon) > koefVykon*deltaTime*2 then
                                vykon = (math.min(vykon-(koefVykon*deltaTime), omezeniVykonu))
                            else
                                vykon = pomernyTah
                            end
                        end
                    end
                elseif pomernyTah < 0 and vykon > 0 and -pomernyTah > vykon and math.abs(Call("GetControlValue","UserVirtualReverser",0)-Call("GetControlValue","Reverser",0)) < 0.2 and napetiFiltru > 300 and not uzemnenaLoko then --preskok do EDB
                    vykon = -vykon
                elseif pomernyTah < 0 and math.abs(Call("GetControlValue","UserVirtualReverser",0)-Call("GetControlValue","Reverser",0)) < 0.2 and napetiFiltru > 300 and not uzemnenaLoko then --PT - EDB
                    if custom_wheelslip > 0.3 then
                        vykon = math.min(vykon+(koefVykon*deltaTime*2),0)
                    else
                        if pomernyTah > vykon then
                            if math.abs(pomernyTah - vykon) > koefVykon*deltaTime*2 then
                                vykon = (math.min(vykon+(koefVykon*deltaTime), 0))
                            else
                                vykon = pomernyTah
                            end
                        elseif pomernyTah < vykon then
                            if math.abs(pomernyTah - vykon) > koefVykon*deltaTime*2 then
                                vykon = (math.max(vykon-(koefVykon*deltaTime), -1))
                            else
                                vykon = pomernyTah
                            end
                        end
                    end
                elseif pomernyTah == 0 or not podminkaJizdy then
                    if vykon ~= 0 then
                        if podminkaJizdy then
                            if vykon > 0 then
                                vykon = (vykon-(koefVykon*deltaTime))
                            end
                            if vykon < 0 then
                                vykon = (vykon+(koefVykon*deltaTime))
                            end
                            if math.abs(pomernyTah - vykon) < koefVykon*deltaTime*2 then
                                vykon = 0
                            end
                        else
                            vykon = 0
                        end
                    end
                end
                
                --kompenzace EDB v nizkych rychlostech
                vykon = math.max(vykon, math.min(0, -speedometerKPH/10+0.5))

                Call("SetControlValue", "ThrottleAndBrake", 0, vykon)
            --------------ARR-------------------
                if significantRezimARR == 1 and not MIREL.odpadleSoupatkoVZ and not PZB90.emergencyBrake and not PZB90.overspeedEmergencyApplied and not SIFA.emergencyBrake and not LZB.emergencyBrake and gRizeni == 1 and significantKombi >= 0.75 and significantReverser ~= 0 and not stradac and podminkaJizdy and Call("GetControlValue","BrakePipePressureBAR",0) > 4.9 and not LZB.blockTraction then --poloha Souhlas --or (significantKombi > 0.25 and speedometerKPH > 3 and not bylaBrzda) 
                    ARR:udelSouhlas()
                end
                if Call("GetControlValue", "TlacPMplus", 0) == 1 and lastTlacPMPlus == 0 then
                    ARR:pmPlus()
                    lastTlacPMPlus = 1
                elseif Call("GetControlValue", "TlacPMplus", 0) == 0 then
                    lastTlacPMPlus = 0
                end
                if Call("GetControlValue", "TlacPMminus", 0) == 1 and lastTlacPMMinus == 0 then
                    ARR:pmMinus()
                    lastTlacPMMinus = 1
                elseif Call("GetControlValue", "TlacPMminus", 0) == 0 then
                    lastTlacPMMinus = 0
                end
                if Call("GetControlValue", "TlacFMplus", 0) == 1 and lastTlacFMPlus == 0 then
                    ARR:fmPlus()
                    lastTlacFMPlus = 1
                elseif Call("GetControlValue", "TlacFMplus", 0) == 0 then
                    lastTlacFMPlus = 0
                end
                if Call("GetControlValue", "TlacFMminus", 0) == 1 and lastTlacFMMinus == 0 then
                    ARR:fmMinus()
                    lastTlacFMMinus = 1
                elseif Call("GetControlValue", "TlacFMminus", 0) == 0 then
                    lastTlacFMMinus = 0
                end

                Call("SetControlValue", "PM", 0, ARR:getPM())
                Call("SetControlValue", "FM", 0, ARR:getFM())

                if Call("GetControlValue", "TlacARRplus", 0) == 1 and lastTlacARRPlus == 0 then
                    ARR:rychPlus()
                    lastTlacARRPlus = 1
                elseif Call("GetControlValue", "TlacARRplus", 0) == 0 then
                    lastTlacARRPlus = 0
                end

                if Call("GetControlValue", "TlacARRminus", 0) == 1 and lastTlacARRMinus == 0 then
                    ARR:rychMinus()
                    lastTlacARRMinus = 1
                elseif Call("GetControlValue", "TlacARRminus", 0) == 0 then
                    lastTlacARRMinus = 0
                end
            
            --------------KPJ-------------------
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
            --------------Piskovani-------------
                if gBaterie == 1 and Call("GetControlValue", "VirtualSander", 0) > 0.1 then
                    Call("SetControlValue", "Sander", 0, 1)
                else
                    Call("SetControlValue", "Sander", 0, 0)
                end

            --------------Drhlik----------------
                local cisticiSpalikyTlac = Call("GetControlValue", "CisticiSpalikyTlacitko", 0)

                if (vykon < -0.5 and lastVykon > -0.5) or cisticiSpalikyTlac > 0.5 and cisticiSpalikyCountdown == -1 then
                    odpocetCisticiSpaliky = 10
                    cisticiSpalikyCountdown = 300
                end
                if odpocetCisticiSpaliky > 0 and speedometerKPH > 5 then
                    odpocetCisticiSpaliky = odpocetCisticiSpaliky - deltaTime
                else
                    odpocetCisticiSpaliky = -1
                end
                if cisticiSpalikyCountdown > 0 and speedometerKPH > 5 then
                    cisticiSpalikyCountdown = cisticiSpalikyCountdown - deltaTime
                else
                    cisticiSpalikyCountdown = -1
                end
                if odpocetCisticiSpaliky > 0 then
                    Call("SetControlValue", "CisticiSpaliky", 0, 1)
                else
                    Call("SetControlValue", "CisticiSpaliky", 0, 0)
                end
                lastVykon = vykon
                
                if cisticiSpalikyTlac == 1 then
                    Call("SetControlValue", "CisticiSpalikyTlacitko", 0, 0)
                end
            
            --------------Napeti troleje--------
                local tvrdostNapeti = math.sqrt(math.sqrt(math.floor(((math.floor(os.time()/100)/100) - math.floor(math.floor(os.time()/100)/100))*100)+mm))
                if NS == 3 then
                    koefTvrdost = 1
                elseif NS == 15 then
                    koefTvrdost = 2.5
                else
                    koefTvrdost = 3.5
                end
                
                if Call("GetControlValue","PantographControl",0) == 1 and Call("GetControlValue","LevySystem",0) ~= SYSTEM_NENI then
                    napeti = ((NS*1000 - (200 * Ammeter / 2800)) - (((tvrdostNapeti-2.5) * 300)/koefTvrdost))
                else
                    napeti = 0
                end

                local napetiZobraz = 0
                if NS > 0 then
                    napetiZobraz = (napeti*3)/NS 
                end

                Call("SetControlValue", "LevyNapetiTroleje", 0, napetiZobraz)

            --------------NAPETI FILTRU---------
                kompresor = Call("GetControlValue", "CompressorState", 0)

                casZapnutychFiltru = casZapnutychFiltru + deltaTime
                casVypnutychFiltru = casVypnutychFiltru + deltaTime
                casBezicihoKompresoru = casBezicihoKompresoru + deltaTime
                if lin_styk == 0 then
                    casZapnutychFiltru = 0
                else
                    casVypnutychFiltru = 0
                end
                if kompresor == 0 then
                    casBezicihoKompresoru = 0
                end

                local KAPACITA_FILTRU = 0.03
                local NAB_ODPOR = 19.1
                local VYB_ODPOR = 80

                if kompresor == 1 then
                    napetiFiltruKompresorEDB = napetiFiltruKompresorEDB - 100 * deltaTime
                end
                if vykon < 0 and napetiFiltruKompresorEDB < 1600 then
                    if NS == 3 then
                        napetiFiltruKompresorEDB = napetiFiltruKompresorEDB - Ammeter * deltaTime * 0.3
                    elseif NS == 15 then
                        napetiFiltruKompresorEDB = napetiFiltruKompresorEDB - Ammeter * deltaTime * 0.6
                    elseif NS == 25 then
                        napetiFiltruKompresorEDB = napetiFiltruKompresorEDB - Ammeter * deltaTime
                    end
                end
                if lin_styk == 1 then
                    if lin_stykOld ~= 1 then
                        vychoziNapetiFiltru = napetiFiltruLS
                    end
                    napetiFiltruLS = (math.min(3000, napeti) - vychoziNapetiFiltru) * (1 - math.exp(-casZapnutychFiltru / (NAB_ODPOR * KAPACITA_FILTRU))) + vychoziNapetiFiltru
                    napetiFiltruUzemneni = napetiFiltruLS
                    napetiFiltruKompresorEDB = napetiFiltruLS
                else
                    if lin_stykOld ~= 0 then
                        vychoziNapetiFiltru = napetiFiltruLS
                    end
                    napetiFiltruLS = (vychoziNapetiFiltru - 1600) * math.exp(-casVypnutychFiltru / (VYB_ODPOR * KAPACITA_FILTRU)) + 1600
                    if napetiFiltruLS < 1601 and napetiFiltruLS > 1600 then
                        napetiFiltruLS = 1600
                    end
                    napetiFiltruKompresorEDB = math.min(napetiFiltruKompresorEDB, napetiFiltruLS)
                end
                if uzemnenaLoko then
                    napetiFiltruUzemneni = vychoziNapetiFiltru * math.exp(-casVypnutychFiltru / (VYB_ODPOR * KAPACITA_FILTRU))
                    napetiFiltruKompresorEDB = napetiFiltruUzemneni
                    napetiFiltruLS = napetiFiltruUzemneni
                end
                kompresorOld = kompresor
                lin_stykOld = lin_styk

                napetiFiltru = math.min(napetiFiltruUzemneni, napetiFiltruLS, napetiFiltruKompresorEDB)

                napetiFiltruUzemneni = napetiFiltruUzemneni - math.sqrt(napetiFiltruUzemneni) * deltaTime*0.01
                napetiFiltruLS = napetiFiltruLS - math.sqrt(napetiFiltruLS) * deltaTime*0.01
                napetiFiltruKompresorEDB = napetiFiltruKompresorEDB - math.sqrt(napetiFiltruKompresorEDB) * deltaTime*0.01

                Call("SetControlValue", "NapetiFiltr", 0, napetiFiltru)

            --------------PROUD FILTRU----------
                if NS == 15 then
                    Ammeter = Ammeter / 3
                elseif NS == 25 then
                    Ammeter = Ammeter / 5
                end
                local proudFiltru = ((3000 - vychoziNapetiFiltru) / NAB_ODPOR) * math.exp(-casZapnutychFiltru / (NAB_ODPOR * KAPACITA_FILTRU))
                if lin_styk == 1 then
                    Ammeter = Ammeter + proudFiltru
                end

                local cilovyProudKompresoru = 0
                if kompresor == 1 then
                    cilovyProudKompresoru = 11
                end
                proudKompresoru = proudKompresoru + (cilovyProudKompresoru - proudKompresoru)^1/3
                Ammeter = Ammeter + proudKompresoru
                Call("SetControlValue", "VirtualAmmeter", 0, Ammeter)

            --------------HJP-------------------
                local p_souhlas = false
                local p_jizda = false
                local p_vybeh = false
                local p_be = false
                local p_bp = false

                if gKabina == 1 then
                    aktualniKombi = Call("GetControlValue", "VirtualThrottleAndBrakeCab1", 0)
                else
                    aktualniKombi = Call("GetControlValue", "VirtualThrottleAndBrakeCab2", 0)
                end

                if ciloveKombi > 0.75 then
                    p_last = p_SO
                elseif ciloveKombi > 0.25 then
                    p_last = p_JI
                elseif ciloveKombi > -0.166 then
                    p_last = p_VY
                elseif ciloveKombi > -0.5 then
                    p_last = p_BE
                elseif ciloveKombi > -0.833 then
                    p_last = p_BP
                else
                    p_last = p_ZB
                end

                if aktualniKombi ~= ciloveKombi and not p_ocekavana then
                    p_ovladaneF4 = true
                end

                if math.abs(ciloveKombi-aktualniKombi) < 0.05 then
                    p_ocekavana = false
                end

                local t_A = Call("GetControlValue", "dummyA", 0)
                local t_D = Call("GetControlValue", "dummyD", 0)
                local t_E = Call("GetControlValue", "dummyE", 0)
                local t_ZB = Call("GetControlValue", "dummyZB", 0)

                if t_A > 0.5 or t_D > 0.5 or t_E > 0.5 or t_ZB > 0.5 then
                    p_ovladaneF4 = false
                end

                if t_A > 0.5 and ciloveKombi > 0.25 and (not t_byloA or p_last == p_SO) then --souhlas - je zmackle A a HJP byla v jizde - drz dokud je t_A > 0.5
                    p_souhlas = true
                    t_byloA = true
                elseif t_A > 0.5 and not t_byloA and ciloveKombi > -0.166 then --jizda - prvni upd se zmacklem A a HJP byla ve vybehu
                    t_byloA = true
                    p_jizda = true
                elseif t_A > 0.5 and not t_byloA and ciloveKombi < -0.833 then --jizda - prvni upd se zmacklem A a HJP byla v ZB
                    t_byloA = true
                    -- p_jizda = true nove vraci HJP do vybehu
                    p_vybeh = true
                elseif t_A < 0.5 then
                    t_byloA = false
                end

                if t_D > 0.5 and ciloveKombi < 0.25 and (not t_byloD or p_last == p_BP) then --BP - je zmackle D a HJP byla ve vybehu - drz dokud je t_D > 0.5
                    p_bp = true
                    t_byloD = true
                elseif t_D > 0.5 and not t_byloD and ciloveKombi > 0.25 then --vybeh - prvni upd se zmacklem D a HJP byla v J
                    p_vybeh = true
                    t_byloD = true
                elseif t_D < 0.5 then
                    t_byloD = false
                end

                if t_E > 0.5 then
                    p_be = true
                end

                if p_souhlas then
                    ciloveKombi = 1
                    p_ocekavana = true
                elseif p_last == p_SO then
                    p_jizda = true
                end

                if p_jizda then
                    ciloveKombi = 0.5
                    p_ocekavana = true
                end

                if p_be then
                    ciloveKombi = -0.333
                    p_ocekavana = true
                elseif p_last == p_BE then
                    p_vybeh = true
                end

                if p_bp then
                    ciloveKombi = -0.666
                    p_ocekavana = true
                elseif p_last == p_BP then
                    p_vybeh = true
                end

                if p_vybeh then
                    ciloveKombi = 0
                    p_ocekavana = true
                end

                if t_ZB > 0.5 then
                    ciloveKombi = -1
                    p_ocekavana = true
                end

                if not p_ovladaneF4 then
                    if ciloveKombi - aktualniKombi > 0.05 then
                        Call("SetControlValue", "VirtualThrottleAndBrake", 0, aktualniKombi + math.sqrt(math.abs(ciloveKombi-aktualniKombi))*deltaTime*3)
                        p_ocekavana = true
                    elseif ciloveKombi - aktualniKombi < -0.05 then
                        Call("SetControlValue", "VirtualThrottleAndBrake", 0, aktualniKombi - math.sqrt(math.abs(ciloveKombi-aktualniKombi))*deltaTime*3)
                        p_ocekavana = true
                    else
                        Call("SetControlValue", "VirtualThrottleAndBrake", 0, ciloveKombi)
                    end
                else
                    ciloveKombi = aktualniKombi
                end

            --------------BPE-------------------
                casOdbrzdene = casOdbrzdene + deltaTime

                if significantKombi >= 0.75 then
                    casOdbrzdene = 0
                end

                if speedometerKPH < 2 and casOdbrzdene > 8 and parkovackaZap then
                    parkovacka = 0.47
                    ARR:nastavParkovacku(true)
                else
                    parkovacka = 0
                    ARR:nastavParkovacku(false)
                end

                if significantBPE < 0.125 then
                    if primocinka > 0 then
                        Call("EngineSound:SetParameter", "BPE_ODBRZDI", 1)
                        primocinka = primocinka-(koefBPEMAX*deltaTime)
                    end
                    if primocinka <= 0 then
                        Call("EngineSound:SetParameter", "BPE_ODBRZDI", 0)
                        primocinka = 0 
                    end
                elseif significantBPE < 0.375 then
                    if primocinka > 0 then
                        Call("EngineSound:SetParameter", "BPE_ODBRZDI", 1)
                        primocinka = primocinka-(koefBPE*deltaTime)
                    end
                    if primocinka <= 0 then
                        Call("EngineSound:SetParameter", "BPE_ODBRZDI", 0)
                        primocinka = 0 
                    end
                elseif significantBPE < 0.625 then
                    --pretend to do smth here!
                    Call("EngineSound:SetParameter", "BPE_ODBRZDI", 0)
                    Call("EngineSound:SetParameter", "BPE_ZABRZDI", 0)
                elseif significantBPE < 0.875 then
                    if primocinka < 1 then
                        primocinka = primocinka+(koefBPE*deltaTime)
                        Call("EngineSound:SetParameter", "BPE_ZABRZDI", 1)
                    end
                    if primocinka >= 1 then
                        primocinka = 1 
                        Call("EngineSound:SetParameter", "BPE_ZABRZDI", 0)
                    end
                else
                    if primocinka < 1 then
                        primocinka = primocinka+(koefBPEMAX*deltaTime)
                        Call("EngineSound:SetParameter", "BPE_ZABRZDI", 1)
                    end
                    if primocinka >= 1 then
                        primocinka = 1 
                        Call("EngineSound:SetParameter", "BPE_ZABRZDI", 0)
                    end
                end

                doplnkovaBrzda = math.max(math.min(math.max(-1.5+speedometerKPH/10,-1),0)*pomernyTah,0)

                Call("SetControlValue","EngineBrakeControl",0,math.max(primocinka, parkovacka, doplnkovaBrzda))

            --------------Ovladani sberacu------
                local pozadavekSberace = ToBolAndBack(Call("GetControlValue","PozadavekSberace",0))
                local predniSberac = false
                local zadniSberac = false

                if gBaterie == 1 and ((gObrazovky == 1 and gRizeni == 1) or vRZWS or Prechod) then
                    if significantOvladaniSberacu > 2.5 or vRPantograph then
                        Call("SetControlValue","PozadavekSberace",0,1)
                        pozadavekSberace = true
                        uzemnenaLoko = false
                    elseif significantOvladaniSberacu < 1.5 or (vRZWS and not vRPantograph) then
                        Call("SetControlValue","PozadavekSberace",0,0)
                        pozadavekSberace = false
                        lin_styk = 0
                        hl_vyp = 0
                        Call("SetControlValue","HV",0,0)
                        Call("SetControlValue","LinkoveStykace",0,0)
                    end	
                else
                    Call("SetControlValue","PozadavekSberace",0,0)
                    pozadavekSberace = false
                end

                if (vykon ~= 0 and not pozadavekSberace) or gBaterie ~= 1 then
                    lin_styk = 0
                    hl_vyp = 0
                    Call("SetControlValue","HV",0,0)
                    Call("SetControlValue","LinkoveStykace",0,0)
                end
                
                if gBaterie == 1 and (gRizeni == 1 or vRZWS or Prechod) and pozadavekSberace then
                    if Call("GetControlValue","VolbaSberace",0) == 0 then
                        predniSberac = true
                    elseif Call("GetControlValue","VolbaSberace",0) == 1 then
                        zadniSberac = true	
                    elseif Call("GetControlValue","VolbaSberace",0) == 2 then
                        predniSberac = true
                        zadniSberac = true
                    end
                end
                
                if predniSberac and animaceSberac01 < 4.04 then
                    animaceSberac01 = animaceSberac01 + deltaTime
                elseif not predniSberac and animaceSberac01 > 0 and (not zadniSberac or animaceSberac02 > 4) then
                    animaceSberac01 = animaceSberac01 - deltaTime
                end
                Call("SetTime","Sberac01",animaceSberac01)
                
                if zadniSberac and animaceSberac02 < 4.04 then
                    animaceSberac02 = animaceSberac02 + deltaTime
                elseif not zadniSberac and animaceSberac02 > 0 and (not predniSberac or animaceSberac01 > 4) then
                    animaceSberac02 = animaceSberac02 - deltaTime
                end
                Call("SetTime","Sberac02",animaceSberac02)
                
                if math.max(animaceSberac01, animaceSberac02) > 4 then
                    Call("SetControlValue","PantographControl",0,1)
                else
                    Call("SetControlValue","PantographControl",0,0)
                end
            --------------Hlavni vypinac--------
                if NSdetekovana and Call("GetControlValue","LevySystem",0) ~= SYSTEM_NENI and souhlasneNapeti then
                    if significantOvladacVN >= 2.5 or vRMainSwitch then
                        Call("SetControlValue","HV",0,1)
                        Call("SetControlValue","LinkoveStykace",0,1)
                        hl_vyp = 1
                        lin_styk = 1
                    elseif significantOvladacVN <= 0.5 or (vRZWS and not vRMainSwitch) then
                        Call("SetControlValue","LinkoveStykace",0,0)
                        Call("SetControlValue","HV",0,0)
                        hl_vyp = 0
                        lin_styk = 0
                        pozadavekTopeni = false
                    elseif significantOvladacVN <= 1.5 then
                        if Call("GetControlValue","NapajeciSystem",0) > 3 then
                            Call("SetControlValue","HV",0,0)
                            hl_vyp = 0
                        end
                        Call("SetControlValue","LinkoveStykace",0,0)
                        lin_styk = 0
                    end
                else
                    Call("SetControlValue","LinkoveStykace",0,0)
                    lin_styk = 0
                end

            --------------Stradac---------------
                if gBaterie == 1 and Call("GetControlValue","HandBrake",0) > 0.5 then
                    Call("SetControlValue","StradacSvetlo",0,1)
                else
                    Call("SetControlValue","StradacSvetlo",0,0)
                end
                
                if (Call("GetControlValue","StradacZapnout",0) > 0.5 or gBaterie ~= 1) and speedometerKPH < 1 then
                    Call("SetControlValue","HandBrake",0,1)
                    stradac = true
                end
                
                if Call("GetControlValue","StradacVypnout",0) > 0.5 and gBaterie == 1 and gRizeni == 1 then
                    Call("SetControlValue","HandBrake",0,0)
                    stradac = false
                end

                if significantKombi > 0.75 and gBaterie == 1 and gRizeni == 1 and stradac then
                    timerStradac = 5
                end

                if timerStradac > 0 then
                    timerStradac = timerStradac - deltaTime
                    Call("SetControlValue","IkonkaStradac",0,1)
                else
                    timerStradac = -1
                    Call("SetControlValue","IkonkaStradac",0,0)
                end
                    
            --------------Prechod stanoviste----
                if Call("GetControlValue","PrechodStan",0) > 0.5 then
                    CasProPrechod = CasProPrechod + deltaTime
                    Prechod = true
                end
                if CasProPrechod > 30 then
                    CasProPrechod = 0
                    Prechod = false
                    Call("SetControlValue","PrechodStan",0,0)
                end
            --------------Fira------------------
                if Call("GetControlValue","CisloKab",0) == 0 then
                    Call("ActivateNode", "FiraP", 1)
                    Call("ActivateNode", "FiraZ", 0)
                else
                    Call("ActivateNode", "FiraP", 0)
                    Call("ActivateNode", "FiraZ", 1)
                end
            --------------Svetla cab------------
                if gBaterie < 0.5 then
                    ZhasniCab()
                end
            --------------Reflektor-------------
                if gBaterie == 1 then
                    if rizeniCab1 > 0.5 then
                        if significantHeadlights == 3 then
                            Call("DalkovaPP:Activate", 1)
                            Call("DalkovaPL:Activate", 1)
                            Call("ActivateNode", "DalkovaP", 1)
                            Call("DalkovaPL:SetRange", 35)
                            Call("DalkovaPP:SetRange", 35)
                        elseif significantHeadlights >= 3.05 then
                            Call("DalkovaPP:Activate", 1)
                            Call("DalkovaPL:Activate", 1)
                            Call("ActivateNode", "DalkovaP", 1)
                            Call("DalkovaPL:SetRange", 250)
                            Call("DalkovaPP:SetRange", 250)
                        else
                            Call("DalkovaPP:Activate", 0)
                            Call("DalkovaPL:Activate", 0)
                            Call("ActivateNode", "DalkovaP", 0)
                        end
                        Call("DalkovaZP:Activate", 0)
                        Call("DalkovaZL:Activate", 0)
                        Call("ActivateNode", "DalkovaZ", 0)
                    elseif rizeniCab2 > 0.5 then
                        if significantHeadlights == 3 then
                            Call("DalkovaZP:Activate", 1)
                            Call("DalkovaZL:Activate", 1)
                            Call("ActivateNode", "DalkovaZ", 1)
                            Call("DalkovaZL:SetRange", 35)
                            Call("DalkovaZP:SetRange", 35)
                        elseif significantHeadlights >= 3.05 then
                            Call("DalkovaZP:Activate", 1)
                            Call("DalkovaZL:Activate", 1)
                            Call("ActivateNode", "DalkovaZ", 1)
                            Call("DalkovaZL:SetRange", 250)
                            Call("DalkovaZP:SetRange", 250)
                        else
                            Call("DalkovaZP:Activate", 0)
                            Call("DalkovaZL:Activate", 0)
                            Call("ActivateNode", "DalkovaZ", 0)
                        end
                        Call("DalkovaPP:Activate", 0)
                        Call("DalkovaPL:Activate", 0)
                        Call("ActivateNode", "DalkovaP", 0)
                    end
                else
                    Call("DalkovaPP:Activate", 0)
                    Call("DalkovaPL:Activate", 0)
                    Call("ActivateNode", "DalkovaP", 0)	
                    Call("DalkovaZP:Activate", 0)
                    Call("DalkovaZL:Activate", 0)
                    Call("ActivateNode", "DalkovaZ", 0)
                end

            --------------Osvetleni-------------
                if gBaterie == 1 then
                    if osvetleniPristroje >= 2.5 then
                        Call("SetControlValue","Zarivky",0,1)
                    else
                        Call("SetControlValue","Zarivky",0,0)
                    end
                    if osvetleniPristroje >= 1.5 then
                        Call("SetControlValue","Kulicky",0,1)
                    else
                        Call("SetControlValue","Kulicky",0,0)
                    end
                    if osvetleniPristroje >= 3.5 then
                        Call("SetControlValue","Bodovky",0,1)
                    else
                        Call("SetControlValue","Bodovky",0,0)
                    end
                    --stanoviste I
                        if osvetleniSJRCab1 >= 0.5 then
                            Call("SvetloSJR:Activate",1)
                        else
                            Call("SvetloSJR:Activate",0)
                        end
                        if osvetleniPristrojeCab1 >= 3.5 then
                            Call("Bodovky1:Activate", 1 )
                            Call("Bodovky2:Activate", 1 )
                            Call("Bodovky3:Activate", 1 )
                        else
                            Call("Bodovky1:Activate", 0 )	
                            Call("Bodovky2:Activate", 0 )	
                            Call("Bodovky3:Activate", 0 )
                        end
                        if osvetleniPristrojeCab1 >= 2.5 then
                            Call("Zarivky:Activate",1)
                        else
                            Call("Zarivky:Activate",0)
                        end
                    --stanoviste II
                        if osvetleniSJRCab2 >= 0.5 then
                            Call("SvetloSJR02:Activate",1)
                        else
                            Call("SvetloSJR02:Activate",0)
                        end
                        if osvetleniPristrojeCab2 >= 3.5 then
                            Call("Bodovky4:Activate",1)
                            Call("Bodovky5:Activate",1)
                            Call("Bodovky6:Activate",1)
                        else
                            Call("Bodovky4:Activate",0)
                            Call("Bodovky5:Activate",0)
                            Call("Bodovky6:Activate",0)
                        end
                        if osvetleniPristrojeCab2 >= 2.5 then
                            Call("Zarivky02:Activate",1)
                        else
                            Call("Zarivky02:Activate",0)
                        end
                else
                    Call("SetControlValue","Kulicky",0,0)
                    Call("Zarivky:Activate",0)
                    Call("Zarivky02:Activate",0)
                    Call("SetControlValue","Zarivky",0,0)
                    Call("Bodovky1:Activate",0)
                    Call("Bodovky2:Activate",0)
                    Call("Bodovky3:Activate",0)
                    Call("Bodovky4:Activate",0)
                    Call("Bodovky5:Activate",0)
                    Call("Bodovky6:Activate",0)
                    Call("SetControlValue","Bodovky",0,0)
                    Call("SvetloSJR:Activate",0)
                    Call("SvetloSJR02:Activate",0)
                end

            --------------Sterace---------------
                if gBaterie == 1 then
                    if ovladaniSteraceCab1 == 3 then
                        Call("SetControlValue","SteracP",0,1)
                    elseif ovladaniSteraceCab1 == 4 then
                        Call("SetControlValue","SteracP",0,1)
                        Call("AddTime", "SteracP", deltaTime*2)
                    else
                        Call("SetControlValue","SteracP",0,0)
                    end
                    if ovladaniSteraceCab2 == 3 then
                        Call("SetControlValue","SteracZ",0,1)
                    else
                        Call("SetControlValue","SteracZ",0,0)
                    end
                end
            --------------Uspani menicu---------
                if significantKombi < 0.25 and significantKombi > -0.150 and vykon == 0 and speedometerKPH < 1 then
                    if casNeaktivniMenice > 5 then
                        neaktivniMenice = 0
                    else
                        casNeaktivniMenice = casNeaktivniMenice + deltaTime
                    end
                else
                    neaktivniMenice = 1
                    casNeaktivniMenice = 0
                end	
            --------------Kolecko tahu----------
                local tractiveEffortFromGame = Call("GetTractiveEffort")*275
                if math.abs(tractiveEffortFromGame) > 0.01 then
                    Call("SetControlValue", "KoleckoTah", 0, math.abs(tractiveEffortFromGame))
                else
                    Call("SetControlValue", "KoleckoTah", 0, 0)
                end	
            --------------Obrazovky	------------
                if gBaterie == 1 then
                    if gStartObrazovkaCas <= 15 then
                        gStartObrazovkaCas = gStartObrazovkaCas + deltaTime
                        Call("SetControlValue","Obrazovky",0,1)
                        gObrazovky = 0
                        levyDisplejStav = DISP_INIT
                        pravyDisplejStav = DISP_INIT
                    else
                        if levyDisplejStav == DISP_INIT then
                            levyDisplejStav = LD_INFO
                        end
                        if pravyDisplejStav == DISP_INIT then
                            pravyDisplejStav = PD_INFO
                        end
                        Call("SetControlValue","Obrazovky",0,2)
                        gObrazovky = 1
                    end
                else
                    Call("SetControlValue","Obrazovky",0,0)
                    gObrazovky = 0
                    gStartObrazovkaCas = 0
                    levyDisplejStav = DISP_VYP
                    pravyDisplejStav = DISP_VYP
                end
            
                if levyDisplejStav == LD_INFO then --displej je v zakladnim stavu - zobrazeni info
                    --**--**--**--**--**--**--**--IKONKA SMERU--**--**--**--**--**--**--**--**
                        if math.abs(Call("GetControlValue","UserVirtualReverser",0)-Call("GetControlValue","Reverser",0)) > 0.2 then --nesoulad navoleny - skutecny smer
                            Call("SetControlValue","LevySmer",0,SMER_NESOULAD)
                        else
                            if Call("GetControlValue","Reverser",0) == -1 then --vzad
                                Call("SetControlValue","LevySmer",0,SMER_VZAD)
                            elseif Call("GetControlValue","Reverser",0) == 0 then --neni smer
                                Call("SetControlValue","LevySmer",0,SMER_NENI)
                            elseif Call("GetControlValue","Reverser",0) == 1 then --vpred
                                Call("SetControlValue","LevySmer",0,SMER_VPRED)
                            end
                        end

                    --**--**--**--**--**--**--**--IKONKA SBERACE--**--**--**--**--**--**--**--
                        if not pozadavekSberace then --stazene sberace
                            Call("SetControlValue","LevySberace",0,SBERACE_STAZENO)
                            gCasSberacePZ20 = 0
                        else
                            if predniSberac and not zadniSberac then --predni sberac
                                Call("SetControlValue","LevySberace",0,SBERACE_ZADNI)
                                gCasSberacePZ20 = 0
                            elseif predniSberac and zadniSberac and Call("GetControlValue","SpeedometerKPH",0) < 20 then --oba sberace pod 20km/h
                                Call("SetControlValue","LevySberace",0,SBERACE_OBA)
                                gCasSberacePZ20 = 0
                            elseif predniSberac and zadniSberac then --oba sberace nad 20km/h - blikaji
                                gCasSberacePZ20 = gCasSberacePZ20 + deltaTime
                                if gCasSberacePZ20 >= 1 and gCasSberacePZ20 <= 2 then
                                    Call("SetControlValue","LevySberace",0,SBERACE_OBA_CHYBA)
                                elseif gCasSberacePZ20 > 2 then
                                    gCasSberacePZ20 = 0
                                    Call("SetControlValue","LevySberace",0,SBERACE_OBA)
                                end
                            elseif not predniSberac and zadniSberac then --zadni sberac
                                Call("SetControlValue","LevySberace",0,SBERACE_PREDNI)
                                gCasSberacePZ20 = 0
                            end
                        end
                        
                    --**--**--**--**--**--**--**--IKONKA LS--**--**--**--**--**--**--**--**--*
                        if lin_styk == 0 then
                            Call("SetControlValue","LevyLS",0,LS_VYP)
                            casChybaLS = 0
                        elseif lin_styk == 1 then
                            casChybaLS = casChybaLS + deltaTime
                            if casChybaLS < 0.65 then
                                Call("SetControlValue","LevyLS",0,LS_VYP)
                            elseif casChybaLS < 1 then
                                Call("SetControlValue","LevyLS",0,LS_POZADAVEK)
                            elseif napetiFiltru < math.min(3000, napeti) - 100 then
                                Call("SetControlValue","LevyLS",0,LS_NABIJENI)
                            else
                                casChybaLS = 2
                                Call("SetControlValue","LevyLS",0,LS_ZAP)
                            end
                        end

                    --**--**--**--**--**--**--**--IKONKA TOPENI--**--**--**--**--**--**--**--*
                        if topeniSkutecne then
                            if NS == 15 then
                                Call("SetControlValue","LevySystemTopeni",0,TOPENI_1KV)
                            else
                                Call("SetControlValue","LevySystemTopeni",0,TOPENI_3KV)
                            end
                        else
                            Call("SetControlValue","LevySystemTopeni",0,TOPENI_HIDE)
                        end

                    --**--**--**--**--**--**--**--OVLADANI TOPENI--**--**--**--**--**--**--**-
                        if casChybaLS == 2 then
                            if Call("GetControlValue","OvladaniTopeni",0) >= 0.5 and lastOvladaniTopeni < 0.5 then
                                lastOvladaniTopeni = 1
                                pozadavekTopeni = not pozadavekTopeni
                            elseif Call("GetControlValue","OvladaniTopeni",0) < 0.5 then
                                lastOvladaniTopeni = 0
                            end
                            if pozadavekTopeni then
                                if casTopeni < 1 then
                                    casTopeni = casTopeni + deltaTime
                                    Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_NESEPNUTO)
                                    Call("SetControlValue","TopeniVlaku",0,0)
                                    topeniSkutecne = false
                                else
                                    Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_ZAPNUTO)
                                    Call("SetControlValue","TopeniVlaku",0,1)
                                    topeniSkutecne = true
                                end
                            else
                                Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_PRIPRAVENE)
                                Call("SetControlValue","TopeniVlaku",0,0)
                                topeniSkutecne = false
                                casTopeni = 0
                            end
                        else 
                            Call("SetControlValue","TopeniVlaku",0,0)
                            topeniSkutecne = false
                            casTopeni = 0
                            if pozadavekTopeni then
                                casTopeniHold = casTopeniHold + deltaTime
                                if casTopeniHold > 0.5 then
                                    casTopeniHold = 0
                                    if Call("GetControlValue","LevyTopeniOvladani",0) == TOPENI_OVLADANI_HIDE then
                                        Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_NESEPNUTO)
                                    else
                                        Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_HIDE)
                                    end
                                end
                            else
                                Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_UZEMNENO)
                            end
                        end
                    --**--**--**--**--**--**--**--IKONA ZVEDANI SBERACE--**--**--**--**--**--*
                        if pozadavekSberace and Call("GetControlValue","PantographControl",0) == 0 then
                            Call("SetControlValue","LevyZvedameSberac",0,ZVEDANI_VISIBLE)
                        else
                            Call("SetControlValue","LevyZvedameSberac",0,ZVEDANI_HIDE)
                        end
                    --**--**--**--**--**--**--**--IKONA VYBEH--**--**--**--**--**--**--**--**-
                        if significantKombi == 0 then
                            Call("SetControlValue","LevyVybeh",0,VYBEH_VISIBLE)
                        else
                            Call("SetControlValue","LevyVybeh",0,VYBEH_HIDE)
                        end
                    --**--**--**--**--**--**--**--IKONA PREFERENCE--**--**--**--**--**--**--**
                        if bylaBrzda then
                            Call("SetControlValue","LevyPreferenceBrzdeni",0,PREFERENCE_VISIBLE)
                        else
                            Call("SetControlValue","LevyPreferenceBrzdeni",0,PREFERENCE_HIDE)
                        end
                    --**--**--**--**--**--**--**--UKAZATEL U--**--**--**--**--**--**--**--**--
                        --napeti = napeti * (NS/3)
                        local napetiText = math.floor(napeti/100)
                        if napetiText == 0 then
                            napetiText = "XX00"
                        end
                        while string.len(napetiText) < 4 do
                            napetiText = "X"..napetiText
                        end
                        Call("NapetiPXXX:SetText", napetiText)
                        Call("NapetiZXXX:SetText", napetiText)

                    --**--**--**--**--**--**--**--UKAZATEL I--**--**--**--**--**--**--**--**--
                        local proudText = math.min(math.floor(math.abs(Ammeter)),99999)
                        while string.len(proudText) < 5 do
                        	proudText = "X"..proudText
                        end
                        Call("ProudPXXXX:SetText", proudText)
                        Call("ProudZXXXX:SetText", proudText)

                    if Call("GetControlValue","Levy2",0) >= 0.5 and levy2last == 0 then
                        levyDisplejStav = LD_NASTAVENI
                        levy2last = 1
                    elseif Call("GetControlValue","Levy2",0) < 0.5 then
                        levy2last = 0
                    end
                else --displej neni v zakladnim stavu - schovat ikonky
                    Call("SetControlValue","LevySmer",0,SMER_HIDE)
                    Call("SetControlValue","LevySberace",0,SBERACE_HIDE)
                    -- Call("SetControlValue","LevySystem",0,SYSTEM_HIDE)
                    -- Call("SetControlValue","LevyHV",0,HV_HIDE)
                    Call("SetControlValue","LevyNapeti",0,NAPETI_HIDE)
                    Call("SetControlValue","LevyLS",0,LS_HIDE)
                    Call("SetControlValue","LevySystemTopeni",0,TOPENI_HIDE)
                    Call("SetControlValue","LevyTopeniOvladani",0,TOPENI_OVLADANI_HIDE)
                    Call("SetControlValue","LevyZvedameSberac",0,ZVEDANI_HIDE)
                    Call("SetControlValue","LevyVybeh",0,VYBEH_HIDE)
                    Call("SetControlValue","LevyPreferenceBrzdeni",0,PREFERENCE_HIDE)
                    -- Call("SetControlValue","LevyTah",0,TAH_HIDE)
                    Call("NapetiPXXX:SetText", "XXX")
                    Call("ProudPXXXX:SetText", "XXXX")
                    Call("NapetiZXXX:SetText", "XXX")
                    Call("ProudZXXXX:SetText", "XXXX")
                    if gObrazovky == 0 then
                        Call("SetControlValue","TopeniVlaku",0,0)
                        pozadavekTopeni = false
                        topeniSkutecne = false
                        casTopeni = 0
                        gCasSberacePZ20 = 0
                        casChybaLS = 0
                    end
                end

                --**--**--**--**--**--**--**--IKONKA SYSTEMU--**--**--**--**--**--**--**--
                    if Call("GetControlValue", "NapajeciSystemNav", 0) > 0 and NSdetekovana then
                        if napetiFiltru > 0 and Call("GetControlValue", "NapajeciSystemNav", 0) ~= NS then
                            lin_styk = 0
                            hl_vyp = 0
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                        end
                        Call("SetControlValue","NapajeciSystem",0,Call("GetControlValue", "NapajeciSystemNav", 0))
                        NS = Call("GetControlValue", "NapajeciSystemNav", 0)
                    end
                
                    if Call("GetControlValue","PantographControl",0) == 1 then --dotek sberace troleje
                        if gCasDetekceNS < 1 then --zpozdeni indikace systemu
                            gCasDetekceNS = gCasDetekceNS + deltaTime
                            Call("SetControlValue","LevySystem",0,SYSTEM_NENI)
                            souhlasneNapeti = false
                            vRPantographRaised = false
                        else
                            NSdetekovana = true
                            if (Call("GetControlValue", "NapajeciSystemNav", 0) ~= 0 and not (Call("GetControlValue", "NapajeciSystemNav", 0) == 3 and ((narodniVolba > 4 and narodniVolba ~= 7) or narodniVolba == 3)) and not (Call("GetControlValue", "NapajeciSystemNav", 0) == 15 and narodniVolba < 5) and not (Call("GetControlValue", "NapajeciSystemNav", 0) == 25 and narodniVolba > 3 and narodniVolba ~= 7)) or Call("GetControlValue", "NapajeciSystemNav", 0) == -1 and hl_vyp == 0 then
                                souhlasneNapeti = true
                                vRPantographRaised = true
                            elseif Call("GetControlValue", "NapajeciSystemNav", 0) ~= 0 then
                                lin_styk = 0
                                hl_vyp = 0
                                Call("SetControlValue","HV",0,0)
                                Call("SetControlValue","LinkoveStykace",0,0)
                                souhlasneNapeti = false
                            else
                                vRPantographRaised = false
                                souhlasneNapeti = false
                            end
                            if Call("GetControlValue", "NapajeciSystemNav", 0) ~= 0 then
                                if NS == 3 then
                                    Call("SetControlValue","LevySystem",0,SYSTEM_3KV)
                                elseif NS == 15 then
                                    Call("SetControlValue","LevySystem",0,SYSTEM_15KV)
                                elseif NS == 25 then
                                    Call("SetControlValue","LevySystem",0,SYSTEM_25KV)
                                else
                                    Call("SetControlValue","LevySystem",0,SYSTEM_NENI)
                                end
                            else
                                Call("SetControlValue","LevySystem",0,SYSTEM_NENI)
                            end
                        end
                    else
                        Call("SetControlValue","LevySystem",0,0)
                        gCasDetekceNS = 0
                        NSdetekovana = false
                        vRPantographRaised = false
                        souhlasneNapeti = false
                    end
                    if vRPantographRaised ~= vRPantographRaisedOld then
                        vRPantographRaisedOld = vRPantographRaised
                        if vRPantographRaised then
                            Call("SendConsistMessage", 895059, "1", 0)
                            Call("SendConsistMessage", 895059, "1", 1)
                        else
                            Call("SendConsistMessage", 895059, "0", 0)
                            Call("SendConsistMessage", 895059, "0", 1)
                        end
                    end

                --**--**--**--**--**--**--**--IKONKA HV--**--**--**--**--**--**--**--**--*
                    if hl_vyp == 0 then
                        Call("SetControlValue","LevyHV",0,HV_VYP)
                        if uzemnenaLoko then
                            Call("SetControlValue","LevyNapeti",0,NAPETI_UZEM)
                        else
                            Call("SetControlValue","LevyNapeti",0,NAPETI_NENI)
                        end
                        casChybaHV = 0
                    elseif hl_vyp == 1 then
                        casChybaHV = casChybaHV + deltaTime
                        if casChybaHV > 0.5 then
                            Call("SetControlValue","LevyNapeti",0,NAPETI_OK)
                        else
                            Call("SetControlValue","LevyNapeti",0,NAPETI_NENI)
                        end

                        if casChybaHV < 0.25 then
                            Call("SetControlValue","LevyHV",0,HV_VYP)
                        elseif casChybaHV < 0.85 then
                            Call("SetControlValue","LevyHV",0,HV_PORUCHA)
                        else
                            casChybaHV = 1
                            Call("SetControlValue","LevyHV",0,HV_ZAP)
                        end
                    end
                
                --**--**--**--**--**--**--**--IKONA kN--**--**--**--**--**--**--***--**--*
                    if hl_vyp*lin_styk == 1 and math.abs(Call("GetControlValue","UserVirtualReverser",0)-Call("GetControlValue","Reverser",0)) < 0.2 then
                        if gCasNahozeni <= 5 then
                            gCasNahozeni = gCasNahozeni + deltaTime
                        end
                    else
                        gCasNahozeni = 0
                    end
                    if (1-Call("GetControlValue","HandBrake",0))*neaktivniMenice == 1 and gCasNahozeni > 5 then
                        Call("SetControlValue","LevyTah",0,TAH_LZE)
                        if NS == 15 or NS == 25 then
                            Call("EngineSound:SetParameter", "4Q", 1)
                        else
                            Call("EngineSound:SetParameter", "4Q", 0)
                        end
                    else
                        Call("SetControlValue","LevyTah",0,TAH_NELZE)
                        Call("EngineSound:SetParameter", "4Q", 0)
                    end

                if levyDisplejStav ~= DISP_INIT and levyDisplejStav ~= DISP_VYP then
                    if Call("GetControlValue", "HelpTlac", 0) > 0.5 and not helpLast then
                        helpLast = true
                        if Call("GetControlValue", "HelpStav", 0) == 0 then
                            Call("SetControlValue", "HelpStav", 0, 1)
                            Call("EngineSound:SetParameter", "Befehl40Taste", 0)
                        elseif Call("GetControlValue", "HelpStav", 0) == 1 then
                            Call("SetControlValue", "HelpStav", 0, 2)
                            Call("EngineSound:SetParameter", "Befehl40Taste", 1)
                        elseif Call("GetControlValue", "HelpStav", 0) == 2 then
                            Call("SetControlValue", "HelpStav", 0, 0)
                            Call("EngineSound:SetParameter", "Befehl40Taste", 0)
                        end
                    elseif Call("GetControlValue", "HelpTlac", 0) < 0.5 then
                        helpLast = false
                    end
                else
                    Call("SetControlValue", "HelpStav", 0, 0)
                    Call("EngineSound:SetParameter", "Befehl40Taste", 0)
                end

                if levyDisplejStav == LD_NASTAVENI then
                    Call("SetControlValue","DisplejLevyNastaveni",0,1)
                    if Call("GetControlValue","Levy0",0) >= 0.5 and levy0last == 0 then
                        levyDisplejStav = LD_INFO
                        levy0last = 1
                    elseif Call("GetControlValue","Levy0",0) < 0.5 then
                        levy0last = 0
                    end
                    if Call("GetControlValue","LevySberaceTlac",0) >= 0.5 and levySberaceLast == 0 then
                        levyDisplejStav = LD_SBERACE
                        levySberaceLast = 1
                    elseif Call("GetControlValue","LevySberaceTlac",0) < 0.5 then
                        levySberaceLast = 0
                    end
                else
                    Call("SetControlValue","DisplejLevyNastaveni",0,0)
                end

                if levyDisplejStav == LD_SBERACE then
                    Call("SetControlValue","DisplejLevySberace",0,1)
                    if Call("GetControlValue","LevySberaceTlac",0) >= 0.5 and levySberaceLast == 0 then
                        levySberaceLast = 1
                        if zvolenySberac == 0 then
                            zvolenySberac = 1
                            Call("SetControlValue","VolbaSberace",0,0)
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "", "Zvolen predni sberac", 2, 0)
                        elseif zvolenySberac == 1 then
                            zvolenySberac = 2
                            Call("SetControlValue","VolbaSberace",0,1)
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "", "Zvolen zadni sberac", 2, 0)
                        elseif zvolenySberac == 2 then
                            zvolenySberac = 3
                            Call("SetControlValue","VolbaSberace",0,2)
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "", "Zvoleny oba sberace", 2, 0)
                        else
                            zvolenySberac = 0
                            -- SysCall("ScenarioManager:ShowAlertMessageExt", "", "Zvoleny auto rezim sberacu", 2, 0)
                        end
                    elseif Call("GetControlValue","LevySberaceTlac",0) < 0.5 then
                        levySberaceLast = 0
                    end
                    Call("SetControlValue","DisplejLevyZvolenySberac",0,zvolenySberac)
                    if Call("GetControlValue","Levy0",0) >= 0.5 and levy0last == 0 then
                        levyDisplejStav = LD_NASTAVENI
                        levy0last = 1
                    elseif Call("GetControlValue","Levy0",0) < 0.5 then
                        levy0last = 0
                    end
                else
                    Call("SetControlValue","DisplejLevySberace",0,0)
                    Call("SetControlValue","DisplejLevyZvolenySberac",0,0)
                end
                
                if Call("GetControlValue", "NapajeciSystemNav", 0) == -1 then
                    if narodniVolba == 1 then --CZ
                        if NaVoLast == true then
                            Call("SetControlValue", "NapajeciSystem", 0, 25)
                        else
                            Call("SetControlValue", "NapajeciSystem", 0, 3)
                        end
                    elseif narodniVolba == 2 then --SK
                        if NaVoLast == true then
                            Call("SetControlValue", "NapajeciSystem", 0, 25)
                        else
                            Call("SetControlValue", "NapajeciSystem", 0, 3)
                        end
                    elseif narodniVolba == 3 then --HU
                        Call("SetControlValue", "NapajeciSystem", 0, 25)
                        NaVoLast = true
                    elseif narodniVolba == 4 then --PL
                        Call("SetControlValue", "NapajeciSystem", 0, 3)
                        NaVoLast = false
                    elseif narodniVolba == 5 then --DE
                        Call("SetControlValue", "NapajeciSystem", 0, 15)
                        NaVoLast = false
                    elseif narodniVolba == 6 then --AT
                        Call("SetControlValue", "NapajeciSystem", 0, 15)
                        NaVoLast = true
                    else --ZZO
                        -- Call("SetControlValue", "NapajeciSystem", 0, 25)
                    end
                end

                if zvolenySberac == 0 then
                    if NS == 15 or NS == 25 then
                        Call("SetControlValue","VolbaSberace",0,0)
                    elseif speedometerKPH > 5 or not pozadavekTopeni then
                        Call("SetControlValue","VolbaSberace",0,1)
                    else
                        Call("SetControlValue","VolbaSberace",0,2)
                    end
                end
                
                if pravyDisplejStav == PD_INFO then --displej je v zakladnim stavu - zobrazeni info
                    --**--**--**--**--**--**--**--IKONA STAV--**--**--**--**--**--**--**--**--
                        if pozadavekSberace then
                            if Call("GetControlValue","PantographControl",0) == 0 or (Call("GetControlValue", "NapajeciSystemNav", 0) == 0 or (Call("GetControlValue", "NapajeciSystemNav", 0) == 3 and narodniVolba > 4 or narodniVolba == 3) or (Call("GetControlValue", "NapajeciSystemNav", 0) == 15 and narodniVolba < 5) or (Call("GetControlValue", "NapajeciSystemNav", 0) == 25 and narodniVolba > 3) and NSdetekovana and Call("GetControlValue", "NapajeciSystemNav", 0) ~= -1) then
                                Call("SetControlValue","PredniDisSberac",0,STAV_NAHORE)
                            elseif lin_styk == 0 then
                                Call("SetControlValue","PredniDisSberac",0,STAV_BEZ_kN)
                            elseif podminkaJizdy then
                                Call("SetControlValue","PredniDisSberac",0,STAV_kN)
                            end
                        else
                            Call("SetControlValue","PredniDisSberac",0,STAV_DOLE)
                        end
                    --**--**--**--**--**--**--**--IKONA TOPENI--**--**--**--**--**--**--**--**
                        if pozadavekTopeni and not topeniSkutecne then
                            Call("SetControlValue","PredniTopeni",0,TOPENI_PREDNI_NESEPNUTO)
                        elseif pozadavekTopeni and topeniSkutecne then
                            Call("SetControlValue","PredniTopeni",0,TOPENI_PREDNI_ZAP)
                        else
                            Call("SetControlValue","PredniTopeni",0,TOPENI_PREDNI_UZEM)
                        end
                    --**--**--**--**--**--**--**--RUCICKA ARR--**--**--**--**--**--**--**--**-
                        if Call("GetControlValue","RezimARR",0) >= 1 then
                            Call("SetControlValue","ZobrazRuckaARR",0,1)
                        else
                            Call("SetControlValue","ZobrazRuckaARR",0,0)
                        end
                    --**--**--**--**--**--**--**--RYCHLOMER--**--**--**--**--**--**--**--**--*
                        Call("SetControlValue","ZobrazRychlomer",0,1)
                    --**--**--**--**--**--**--**--NARODNI VOLBA--**--**--**--**--**--**--**--*
                        if Call("GetControlValue","Pravy7",0) == 1 then
                            pravyDisplejStav = PD_NAVO
                        end
                    --**--**--**--**--**--**--**--KPJ ODPOCET--**--**--**--**--**--**--**--**-
                        if Call("GetControlValue", "KPJ", 0) > 0.5 and not kpjOld then
                            KPJ:startCounting(Call("GetConsistLength"))
                            kpjOld = true
                        elseif Call("GetControlValue", "KPJ", 0) < 0.5 then
                            kpjOld = false
                        end
                    --**--**--**--**--**--**--**--IKONA PARKOVACKA--**--**--**--**--**--**--**
                        if parkovacka == 0.47 then
                            Call("SetControlValue", "ParkovackaZobraz", 0, 1)
                        else
                            Call("SetControlValue", "ParkovackaZobraz", 0, 0)
                        end
                    --**--**--**--**--**--**--**--POTVRZENI NaVo--**--**--**--**--**--**--**--
                        if narodniVolbaPredvolena then
                            Call("SetControlValue", "PotvrzeniPredvolby", 0, 1)
                        else
                            Call("SetControlValue", "PotvrzeniPredvolby", 0, 0)
                        end
                        if Call("GetControlValue", "PotvrzeniPredvolbyTlac", 0) > 0.5 and narodniVolbaPredvolena then
                            if narodniVolbaPredvolba > 0 and narodniVolbaPredvolba < 5 then
                                pendingRequestOnMIRELStart = true
                            end
                            narodniVolba = narodniVolbaPredvolba
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                            narodniVolbaPredvolena = false
                        end
                else --displej neni v zakladnim stavu - schovat ikonky  
                    Call("SetControlValue","PredniDisSberac",0,STAV_HIDE)
                    Call("SetControlValue","PredniTopeni",0,TOPENI_PREDNI_HIDE)
                    Call("SetControlValue","ZobrazRuckaARR",0,0)
                    Call("SetControlValue","ZobrazRychlomer",0,0)
                    Call("SetControlValue", "PotvrzeniPredvolby", 0, 0)
                    KPJ:turnOff()
                end

                if pravyDisplejStav == PD_NAVO then --displej je v rezimu narodni volby
                    Call("SetControlValue","DisplejPredni",0,1)
                    if Call("GetControlValue","Pravy0",0) == 1 then
                        pravyDisplejStav = PD_INFO
                    end
                    if Call("GetControlValue", "Pravy8", 0) > 0.5 then
                        narodniVolbaPredvolena = true
                        narodniVolbaPredvolenaMenu = true
                    end
                    if Call("GetControlValue", "NarodniVolbaCZ", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 1
                        else
                            narodniVolba = 1
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    elseif Call("GetControlValue", "NarodniVolbaSK", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 2
                        else
                            narodniVolba = 2
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    elseif Call("GetControlValue", "NarodniVolbaHU", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 3
                        else
                            narodniVolba = 3
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    elseif Call("GetControlValue", "NarodniVolbaPL", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 4
                        else
                            narodniVolba = 4
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    elseif Call("GetControlValue", "NarodniVolbaDE", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 5
                            pendingRequestOnPZBStart = true
                        else
                            narodniVolba = 5
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    elseif Call("GetControlValue", "NarodniVolbaAT", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 6
                            pendingRequestOnPZBStart = true
                        else
                            narodniVolba = 6
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    elseif Call("GetControlValue", "NarodniVolbaZZO", 0) > 0.5 then
                        if narodniVolbaPredvolenaMenu then
                            narodniVolbaPredvolba = 7
                        else
                            narodniVolba = 7
                            narodniVolbaPredvolba = 0
                            lin_styk = 0
                            hl_vyp = 0
                            pozadavekSberace = false
                            Call("SetControlValue","HV",0,0)
                            Call("SetControlValue","LinkoveStykace",0,0)
                            Call("SetControlValue","PozadavekSberace",0,0)
                        end
                    end
                    Call("SetControlValue", "NarodniVolbaZvolena", 0, narodniVolba)
                    if narodniVolbaPredvolenaMenu then
                        Call("SetControlValue", "NarodniVolbaPredvolena", 0, narodniVolbaPredvolba)
                    else
                        Call("SetControlValue", "NarodniVolbaPredvolena", 0, 0)
                    end
                else --displej neni v rezimu narodni volby
                    Call("SetControlValue", "DisplejPredni", 0, 0)
                    Call("SetControlValue", "NarodniVolbaZvolena", 0, 0)
                    Call("SetControlValue", "NarodniVolbaPredvolena", 0, 0)
                    narodniVolbaPredvolenaMenu = false
                end
                Call("SetControlValue", "NarodniVolba", 0, narodniVolba)
                        
                if gBaterie == 1 then
                    if Call("GetControlValue","SipkaDoluPravy",0) > 0 then
                        roletka = roletka + deltaTime
                        Call("SetControlValue","Roletka",0,roletka)
                    end
                    if Call("GetControlValue","SipkaNahoruPravy",0) > 0 then
                        roletka = roletka - deltaTime
                        Call("SetControlValue","Roletka",0,roletka)
                    end
                else
                    narodniVolbaPredvolena = false
                    narodniVolbaPredvolenaMenu = false
                end
            --------------DVERE-----------------
                Call("SetTime","Dvere01L",dvereLcab1)
                Call("SetTime","Dvere01P",dverePcab1)
                Call("SetTime","Dvere02L",dvereLcab2)
                Call("SetTime","Dvere02P",dverePcab2)
                Call("SetControlValue","DvereAbsHlasitost",0,math.max(dvereL, dvereP))
            --------------STOP------------------
                if Call("GetControlValue","Stop",0) == 1 then
                    lin_styk = 0
                    hl_vyp = 0
                    Call("SetControlValue","HV",0,0)
                    Call("SetControlValue","LinkoveStykace",0,0)
                    gOvladaniSberacu = 0
                    Call("SetControlValue","PozadavekSberace",0,0)
                    uzemnenaLoko = true
                    pozadavekTopeni = false
                end
                if gRizeni ~= 1 or gBaterie ~= 1 then
                    lin_styk = 0
                    hl_vyp = 0
                    Call("SetControlValue","HV",0,0)
                    Call("SetControlValue","LinkoveStykace",0,0)
                    gOvladaniSberacu = 0
                    Call("SetControlValue","PozadavekSberace",0,0)
                    pozadavekTopeni = false
                end
            --------------Podsviceni klavesnice-
                if Call("GetControlValue","OsvetleniPristroje",0) ~= 1 then
                    if Call("GetControlValue","RezimARR",0) == 0 then
                        Call("SetControlValue","KlavPodsviceni",0,1)
                    elseif Call("GetControlValue","RezimARR",0) <= 1 then
                        Call("SetControlValue","KlavPodsviceni",0,2)
                    else
                        Call("SetControlValue","KlavPodsviceni",0,3)
                    end
                else
                    Call("SetControlValue","KlavPodsviceni",0,0)
                end

            --------------KOMBINACE SVETEL------
                light_blink_counter = light_blink_counter + deltaTime
                if light_blink_counter > 0.5 then
                    light_blink_counter = 0
                    light_blink_state = not light_blink_state
                end
                
                if significantSvetla == 6 and gBaterie == 1 and significantHeadlights > 0.5 then
                    horn_blink_counter = horn_blink_counter + deltaTime
                    if horn_blink_counter > 1.5 then
                        horn_blink_counter = 0
                        horn_blink_state = not horn_blink_state
                    end
                else
                    horn_blink_counter = 1.5
                    horn_blink_state = false
                end

                if gBaterie == 1 and significantHeadlights > 0.5 then
                    if rizeniCab1 > 0.5 then
                        --predni pozicky
                            --bila leva
                                if significantSvetla == 0 or significantSvetla == 1 or significantSvetla == 2 or significantSvetla == 3 
                                or significantSvetla == 4 or (significantSvetla == 9 and light_blink_state) or significantPozPP > 1.5 then
                                    Call("ZlutaPravaVpred:Activate", 1)
                                    Call("ActivateNode", "PozPP", 1)
                                else
                                    Call("ZlutaPravaVpred:Activate", 0)
                                    Call("ActivateNode", "PozPP", 0)
                                end
                            --cervena leva
                                if significantSvetla == 7 or significantSvetla == 8 or significantPozPP < 0.5 then
                                    Call("CervenaPravaVzad:Activate", 1)
                                    Call("ActivateNode", "KoncovePP", 1)
                                else
                                    Call("CervenaPravaVzad:Activate", 0)
                                    Call("ActivateNode", "KoncovePP", 0)
                                end
                            --bila prava
                                if significantSvetla == 0 or significantSvetla == 2 or significantSvetla == 3 or significantSvetla == 4
                                or (significantSvetla == 9 and light_blink_state) or significantSvetla == 10 or significantPozPL > 1.5 then
                                    Call("ZlutaLevaVpred:Activate", 1)
                                    Call("ActivateNode", "PozPL", 1)
                                else
                                    Call("ZlutaLevaVpred:Activate", 0)
                                    Call("ActivateNode", "PozPL", 0)
                                end
                            --cervena prava
                                if significantSvetla == 6 or significantSvetla == 7 or significantSvetla == 8 or significantPozPL < 0.5 then
                                    Call("CervenaLevaVzad:Activate", 1)
                                    Call("ActivateNode", "KoncovePL", 1)
                                else
                                    Call("CervenaLevaVzad:Activate", 0)
                                    Call("ActivateNode", "KoncovePL", 0)
                                end
                            --horni
                                if significantSvetla == 0 or significantSvetla == 3 or significantSvetla == 4 or (significantSvetla == 6 and light_blink_state)
                                or significantSvetla == 8 or significantPozHorni < 0.5 then
                                    Call("ZlutaHorniP:Activate", 1)
                                    Call("ActivateNode", "PozHorniP", 1)
                                else
                                    Call("ZlutaHorniP:Activate", 0)
                                    Call("ActivateNode", "PozHorniP", 0)
                                end
                        --zadni pozicky
                            --bila leva
                                if significantSvetla == 0 or significantSvetla == 1 or significantSvetla == 2 or (significantSvetla == 9 and light_blink_state) or significantPozZP > 1.5 then
                                    Call("ZlutaLevaVzad:Activate", 1)
                                    Call("ActivateNode", "PozZP", 1)
                                else
                                    Call("ZlutaLevaVzad:Activate", 0)
                                    Call("ActivateNode", "PozZP", 0)
                                end
                            --cervena leva
                                if significantSvetla == 4 or significantSvetla == 5 or significantSvetla == 8 or significantPozZP < 0.5 then
                                    Call("CervenaLevaVpred:Activate", 1)
                                    Call("ActivateNode", "KoncoveZP", 1)
                                else
                                    Call("CervenaLevaVpred:Activate", 0)
                                    Call("ActivateNode", "KoncoveZP", 0)
                                end
                            --bila prava
                                if significantSvetla == 0 or significantSvetla == 2 or (significantSvetla == 9 and light_blink_state) or significantSvetla == 10 or significantPozZL > 1.5 then
                                    Call("ZlutaPravaVzad:Activate", 1)
                                    Call("ActivateNode", "PozZL", 1)
                                else
                                    Call("ZlutaPravaVzad:Activate", 0)
                                    Call("ActivateNode", "PozZL", 0)
                                end
                            --cervena prava
                                if significantSvetla == 4 or significantSvetla == 5 or significantSvetla == 6 or significantSvetla == 8 or significantPozZL < 0.5 then
                                    Call("CervenaPravaVpred:Activate", 1)
                                    Call("ActivateNode", "KoncoveZL", 1)
                                else
                                    Call("CervenaPravaVpred:Activate", 0)
                                    Call("ActivateNode", "KoncoveZL", 0)
                                end
                            --horni
                                if significantSvetla == 0 or (significantSvetla == 6 and light_blink_state) or significantSvetla == 8 or significantPozHorni > 1.5 then
                                    Call("ZlutaHorniZ:Activate", 1)
                                    Call("ActivateNode", "PorHorniZ", 1)
                                else
                                    Call("ZlutaHorniZ:Activate", 0)
                                    Call("ActivateNode", "PorHorniZ", 0)
                                end
                    elseif rizeniCab2 > 0.5 then
                        --predni pozicky
                            --bila leva
                                if significantSvetla == 0 or significantSvetla == 1 or significantSvetla == 2 or significantSvetla == 3 
                                or significantSvetla == 4 or (significantSvetla == 9 and light_blink_state) or significantPozZP > 1.5 then
                                    Call("ZlutaLevaVzad:Activate", 1)
                                    Call("ActivateNode", "PozZP", 1)
                                else
                                    Call("ZlutaLevaVzad:Activate", 0)
                                    Call("ActivateNode", "PozZP", 0)
                                end
                            --cervena leva
                                if significantSvetla == 7 or significantSvetla == 8 or significantPozZP < 0.5 then
                                    Call("CervenaLevaVpred:Activate", 1)
                                    Call("ActivateNode", "KoncoveZP", 1)
                                else
                                    Call("CervenaLevaVpred:Activate", 0)
                                    Call("ActivateNode", "KoncoveZP", 0)
                                end
                            --bila prava
                                if significantSvetla == 0 or significantSvetla == 2 or significantSvetla == 3 or significantSvetla == 4
                                or (significantSvetla == 9 and light_blink_state) or significantSvetla == 10 or significantPozZL > 1.5 then
                                    Call("ZlutaPravaVzad:Activate", 1)
                                    Call("ActivateNode", "PozZL", 1)
                                else
                                    Call("ZlutaPravaVzad:Activate", 0)
                                    Call("ActivateNode", "PozZL", 0)
                                end
                            --cervena prava
                                if significantSvetla == 6 or significantSvetla == 7 or significantSvetla == 8 or significantPozZL < 0.5 then
                                    Call("CervenaPravaVpred:Activate", 1)
                                    Call("ActivateNode", "KoncoveZL", 1)
                                else
                                    Call("CervenaPravaVpred:Activate", 0)
                                    Call("ActivateNode", "KoncoveZL", 0)
                                end
                            --horni
                                if significantSvetla == 0 or significantSvetla == 3 or significantSvetla == 4 or (significantSvetla == 6 and light_blink_state)
                                or significantSvetla == 8 or significantPozHorni > 1.5 then
                                    Call("ZlutaHorniZ:Activate", 1)
                                    Call("ActivateNode", "PorHorniZ", 1)
                                else
                                    Call("ZlutaHorniZ:Activate", 0)
                                    Call("ActivateNode", "PorHorniZ", 0)
                                end
                        --zadni pozicky
                            --bila leva
                                if significantSvetla == 0 or significantSvetla == 1 or significantSvetla == 2 or (significantSvetla == 9 and light_blink_state) or significantPozPP > 1.5 then
                                    Call("ZlutaPravaVpred:Activate", 1)
                                    Call("ActivateNode", "PozPP", 1)
                                else
                                    Call("ZlutaPravaVpred:Activate", 0)
                                    Call("ActivateNode", "PozPP", 0)
                                end
                            --cervena leva
                                if significantSvetla == 4 or significantSvetla == 5 or significantSvetla == 8 or significantPozPP < 0.5 then
                                    Call("CervenaPravaVzad:Activate", 1)
                                    Call("ActivateNode", "KoncovePP", 1)
                                else
                                    Call("CervenaPravaVzad:Activate", 0)
                                    Call("ActivateNode", "KoncovePP", 0)
                                end
                            --bila prava
                                if significantSvetla == 0 or significantSvetla == 2 or (significantSvetla == 9 and light_blink_state) or significantSvetla == 10 or significantPozPL > 1.5 then
                                    Call("ZlutaLevaVpred:Activate", 1)
                                    Call("ActivateNode", "PozPL", 1)
                                else
                                    Call("ZlutaLevaVpred:Activate", 0)
                                    Call("ActivateNode", "PozPL", 0)
                                end
                            --cervena prava
                                if significantSvetla == 4 or significantSvetla == 5 or significantSvetla == 6 or significantSvetla == 8 or significantPozPL < 0.5 then
                                    Call("CervenaLevaVzad:Activate", 1)
                                    Call("ActivateNode", "KoncovePL", 1)
                                else
                                    Call("CervenaLevaVzad:Activate", 0)
                                    Call("ActivateNode", "KoncovePL", 0)
                                end
                            --horni
                                if significantSvetla == 0 or (significantSvetla == 6 and light_blink_state) or significantSvetla == 8 or significantPozHorni < 0.5 then
                                    Call("ZlutaHorniP:Activate", 1)
                                    Call("ActivateNode", "PozHorniP", 1)
                                else
                                    Call("ZlutaHorniP:Activate", 0)
                                    Call("ActivateNode", "PozHorniP", 0)
                                end
                    end
                            
                    if rizeniCab1 > 0.5 then
                        if pred and za then
                            if (significantSvetla == 5 or significantSvetla == 4 or significantSvetla == 3)
                                or ((significantPozZP < 0.5 and significantPozZL < 0.5) or (significantPozPL > 1.5 and significantPozPP > 1.5 and significantPozHorni < 0.5))
                                and significantPozPP > 0.5 and significantPozPL > 0.5 and significantPozZL < 1.5 and significantPozZP < 1.5 and significantPozHorni < 1.5 then
                                    Call("SetControlValue", "Headlights", 0, 1)
                            elseif significantSvetla == 7
                                or ((significantPozPP < 0.5 and significantPozPL < 0.5) or (significantPozZL > 1.5 and significantPozZP > 1.5 and significantPozHorni > 1.5))
                                and significantPozPP < 1.5 and significantPozPL < 1.5 and significantPozZL > 0.5 and significantPozZP > 0.5 and significantPozHorni > 0.5 then
                                    Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        elseif pred then
                            if (significantSvetla == 10 or significantSvetla == 5 or significantSvetla == 4 or significantSvetla == 3 or significantSvetla == 2 or significantSvetla == 1 or significantSvetla == 0
                                or (((significantPozZP > 1.5 or significantPozZL > 1.5) or (significantPozZP < 0.5 and significantPozZL < 0.5)) and significantPozHorni < 1.5 and significantPozHorni > 0.5 and significantSvetla == 11))
                                and significantPozPP > 0.5 and significantPozPL > 0.5 and significantPozHorni < 1.5 then
                                    Call("SetControlValue", "Headlights", 0, 1)
                            elseif (significantSvetla == 7 
                                or (significantPozZP > 1.5 and significantPozZL > 1.5 and significantPozHorni > 1.5 and significantSvetla == 11))
                                and significantPozPP < 1.5 and significantPozPL < 1.5 and significantPozZL > 0.5 and significantPozZP > 0.5 and significantPozHorni > 0.5 then
                                    Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        elseif za then
                            if (significantSvetla == 5 or significantSvetla == 4 or significantSvetla == 3
                                or (significantPozPL > 1.5 and significantPozPP > 1.5 and significantPozHorni > 1.5))
                                and significantPozPP > 0.5 and significantPozPL > 0.5 and significantPozZL < 1.5 and significantPozZP < 1.5 and significantPozHorni > 0.5 then
                                    Call("SetControlValue", "Headlights", 0, 1)
                            elseif (significantSvetla == 10 or significantSvetla == 7 or significantSvetla == 2 or significantSvetla == 1 or significantSvetla == 0)
                                and significantPozPP == significantPozPL and significantPozZL > 0.5 and significantPozZP > 0.5 and significantPozHorni > 0.5 and significantPozHorni < 1.5 then
                                    Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        else
                            Call("SetControlValue", "Headlights", 0, 0)
                        end
                    elseif rizeniCab2 > 0.5 then
                        if pred and za then
                            if (significantSvetla == 5 or significantSvetla == 4 or significantSvetla == 3)
                                or ((significantPozZP < 0.5 and significantPozZL < 0.5) or (significantPozPL > 1.5 and significantPozPP > 1.5 and significantPozHorni < 0.5))
                                and significantPozPP > 0.5 and significantPozPL > 0.5 and significantPozZL < 1.5 and significantPozZP < 1.5 and significantPozHorni < 1.5 then
                                    Call("SetControlValue", "Headlights", 0, 1)
                            elseif significantSvetla == 7
                                or ((significantPozPP < 0.5 and significantPozPL < 0.5) or (significantPozZL > 1.5 and significantPozZP > 1.5 and significantPozHorni > 1.5))
                                and significantPozPP < 1.5 and significantPozPL < 1.5 and significantPozZL > 0.5 and significantPozZP > 0.5 and significantPozHorni > 0.5 then
                                    Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        elseif pred then
                            if (significantSvetla == 10 or significantSvetla == 5 or significantSvetla == 4 or significantSvetla == 3 or significantSvetla == 2 or significantSvetla == 1 or significantSvetla == 0
                                or (((significantPozZP > 1.5 or significantPozZL > 1.5) or (significantPozZP < 0.5 and significantPozZL < 0.5)) and significantPozHorni < 1.5 and significantPozHorni > 0.5 and significantSvetla == 11))
                                and significantPozPP > 0.5 and significantPozPL > 0.5 and significantPozHorni < 1.5 then
                                    Call("SetControlValue", "Headlights", 0, 1)
                            elseif (significantSvetla == 7 
                                or (significantPozZP > 1.5 and significantPozZL > 1.5 and significantPozHorni > 1.5 and significantSvetla == 11))
                                and significantPozPP < 1.5 and significantPozPL < 1.5 and significantPozZL > 0.5 and significantPozZP > 0.5 and significantPozHorni > 0.5 then
                                    Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        elseif za then
                            if (significantSvetla == 5 or significantSvetla == 4 or significantSvetla == 3
                                or (significantPozPL > 1.5 and significantPozPP > 1.5 and significantPozHorni > 1.5))
                                and significantPozPP > 0.5 and significantPozPL > 0.5 and significantPozZL < 1.5 and significantPozZP < 1.5 and significantPozHorni > 0.5 then
                                    Call("SetControlValue", "Headlights", 0, 1)
                            elseif (significantSvetla == 10 or significantSvetla == 7 or significantSvetla == 2 or significantSvetla == 1 or significantSvetla == 0)
                                and significantPozPP == significantPozPL and significantPozZL > 0.5 and significantPozZP > 0.5 and significantPozHorni > 0.5 and significantPozHorni < 1.5 then
                                    Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        else
                            Call("SetControlValue", "Headlights", 0, 0)
                        end
                    end
                else
                    ZhasniSvetla()
                    Call("SetControlValue", "Headlights", 0, 0)
                end
            --------------Mirel-----------------
                MIREL:Update(deltaTime,deltaUpdateTimeFromGame)

                if significantKombi ~= significantKombiOld then
                    MIREL:VybaveniBdelostiOvladacem()
                end

                if Call("GetControlValue","Bdelost",0) > 0.5 and not bdelostLast then 
                    MIREL:VybaveniBdelosti() 
                    bdelostLast = true
                elseif Call("GetControlValue","Bdelost",0) < 0.5 then
                    bdelostLast = false
                end

                if (speedometerKPH < 1 and significantReverser < 0.5 and significantReverser > -0.5 and pendingRequestOnMIRELStart) or (narodniVolba > 0 and narodniVolba < 5 and not pendingRequestOnMIRELStart and speedometerKPH > 0 and narodniVolbaPredvolba < 5) then
                    pendingRequestOnMIRELStart = false
                    MIREL:NastavNarodniVolbu(narodniVolba)
                elseif narodniVolbaPredvolba > 4 then
                    pendingRequestOnMIRELStart = false
                    MIREL:NastavNarodniVolbu(narodniVolbaPredvolba)
                    MIREL.odpadleSoupatkoVZ = false
                elseif narodniVolba > 4 then
                    pendingRequestOnMIRELStart = false
                    MIREL:NastavNarodniVolbu(narodniVolba)
                    MIREL.odpadleSoupatkoVZ = false
                end
                if MIREL.narodniVolba > 4 then
                    if narodniVolba == 1 then
                        vyplyMIRELomezeni = 100
                    elseif narodniVolba < 5 then
                        vyplyMIRELomezeni = 120
                    else
                        vyplyMIRELomezeni = -1
                    end
                else
                    vyplyMIRELomezeni = 160
                end

                if vyplyMIRELomezeni > 0 then
                    Call("SetControlValue","Displej_MIRELrucicka",0,math.min(MIREL.nastavenaRychlost, vyplyMIRELomezeni))
                else
                    Call("SetControlValue","Displej_MIRELrucicka",0,MIREL.nastavenaRychlost)
                end

                if custom_wheelslip > 0.3 then
                    MIREL:Skluz()
                end

                if gBaterie == 1 then
                    MIREL:NastavHodnotuBaterii(true)
                else
                    MIREL:NastavHodnotuBaterii(false)
                end

                MIREL:NastavHodnotyRizeni(rizeniCab1 > 0.5, rizeniCab2 > 0.5)
                MIREL:NastavAktualniKabinu(gKabina)

            --------------PZB90-----------------
                PZB90:Update(deltaTime,deltaUpdateTimeFromGame)
                if Call("GetControlValue", "Wachsam", 0) > 0.5 then
                    PZB90:WachsamPressed()
                end
                if Call("GetControlValue", "Frei", 0) > 0.5 and not freiOld then
                    freiOld = true
                    PZB90:FreiPressed()
                    LZB:ConfirmLZBend()
                elseif Call("GetControlValue", "Frei", 0) < 0.5 then
                    freiOld = false
                end
                if Call("GetControlValue", "Befehl40", 0) > 0.5 then
                    PZB90:SetBefehlLever(true)
                else
                    PZB90:SetBefehlLever(false)
                end
                if (speedometerKPH < 1 and significantReverser < 0.5 and significantReverser > -0.5 and pendingRequestOnPZBStart and narodniVolbaPredvolba > 4 or narodniVolba > 4) and gBaterie == 1 and gRizeni == 1 and narodniVolba ~= 7 then
                    pendingRequestOnPZBStart = false
                    PZB90:SetPZBOn()
                elseif ((narodniVolba < 5 or narodniVolba == 7) and (narodniVolbaPredvolba < 5 or narodniVolbaPredvolba == 7)) or gBaterie ~= 1 or gRizeni ~= 1 then
                    pendingRequestOnPZBStart = false
                    PZB90:SetPZBOff()
                end
                if narodniVolba == 5 or narodniVolba == 6 then
                    Call("SetControlValue", "PZB_LZB", 0, 1)
                else
                    Call("SetControlValue", "PZB_LZB", 0, 0)
                end
                if Call("GetSpeed") < 0.05 then
                    if Call("GetControlValue", "RezimBrzdeni", 0) < 0.5 then
                        PZB90:SetTrainType("O")
                    elseif Call("GetControlValue", "RezimBrzdeni", 0) < 1.5 then
                        PZB90:SetTrainType("M")
                    else
                        PZB90:SetTrainType("U")
                    end
                end
            --------------LZB-------------------
                LZB:Update(deltaTime, deltaUpdateTimeFromGame, pomernyTah)
            --------------SIFA------------------
                SIFA:Update(deltaTime)
                if Call("GetControlValue", "Sifa", 0) > 0.5 then
                    SIFA:SetPedalValue(true)
                else
                    SIFA:SetPedalValue(false)
                end
            --------------AWS-------------------
                if (((not MIREL.NO.NO5 and Call("GetControlValue","Rizeni",0) == 1 and (MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko)) or (MIREL.narodniVolba == MIREL.polsko and (MIREL.SHPcounter > 60 or MIREL.SHPresetCounter > 1 or MIREL.SHPsignalCounter > 0))) and MIREL.uspesnyD1) or (SIFA.active and SIFA.counter > SIFA.LIGHT_ON) then --(Call("GetControlValue","ZS1",0) > 0.5) or (SIFA.active and SIFA.counter > SIFA.LIGHT_OFF_SOUND_ON)
                    Call("SetControlValue", "AWSWarnCount", 0, 1)
                    Call("SetControlValue", "AWSClearCount", 0, 0)
                else
                    Call("SetControlValue", "AWSWarnCount", 0, 0)
                    Call("SetControlValue", "AWSClearCount", 0, 1)
                end
        else
            --------------Nastaveni AI----------
                if Call("GetSpeed") < -0.01 then
                    SvetlaVzad = true
                    SvetlaVpred = false
                else
                    SvetlaVzad = false
                    SvetlaVpred = true
                end
                Call("EngineSound:SetParameter", "BSE_RB", 0)
                Call("EngineSound:SetParameter", "BSE_PLNENI", 0)
                Call("EngineSound:SetParameter", "BSE_UPOUSTENI", 0)

                -- if Call("GetControlValue","NapajeciSystemNav",0) == 0 then
                --     predniSberacAI = false
                --     zadniSberacAI = false
                -- end
                
                if predniSberacAI and animaceSberac01AI < 4.04 then
                    animaceSberac01AI = animaceSberac01AI + deltaTime
                elseif not predniSberacAI and animaceSberac01AI > 0 then -- and (not zadniSberacAI or animaceSberac02AI > 4) then
                    animaceSberac01AI = animaceSberac01AI - deltaTime
                end
                Call("SetTime","Sberac01",animaceSberac01AI)
            
                if zadniSberacAI and animaceSberac02AI < 4.04 then
                    animaceSberac02AI = animaceSberac02AI + deltaTime
                elseif not zadniSberacAI and animaceSberac02AI > 0 then -- and (not predniSberacAI or animaceSberac01AI > 4) then
                    animaceSberac02AI = animaceSberac02AI - deltaTime
                end
                Call("SetTime","Sberac02",animaceSberac02AI)
                --Call ("SetTime","Sberac01",4)
                --Call ("SetTime","Sberac02",4)
                predniSberacAI = false
                zadniSberacAI = false
				if math.abs(Call("GetSpeed")) > 2 then
					ujeteMetryAI = ujeteMetryAI + (math.abs(Call("GetSpeed"))*deltaTime)
					if ujeteMetryAI > 100 then
						reflektorAI = true
					end
				else
					ujeteMetryAI = 0
                    reflektorAI = false
				end
                if SysCall("ScenarioManager:GetSeason") ~= 3 then
                    if dennicas > 063000 and dennicas < 220000 then
                        reflektorAI = false
                    end
                else
                    if dennicas > 080000 and dennicas < 163000 then
                        reflektorAI = false
                    end
                end
                Call("DalkovaPL:SetRange", 250)
                Call("DalkovaPP:SetRange", 250)
                Call("DalkovaZL:SetRange", 250)
                Call("DalkovaZP:SetRange", 250)
                if Call("GetConsistType") == 9 then
                    Call("ZlutaHorniP:Activate", 0)
                    Call("ZlutaHorniZ:Activate", 0)	
                    Call("ZlutaPravaVpred:Activate", 0, 1)
                    Call("ZlutaLevaVpred:Activate", 0, 1)
                    Call("ZlutaPravaVzad:Activate", 0, 1)
                    Call("ZlutaLevaVzad:Activate", 0, 1)
                    Call("CervenaPravaVpred:Activate", 0, 0)
                    Call("CervenaLevaVpred:Activate", 0, 0)
                    Call("CervenaPravaVzad:Activate", 0, 0)
                    Call("CervenaLevaVzad:Activate", 0, 0)
                    Call("ActivateNode", "PozPP", 1)
                    Call("ActivateNode", "PozZP", 1)
                    Call("ActivateNode", "PozZL", 1)
                    Call("ActivateNode", "PozPL", 1)
                    Call("ActivateNode", "KoncovePL", 0)
                    Call("ActivateNode", "KoncovePP", 0)
                    Call("ActivateNode", "KoncoveZL", 0)
                    Call("ActivateNode", "KoncoveZP", 0)
                    Call("ActivateNode", "PozHorniP", 0)
                    Call("ActivateNode", "PorHorniZ", 0)
                    Call("DalkovaPP:Activate", 0)
                    Call("DalkovaPL:Activate", 0)
                    Call("ActivateNode", "DalkovaP", 0)	
                    Call("DalkovaZP:Activate", 0)
                    Call("DalkovaZL:Activate", 0)
                    Call("ActivateNode", "DalkovaZ", 0)
                    if not pred and not za then
                        if SvetlaVzad then
                            Call("ActivateNode", "FiraP", 0)
                            Call("ActivateNode", "FiraZ", 1)
                        else
                            Call("ActivateNode", "FiraP", 1)
                            Call("ActivateNode", "FiraZ", 0)
                        end
                    elseif pred and not za then
                        Call("ActivateNode", "FiraP", 0)
                        Call("ActivateNode", "FiraZ", 1)
                    elseif not pred and za then
                        Call("ActivateNode", "FiraP", 1)
                        Call("ActivateNode", "FiraZ", 0)
                    elseif pred and za then
                        if SvetlaVzad then
                            Call("ActivateNode", "FiraP", 0)
                            Call("ActivateNode", "FiraZ", 1)
                        else
                            Call("ActivateNode", "FiraP", 1)
                            Call("ActivateNode", "FiraZ", 0)
                        end
                    end
                    predniSberacAI = true
                    zadniSberacAI = true
                elseif za and not pred then
                    if SvetlaVzad then
                        Call("ZlutaHorniP:Activate", 0)
                        Call("ZlutaHorniZ:Activate", 0)	
                        Call("ZlutaPravaVpred:Activate", 0, 0)
                        Call("ZlutaLevaVpred:Activate", 0, 0)
                        Call("ZlutaPravaVzad:Activate", 0, 0)
                        Call("ZlutaLevaVzad:Activate", 0, 0)
                        Call("CervenaPravaVpred:Activate", 0, 0)
                        Call("CervenaLevaVpred:Activate", 0, 0)
                        Call("CervenaPravaVzad:Activate", 0, 1)
                        Call("CervenaLevaVzad:Activate", 0, 1)
                        Call("ActivateNode", "PozPP", 0)
                        Call("ActivateNode", "PozZP", 0)
                        Call("ActivateNode", "PozZL", 0)
                        Call("ActivateNode", "PozPL", 0)
                        Call("ActivateNode", "KoncovePL", 1)
                        Call("ActivateNode", "KoncovePP", 1)
                        Call("ActivateNode", "KoncoveZL", 0)
                        Call("ActivateNode", "KoncoveZP", 0)
                        Call("ActivateNode", "PozHorniP", 0)
                        Call("ActivateNode", "PorHorniZ", 0)
                        Call("DalkovaPP:Activate", 0)
                        Call("DalkovaPL:Activate", 0)
                        Call("ActivateNode", "DalkovaP", 0)	
                        Call("DalkovaZP:Activate", 0)
                        Call("DalkovaZL:Activate", 0)
                        Call("ActivateNode", "DalkovaZ", 0)
                        --Call ("SetTime","Sberac01",4)
                        --Call ("SetTime","Sberac02",0)
                        if animaceSberac01AI > 4 then
                            zadniSberacAI = false
                        end 
                        predniSberacAI = true
                        Call("ActivateNode", "FiraP", 0)
                        Call("ActivateNode", "FiraZ", 0)
                        Call("SetControlValue", "Headlights", 0, 2)
                    else
                        Call("ZlutaHorniP:Activate", 1)
                        Call("ZlutaHorniZ:Activate", 0)	
                        Call("ZlutaPravaVpred:Activate", 0, 1)
                        Call("ZlutaLevaVpred:Activate", 0, 1)
                        Call("ZlutaPravaVzad:Activate", 0, 0)
                        Call("ZlutaLevaVzad:Activate", 0, 0)
                        Call("CervenaPravaVpred:Activate", 0, 0)
                        Call("CervenaLevaVpred:Activate", 0, 0)
                        Call("CervenaPravaVzad:Activate", 0, 0)
                        Call("CervenaLevaVzad:Activate", 0, 0)
                        Call("ActivateNode", "PozPP", 1)
                        Call("ActivateNode", "PozZP", 0)
                        Call("ActivateNode", "PozZL", 0)
                        Call("ActivateNode", "PozPL", 1)
                        Call("ActivateNode", "KoncovePL", 0)
                        Call("ActivateNode", "KoncovePP", 0)
                        Call("ActivateNode", "KoncoveZL", 0)
                        Call("ActivateNode", "KoncoveZP", 0)
                        Call("ActivateNode", "PozHorniP", 1)
                        Call("ActivateNode", "PorHorniZ", 0)
                        Call("DalkovaZP:Activate", 0)
                        Call("DalkovaZL:Activate", 0)
                        Call("ActivateNode", "DalkovaZ", 0)
                        if reflektorAI then
                            Call("DalkovaPP:Activate", 1)
                            Call("DalkovaPL:Activate", 1)
                            Call("ActivateNode", "DalkovaP", 1)
                        else
                            Call("DalkovaPP:Activate", 0)
                            Call("DalkovaPL:Activate", 0)
                            Call("ActivateNode", "DalkovaP", 0)
                        end
                        --Call ("SetTime","Sberac01",0)
                        --Call ("SetTime","Sberac02",4)
                        if animaceSberac02AI > 4 then
                            predniSberacAI = false
                        end 
                        zadniSberacAI = true
                        Call("ActivateNode", "FiraP", 1)
                        Call("ActivateNode", "FiraZ", 0)
                        Call("SetControlValue", "Headlights", 0, 1)
                    end
                elseif pred and not za then
                    if SvetlaVzad then
                        Call("ZlutaHorniP:Activate", 0)
                        Call("ZlutaHorniZ:Activate", 1)	
                        Call("ZlutaPravaVpred:Activate", 0, 0)
                        Call("ZlutaLevaVpred:Activate", 0, 0)
                        Call("ZlutaPravaVzad:Activate", 0, 1)
                        Call("ZlutaLevaVzad:Activate", 0, 1)
                        Call("CervenaPravaVpred:Activate", 0, 0)
                        Call("CervenaLevaVpred:Activate", 0, 0)
                        Call("CervenaPravaVzad:Activate", 0, 0)
                        Call("CervenaLevaVzad:Activate", 0, 0)
                        Call("ActivateNode", "PozPP", 0)
                        Call("ActivateNode", "PozZP", 1)
                        Call("ActivateNode", "PozZL", 1)
                        Call("ActivateNode", "PozPL", 0)
                        Call("ActivateNode", "KoncovePL", 0)
                        Call("ActivateNode", "KoncovePP", 0)
                        Call("ActivateNode", "KoncoveZL", 0)
                        Call("ActivateNode", "KoncoveZP", 0)
                        Call("ActivateNode", "PozHorniP", 0)
                        Call("ActivateNode", "PorHorniZ", 1)
                        Call("DalkovaPP:Activate", 0)
                        Call("DalkovaPL:Activate", 0)
                        Call("ActivateNode", "DalkovaP", 0)
                        if reflektorAI then
                            Call("DalkovaZP:Activate", 1)
                            Call("DalkovaZL:Activate", 1)
                            Call("ActivateNode", "DalkovaZ", 1)
                        else
                            Call("DalkovaZP:Activate", 0)
                            Call("DalkovaZL:Activate", 0)
                            Call("ActivateNode", "DalkovaZ", 0)
                        end
                        --Call ("SetTime","Sberac01",4)
                        --Call ("SetTime","Sberac02",0)
                        if animaceSberac01AI > 4 then
                            zadniSberacAI = false
                        end 
                        predniSberacAI = true
                        Call("ActivateNode", "FiraP", 0)
                        Call("ActivateNode", "FiraZ", 1)
                        Call("SetControlValue", "Headlights", 0, 2)
                    else
                        Call("ZlutaHorniP:Activate", 0)
                        Call("ZlutaHorniZ:Activate", 0)	
                        Call("ZlutaPravaVpred:Activate", 0, 0)
                        Call("ZlutaLevaVpred:Activate", 0, 0)
                        Call("ZlutaPravaVzad:Activate", 0, 0)
                        Call("ZlutaLevaVzad:Activate", 0, 0)
                        Call("CervenaPravaVpred:Activate", 0, 1)
                        Call("CervenaLevaVpred:Activate", 0, 1)
                        Call("CervenaPravaVzad:Activate", 0, 0)
                        Call("CervenaLevaVzad:Activate", 0, 0)
                        Call("ActivateNode", "PozPP", 0)
                        Call("ActivateNode", "PozZP", 0)
                        Call("ActivateNode", "PozZL", 0)
                        Call("ActivateNode", "PozPL", 0)
                        Call("ActivateNode", "KoncovePL", 0)
                        Call("ActivateNode", "KoncovePP", 0)
                        Call("ActivateNode", "KoncoveZL", 1)
                        Call("ActivateNode", "KoncoveZP", 1)
                        Call("ActivateNode", "PozHorniP", 0)
                        Call("ActivateNode", "PorHorniZ", 0)
                        Call("DalkovaPP:Activate", 0)
                        Call("DalkovaPL:Activate", 0)
                        Call("ActivateNode", "DalkovaP", 0)	
                        Call("DalkovaZP:Activate", 0)
                        Call("DalkovaZL:Activate", 0)
                        Call("ActivateNode", "DalkovaZ", 0)
                        --Call ("SetTime","Sberac01",0)
                        --Call ("SetTime","Sberac02",4)
                        if animaceSberac02AI > 4 then
                            predniSberacAI = false
                        end 
                        zadniSberacAI = true
                        Call("ActivateNode", "FiraP", 0)
                        Call("ActivateNode", "FiraZ", 0)
                        Call("SetControlValue", "Headlights", 0, 1)
                    end
                elseif pred and za then
                    Call("ZlutaHorniP:Activate", 0)
                    Call("ZlutaHorniZ:Activate", 0)	
                    Call("ZlutaPravaVpred:Activate", 0, 0)
                    Call("ZlutaLevaVpred:Activate", 0, 0)
                    Call("ZlutaPravaVzad:Activate", 0, 0)
                    Call("ZlutaLevaVzad:Activate", 0, 0)
                    Call("CervenaPravaVpred:Activate", 0, 0)
                    Call("CervenaLevaVpred:Activate", 0, 0)
                    Call("CervenaPravaVzad:Activate", 0, 0)
                    Call("CervenaLevaVzad:Activate", 0, 0)
                    Call("ActivateNode", "PozPP", 0)
                    Call("ActivateNode", "PozZP", 0)
                    Call("ActivateNode", "PozZL", 0)
                    Call("ActivateNode", "PozPL", 0)
                    Call("ActivateNode", "KoncovePL", 0)
                    Call("ActivateNode", "KoncovePP", 0)
                    Call("ActivateNode", "KoncoveZL", 0)
                    Call("ActivateNode", "KoncoveZP", 0)
                    Call("ActivateNode", "PozHorniP", 0)
                    Call("ActivateNode", "PorHorniZ", 0)
                    Call("DalkovaPP:Activate", 0)
                    Call("DalkovaPL:Activate", 0)
                    Call("ActivateNode", "DalkovaP", 0)	
                    Call("DalkovaZP:Activate", 0)
                    Call("DalkovaZL:Activate", 0)
                    Call("ActivateNode", "DalkovaZ", 0)
                    if SvetlaVzad then
                        if animaceSberac01AI > 4 then
                            zadniSberacAI = false
                        end 
                        predniSberacAI = true
                    else
                        if animaceSberac02AI > 4 then
                            predniSberacAI = false
                        end 
                        zadniSberacAI = true
                    end
                    Call("ActivateNode", "FiraP", 0)
                    Call("ActivateNode", "FiraZ", 0)
                    if SvetlaVzad then
                        Call("SetControlValue", "Headlights", 0, 2)
                    else
                        Call("SetControlValue", "Headlights", 0, 1)
                    end
                elseif not pred and not za then
                    if SvetlaVzad then
                        Call("ZlutaHorniP:Activate", 0 )
                        Call("ZlutaHorniZ:Activate", 1 )	
                        Call("ZlutaPravaVpred:Activate", 0, 0)
                        Call("ZlutaLevaVpred:Activate", 0, 0)
                        Call("ZlutaPravaVzad:Activate", 0, 1)
                        Call("ZlutaLevaVzad:Activate", 0, 1)
                        Call("CervenaPravaVpred:Activate", 0, 0)
                        Call("CervenaLevaVpred:Activate", 0, 0)
                        Call("CervenaPravaVzad:Activate", 0, 1)
                        Call("CervenaLevaVzad:Activate", 0, 1)
                        Call("ActivateNode", "PozPP", 0)
                        Call("ActivateNode", "PozZP", 1)
                        Call("ActivateNode", "PozZL", 1)
                        Call("ActivateNode", "PozPL", 0)
                        Call("ActivateNode", "KoncovePL", 1)
                        Call("ActivateNode", "KoncovePP", 1)
                        Call("ActivateNode", "KoncoveZL", 0)
                        Call("ActivateNode", "KoncoveZP", 0)
                        Call("ActivateNode", "PozHorniP", 0)
                        Call("ActivateNode", "PorHorniZ", 1)
                        Call("DalkovaPP:Activate", 0)
                        Call("DalkovaPL:Activate", 0)
                        Call("ActivateNode", "DalkovaP", 0)
                        if reflektorAI then
                            Call("DalkovaZP:Activate", 1)
                            Call("DalkovaZL:Activate", 1)
                            Call("ActivateNode", "DalkovaZ", 1)
                        else
                            Call("DalkovaZP:Activate", 0)
                            Call("DalkovaZL:Activate", 0)
                            Call("ActivateNode", "DalkovaZ", 0)
                        end
                        --Call ("SetTime","Sberac01",4)
                        --Call ("SetTime","Sberac02",0)
                        if animaceSberac01AI > 4 then
                            zadniSberacAI = false
                        end 
                        predniSberacAI = true
                    else
                        Call("ZlutaHorniP:Activate", 1 )
                        Call("ZlutaHorniZ:Activate", 0 )	
                        Call("ZlutaPravaVpred:Activate", 0, 1)
                        Call("ZlutaLevaVpred:Activate", 0, 1)
                        Call("ZlutaPravaVzad:Activate", 0, 0)
                        Call("ZlutaLevaVzad:Activate", 0, 0)
                        Call("CervenaPravaVpred:Activate", 0, 1)
                        Call("CervenaLevaVpred:Activate", 0, 1)
                        Call("CervenaPravaVzad:Activate", 0, 0)
                        Call("CervenaLevaVzad:Activate", 0, 0)
                        Call("ActivateNode", "PozPP", 1)
                        Call("ActivateNode", "PozZP", 0)
                        Call("ActivateNode", "PozZL", 0)
                        Call("ActivateNode", "PozPL", 1)
                        Call("ActivateNode", "KoncovePL", 0)
                        Call("ActivateNode", "KoncovePP", 0)
                        Call("ActivateNode", "KoncoveZL", 1)
                        Call("ActivateNode", "KoncoveZP", 1)
                        Call("ActivateNode", "PozHorniP", 1)
                        Call("ActivateNode", "PorHorniZ", 0)
                        Call("DalkovaZP:Activate", 0)
                        Call("DalkovaZL:Activate", 0)
                        Call("ActivateNode", "DalkovaZ", 0)
                        if reflektorAI then
                            Call("DalkovaPP:Activate", 1)
                            Call("DalkovaPL:Activate", 1)
                            Call("ActivateNode", "DalkovaP", 1)
                        else
                            Call("DalkovaPP:Activate", 0)
                            Call("DalkovaPL:Activate", 0)
                            Call("ActivateNode", "DalkovaP", 0)
                        end
                        --Call ("SetTime","Sberac01",0)
                        --Call ("SetTime","Sberac02",4)
                        if animaceSberac02AI > 4 then
                            predniSberacAI = false
                        end 
                        zadniSberacAI = true
                    end
                    if SvetlaVzad then
                        Call("ActivateNode", "FiraP", 0)
                        Call("ActivateNode", "FiraZ", 1)
                    else
                        Call("ActivateNode", "FiraP", 1)
                        Call("ActivateNode", "FiraZ", 0)
                    end
                    Call("SetControlValue", "Headlights", 0, 0)
                end
                if math.abs(Call("GetSpeed")) < 1 then
                    if Call("GetControlValue","NapajeciSystemNav",0) == 3 then
                        predniSberacAI = true
                        zadniSberacAI = true
                    end
                    if SvetlaVzad then
                        Call("SetControlValue","Kulicky",0,0)
                        Call("Zarivky:Activate",0)
                        Call("Zarivky02:Activate",1)
                        Call("SetControlValue","Zarivky",0,0)
                        Call("Bodovky1:Activate",0)
                        Call("Bodovky2:Activate",0)
                        Call("Bodovky3:Activate",0)
                        Call("Bodovky4:Activate",1)
                        Call("Bodovky5:Activate",1)
                        Call("Bodovky6:Activate",1)
                        Call("SetControlValue","Bodovky",0,0)
                        Call("SvetloSJR:Activate",0)
                        Call("SvetloSJR02:Activate",0)
                    else
                        Call("SetControlValue","Kulicky",0,0)
                        Call("Zarivky:Activate",1)
                        Call("Zarivky02:Activate",0)
                        Call("SetControlValue","Zarivky",0,0)
                        Call("Bodovky1:Activate",1)
                        Call("Bodovky2:Activate",1)
                        Call("Bodovky3:Activate",1)
                        Call("Bodovky4:Activate",0)
                        Call("Bodovky5:Activate",0)
                        Call("Bodovky6:Activate",0)
                        Call("SetControlValue","Bodovky",0,0)
                        Call("SvetloSJR:Activate",0)
                        Call("SvetloSJR02:Activate",0)
                    end
                else
                    Call("SetControlValue","Kulicky",0,0)
                    Call("Zarivky:Activate",0)
                    Call("Zarivky02:Activate",0)
                    Call("SetControlValue","Zarivky",0,0)
                    Call("Bodovky1:Activate",0)
                    Call("Bodovky2:Activate",0)
                    Call("Bodovky3:Activate",0)
                    Call("Bodovky4:Activate",0)
                    Call("Bodovky5:Activate",0)
                    Call("Bodovky6:Activate",0)
                    Call("SetControlValue","Bodovky",0,0)
                    Call("SvetloSJR:Activate",0)
                    Call("SvetloSJR02:Activate",0)
                end
        end
    end
end
--EDB se hýbe 0.002083 za 0.0125 vteřiny

--###############################################################
--************************ FCE Rychlomer ************************
--###############################################################
-- Parameters:
-- speed
------------------------------------------------------------
function setTacho(speed)
	speed = math.max(round(math.abs(speed*3.6)), 0)
	Call("SetControlValue","RychlostRucka",0,speed)
	if Call("GetControlValue","Obrazovky",0) == 2 and Call("GetControlValue","DisplejPredni",0) == 0 then
		if speed < 10 then
			Call("TachoPX:SetText", tostring(speed), 0)
			Call("TachoPXX:SetText", "XX", 0)
			Call("TachoPXXX:SetText", "XXX", 0)
			Call("TachoZX:SetText", tostring(speed), 0)
			Call("TachoZXX:SetText", "XX", 0)
			Call("TachoZXXX:SetText", "XXX", 0)
		elseif speed < 100 then
			Call("TachoPX:SetText", "X", 0)
			Call("TachoPXX:SetText", tostring(speed), 0)
			Call("TachoPXXX:SetText", "XXX", 0)
			Call("TachoZX:SetText", "X", 0)
			Call("TachoZXX:SetText", tostring(speed), 0)
			Call("TachoZXXX:SetText", "XXX", 0)
		else
			Call("TachoPX:SetText", "X", 0)
			Call("TachoPXX:SetText", "XX", 0)
			Call("TachoPXXX:SetText", tostring(speed), 0)
			Call("TachoZX:SetText", "X", 0)
			Call("TachoZXX:SetText", "XX", 0)
			Call("TachoZXXX:SetText", tostring(speed), 0)
		end
	else
		Call("TachoPX:SetText", "X", 0)
		Call("TachoPXX:SetText", "XX", 0)
		Call("TachoPXXX:SetText", "XXX", 0)
		Call("TachoZX:SetText", "X", 0)
		Call("TachoZXX:SetText", "XX", 0)
		Call("TachoZXXX:SetText", "XXX", 0)
	end
end

function zasahVZ()
    pomernyTah = -1
    Call("SetControlValue", "PomernyTah", 0, pomernyTah)
end

function setTah(TractiveEffort, BrakeEffort)
    TractiveEffort = math.floor(math.abs(TractiveEffort) * 275)
    BrakeEffort = math.floor(math.abs(BrakeEffort) * 150)
    if BrakeEffort > 0 then
        TractiveEffort = BrakeEffort
    end
	if Call("GetControlValue","Obrazovky",0) == 2 and Call("GetControlValue","DisplejPredni",0) == 0 then
		if (lastTractiveEffort ~= TractiveEffort or TractiveEffort < 1) then
			lastTractiveEffort = TractiveEffort
			if TractiveEffort < 10 then
				Call("TahPX:SetText", tostring(TractiveEffort), 0)
				Call("TahPXX:SetText", "XX", 0)
				Call("TahPXXX:SetText", "XXX", 0)
				Call("TahZX:SetText", tostring(TractiveEffort), 0)
				Call("TahZXX:SetText", "XX", 0)
				Call("TahZXXX:SetText", "XXX", 0)
			elseif TractiveEffort < 100 then
				Call("TahPX:SetText", "X", 0)
				Call("TahPXX:SetText", tostring(TractiveEffort), 0)
				Call("TahPXXX:SetText", "XXX", 0)
				Call("TahZX:SetText", "X", 0)
				Call("TahZXX:SetText", tostring(TractiveEffort), 0)
				Call("TahZXXX:SetText", "XXX", 0)
			else
				Call("TahPX:SetText", "X", 0)
				Call("TahPXX:SetText", "XX", 0)
				Call("TahPXXX:SetText", tostring(TractiveEffort), 0)
				Call("TahZX:SetText", "X", 0)
				Call("TahZXX:SetText", "XX", 0)
				Call("TahZXXX:SetText", tostring(TractiveEffort), 0)
			end
		end	
	else
		Call("TahPX:SetText", "X", 0)
		Call("TahPXX:SetText", "XX", 0)
		Call("TahPXXX:SetText", "XXX", 0)
		Call("TahZX:SetText", "X", 0)
		Call("TahZXX:SetText", "XX", 0)
		Call("TahZXXX:SetText", "XXX", 0)
	end
end

function divMod(x,y)
    return math.floor(x / y), x - math.floor(x/y)*y
end

function round(x)
    x_floored = math.floor(x)
    if math.abs(x_floored-x) > 0.5 then
        return math.ceil(x)
    else
        return x_floored
    end
end

function ZhasniSvetla()
	Call("ZlutaHorniP:Activate", 0 )
	Call("ZlutaHorniZ:Activate", 0 )
	Call("DalkovePP:Activate", 0, 0)
	Call("DalkovePL:Activate", 0, 0)
	Call("DalkoveZP:Activate", 0, 0)
	Call("DalkoveZL:Activate", 0, 0)	
	Call("ZlutaPravaVpred:Activate", 0, 0)
	Call("ZlutaLevaVpred:Activate", 0, 0)
	Call("ZlutaPravaVzad:Activate", 0, 0 )
	Call("ZlutaLevaVzad:Activate", 0, 0)
	Call("CervenaPravaVpred:Activate", 0, 0)
	Call("CervenaLevaVpred:Activate", 0, 0)
	Call("CervenaPravaVzad:Activate", 0, 0)
	Call("CervenaLevaVzad:Activate", 0, 0)
	Call("ActivateNode", "PozPP", 0)
	Call("ActivateNode", "PozZP", 0)
	Call("ActivateNode", "PozZL", 0)
	Call("ActivateNode", "PozPL", 0)
	Call("ActivateNode", "KoncovePL", 0)
	Call("ActivateNode", "KoncovePP", 0)
	Call("ActivateNode", "KoncoveZL", 0)
	Call("ActivateNode", "KoncoveZP", 0)
	Call("ActivateNode", "PozHorniP", 0)
	Call("ActivateNode", "PorHorniZ", 0)	
	Call("ActivateNode", "DalkovaP", 0)
	Call("ActivateNode", "DalkovaZ", 0)
	Call("SetControlValue", "Headlights", 0, 0)
end

function ZhasniCab()
	Call("SvetloSJR:Activate", 0 )
	Call("Bodovky1:Activate", 0 )	
	Call("Bodovky2:Activate", 0 )	
	Call("Bodovky3:Activate", 0 )
	Call("Zarivky:Activate", 0 )	
	Call("SvetloSJR02:Activate", 0 )
	Call("Bodovky4:Activate", 0 )	
	Call("Bodovky5:Activate", 0 )	
	Call("Bodovky6:Activate", 0 )
	Call("Zarivky02:Activate", 0 )	
end

function ToBolAndBack (hodnota,hranice)
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

function OnCustomSignalMessage ( parameter )
    -- if Call("GetControlValue","OsvetleniPristroje",0) < 0.5 then
        -- SysCall("ScenarioManager:ShowAlertMessageExt", "Prijate z nav", parameter, 2, 0)
    -- end
    ZpravaDebug(parameter)
    if parameter == "3000V" or parameter == "3000" then
		Call("SetControlValue","NapajeciSystemNav",0,3)
	elseif parameter == "15000V" or parameter == "15000" or parameter == "vR_EL5" or parameter == "vR_EL2" then
		Call("SetControlValue","NapajeciSystemNav",0,15)
	elseif parameter == "25000V" or parameter == "25000" then
        Call("SetControlValue","NapajeciSystemNav",0,25)
    elseif parameter == "0V" or parameter == "vR_EL1" or parameter == "vR_EL4" then
        Call("SetControlValue","NapajeciSystemNav",0,0)
        lin_styk = 0
        Call("SetControlValue","LinkoveStykace",0,0)
        if vykon ~= 0 then
            hl_vyp = 0
            Call("SetControlValue","HV",0,0)
        end
    elseif parameter == "intrare_neutra" then
        if Call("GetControlValue","NapajeciSystemNav",0) ~= 0 then
            napSysPredStazenim = Call("GetControlValue","NapajeciSystemNav",0)
        end
        Call("SetControlValue","NapajeciSystemNav",0,0)
        lin_styk = 0
        Call("SetControlValue","LinkoveStykace",0,0)
        if vykon ~= 0 then
            hl_vyp = 0
            Call("SetControlValue","HV",0,0)
        end
    elseif parameter == "iesire_neutra" then
        Call("SetControlValue","NapajeciSystemNav",0,napSysPredStazenim)
	else
		MIREL:ZpravyNavestidel(parameter)
		PZB90:OnReceivedSignalMessage(parameter)
		LZB:OnReceivedSignalMessage(parameter)
	end
end