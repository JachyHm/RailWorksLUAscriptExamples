--Aktuální verze k 16.4.2018
--**********************skript lokomotivy 460**************************--
	-- SysCall("ScenarioManager:ShowInfoMessageExt", "CD460 addon", "Baterie zapnute.",5,16,0,0)
--os.execute('Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\ActualizationAutoRun\\runactualization.exe')

-- addPoints, err = loadlib("c:\\Users\\Jachym\\source\\repos\\TSGui\\Debug\\TSGui.dll", "addPoints")
-- if _G["addPoints"] then 
--     Print("TSDll Library Loaded!")
--     addPoints()
-- else
--     Print("loadlib on TSDll failed: ")
--     Print(err)
-- end

INFO = 0
ALERT = 1

gAbsolutniMax_kN = 1300
gMax_kN = {17.5,30,40,55,69,90,105,145,215,286.5,420,500,710,800,2000,2000,2350,2740,3350,2025} 
gKoeficient = {-0.097,-0.071,-0.077,-0.087,-0.094,-0.091,-0.0896,-0.112,-0.13,-0.14,-0.16,-0.162,-0.173,-0.173,-0.23,-0.25,-0.25,-0.25,-0.25,-0.22} 
gOffsetX = {0,0,0,0,0,0,0,0,0,0,0.26,0,0,0,0000,-2,-2,-2,-2,-3}
gOffsetY = {0,0,0,0,0,0,0,0,0,0,4.00,2,1,1,5.75,07,09,11,14,15}
gZvetseni ={0,0,0,0,0,0,0,0,0,0,0.00,0,0,0,0.00,00,00,00,00,00}

gA = {450,480,525,600}
gB = {10000,11000,12000,13000}
gC = {10,11,12,13}

gProbihaA = false
gHODNOTA_LASTa = 0
gHraniceA = 0
gGradientLastA = 0
gCurvatureLastA = 0

gProbihaV = false
gHODNOTA_LASTv = 0
gHraniceV = 0
gGradientLastV = 0
gCurvatureLastV = 0

stavVystraha = 0
stavStuj = 0
stavVolno = 0
stavMezikruzi = 0
stavVybaveni = 0

vystraha = false
stuj = false
volno = false
mezikruzi = false
vybaveni = false

casNekodovani = 0
nekodujCas = nil
sumPoPrujezdu = false
pocetSumuPoPrujezdu = 0
sumPoPrujezduKod = 0
sumPoPrujezduDelka = 0
sumPoPrujezduDelkaUbehle = 0
zmenaParametru = 0
zmenaParametruLast = 0
casChybyUbehly = 0
casZhasleUbehly = 0
casZmenyUbehly = 0
signalCode = 0
lastSignalCode = 0

blokEDB = false

vnitrniSit220V = 0
vnitrniSit220Vnouzova = 0
napetiVS220 = 0
napetiVS220nouz = 0
mgRezim = 0
MG_VLASTNI = 0
MG_NOUZOVY = 1
MG_SOUSEDNI = 2

blokKrokNU = false

blokOchran = false

HRKzeShuntu = false
stupenKontroleru = 0

ojDiag = 0

nastaveneValce = 0
doplnujBrzdu = false
gProbihaPipe = false
gHranicePipe = 0
gHODNOTA_LAST_Pipe = 0
gProbihaValce = false
gHraniceValce = 0
gHODNOTA_LAST_Valce = 0
BS2 = 0

snizenyVykonTady = false

JOB = 0

stavDalkoveLeve = 0
stavDalkovePrave = 0
stavDalkoveHorni1 = 0
stavDalkoveHorni2 = 0

ridiciKontrolerOknoOCVC = 1

ventilatory_tm_otacky = 0
ventilatory_strecha_otacky = 0

instanceGroupNabeh = false
instanceGroupDobeh = false

blokuj_nabeh_TM = false
blokuj_dobeh_TM = false

casMinuly = 0
casProcesor = os.clock()

vystupBrzdic = 0
beginZpozdeniBrzdic = nil

plynuleValce = 0
plynuleValce_bezBP = 0
tlak_HP = 0
cilovy_tlak_HP_po_zmene = 0
navoleny_tlak = 0
ridici_tlak = 0
ventilSvihu = false
prah_hystereze_ridiciho_ustroji = 0.25
idealni_membrana_ridiciho_ustroji = 0
skutecna_membrana_ridiciho_ustroji = 0
VirtualMainReservoirPressureBAR = math.random(0,10)
--VirtualMainReservoirPressureBAR = 10
VirtualDistributorBrakeCylinderPressureBAR = 0
plynulyVzduchojem = 0
pribrzdiSvih = false
vychoziTlakSystemu = 5
vychoziTlakBrzdice = 5
hysterezeRidicihoTlaku = false
PipeOld = 0
naskokManometruBV = false
ubytekHJ = false
prekmitManometrHJ = false
podkmitManometrHJ = false

zobrazovany_cilovy_tlak_jimky = 0
zobrazovany_plynuly_tlak_jimky = 0

zobrazovany_cilovy_tlak_potrubi = 0
zobrazovany_plynuly_tlak_potrubi = 0

zobrazovany_cilovy_tlak_valcu = 0
zobrazovany_plynuly_tlak_valcu = 0

ZPRAVA_FAST_START = SysCall("ScenarioManager:GetLocalisedString","d628e082-95e2-4d62-84bd-be5186025d2c")
ZPRAVA_HLAVICKA = SysCall("ScenarioManager:GetLocalisedString","297fd3ee-8b43-11e7-bb31-be2e44b06b34")
ZPRAVA_BATERIE_POSKOZENE = SysCall("ScenarioManager:GetLocalisedString","1d415004-5d9b-4562-8d2f-06815b4e34b0")
ZPRAVA_NEUSPESNY_FAST_START = SysCall("ScenarioManager:GetLocalisedString","86bd9176-0722-4bda-bcea-9111b16b6bfc")
ZPRAVA_BATERIE_ZAP = SysCall("ScenarioManager:GetLocalisedString","5cc482bf-9e41-48fc-a377-c51338dc5b90")
ZPRAVA_UROVEN_HELP = SysCall("ScenarioManager:GetLocalisedString","2a28ea97-e512-4303-a839-a8d6cb89c262")
ZPRAVA_HLAVICKA_NAPOVEDA = SysCall("ScenarioManager:GetLocalisedString","5719ee78-b404-447a-a756-f48064caa3c2")

levelNapovedy = 0

otocPovely = false
dvereLeveZeSoupravy = false
dvereLeveZeSoupravyPridrznyStav = false
dvereLevePridrznyStav = false
dverePraveZeSoupravy = false
dverePraveZeSoupravyPridrznyStav = false
dverePravePridrznyStav = false
dvereStavLast = ""
dvereLPskutecne = 0
dvereLPvystraha = 0
dvereLZskutecne = 0
dvereLZvystraha = 0
dverePPskutecne = 0
dverePPvystraha = 0
dverePZskutecne = 0
dverePZvystraha = 0
rychlostZaviraniDveriLP_rychle = math.random(100, 130)/100
rychlostZaviraniDveriLP_pomalu = math.random(3000, 3250)/10000
rychlostZaviraniDveriPP_rychle = math.random(100, 130)/100
rychlostZaviraniDveriPP_pomalu = math.random(3000, 3250)/10000
rychlostZaviraniDveriLZ_rychle = math.random(100, 130)/100
rychlostZaviraniDveriLZ_pomalu = math.random(3000, 3250)/10000
rychlostZaviraniDveriPZ_rychle = math.random(100, 130)/100
rychlostZaviraniDveriPZ_pomalu = math.random(3000, 3250)/10000
rychlostOteviraniDveriLP = math.random(20, 36)/100
rychlostOteviraniDveriPP = math.random(20, 36)/100
rychlostOteviraniDveriLZ = math.random(20, 36)/100
rychlostOteviraniDveriPZ = math.random(20, 36)/100
RizenaRidiciLast_dvere = ""

gProbihaPrasatkoL = false
gHranicePrasatkoL = 0
gHODNOTA_LAST_PrasatkoL = 0
gProbihaPrasatkoP = false
gHranicePrasatkoP = 0
gHODNOTA_LAST_PrasatkoP = 0

dvereVypisLast = ""
prujezdKolemNavestidla = false

RizenaRidiciLast = ""

MSVsipkaLevaLast = false
MSVsipkaPravaLast = false
MSVsipkaDoluLast = false
MSVsipkaNahoruLast = false
MSVokLast = false
MSVsipkaLeva = false
MSVsipkaPrava = false
MSVsipkaDolu = false
MSVsipkaNahoru = false
MSVok = false

zavedSnizenyVykon = false

fiktivniVykonNaRizeneNeschopne = false

prvnizprava = false

releEPV = false
kontrolaBdelosti = false
nadbytecnaObsluha = false

steracLevyOut = 0
steracPravyOut = 0
steracLevy = 0
steracPravy = 0
steracePrep = false
steracLevySpeed = 0
steracPravySpeed = 0
STERAC_LEVY_MAX_SPEED = math.random(55, 70)/100
STERAC_LEVY_DRY_SPEED = math.random(40,60)/100
STERAC_PRAVY_MAX_SPEED = STERAC_LEVY_MAX_SPEED - math.random(-10, 10)/100
STERAC_PRAVY_DRY_SPEED = STERAC_LEVY_DRY_SPEED - math.random(-10, 10)/100

ojThrottleAndBrakeLast = 0

rychlostEDB = math.random(20, 25)

predMasinouTornado = nil
zaMasinouTornado = nil
predMasinouTornadoCas = nil
zaMasinouTornadoCas = nil
maxVzdalenost = 25000
poleKOdeslani = {}
prijateZpravy = {}

delkaVlakuLast = 0
delkaVlaku = 0

pocetMG = 0
pocetZapnutychVozu = 0

dolniMezKompresoru = 8.2
horniMezKompresoru = 9.7

mgUnitValueLast = 0
zapnuteVozyValueLast = 0

dvereTlak = 0
prepinaceTlak = 0

ujeteMetryAI = 0
casPlayerReflektor = 0
vzdalenostAI = 0
vzdalenostAIlast = 0

provedPrijetiVUpdate = false

bylKS = false
ksOK = false
casKS = 0

vevnitr = true
vOddile = false

pocetHaslerUpdate = 0
casHasler = 0
sumHasler = 0

skriptVersion = -1

function genChckSum(fileObject)
	fileObject = assert(fileObject, "Soubor nebyl nalezeny!")
	chckSum = 0
	char = fileObject:read(1)
	while char do
		chckSum = chckSum + string.byte(char)
    	char = fileObject:read(1)
	end
	chckSum = math.mod(chckSum, 256)
	chckSum = 256 - chckSum
	fileObject:close()
	return chckSum
end

function overKS()
	if scriptVersion == 460021 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\460_modra.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 256 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 021 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 021 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\460021.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 255 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 021 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 021 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-1.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 192 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-2.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 40 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-4.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460021\\Textures\\460-6.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 021 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	elseif scriptVersion == 460063 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\460_063.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 063 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 063 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\460063.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 86 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 063 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 063 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-1.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-2.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 104 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-4.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460063\\Textures\\460-6.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 063 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	elseif scriptVersion == 460064 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\460_064.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 064 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 064 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\460064.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 190 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 064 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 064 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-1.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 192 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-2.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 184 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-4.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460064\\Textures\\460-6.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 128 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 064 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	elseif scriptVersion == 460080 then
		extModel = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\460_muz.GeoPcDx", "rb")
		local ks = genChckSum(extModel)
		if ks ~= 64 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet modelu 460 080 je "..ks.." a neshoduje se s originalnim modelem!")
			Print("Kontrolni soucet modelu 460 080 je "..ks.." a neshoduje se s originalnim modelem!")
			--return false
		end

		BPmain021 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\460080.bin", "rb")
		local ks = genChckSum(BPmain021)
		if ks ~= 76 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet blueprintu 460 080 je "..ks.." a neshoduje se s originalnim blueprintem!")
			Print("Kontrolni soucet blueprintu 460 080 je "..ks.." a neshoduje se s originalnim blueprintem!")
			--return false
		end

		tex021_1 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079a.TgPcDx", "rb")
		local ks = genChckSum(tex021_1)
		if ks ~= 256 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_2 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079b.TgPcDx", "rb")
		local ks = genChckSum(tex021_2)
		if ks ~= 256 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_4 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079c.TgPcDx", "rb")
		local ks = genChckSum(tex021_4)
		if ks ~= 224 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end

		tex021_6 = io.open("Assets\\Smejki\\CD460pack01\\RailVehicles\\Electric\\460080\\Textures\\460079c1.TgPcDx", "rb")
		local ks = genChckSum(tex021_6)
		if ks ~= 96 then
			-- os.execute()
			SysCall("ScenarioManager:TriggerScenarioFailure", "Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			Print("Kontrolni soucet textur 460 080 je "..ks.." a neshoduje se s originalnimi texturami!")
			--return false
		end
	end
	return true
end

function ZpravaDebug(zprava)
	if gDebug then
		printID = ID
		if printID == nil then
			printID = Call("GetRVNumber")
		end
		Print("CD460 - ID"..printID)
		Print("Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))))
		Print("Zprava: "..zprava.."\n")
		f = assert(io.open("460.log", "a"))
		f:write("CD460 - ID: "..printID.." :: Rizena: "..tostring(ToBolAndBack(Call("GetIsEngineWithKey"))).." :: Zprava: "..zprava.."\n")
		f:close()
	end
end

function divMod(x,y)
    return math.floor(x / y), x - math.floor(x/y)*y
end

function split(s, delimiter)
	local result = { }
	local from  = 1
	local delim_from, delim_to = string.find( s, delimiter, from  )
	while delim_from do
		table.insert( result, string.sub( s, from , delim_from-1 ) )
		from  = delim_to + 1
		delim_from, delim_to = string.find( s, delimiter, from  )
	end
	table.insert( result, string.sub( s, from  ) )
	return result
end

function modulo(x,y)
    return x - math.floor(x/y)*y
end

char = string.char
pairs = pairs
floor = math.floor
table_insert = table.insert
table_concat = table.concat
unpack = table.unpack or unpack

local function unicode_to_utf8(code)
   -- converts numeric UTF code (U+code) to UTF-8 string
   local t, h = {}, 128
   while code >= h do
      t[table.getn(t)+1] = 128 + modulo(code,64)
      code = floor(code/64)
      h = h > 32 and 32 or h/2
   end
   t[table.getn(t)+1] = 256 - 2*h + code
   return char(unpack(t)):reverse()
end

local function utf8_to_unicode(utf8str, pos)
   -- pos = starting byte position inside input string (default 1)
   pos = pos or 1
   local code, size = string.byte(utf8str, pos), 1
   if code >= 192 and code < 254 then
      local mask = 64
      code = code - 128
      repeat
         local next_byte = string.byte(utf8str, pos + size) or 0
         if next_byte >= 128 and next_byte < 192 then
            code, size = (code - mask - 2) * 64 + next_byte, size + 1
         else
            code, size = string.byte(utf8str, pos), 1
         end
         mask = mask * 32
      until code < mask
   end
   -- returns code, number of bytes in this utf8 char
   return code, size
end
--------------------------------TABULKA ZNAKU---------------
	--á(225) = °(176)
	--Á(193) = 1(49)
	--č(269) = 2(50)
	--Č(268) = 3(51)
	--ď(271) = 4(52)
	--Ď(270) = 5(53)
	--é(233) = 6(54)
	--ě(283) = 7(55)
	--É(201) = 8(56)
	--Ě(282) = 9(57)
	--í(237) = 0(48)
	--Í(205) = %(37)
	--ň(328) = +(43)
	--Ň(327) = `(96)
	--ó(243) = !(33)
	--Ó(211) = @(64)
	--ř(345) = #(35)
	--Ř(344) = $(36)
	--š(353) = ^(94)
	--Š(352) = &(38)
	--ť(357) = *(42)
	--Ť(356) = =(61)
	--ú(250) = {(123)
	--ů(367) = }(125)
	--Ú(218) = [(91)
	--Ů(366) = ](93)
	--ý(253) = ;(59)
	--Ý(221) = ¤(164)
	--ž(382) = /(47)
    --Ž(381) = \(92)
local map_unicode_to_1252 = {
   [8364] = 128,
   [129] = 129,
   [8218] = 130,
   [402] = 131,
   [8222] = 132,
   [8230] = 133,
   [8224] = 134,
   [8225] = 135,
   [710] = 136,
   [8240] = 137,
   [352] = 38,
   [8249] = 139,
   [338] = 140,
   [141] = 141,
   [381] = 92,
   [143] = 143,
   [144] = 144,
   [8216] = 145,
   [8217] = 146,
   [8220] = 147,
   [8221] = 148,
   [8226] = 149,
   [8211] = 150,
   [8212] = 151,
   [732] = 152,
   [8482] = 153,
   [353] = 94,
   [8250] = 155,
   [339] = 156,
   [157] = 157,
   [382] = 47,
   [376] = 159,
   [160] = 160,
   [161] = 161,
   [162] = 162,
   [163] = 163,
   [164] = 164,
   [165] = 161,
   [166] = 166,
   [167] = 167,
   [168] = 168,
   [196] = 48,
   [170] = 170,
   [356] = 61,
   [172] = 172,
   [173] = 173,
   [1125] = 174,
   [175] = 175,
   [176] = 176,
   [177] = 177,
   [178] = 178,
   [179] = 179,
   [180] = 180,
   [162] = 181,
   [182] = 182,
   [183] = 183,
   [184] = 184,
   [197] = 48,
   [186] = 186,
   [357] = 42,
   [188] = 188,
   [189] = 189,
   [1126] = 190,
   [191] = 191,
   [184] = 95,
   [193] = 49,
   [194] = 194,
   [195] = 195,
   [196] = 196,
   [157] = 197,
   [198] = 198,
   [199] = 199,
   [268] = 51,
   [201] = 56,
   [202] = 202,
   [203] = 203,
   [282] = 57,
   [205] = 37,
   [206] = 206,
   [270] = 53,
   [208] = 208,
   [209] = 209,
   [327] = 96,
   [211] = 64,
   [212] = 212,
   [213] = 213,
   [214] = 214,
   [215] = 215,
   [344] = 36,
   [366] = 93,
   [218] = 91,
   [219] = 219,
   [220] = 220,
   [221] = 164,
   [222] = 222,
   [223] = 52,
   [185] = 224,
   [225] = 176,
   [226] = 226,
   [227] = 227,
   [228] = 228,
   [158] = 54,
   [230] = 230,
   [231] = 231,
   [269] = 50,
   [233] = 54,
   [234] = 234,
   [235] = 235,
   [283] = 55,
   [237] = 48,
   [238] = 238,
   [271] = 52,
   [240] = 240,
   [241] = 241,
   [328] = 43,
   [243] = 33,
   [244] = 244,
   [245] = 245,
   [246] = 246,
   [247] = 247,
   [345] = 35,
   [367] = 125,
   [250] = 123,
   [251] = 251,
   [252] = 252,
   [253] = 59,
   [254] = 254,
   [255] = 255,
}

local map_custom_upper_1252_to_lower = {
    [49] = 176,
    [51] = 50,
    [53] = 52,
    [56] = 54,
    [57] = 55,
    [37] = 48,
    [96] = 43,
    [64] = 33,
    [36] = 35,
    [38] = 94,
    [61] = 42,
    [91] = 123,
    [93] = 125,
    [164] = 59,
    [92] = 47,
    [95] = 45,
    [215] = 40,
    [168] = 41,
    [63] = 32,
    [126] = 46,
    [167] = 44
}

local map_custom_lower_1252_to_upper = {
    [176] = 49,
    [50] = 51,
    [52] = 53,
    [54] = 56,
    [55] = 57,
    [48] = 37,
    [43] = 96,
    [33] = 64,
    [35] = 36,
    [94] = 38,
    [42] = 61,
    [123] = 91,
    [125] = 93,
    [59] = 164,
    [47] = 92,
    [45] = 95,
    [40] = 215,
    [41] = 168,
    [32] = 63,
    [46] = 126,
    [44] = 167
}

local map_line_disp_to_upper_line_disp = {
    [32] = 63,
    [48] = 37
}

local map_upper_line_disp_to_line_disp = {
    [63] = 32,
    [37] = 48
}

local map_unicode_to_inverse_line_disp = {
    [49] = 33,
    [50] = 64,
    [51] = 35,
    [52] = 36,
    [53] = 41,
    [54] = 94,
    [55] = 38,
    [56] = 42,
    [57] = 40
}

function string.fromutf8(utf8str)
	local pos, result_1252 = 1, {}
	while pos <= string.len(utf8str) do
		local code, size = utf8_to_unicode(utf8str, pos)
		pos = pos + size
		code = code < 128 and code or map_unicode_to_1252[code] or string.byte('?')
		table_insert(result_1252, char(code))
	end
	return table_concat(result_1252)
end

function string.lowerCustomEncoded1252(CP1252customEncoded)
	local pos, result_1252 = 1, {}
	while pos <= string.len(CP1252customEncoded) do
		local code, size = utf8_to_unicode(CP1252customEncoded, pos)
		pos = pos + size
		code = map_custom_upper_1252_to_lower[code] or code
		table_insert(result_1252, char(code))
	end
    return table_concat(result_1252)
end

function string.upperCustomEncoded1252(CP1252customEncoded)
	local pos, result_1252 = 1, {}
	while pos <= string.len(CP1252customEncoded) do
		local code, size = utf8_to_unicode(CP1252customEncoded, pos)
		pos = pos + size
		code = map_custom_lower_1252_to_upper[code] or code
		table_insert(result_1252, char(code))
	end
    return table_concat(result_1252)
end

function string.upperLineDisp(CP1252customEncoded)
	local pos, result_1252 = 1, {}
	while pos <= string.len(CP1252customEncoded) do
		local code, size = utf8_to_unicode(CP1252customEncoded, pos)
		pos = pos + size
		code = map_line_disp_to_upper_line_disp[code] or code
		table_insert(result_1252, char(code))
	end
    return table_concat(result_1252)
end

function string.lowerLineDisp(CP1252customEncoded)
	local pos, result_1252 = 1, {}
	while pos <= string.len(CP1252customEncoded) do
		local code, size = utf8_to_unicode(CP1252customEncoded, pos)
		pos = pos + size
		code = map_upper_line_disp_to_line_disp[code] or code
		table_insert(result_1252, char(code))
	end
    return table_concat(result_1252)
end

function string.inverseLineDisp(CP1252customEncoded)
    local pos, result_1252 = 1, {}
    local CP1252customEncoded = string.upper(CP1252customEncoded)
    while pos <= string.len(CP1252customEncoded) do
        local code, size = utf8_to_unicode(CP1252customEncoded, pos)
        pos = pos + size
        code = map_unicode_to_inverse_line_disp[code] or code
        table_insert(result_1252, char(code))
    end
    return table_concat(result_1252)
end

IS = {
	maxDelky = {
		MSVlinkaOUT = 2,
		MSVlinkaIN = 16,
		MSVcil1OUT = 16,
		MSVcil1IN = 16,
		MSVcil2OUT = 16,
		MSVcil2IN = 16,
		MSVcilCelaPlochaOUT = 16,
		MSVcilCelaPlochaIN = 16,
		MSVid = 2,
	},
    cile1IN = {},
    cile1INremap = {},
	cile1OUT = {},
	cileIsWhole = {},
    cile2IN = {},
    cile2INremap = {},    
	cile2OUT = {},
	linkyOUT = {},
    linkyIN = {},
	stav = "start",
	cil1ID = 1,
	cil2ID = 1,
	linkaID = 1,
	casStart = 0,
    casMenu = 0,
    rezim = 1,
	Zapis = function(self, kam, co, zleva, center, escChar)
        local maxDelka = IS.maxDelky[kam]
        escChar = escChar or " "
		if maxDelka then
			if string.len(co) > maxDelka then
				co = string.sub(co,1,maxDelka)
			end
			if not center then
				while string.len(co) < maxDelka do
					if not zleva then
						co = co..escChar
					else
						co = escChar..co
					end
				end
			else
				local pocetMezerLeva = math.floor((maxDelka - string.len(co))/2)
				local i = 0
				while i < pocetMezerLeva do
					co = escChar..co
					i = i + 1
				end
				while string.len(co) < maxDelka do
					co = co..escChar
				end
			end
			if kam ~= "MSVcil1IN" and kam ~= "MSVcil2IN" and kam ~= "MSVlinkaIN" and kam ~= "MSVid" then
				Call(kam..":SetText",co,0)
				Call(kam.."2:SetText",co,0)
			else
                Call(kam..":SetText",co,0)
			end
		end
	end,
	NastavLinku = function(self, ID, inverzni)
		IS:Zapis("MSVlinkaOUT",IS.linkyOUT[ID],false,false)
        if not inverzni then --neinverzni zapis
            IS:Zapis("MSVlinkaIN",string.lowerLineDisp(string.lower(IS.linkyIN[ID])),false,false)
        else
            IS:Zapis("MSVlinkaIN",string.inverseLineDisp(string.upperLineDisp(string.upper(IS.linkyIN[ID]))),false,false, "?")
        end
	end,
	NastavCil1 = function(self, ID, inverzni)
		if IS.cileIsWhole[ID] == "false" then
			IS:Zapis("MSVcil1OUT",IS.cile1OUT[ID],false,false)
			IS:Zapis("MSVcilCelaPlochaOUT","",false,false)
			IS:NastavCil2(IS.cil2ID)
			IS:NastavLinku(IS.linkaID)
		else
			IS:Zapis("MSVcil1OUT","",false,false)
			IS:Zapis("MSVcilCelaPlochaOUT",IS.cile1OUT[ID],false,true)
		end
		if IS.cileIsWhole[ID] == "true" then
			IS:Zapis("MSVlinkaOUT","",false,false)
			IS:Zapis("MSVlinkaIN","",false,false)
			IS:Zapis("MSVcil2OUT","",false,false)
			IS:Zapis("MSVcil2IN","",false,false)
        end
        if not inverzni then --neinverzni zapis
            IS:Zapis("MSVcil1IN",string.lowerCustomEncoded1252(string.lower(IS.cile1IN[ID])),false,false)
        else
            IS:Zapis("MSVcil1IN",string.upperCustomEncoded1252(string.upper(IS.cile1IN[ID])),false,false, "?")
        end
	end,
	NastavCil2 = function(self, ID, inverzni)
		IS:Zapis("MSVcil2OUT",IS.cile2OUT[ID],true,false)
        if not inverzni then --neinverzni zapis
            IS:Zapis("MSVcil2IN",string.lowerCustomEncoded1252(string.lower(IS.cile2IN[ID])),false,false)
        else
            IS:Zapis("MSVcil2IN",string.upperCustomEncoded1252(string.upper(IS.cile2IN[ID])),false,false, "?")
        end
	end,
	NastavCislo = function(self, ID)
		IS:Zapis("MSVid",tostring(ID-1),true,false)
	end,
	SipkaNahoru = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "menu"
            IS:NastavCil1(IS.cil1ID)
            if IS.cileIsWhole[IS.cil1ID] == "false" then
                Call("SetControlValue", "MSVzdo", 0, 1)
            end
            Call("SetControlValue", "MSVdisp", 0, 2)
        elseif IS.stav == "menu" and IS.cileIsWhole[IS.cil1ID] == "false" then
			local cil1 = IS.cil1ID
			local cil2 = IS.cil2ID
			IS.cil1ID = IS.cile2INremap[cil2]
			IS.cil2ID = IS.cile1INremap[cil1]
			IS:NastavCil1(IS.cil1ID)
			IS:NastavCil2(IS.cil2ID)
			if IS.stav == "cil1" then
				IS:NastavCislo(IS.cil1ID)
			elseif IS.stav == "cil2" then
				IS:NastavCislo(IS.cil2ID)
			end
		elseif IS.stav == "cil1" then
			IS.cil1ID = IS.cil1ID + 1
			if IS.cil1ID > table.getn(IS.cile1IN) then
				IS.cil1ID = 1
			end
			IS:NastavCil1(IS.cil1ID,true)
			IS:NastavCislo(IS.cil1ID)
		elseif IS.stav == "cil2" then
			IS.cil2ID = IS.cil2ID + 1
			if IS.cil2ID > table.getn(IS.cile2IN) then
				IS.cil2ID = 1
			end
			IS:NastavCil2(IS.cil2ID,true)
			IS:NastavCislo(IS.cil2ID)
		elseif IS.stav == "linka" then
			IS.linkaID = IS.linkaID + 1
			if IS.linkaID > table.getn(IS.linkyIN) then
				IS.linkaID = 1
			end
			IS:NastavLinku(IS.linkaID,true)
			IS:NastavCislo(IS.linkaID)
		end
	end,
	SipkaDolu = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
            IS.stav = "menu"
            IS:NastavCil1(IS.cil1ID)
            if IS.cileIsWhole[IS.cil1ID] == "false" then
                Call("SetControlValue", "MSVzdo", 0, 1)
            end
            Call("SetControlValue", "MSVdisp", 0, 2)
        elseif IS.stav == "menu" and IS.cileIsWhole[IS.cil1ID] == "false" then
			local cil1 = IS.cil1ID
			local cil2 = IS.cil2ID
			IS.cil1ID = IS.cile2INremap[cil2]
			IS.cil2ID = IS.cile1INremap[cil1]
			IS:NastavCil1(IS.cil1ID)
			IS:NastavCil2(IS.cil2ID)
			if IS.stav == "cil1" then
				IS:NastavCislo(IS.cil1ID)
			elseif IS.stav == "cil2" then
				IS:NastavCislo(IS.cil2ID)
			end
		elseif IS.stav == "cil1" then
			IS.cil1ID = IS.cil1ID - 1
			if IS.cil1ID <= 0 then
				IS.cil1ID = table.getn(IS.cile1IN)
			end
			IS:NastavCil1(IS.cil1ID,true)
			IS:NastavCislo(IS.cil1ID)
		elseif IS.stav == "cil2" then
			IS.cil2ID = IS.cil2ID - 1
			if IS.cil2ID <= 0 then
				IS.cil2ID = table.getn(IS.cile2IN)
			end
			IS:NastavCil2(IS.cil2ID,true)
			IS:NastavCislo(IS.cil2ID)
		elseif IS.stav == "linka" then
			IS.linkaID = IS.linkaID - 1
			if IS.linkaID <= 0 then
				IS.linkaID = table.getn(IS.IS.linkyIN)
			end
			IS:NastavLinku(IS.linkaID,true)
			IS:NastavCislo(IS.linkaID)
		end
	end,
	Potvrzeni = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
            IS.stav = "menu"
            IS:NastavCil1(IS.cil1ID)
            if IS.cileIsWhole[IS.cil1ID] == "false" then
                Call("SetControlValue", "MSVzdo", 0, 1)
            end
            Call("SetControlValue", "MSVdisp", 0, 2)
        elseif IS.stav == "menu" then
            IS.stav = "cil1"
            IS:NastavCil1(IS.cil1ID, true)
            IS:NastavCislo(IS.cil1ID)
            Call("SetControlValue", "MSVzdo", 0, 0)
		elseif IS.stav == "cil1" then
			if IS.cileIsWhole[IS.cil1ID] == "false" then
                IS:NastavCislo(IS.cil2ID)
                IS:NastavCil1(IS.cil1ID)
                IS:NastavCil2(IS.cil2ID, true)
                IS:NastavLinku(IS.linkaID)
                IS.stav = "cil2"
            else
                IS:NastavCil1(IS.cil1ID)
                IS:Zapis("MSVid","",false,false)
                IS.stav = "menu"
			end
		elseif IS.stav == "cil2" then
			IS:NastavCislo(IS.linkaID)
            IS:NastavCil1(IS.cil1ID)
            IS:NastavCil2(IS.cil2ID)
            IS:NastavLinku(IS.linkaID, true)
			IS.stav = "linka"
		elseif IS.stav == "linka" then
            IS:Zapis("MSVid","",false,false)
            IS:NastavCil1(IS.cil1ID)
            IS:NastavCil2(IS.cil2ID)
            IS:NastavLinku(IS.linkaID)
            if IS.cileIsWhole[IS.cil1ID] == "false" then
                Call("SetControlValue", "MSVzdo", 0, 1)
            end
			IS.stav = "menu"
		end
	end,
	SipkaBok = function(self)
		IS.casMenu = 0
		if IS.stav == "sleep" then
			IS.stav = "menu"
            IS:NastavCil1(IS.cil1ID)
            if IS.cileIsWhole[IS.cil1ID] == "false" then
                Call("SetControlValue", "MSVzdo", 0, 1)
            end
            Call("SetControlValue", "MSVdisp", 0, 2)
		else
            if IS.rezim == 2 then
                IS.rezim = 1
            else
                IS.rezim = 2
            end
            Call("SetControlValue", "MSVrezim", 0, IS.rezim)
		end
	end,
	VymazVse = function(self)
		IS:Zapis("MSVlinkaOUT","",false,false)
		IS:Zapis("MSVlinkaIN","",false,false)
		IS:Zapis("MSVcil1OUT","",false,false)
		IS:Zapis("MSVcil1IN","",false,false)
		IS:Zapis("MSVcil2OUT","",false,false)
		IS:Zapis("MSVcil2IN","",false,false)
		IS:Zapis("MSVcilCelaPlochaOUT","",false,false)
        IS:Zapis("MSVid","",false,false)
        Call("SetControlValue", "", 0, 0)
        Call("SetControlValue", "MSVzdo", 0, 0)
        Call("SetControlValue", "MSVrezim", 0, 0)
        Call("SetControlValue", "MSVdisp", 0, 0)
	end
}

function NactiIS()
	local souborCile = io.open("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/cile.ci4", "rb")
	local souborLinky = io.open("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/linky.lin", "rb")
	
	if souborCile then
		souborCile:close()
		for radek in io.lines("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/cile.ci4") do
			if table.getn(IS.cile1IN) == 99 then
				break
			end
			if not string.find(radek,"#") then
				radek = string.fromutf8(radek)
				local splitted = split(radek,"|")
				local cilIN = splitted[1]
				local cilOUT = splitted[2]
				local cilIS = splitted[3]
				IS.cile1IN[table.getn(IS.cile1IN)+1] = cilIN
				IS.cile1OUT[table.getn(IS.cile1OUT)+1] = cilOUT
				IS.cileIsWhole[table.getn(IS.cileIsWhole)+1] = cilIS
				if IS.cileIsWhole[table.getn(IS.cileIsWhole)] == "false" then
					IS.cile2IN[table.getn(IS.cile2IN)+1] = cilIN
                    IS.cile2OUT[table.getn(IS.cile2OUT)+1] = cilOUT
                    IS.cile2INremap[table.getn(IS.cile2IN)] = table.getn(IS.cile1IN)
				end
                IS.cile1INremap[table.getn(IS.cile1IN)] = table.getn(IS.cile2IN)
			end
		end
	else
		IS.cile1IN[1] = "pr°zdn; displej"
		IS.cile1OUT[1] = " "
		IS.cileIsWhole[1] = "true"
	end
	if souborLinky then
		souborLinky:close()
		for radek in io.lines("Assets/Smejki/CD460pack01/RailVehicles/Electric/Common/MSV/linky.lin") do
			if not string.find(radek,"#") then
				radek = string.fromutf8(string.lower(radek))
				local splitted = split(radek,"|")
				local linkaIN = string.upper(splitted[1])
				local linkaOUT = string.upper(splitted[2])
				IS.linkyIN[table.getn(IS.linkyIN)+1] = linkaIN
				IS.linkyOUT[table.getn(IS.linkyOUT)+1] = linkaOUT
			end
			if table.getn(IS.linkyIN) == 99 then
				break
			end
		end
	else
		IS.linkyIN[1] = "nen% linka"
		IS.linkyOUT[1] = " "
	end
	ZpravaDebug("Nacteno "..table.getn(IS.cile1IN).." cilu a "..table.getn(IS.linkyIN).." linek do IS!")
end

NactiIS()

caskroku = (math.random(8,12)/20)
caszkroku = (math.random(3,7)/20)


rp_270A = math.random(220,320)
rp_350A = math.random(300,400)
rp_420A = math.random(370,470)
rp_480A = math.random(430,530)
rp_570A = math.random(520,620)

lastTramex = 0
tramexSipickaHore = false
tramexSipickaDole = false
tramexCasSipicka = 0
tramexInit = false
nulovyDoraz = false
maximalniDoraz = false
tramexDrahaKm = math.random(10000,1000000)
tramexRelDrahaKm = 0
tramexStrojvedouci = ""
tramexSluzebna = ""
tramexStanice = ""
tramexCisloVlaku = ""..math.random(1700,3799)
tramexHmotnost = "239"
tramexNaprav = "16"
tramexRezimBrzdeni = 98
tramexBrzdiciProc = "104"
tramexKodZeme = "1"
tramexHeslo = ""

TRAMEX_VYP = 0
TRAMEX_CAS = 1
TRAMEX_DATUM = 2
TRAMEX_DRAHA = 3
TRAMEX_RELDRAHA = 4
TRAMEX_POMALAJIZDA = 5
TRAMEX_HLAVNIMENU = 16
	TRAMEX_HM_ZADVOL = 6
		TRAMEX_ZV_STROJVED = 61
		TRAMEX_ZV_SLUZ = 62
		TRAMEX_ZV_STAN = 63
		TRAMEX_ZV_CVLAKU = 64
		TRAMEX_ZV_HMOTNOST = 65
		TRAMEX_ZV_NAPRAV = 66
		TRAMEX_ZV_BRZDREZ = 67
		TRAMEX_ZV_BRZDPROC = 68
		TRAMEX_ZV_KODZEME = 69
	TRAMEX_HM_ZADZAKL = 7
	TRAMEX_HM_ZADCHRAN = 8
	TRAMEX_HM_ZAKLUD = 9
		TRAMEX_ZU_RYCH = 91
		TRAMEX_ZU_CAS = 92
		TRAMEX_ZU_DATUM = 93
		TRAMEX_ZU_DRAHA = 94
		TRAMEX_ZU_RELDR = 95
		TRAMEX_ZU_ZMENACAS = 96
			TRAMEX_ZU_ZMENACAS_STAV = 961
	TRAMEX_HM_STATVOL = 10
		TRAMEX_SV_STROJVED = 101
		TRAMEX_SV_SLUZ = 102
		TRAMEX_SV_STAN = 103
		TRAMEX_SV_CVLAKU = 104
		TRAMEX_SV_HMOTNOST = 105
		TRAMEX_SV_NAPRAV = 106
		TRAMEX_SV_BRZDREZ = 107
		TRAMEX_SV_BRZDPROC = 108
		TRAMEX_SV_KODZEME = 109
    TRAMEX_HM_STATCHRA = 11
	TRAMEX_HM_DIAG = 12
	TRAMEX_HM_SERVIS = 13
TRAMEX_ZAJIZDY_NELZE = 14
TRAMEX_NELZESPUSTIT = 15
TRAMEX_HESLO = 17
TRAMEX_CHYBNEHESLO = 18
TRAMEX_PJIZDA = 19
TRAMEX_DATA_ULOZENA = 20
TRAMEX_G = 96
TRAMEX_P = 97
TRAMEX_R = 98
TRAMEX_RMG = 99
tramexCasMenu = 0
tramexStav = TRAMEX_VYP
tramexStavPredMenu = TRAMEX_CAS
tramex3secZobrazeni = -1
tramexStavPred3sec = TRAMEX_VYP
tramexPomalaJizdaMetry = -1
tramexStavPredKPJ = TRAMEX_VYP
tramexOldContent = false
tramexUpravenePolicko = false
tramexZadavani = false

tramexLast0 = false
tramexLast1 = false
tramexLast2 = false
tramexLast3 = false
tramexLast4 = false
tramexLast5 = false
tramexLast6 = false
tramexLast7 = false
tramexLast8 = false
tramexLast9 = false
tramexLastKPJ = false
tramexLastErr = false
tramexLastKM = false
tramexLastCas = false
tramexLastRet = false
tramexLastEnt = false
tramexLastMenu = false
tramexLastDoleva = false
tramexLastDoprava = false

ohrevLeve = 1
ohrevLevePredni = 1
ohrevPravePredni = 1
ohrevPrave = 1

vypnutyVuz = false
venku = false

NABEH_VENTILATORY = math.random(5,9)/10

startDelay = 0

odkalovaniJimek = false

zkratTM = false
zkratMG = false

ADHESE_VYUZITI = 0.80
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

adheseRandomCtdnPodvozek1 = math.random(40, 200)
adheseRandomLenCtuPodvozek1 = 0

adheseRandomCtdnPodvozek2 = math.random(40, 200)
adheseRandomLenCtuPodvozek2 = 0

decisiveAdhesionPodvozek1 = 0
decisiveAdhesionPodvozek2 = 0
brakeAdhesionAdditionPodvozek1 = 0
brakeAdhesionAdditionPodvozek2 = 0

cilovaRychlostKolaPodvozek1 = 0
rychlostKolaPodvozek1 = 0
rychlostKolaKMHPodvozek1 = 0

cilovaRychlostKolaPodvozek2 = 0
rychlostKolaPodvozek2 = 0
rychlostKolaKMHPodvozek2 = 0

prahDSO = math.random(10,60)/2
obutiVolume = math.max(math.random(-3,1),0)
obuti = 0
obutiDistance = 2.4772805742778301026860760754598

soundPantoUp = 0
soundPantoDown = 0
soundJiskreni = 0

releSoucinnostiBrzd = false
tlakVeValcich = false

cilovaTBC = 0
actualTBC = 0

casOJ = 0
kontrolerLast = 0

blokujJK = false

idealniNapeti = 3000
tabulkaNapeti = {}

napetiTargetDelta = math.random()*700-400
napetiDeltaSpeed = math.random(1,20)
napetiDelta = napetiTargetDelta

tvrdostNapetiTarget = math.random()
tvrdostNapeti = tvrdostNapetiTarget

napetiBaterieRizeni = math.random()*10+40
napetiBaterieRizeniSmooth = 0
napetiBaterieAutostop = math.random()*10+40
napetiBaterieAutostopSmooth = 0
proudBaterieRizeni = 0
proudBaterieRizeniSmooth = 0
proudBaterieAutostop = 0
proudBaterieAutostopSmooth = 0

modelConfig = {
    [460021] = {
        tramex = false,
        metra = false,
        led = false,
        horniPozicka = true,
        vystraha = false,
        delkaVystrahy = 0,
        ctyriSberace = false,
        stupneEDB = 2
    },
    [460063] = {
        tramex = true,
        metra = false,
        led = true,
        horniPozicka = true,
        vystraha = true,
        delkaVystrahy = 2.5,
        ctyriSberace = false,
        stupneEDB = 2
    },
    [460064] = {
        tramex = true,
        metra = false,
        led = true,
        horniPozicka = true,
        vystraha = true,
        delkaVystrahy = 2.5,
        ctyriSberace = false,
        stupneEDB = 2
    },
    [460079] = {
        tramex = false,
        metra = true,
        led = false,
        horniPozicka = false,
        vystraha = false,
        delkaVystrahy = 0,
        ctyriSberace = true,
        stupneEDB = 2
    },
    [460080] = {
        tramex = false,
        metra = true,
        led = false,
        horniPozicka = false,
        vystraha = false,
        delkaVystrahy = 0,
        ctyriSberace = true,
        stupneEDB = 2
    }
}

-- BS2 = {
--     --USER DEFINED
--         HANDLE_POS = {
--             SVIH = 0,
--             JIZDA = 0.1,
--             ZAVER = 0.18,
--             FIRST_BRAKE_NOTCH = 0.28,
--             LAST_BRAKE_NOTCH = 0.78,
--             UZAMYKATELNY_ZAVER = 0.86,
--             RYCHLOBRZDA = 1
--         },
--         DEFAULT_MAIN_PIPE_PRESSURE = math.random(49,51)/10,
--         FIRST_BRAKE_NOTCH_PRESS_DROP = 0.3,
--         SOUND_CONTROLLERS = {

--         },
--         RATES = {},
--     --INTERNAL VARIABLES
--         TRIGGERS = {
--             S_J = self.HANDLE_POS.SVIH + (self.HANDLE_POS.JIZDA-self.HANDLE_POS.SVIH)/2,
--             J_Z = self.HANDLE_POS.JIZDA + (self.HANDLE_POS.ZAVER-self.HANDLE_POS.JIZDA)/2,
--             Z_B = self.HANDLE_POS.ZAVER + (self.HANDLE_POS.FIRST_BRAKE_NOTCH-self.HANDLE_POS.ZAVER)/2,
--             B_Z = self.HANDLE_POS.LAST_BRAKE_NOTCH + (self.HANDLE_POS.UZAMYKATELNY_ZAVER-self.HANDLE_POS.LAST_BRAKE_NOTCH)/2,
--             Z_R = self.HANDLE_POS.UZAMYKATELNY_ZAVER + (self.HANDLE_POS.RYCHLOBRZDA-self.HANDLE_POS.UZAMYKATELNY_ZAVER)/2
--         },
--         main_reservoir_pressure = 0,
--         brake_handle_position = 0,
--         ridici_ustroji = {
--             vychozi_tlak = self.DEFAULT_MAIN_PIPE_PRESSURE,
--             nastaveny_tlak = 0,
--             skutecny_tlak = 0
--         },
--         rozvodove_ustroji = {
--             vstupni_tlak = 0,
--             vystupni_tlak = 0
--         },
--         ventil_svihu = false,
--         prerusovaci_ventil = false,
--         rychlocinny_ventil = false,
--         nizkotlake_prebiti = false,
--         tlak_nizkotlake_prebiti = 0,
--         linearni_odvetrani = false,
--         tlak_potrubi = 0,
--         delka_vlaku = 0,
--     --INTERNAL FUNCTIONS
--         init = function()
--             -- self.TRIGGERS.S_J = self.HANDLE_POS.SVIH + (self.HANDLE_POS.JIZDA-self.HANDLE_POS.SVIH)/2
--             -- self.TRIGGERS.J_Z = self.HANDLE_POS.JIZDA + (self.HANDLE_POS.ZAVER-self.HANDLE_POS.JIZDA)/2
--             -- self.TRIGGERS.Z_B = self.HANDLE_POS.ZAVER + (self.HANDLE_POS.FIRST_BRAKE_NOTCH-self.HANDLE_POS.ZAVER)/2
--             -- self.TRIGGERS.B_Z = self.HANDLE_POS.LAST_BRAKE_NOTCH + (self.HANDLE_POS.UZAMYKATELNY_ZAVER-self.HANDLE_POS.LAST_BRAKE_NOTCH)/2
--             -- self.TRIGGERS.Z_R = self.HANDLE_POS.UZAMYKATELNY_ZAVER + (self.HANDLE_POS.RYCHLOBRZDA-self.HANDLE_POS.UZAMYKATELNY_ZAVER)/2
--             -- self.ridici_ustroji.vychozi_tlak = self.DEFAULT_MAIN_PIPE_PRESSURE
--         end,
--         update = function()
--             if (self.brake_handle_position < self.TRIGGERS.S_J) then
--                 self.ridici_ustroji.nastaveny_tlak = self.main_reservoir_pressure
--                 self.ventil_svihu = true
--                 self.rychlocinny_ventil = false
--                 self.prerusovaci_ventil = true
--             elseif (self.brake_handle_position < self.TRIGGERS.J_Z) then
--                 self.ridici_ustroji.nastaveny_tlak = self.ridici_ustroji.vychozi_tlak
--                 self.ventil_svihu = false
--                 self.rychlocinny_ventil = false
--                 self.prerusovaci_ventil = true
--             elseif (self.brake_handle_position < self.TRIGGERS.Z_B) then
--                 self.ventil_svihu = false
--                 self.rychlocinny_ventil = false
--                 self.prerusovaci_ventil = false
--             elseif (self.brake_handle_position < self.TRIGGERS.B_Z) then
--                 self.ridici_ustroji.nastaveny_tlak = 
--                     self.ridici_ustroji.vychozi_tlak - 
--                         self.FIRST_BRAKE_NOTCH_PRESS_DROP - 
--                             ((self.brake_handle_position - self.HANDLE_POS.FIRST_BRAKE_NOTCH)*(
--                                 (self.DEFAULT_MAIN_PIPE_PRESSURE-self.FIRST_BRAKE_NOTCH_PRESS_DROP)/(self.HANDLE_POS.LAST_BRAKE_NOTCH-self.HANDLE_POS.FIRST_BRAKE_NOTCH)
--                             ))
--                 self.ventil_svihu = false
--                 self.rychlocinny_ventil = false
--                 self.prerusovaci_ventil = true
--             elseif (self.brake_handle_position < self.TRIGGERS.Z_R) then
--                 self.ventil_svihu = false
--                 self.rychlocinny_ventil = false
--                 self.prerusovaci_ventil = false
--             else
--                 self.ventil_svihu = false
--                 self.rychlocinny_ventil = true
--                 self.prerusovaci_ventil = false
--             end
            
--         end
-- }
-- AIR_SIMULATION = {
--     BRZDIC = BS2,
--     ROZVADEC = {

--     }
-- }

-- srv = net.createConnection(net.TCP, 0)
-- srv:on("receive", function(sck, c) Print(c) end)
-- srv:on("connection", function(sck, c)
--   -- 'Connection: close' rather than 'Connection: keep-alive' to have server 
--   -- initiate a close of the connection after final response (frees memory 
--   -- earlier here), https://tools.ietf.org/html/rfc7230#section-6.6 
--   sck:send("GET /get HTTP/1.1\r\nHost: overuziv.jachyhm.cz\r\nConnection: close\r\nAccept: */*\r\n\r\n")
-- end)
-- srv:connect(80,"overuziv.jachyhm.cz")

--function DefinujPromene()
	pozadavekNaFastStart = false
	PolohaKlice = 0
	klic = 0
	OsvetleniVozu = 0
	KabinaPrist = 0
	osvetleniPomocnik = 0
	hlavniVypinac = 0
	levaPozBil = false
	levaPozBilVPKC = false
	levaPozCer = false
	levaPozCerVPKC = false
	pravaPozBil = false
	pravaPozBilVPKC = false
	pravaPozCer = false
	pravaPozCerVPKC = false
	horniPozBilVKPC = false
	soupatkoVZ = 1
	LVZtimer = 0
	LVZresetOld = 0
	LVZreset = 1
	KlicNaDruheKabine = 0
	RizenaRidici = "rizena"
	gPredniSmetak = 0
    gPredniSberacDelay = 0
    PREDNI_SBERAC_MAX_DELAY = math.random(5,15)/10
    gPressureDelayCoefP = 0
	gZadniSmetak = 0 
    gZadniSberacDelay = 0
    ZADNI_SBERAC_MAX_DELAY = math.random(5,15)/10
    gPressureDelayCoefZ = 0
	casstupnu = 0
	gNejblizsiNavestidlo = -1			-- vzdalenost k nejblizsimu navestidlu s prenosem kodu (max 1250m)
	Smer = 0
	JeNouzovyRadic = 0
	JeNouzovyRadicVS = 0
	ventilatoryTM = 0
	ventilatoryStrecha = 0
	zvukhasler = 0
	proud = 0
	UzJsiZjistovalPanto = false
	ZamekHLvyp = 0
	hh = 0
	necojakomm = 0
	mm = 0
	ss = 0
	dennicas = 0
	cislovlaku="xxxxxx"
	vysilackaObrazovka = 0
	vysilackaObrazovkaStara = 1
	vysilackaboot = 0
	vysilackablikani = 0
	vysilackaprihlasena = 0
	cislovzhasnute = 0
	tlacitko8 = 0
	menupozice=1
	tlacitko1 = 0
	tlacitkoEnter = 0
	cislovlakubuff = 0
	tlacitkoDelete = 0
	tlacitko0 = 0
	tlacitko2 = 0
	tlacitko3 = 0
	tlacitko4 = 0
	tlacitko5 = 0
	tlacitko6 = 0
	tlacitko7 = 0
	tlacitko9 = 0
	pomkomp = 0
	hlkomp = 0
	bylpojistovak = 0
	SvetlaAI = 1
	SmerAI = 0
	PantoJimkaZKom = 0
	PantoJimkaZHJ = 0
	KompresorPrep = 0
	mgp = 0
	mgs = 0
	mg = 0
	mgdocasny = 0
	failvykon = 0
	failmg = 0
	P01 = 0
	SnizenyVykonVozu = false
	-- TlakovyBlokJizdy = false
	VyberJiskry = 0
	deltaSpeedMinula = 0
	baterie = 0
	deltaSpeed = 0
	predMasinou = 0
	zaMasinou = 0
	nezobrazujValce = false
	matrosov = false
	gDebug = false
	gKlicTady = false
	casSkluz = 0
    diagNU = 0
    diagKTM = 0
    diagMG = 0
    diagDOTO = 0
	diagPU = 0
	diagHV = 0
	skluzDiag = 0
	niDiag = 0
    blokKrokSkluz = false
    nutnyRestartDSO = false
	PP = 0
	ZP = 0
    pozadavekNaZapisKlice = false
    casKompresor = -1
    odberVSsmooth = 0
-- 	return(true)
-- end

function PoleFCE (list)
  local set = {}
  for _, l in ipairs(list) do set[l] = true end
  return set
end

function Initialise ()
	Napoveda("Inicializace",1)
	Call ("KourP1L:SetEmitterActive",0 ) 
	Call ("KourP2L:SetEmitterActive",0 ) 
	Call ("KourP1P:SetEmitterActive",0 ) 
	Call ("KourP2P:SetEmitterActive",0 ) 
	Call ( "Zarovka1:Activate", 0 )
	Call ( "Zarovka2:Activate", 0 )
	Call ( "Zarivka1:Activate", 0 )
	Call ( "Zarivka2:Activate", 0 )
	Call ( "Zarivka3:Activate", 0 )
    Call ( "CabLight1:Activate", 0 )
	Call ( "CabLight2:Activate", 0 )
    Call ( "CabLight3:Activate", 0 )
    Call ( "CabLight4:Activate", 0 )
	Call ( "SvetloRychlomer:Activate", 0 )
	Call ( "SvetloAmpermetrHorni:Activate", 0 )
	Call ( "SvetloAmpermetrDolni:Activate", 0 )
	Call ( "SvetloVoltmetrHorni:Activate", 0 )
	Call ( "SvetloVoltmetrDolni:Activate", 0 )
	Call ( "SvetloBudik3:Activate", 0 )
	Call ( "SvetloBudik4:Activate", 0 )
	Call ( "DalkovePrave:Activate", 0 )
	Call ( "DalkoveLeve:Activate", 0 )
	Call ( "ActivateNode","dalkaclevy",0)
	Call ( "ActivateNode","dalkacpravy",0)
	Call ( "ActivateNode","reflektor_rozsviceny",0) 
	Call ( "PozickaHorniBi:Activate", 0 )
	Call ( "PozickaLevaBi:Activate", 0 )
	Call ( "PozickaLevaCr:Activate", 0 )
	Call ( "PozickaPravaBi:Activate", 0 )
	Call ( "PozickaPravaCr:Activate", 0 )
	Call ( "ActivateNode", "pozickalevaBi", 0 ) 
	Call ( "ActivateNode", "pozickalevaCr", 0 ) 
	Call ( "ActivateNode", "pozickapravaBi", 0 ) 
	Call ( "ActivateNode", "pozickapravaCr", 0 ) 
	Call("ZimniJiskra:Activate",0)
	Call("ZimniJiskra1:Activate",0)
	Call("ZimniJiskra2:Activate",0)
	Call("ZimniJiskra3:Activate",0)
	Call("ZimniJiskra4:Activate",0)
	Call ("SetControlValue","JeNouzovyRadic",0,0)
	RocniObdobi = SysCall("ScenarioManager:GetSeason")
	--DefinujPromene()
	Call("PozickaHorniBi:SetRange",12)
	Call("PozickaLevaCr:SetRange",12)
	Call("PozickaLevaBi:SetRange",12)
	Call("PozickaPravaCr:SetRange",12)
	Call("PozickaPravaBi:SetRange",12)
	Call("DalkovePrave:SetRange",500)
	Call("DalkoveLeve:SetRange",500)
	Call("Zarovka1:SetRange",4)
	Call("Zarovka2:SetRange",4)
	Call("Zarivka1:SetRange",4)
	Call("Zarivka2:SetRange",4)
	Call("Zarivka3:SetRange",4)
	Call("CabLight1:SetRange",4)
	Call("CabLight3:SetRange",4)
	Call("CabLight4:SetRange",4)
	Call("SvetloAmpermetrHorni:SetRange",0.07)
	Call("SvetloAmpermetrDolni:SetRange",0.07)
	Call("SvetloVoltmetrHorni:SetRange",0.07)
	Call("SvetloVoltmetrDolni:SetRange",0.07)
	Call("SvetloBudik3:SetRange",0.07)
	Call("SvetloBudik4:SetRange",0.07)
	Call("SvetloRychlomer:SetRange",0.15)
	Call("CabLight2:SetRange",0.5)
	Call("ZimniJiskra:SetRange",200)
	Call("ZimniJiskra2:SetRange",200)
	Call("ZimniJiskra3:SetRange",200)
	Call("ZimniJiskra4:SetRange",200)
	Call ("BeginUpdate")
	Call("SetControlValue","VirtualBrake",0,0)
	Call("SetControlValue","UserVirtualReverser",0,1)
	Call("SetControlValue","VirtualThrottleAndBrake",0,1)
	Call("SetControlValue","VirtualBrake",0,0.86)
	Call("SetControlValue","UserVirtualReverser",0,2)
	Call("SetControlValue","VirtualThrottleAndBrake",0,0)
	predMasinou = Call("SendConsistMessage",460999,"DUMMY",0)
	zaMasinou = Call("SendConsistMessage",460999,"DUMMY",1)
	Call("SetControlValue","PantographControl",0,0)
	NastavHodnotuSID("pocetJimek", 1, 460993)
	if not bylKS then
		bylKS = true
		if overKS() then
			ksOK = true
		end
	end
end

function GetIDs(numberToDecode)
    local tableOfIDs,i,D={},1
    while numberToDecode > 0 do
        numberToDecode,D=math.floor(numberToDecode/2),math.mod(numberToDecode,2)
        if D == 1 then
          tableOfIDs[i] = true
        end
        i = i + 1
    end
    return tableOfIDs
end

function GetFreeID(tableOfUsedIDs)
	lastID = table.getn(tableOfUsedIDs)
	return lastID + 1
end

function tableContains(tableName, value)
	for k,v in pairs(tableName) do
		if v == value then
			return true
		end
	end
	return false
end

function ZpracujZpravuSID(zprava,argument,smer,nazevCV)
	if Call("GetIsEngineWithKey") == 1 then
		ZpravaDebug("Zpracovavam zpravu ID: "..zprava)
		TF = string.sub( argument,0,string.find( argument,":")-1)
		IDzpravy = tonumber(string.sub(argument,string.find(argument,":")+1))
		hodnotaZpravy = 2^(IDzpravy-1)
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if TF == "1" and IDmasinAktiv[IDzpravy] == nil then
			Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+hodnotaZpravy))
		elseif TF == "0" then
			-- vrat = 0
			-- for k,v in pairs(IDmasinAktiv) do
			-- 	if k ~= IDzpravy then
			-- 		vrat = vrat + v
			-- 	end
			-- end
			--TEST ALTERNATIVY
			hodnotaCV = hodnotaCV - 2^(IDzpravy-1)
			Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
		end
	else
		Call("SendConsistMessage",zprava,argument,smer)
	end
end

function NastavHodnotuSID(nazevCV,hodnota,cisloZpravy)
	if hodnota == 1 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] == nil then
			if Call("GetIsEngineWithKey") == 1 then
				Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+2^(ID-1)))
			else
				Call("SendConsistMessage",cisloZpravy,"1:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"1:"..ID,0)
			end
		end
	elseif hodnota == 0 then
		hodnotaCV = Call("GetControlValue",nazevCV,0)
		IDmasinAktiv = GetIDs(hodnotaCV)
		if IDmasinAktiv[ID] ~= nil then
			if Call("GetIsEngineWithKey") == 1 then
				-- vrat = 0
				-- for k,v in pairs(IDmasinAktiv) do
				-- 	if k ~= ID then
				-- 		vrat = vrat + v
				-- 	end
				-- end
				--TEST ALTERNATIVY
				hodnotaCV = hodnotaCV - 2^(ID-1)
				Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
			else
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,1)
				Call("SendConsistMessage",cisloZpravy,"0:"..ID,0)
			end
		end
	end
end

--zpravy
	-- 460101 - kl?? na druh? kabin?
    -- 460102 - vypnutí HV při nadproudu při nesprávném směru
    -- 460103 - pocet vozu se zapnutem rizenim
    -- 460104 - zmeny NS
	-- 460105 - dvereP
    -- 460106 - osv?tlen? vozu
    -- 460107 - skluz ve vlaku
	-- 460108 - zadost o otevreni dveri z nerizene HV
	-- 460109 - dvereL
	-- 460110 - jizda na odporech ve vlaku
	-- 460111 - FastStart
	-- 460114 - Ovladani DveriL
	-- 460115 - Ovladani DveriP
	-- 460116 - MGen priprava
	-- 460117 - startujici MGen v souprave
	-- 460118 - bezici MGEn v souprave
	-- 460119 - inverze dveri Leve/Prave na motorovych vozech - bohuzel predpoklada vzdy cela od sebe
	-- 460120 - porucha ve vlaku
	-- 460121 - ex. baterie ve vlaku
	-- 460122 - pomkomp ve vlaku
	-- 460991 - dira do potrubi
	-- 460992 - synchronizacni rele
	-- 460993 - pocet jimek na vlaku
	-- 460994 - X poloha sousedniho tornada
	-- 460995 - Y poloha sousedniho tornada
	-- 460997 - ID nabalovani
	-- 460998 - zadost o ID
	-- 460999 - DUMMY
function OnConsistMessage(zprava,argument,smer)
	if zprava ~= 460995 and zprava ~= 460994 and zprava ~= 460993 and zprava ~= 460992 and zprava ~= 460991 and zprava ~= 460997 and zprava ~= 460103 and zprava ~= 460105 and zprava ~= 460109 and zprava ~= 460108 and zprava ~= 460114 and zprava ~= 460115 and zprava ~= 460116 and zprava ~= 460117 and zprava ~= 460118 and zprava ~= 460119 and zprava ~= 460104 then
		if smer == 1 and zaMasinouTornado then
			stavPoslane = Call("SendConsistMessage",zprava,argument,1)
		elseif smer == 0 and predMasinouTornado then
			stavPoslane = Call("SendConsistMessage",zprava,argument,0)
		elseif predMasinouTornado == nil or zaMasinouTornado == nil then
			table.insert(poleKOdeslani, {zprava, argument, smer})
		end
	end
	ZpravaDebug("Prijata message: "..zprava.." s argumentem: "..argument.." ve smeru: "..smer)
	if zprava == 460101 then
		if argument == "1" then
			KlicNaDruheKabine = 1
		end
		if argument == "0" then
			KlicNaDruheKabine = 0
		end
	end
	if zprava == 460102 then
		if vykon ~= 0 then
			Call ("SetControlValue", "HlavniVypinac", 0, 0)
			ZamekHLvyp = 1
		end
	end
	if zprava == 460103 then
		ZpracujZpravuSID(zprava,argument,smer,"zapnuteVozy")
    end
    if zprava == 460104 then
        found = false
        delimpos = string.find(argument, ":")
        delim2pos = string.find(argument, ";")
        ujeteMetry = tonumber(string.sub(argument, 1, delimpos-1))
        noveNapeti = tonumber(string.sub(argument, delimpos+1, delim2pos-1))
        stareNapeti = tonumber(string.sub(argument, delim2pos+1))
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 5 then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, stareNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, stareNapeti}
        end
        Call("SendConsistMessage",460104,(ujeteMetry-24.464)..":"..noveNapeti..";"..stareNapeti,smer)
    end
	if zprava == 460105 then
		if argument == "00" then
			dvereLeveZeSoupravy = false
			dvereLevePridrznyStav = false
		elseif argument == "01" then
			dvereLeveZeSoupravy = false
			dvereLevePridrznyStav = true
		elseif argument == "11" then
			dvereLeveZeSoupravy = true
			dvereLevePridrznyStav = true
		end
		Call("SendConsistMessage",460109,argument,smer)
	end
	if zprava == 460106 then
		if argument == "1" then
			OsvetleniVozu = 1
		end
		if argument == "2" then
			OsvetleniVozu = 2
		end
		if argument == "0" then
			OsvetleniVozu = 0
		end
	end
	if zprava == 460107 then
		ZpracujZpravuSID(zprava,argument,smer,"skluzVeVlaku")
	end
	if zprava == 460108 then
		if argument == "leve" then
			argument = "prave"
			if RizenaRidici == "ridici" then
				Call("SetControlValue","DverePrepPravy",0,2)
				Napoveda("Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji pravou klicku do polohy otevreno-prave!",1)
			else
				Call("SendConsistMessage",460108,argument,smer)
			end
		elseif argument == "prave" then
			argument = "leve"
			if RizenaRidici == "ridici" then
				Call("SetControlValue","DverePrepLevy",0,1)
				Napoveda("Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji levou klicku do polohy otevreno!",1)
			else
				Call("SendConsistMessage",460108,argument,smer)
			end
		end
	end
	if zprava == 460109 then
		if argument == "00" then
			dverePraveZeSoupravy = false
			dverePravePridrznyStav = false
		elseif argument == "01" then
			dverePraveZeSoupravy = false
			dverePravePridrznyStav = true
		elseif argument == "11" then
			dverePraveZeSoupravy = true
			dverePravePridrznyStav = true
		end
		Call("SendConsistMessage",460105,argument,smer)
	end
	if zprava == 460110 then
		ZpracujZpravuSID(zprava,argument,smer,"jizdaNaOdporechVeVlaku")
	end
	if zprava == 460111 then
		pozadavekNaFastStart = 2
	end
	if zprava == 460114 then
		ZpracujZpravuSID(zprava,argument,smer,"DvereLeveVSouprave")
	end
	if zprava == 460115 then
		ZpracujZpravuSID(zprava,argument,smer,"DverePraveVSouprave")
	end
	if zprava == 460116 then
		ZpracujZpravuSID(zprava,argument,smer,"mgPriprava")
	end
	if zprava == 460117 then
		ZpracujZpravuSID(zprava,argument,smer,"mgVS")
	end
	if zprava == 460118 then
		ZpracujZpravuSID(zprava,argument,smer,"mg")
	end
	if zprava == 460119 then
		if argument == "obrat" then
			otocPovely = true
			Call("SendConsistMessage",460119,"nech",smer)
		else
			Call("SendConsistMessage",460119,"obrat",smer)
		end
	end
	if zprava == 460120 then
		ZpracujZpravuSID(zprava,argument,smer,"poruchaVeVlaku")
	end
	if zprava == 460122 then
		ZpracujZpravuSID(zprava,argument,smer,"pomkompVS")
	end
	if zprava == 460991 then
		ZpracujZpravuSID(zprava,argument,smer,"diraDoPotrubi")
	end
	if zprava == 460992 then
		ZpracujZpravuSID(zprava,argument,smer,"synchronizacniRele")
	end
	if zprava == 460993 then
		ZpracujZpravuSID(zprava,argument,smer,"pocetJimek")
	end
	if zprava == 460994 then
		prijateZpravy[smer+1] = {}
		prijateZpravy[smer+1]["x"] = argument
		xZS = argument
	end
	if zprava == 460995 then
		if prijateZpravy[smer+1]["x"] ~= nil then
			local yZS = argument
			x, _, y = Call("*:getNearPosition")
			ZpravaDebug("yZS: "..yZS)
			ZpravaDebug("xZS: "..xZS)
			ZpravaDebug("y: "..y)
			ZpravaDebug("x: "..x)
			local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
			if vzdalenost < maxVzdalenost then
				if smer == 1 then
					predMasinouTornado = true
					predMasinouTornadoCas = nil
				else
					zaMasinouTornado = true
					zaMasinouTornadoCas = nil
				end
			else
				if smer == 1 then
					predMasinouTornado = false
					predMasinouTornadoCas = nil
				else
					zaMasinouTornado = false
					zaMasinouTornadoCas = nil
				end
			end
		else
			prijateZpravy[smer+1] = {}
			prijateZpravy[smer+1]["y"] = argument
		end
	end
	if zprava == 460997 then
		ID = GetFreeID(GetIDs(tonumber(argument)))
		i = 2^(ID-1)
		if (smer == 0 and predMasinouTornado) or (smer == 1 and zaMasinouTornado) then
			Call("SendConsistMessage",460997,tostring(tonumber(argument)+i),smer)
		end
		Call("SetControlValue","ID",0,ID)
		ZpravaDebug("Posilam zpravu 460997! ve smeru "..smer)
	end
	if zprava == 460998 then
		if (smer == 0 and not predMasinouTornado) or (smer == 1 and not zaMasinouTornado) then
			Call("SendConsistMessage",460997,"1",ObratSmer(smer))
			Call("SendConsistMessage",460119,"obrat",ObratSmer(smer))
			otocPovely = false
			ID = 1
			Call("SetControlValue","ID",0,ID)
			ZpravaDebug("Prisla 460998 a jsem koncovy vuz! Posilam 460997 ve smeru "..ObratSmer(smer))
		end
	end
end

function ObratSmer(smer)
	if smer == 0 then
		return(1)
	elseif smer == 1 then
		return(0)
	end
end

function OnCustomSignalMessage(parameter)
    if parameter == "PORUCHA_TM" then
        zkratTM = true
    elseif parameter == "PORUCHA_MG" then
        zkratMG = true
    elseif parameter == "0V" then
        noveNapeti = 0
        found = false
        ujeteMetry = -24.464
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 5 then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, idealniNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, idealniNapeti}
        end
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,0)
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,1)
    elseif parameter == "3000V" then
        noveNapeti = 3000
        found = false
        ujeteMetry = -24.464
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 5 then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, idealniNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, idealniNapeti}
        end
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,0)
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,1)
    elseif parameter == "15000V" then
        noveNapeti = 15000
        found = false
        ujeteMetry = -24.464
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 5 then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, idealniNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, idealniNapeti}
        end
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,0)
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,1)
    elseif parameter == "25000V" then
        noveNapeti = 25000
        found = false
        ujeteMetry = -24.464
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 5 then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, idealniNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, idealniNapeti}
        end
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,0)
        Call("SendConsistMessage",460104,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,1)
    else
        local NO
        local vzdalenost
        lastSignalCode = Call("GetControlValue", "SkutecnyKod", 0)
        NO = tonumber(string.sub(parameter, 1, 2))
        vzdalenost = tonumber(string.sub(parameter, 3))
        if NO == -1 then
            gNejblizsiNavestidlo = -1
            Call("SetControlValue","SkutecnyKod",0,0)
        end
        if vzdalenost > 0 then
            if (vzdalenost < gNejblizsiNavestidlo) or (math.abs(gNejblizsiNavestidlo - vzdalenost) < 2) or (gNejblizsiNavestidlo < 0) then
                gNejblizsiNavestidlo = vzdalenost
            end
        end
        if gNejblizsiNavestidlo == vzdalenost then
            if NO == 15 or NO == 30 then					-- Stuj
                Call("SetControlValue","SkutecnyKod",0,3)
            elseif NO == 17 then							-- Vystraha
                Call("SetControlValue","SkutecnyKod",0,4)
            elseif NO == 16 then							-- Volno
                Call("SetControlValue","SkutecnyKod",0,2)
            elseif NO >= 19 and NO <= 24 then				-- omezene rychlosti
                Call("SetControlValue","SkutecnyKod",0,1)
            else											-- nekodovane navesti
                Call("SetControlValue","SkutecnyKod",0,0)
            end
        end
        if gNejblizsiNavestidlo < 1 and not zablokujDalsiZmenyLVZ then
            prujezdKolemNavestidla = true
            zablokujDalsiZmenyLVZ = true
        elseif gNejblizsiNavestidlo > 1 then
            zablokujDalsiZmenyLVZ = nil
        end
    end
end

function VypniVse()
	Call ( "Zarovka1:Activate", 0 )
	Call ( "Zarovka2:Activate", 0 )
	Call ( "Zarivka1:Activate", 0 )
	Call ( "Zarivka2:Activate", 0 )
	Call ( "Zarivka3:Activate", 0 )
	Call ( "DalkovePrave:Activate", 0 )
	Call ( "DalkoveLeve:Activate", 0 )
	Call ( "ActivateNode","dalkaclevy",0)
	Call ( "ActivateNode","dalkacpravy",0)
	Call ( "ActivateNode","reflektor_rozsviceny",0) 
	Call ( "PozickaHorniBi:Activate", 0 )
	Call ( "CabLight1:Activate", 0 )
	Call ( "CabLight2:Activate", 0 )
	Call ( "CabLight3:Activate", 0 )
	Call ( "CabLight4:Activate", 0 )
	Call ( "SvetloRychlomer:Activate", 0 )
	Call ( "SvetloAmpermetrHorni:Activate", 0 )
	Call ( "SvetloAmpermetrDolni:Activate", 0 )
	Call ( "SvetloVoltmetrHorni:Activate", 0 )
	Call ( "SvetloVoltmetrDolni:Activate", 0 )
	Call ( "SvetloBudik3:Activate", 0 )
	Call ( "SvetloBudik4:Activate", 0 )
	Call ( "PozickaLevaBi:Activate", 0 )
	Call ( "PozickaLevaCr:Activate", 0 )
	Call ( "PozickaPravaBi:Activate", 0 )
	Call ( "PozickaPravaCr:Activate", 0 )
	Call ( "ActivateNode", "pozickalevaBi", 0 ) 
	Call ( "ActivateNode", "pozickalevaCr", 0 ) 
	Call ( "ActivateNode", "pozickapravaBi", 0 ) 
	Call ( "ActivateNode", "pozickapravaCr", 0 ) 
    Call("SetControlValue", "ZarivkaSvetlo", 0, 0)
    Call("SetControlValue", "LustrLevySvetlo", 0, 0)
    Call("SetControlValue", "LustrPravySvetlo", 0, 0)
end

function RozsvitSvetlo(corozsvit,plati)
	Call (corozsvit..":Activate",plati)
end

function AktivujNode(ktery,plati)
	Call("ActivateNode",ktery,plati)
end

function OsvetleniVozuF(stupen)
	if stupen == 0 then
		RozsvitSvetlo("Zarovka1",0)
		RozsvitSvetlo("Zarovka2",0)
		RozsvitSvetlo("Zarivka1",0)
		RozsvitSvetlo("Zarivka2",0)
		RozsvitSvetlo("Zarivka3",0)
	end
	if stupen == 1 then
		RozsvitSvetlo("Zarovka1",1)
		RozsvitSvetlo("Zarovka2",1)
		RozsvitSvetlo("Zarivka1",0)
		RozsvitSvetlo("Zarivka2",0)
		RozsvitSvetlo("Zarivka3",0)
	end
	if stupen == 2 then
		RozsvitSvetlo("Zarivka1",1)
		RozsvitSvetlo("Zarivka2",1)
		RozsvitSvetlo("Zarivka3",1)
	end
end	

function DalkovaSvF(stupen,delkaUpd,baterie,tlumene,levy,pravy)
	local pribytek = delkaUpd * 7
	local dalkoveLeve = false
    local dalkovePrave = false
    local dalkoveHorni1 = false
    local dalkoveHorni2 = false

	local barvaDalkovaDolniLED = {1,1,0.7}
	local barvaDalkovaHorniLED = {0.7385892,1,1}

	local barvaDalkovaDolniZ = {1,1,0.1576764}
    local barvaDalkovaHorniZ = {1,0.6597511,0}
    local barvaPozickaHorniZ = {1,0.9543568,0}
	
	if stupen == 1 and baterie == 1 then
		dalkoveLeve = true
        dalkovePrave = true
        if levy or pravy then
            if not (levy and pravy) then
                dalkoveHorni1 = true
            else
                dalkoveHorni2 = true
            end
        end
    end

    if modelConfig[scriptVersion].horniPozicka then
        Call("PozickaHorniBi:SetRange",12)
        if horniPozBilVKPC then
			Call("PozickaHorniBi:Activate",1)
            AktivujNode("reflektor_rozsviceny",1)
        else
			Call("PozickaHorniBi:Activate",0)
            AktivujNode("reflektor_rozsviceny",0)
        end
        if modelConfig[scriptVersion].led then
            Call("PozickaHorniBi:SetColour",barvaDalkovaHorniLED[1],barvaDalkovaHorniLED[2],barvaDalkovaHorniLED[3])
        else
            Call("PozickaHorniBi:SetColour",barvaPozickaHorniZ[1],barvaPozickaHorniZ[2],barvaPozickaHorniZ[3])
        end
    else
        if dalkoveHorni1 and stavDalkoveHorni1 < 5 then
            stavDalkoveHorni1 = stavDalkoveHorni1 + (math.sqrt(5-stavDalkoveHorni1)*pribytek/5)
        elseif not dalkoveHorni1 and stavDalkoveHorni1 > 0 then
            stavDalkoveHorni1 = stavDalkoveHorni1 - (math.sqrt(stavDalkoveHorni1)*pribytek/5)
        end

        stavDalkoveHorni1Zapis = stavDalkoveHorni1/3
        Call("DalkoveHorni1:SetColour",barvaDalkovaHorniZ[1]*stavDalkoveHorni1Zapis,barvaDalkovaHorniZ[2]*stavDalkoveHorni1Zapis,barvaDalkovaHorniZ[3]*stavDalkoveHorni1Zapis)
        if stavDalkoveHorni1Zapis > 0 then
			Call("DalkoveHorni1:Activate",1)
            Call("DalkoveHorni1:SetRange",75)
		else 
			Call("DalkoveHorni1:Activate",0)
            Call("DalkoveHorni1:SetRange",0)
        end
        
        if dalkoveHorni2 and stavDalkoveHorni1 < 5 then
            stavDalkoveHorni1 = stavDalkoveHorni1 + (math.sqrt(5-stavDalkoveHorni1)*pribytek/5)
        elseif not dalkoveHorni2 and stavDalkoveHorni1 > 0 then
            stavDalkoveHorni1 = stavDalkoveHorni1 - (math.sqrt(stavDalkoveHorni1)*pribytek/5)
        end

        stavDalkoveHorni2Zapis = stavDalkoveHorni1/3
        Call("DalkoveHorni2:SetColour",barvaDalkovaHorniZ[1]*stavDalkoveHorni2Zapis,barvaDalkovaHorniZ[2]*stavDalkoveHorni2Zapis,barvaDalkovaHorniZ[3]*stavDalkoveHorni2Zapis)
        if stavDalkoveHorni2Zapis > 0 then
			Call("DalkoveHorni2:Activate",1)
            Call("DalkoveHorni2:SetRange",150)
		else 
			Call("DalkoveHorni2:Activate",0)
            Call("DalkoveHorni2:SetRange",0)
        end
        
        if stavDalkoveHorni1 >= 5 or stavDalkoveHorni2 >= 5 then
            AktivujNode("reflektor_rozsviceny",1)
        else
            AktivujNode("reflektor_rozsviceny",0)
        end
    end

    if not modelConfig[scriptVersion].led then
        if dalkoveLeve and stavDalkoveLeve < 5 then --and modelConfig[scriptVersion].horniPozicka 
            stavDalkoveLeve = stavDalkoveLeve + (math.sqrt(5-stavDalkoveLeve)*pribytek/5)
        elseif not dalkoveLeve and stavDalkoveLeve > 0 then
            stavDalkoveLeve = stavDalkoveLeve - (math.sqrt(stavDalkoveLeve)*pribytek/5)
        end

        if dalkovePrave and stavDalkovePrave < 5 then --and modelConfig[scriptVersion].horniPozicka 
            stavDalkovePrave = stavDalkovePrave + (math.sqrt(5-stavDalkovePrave)*pribytek/5)
        elseif not dalkovePrave and stavDalkovePrave > 0 then
            stavDalkovePrave = stavDalkovePrave - (math.sqrt(stavDalkovePrave)*pribytek/5)
        end

        if stavDalkoveLeve >= 5 then
            AktivujNode("dalkaclevy",1)
        else
            AktivujNode("dalkaclevy",0)
        end

        if stavDalkovePrave >= 5 then
            AktivujNode("dalkacpravy",1)
        else
            AktivujNode("dalkacpravy",0)
        end

        stavDalkoveLeveZapis = stavDalkoveLeve/3
        stavDalkovePraveZapis = stavDalkovePrave/3
		Call("DalkoveLeve:SetColour",barvaDalkovaDolniZ[1]*stavDalkoveLeveZapis,barvaDalkovaDolniZ[2]*stavDalkoveLeveZapis,barvaDalkovaDolniZ[3]*stavDalkoveLeveZapis)
		if stavDalkoveLeveZapis > 0 then
            Call("DalkoveLeve:SetRange",150)
			Call("DalkoveLeve:Activate",1)
		else 
            Call("DalkoveLeve:SetRange",0)
			Call("DalkoveLeve:Activate",0)
		end

		Call("DalkovePrave:SetColour",barvaDalkovaDolniZ[1]*stavDalkovePraveZapis,barvaDalkovaDolniZ[2]*stavDalkovePraveZapis,barvaDalkovaDolniZ[3]*stavDalkovePraveZapis)
		if stavDalkovePraveZapis > 0 then
            Call("DalkovePrave:SetRange",150)
			Call("DalkovePrave:Activate",1)
		else 
            Call("DalkovePrave:SetRange",0)
			Call("DalkovePrave:Activate",0)
		end
    else
        if dalkoveLeve then
            Call("DalkoveLeve:SetRange",500)
            Call("DalkoveLeve:SetColour",barvaDalkovaDolniLED[1],barvaDalkovaDolniLED[2],barvaDalkovaDolniLED[3])
            Call("DalkoveLeve:Activate",1)
            AktivujNode("dalkaclevy",1)
        else
            Call("DalkoveLeve:SetColour",0,0,0)
            Call("DalkoveLeve:Activate",0)
            Call("DalkoveLeve:SetRange",0)
            AktivujNode("dalkaclevy",0)
        end

        if dalkovePrave then
            Call("DalkovePrave:SetRange",500)
            Call("DalkovePrave:SetColour",barvaDalkovaDolniLED[1],barvaDalkovaDolniLED[2],barvaDalkovaDolniLED[3])
            Call("DalkovePrave:Activate",1)
            AktivujNode("dalkacpravy",1)
        else
            Call("DalkovePrave:SetColour",0,0,0)
            Call("DalkovePrave:Activate",0)
            Call("DalkovePrave:SetRange",0)
            AktivujNode("dalkacpravy",0)
        end
	end
end

function KabinaPristF(stupen)
	if stupen == 1 then
		RozsvitSvetlo("SvetloAmpermetrHorni",0)
		RozsvitSvetlo("SvetloAmpermetrDolni",0)
		RozsvitSvetlo("SvetloVoltmetrHorni",0)
		RozsvitSvetlo("SvetloVoltmetrDolni",0)
		RozsvitSvetlo("SvetloBudik3",0)
		RozsvitSvetlo("SvetloBudik4",0)
		RozsvitSvetlo("SvetloRychlomer",0)
	end
	if stupen == 2 then
		RozsvitSvetlo("SvetloAmpermetrHorni",1)
		RozsvitSvetlo("SvetloAmpermetrDolni",1)
		RozsvitSvetlo("SvetloVoltmetrHorni",1)
		RozsvitSvetlo("SvetloVoltmetrDolni",1)
		RozsvitSvetlo("SvetloBudik3",1)
		RozsvitSvetlo("SvetloBudik4",1)
		RozsvitSvetlo("SvetloRychlomer",1)
	end
	if stupen == 0 then
		RozsvitSvetlo("SvetloAmpermetrHorni",0)
		RozsvitSvetlo("SvetloAmpermetrDolni",0)
		RozsvitSvetlo("SvetloVoltmetrHorni",0)
		RozsvitSvetlo("SvetloVoltmetrDolni",0)
		RozsvitSvetlo("SvetloBudik3",0)
		RozsvitSvetlo("SvetloBudik4",0)
		RozsvitSvetlo("SvetloRychlomer",0)
	end
end

function Pozicka(ktera,barva,plati)
	pozickastav = ktera..barva..plati
	RozsvitSvetlo("Pozicka"..ktera..barva,plati)
	AktivujNode("pozicka"..ktera..barva, plati)
end

-- function rozloz(cislo,misto)
-- 	misto = misto - 1
-- 	misto = 10^misto
-- 	cislo = cislo / misto
-- 	cislo = math.floor(cislo)
-- 	cislo = cislo / 10
-- 	_,cislo = math.modf(cislo)
-- 	cislo = cislo * 10
-- 	vysledek = math.floor(cislo)
-- end

function decToBitsCount(cislo)
	-- local vysledek = ""
	local pocet = 0
	while cislo > 0 do
		_, zbytek = divMod(cislo, 2)
		if zbytek == 1 then
			pocet = pocet + 1
		end
		-- vysledek = zbytek..vysledek
		cislo = (cislo - zbytek) / 2
	end
	return pocet --, vysledek
end

function VypniHVaVynutRestart()
	Call ("SetControlValue", "HlavniVypinac", 0, 0)
	ZamekHLvyp = 1
	Call ("SetControlValue", "povel_HlavniVypinac", 0, 0)
end

function VratRadic(radicMain,radicOkno)
	if radicMain >= 0 then
		if math.min(radicOkno,radicMain*2) < 0.5 then
			return(0)
		elseif math.max(radicOkno,radicMain*2) > 1.5 then
			return(1)
		else
			return(0.5)
		end
	else
		return(radicMain)
	end
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

function VratTCh(gRegulatorTrCh,wheelSpeed)
	local stupenTrCh = 0
	local cele = ""
	local zbytek = ""
	local vratRegulator = 0
	local vypoctenaTrCh = 0
    local ridiciKontroler = Call("GetControlValue","povel_RidiciKontroler",0)
	if gRegulatorTrCh > 0 then
		stupenTrCh = gRegulatorTrCh/0.05
		cele, zbytek = divMod(stupenTrCh,1) 
		if zbytek ~= 0 then
			if zbytek > 0.5 then
				stupenTrCh = cele + 1
			else 
				stupenTrCh = cele
			end
		end
	end
	if gRegulatorTrCh < 0 then
		stupenTrCh = gRegulatorTrCh/(1/modelConfig[scriptVersion].stupneEDB)
		cele, zbytek = divMod(stupenTrCh,1)
		if zbytek ~= 0 then
			if zbytek < -0.5 then
				stupenTrCh = cele - 1
			else
				stupenTrCh = cele
			end
		end
	end
	local speed = math.abs(wheelSpeed)
	if stupenTrCh > 0 and not pojezdVDepu then
		vypoctenaTrCh = ((gMax_kN[stupenTrCh]*((math.exp(gKoeficient[stupenTrCh]*(speed+gOffsetX[stupenTrCh])))+gZvetseni[stupenTrCh]))+gOffsetY[stupenTrCh])
		vratRegulator = vypoctenaTrCh/gAbsolutniMax_kN
		if vratRegulator > 1 then
			vratRegulator = 1
		end
	elseif stupenTrCh < 0 and not pojezdVDepu then
        speed = speed * 3.6
        if stupenTrCh == -1 or blokKrokNU or speed < 30 then
            if speed > 70 then
                vypoctenaTrCh = 23
            else
                vypoctenaTrCh = math.min(12 + 0.03333333*speed + 0.0075*speed^2 - 0.00008333333*speed^3, 23)
            end
		elseif stupenTrCh == -2 and not blokKrokNU and speed > 30 then
			vypoctenaTrCh = 5.662053 + 1.502787*speed - 0.01519608*speed^2 + 0.00005113418*speed^3
		-- elseif stupenTrCh == -3 then
		-- 	vypoctenaTrCh = (((-1000-speed)/((2*speed)+2))+80)/2*0.6
		-- elseif stupenTrCh <= -4 then
		-- 	vypoctenaTrCh = (((-1000-speed)/((2*speed)+2))+100)/2*0.6
        end
		vratRegulator = -math.max((vypoctenaTrCh/gAbsolutniMax_kN)*math.min(pocetZapnutychVozu, pocetMG), 0)
		-- if fiktivniVykonNaRizeneNeschopne then
		-- 	vratRegulator = vratRegulator * math.min(pocetZapnutychVozu, pocetMG)
		-- end
		--vratRegulator = vypoctenaTrCh
		if vratRegulator > 0 then vratRegulator = 0 end
	elseif pojezdVDepu then
		vratRegulator = (1 / (20+math.exp(speed)))
	end
	return(vratRegulator)
end

function VratProud(gTaznaSila,gZarazenyStupen,wheelSpeed)
	local shunt = (gZarazenyStupen - 0.8)*20
	local speed = wheelSpeed
    local smer = Call("GetControlValue","Reverser",0)
    local ridiciKontroler = Call("GetControlValue","povel_RidiciKontroler",0)
	local kN = math.abs(gTaznaSila*gAbsolutniMax_kN)
	--local kN = (2000*(math.exp(-0.25*(speed-2))))+7
	local k = 1.3
	local a = 106
	local b = 25
	local vratProud = (a*k)*(math.sqrt((((kN+(b*k))^2)/((b*k)^2))-1))
	if gZarazenyStupen < 0 then
        kmh = speed * 3.6
		-- kN = (kN/math.min(pocetZapnutychVozu, pocetMG))*gAbsolutniMax_kN
        vratProud = -math.max(-48.82555 + 8.544289*kmh - 0.05755316*kmh^2 + 0.0001317839*kmh^3,0)
        if gZarazenyStupen < -1/modelConfig[scriptVersion].stupneEDB and not blokKrokNU and kmh > 30 then
            vratProud = vratProud*1.5
        end
		-- if gZarazenyStupen < -0.25 then
		-- 	vratProud = vratProud * 1.03
		-- 	if gZarazenyStupen < -0.5 then
		-- 		vratProud = vratProud * 1.05
		-- 		if gZarazenyStupen < -0.75 then
		-- 			vratProud = vratProud * 1.05
		-- 		end
		-- 	end
		-- end
		-- vratProud = -math.sqrt(kN*10)*math.log(10*speed*3.6)
		-- vratProud = -kN*speed*3.6/math.sqrt(kN)*0.7
	end
	if shunt > 0 and shunt < 1.5 then
		vratProud = 1.18 * vratProud
	elseif shunt > 1.5 and shunt < 2.5 then
		vratProud = 1.29 * vratProud
	elseif shunt > 2.5 and shunt < 3.5 then
		vratProud = 1.39 * vratProud
	elseif shunt > 3.5 then
		vratProud = 1.48 * vratProud
    end
	if smer > 0 and Call("GetSpeed") < 0 and Call("GetIsEngineWithKey") == 1 then
        vratProud = vratProud * math.max((math.abs(speed)/1.5),1)
        if vratProud > 1800 and math.random(4) > 3  then
            zkratTM = true
        end
		if vratProud > 840 or (math.abs(speed) > 5.55 and vratProud ~= 0) then
			Call ("SetControlValue", "HlavniVypinac", 0, 0)
			ZamekHLvyp = 1
			Call("SendConsistMessage",460102,"",0)
			Call("SendConsistMessage",460102,"",1)
			niDiag = 1
		end
	elseif smer < 0 and Call("GetSpeed") > 0 and Call("GetIsEngineWithKey") == 1 then
		vratProud = vratProud * math.max((math.abs(speed)/1.5),1)
        if vratProud > 1800 and math.random(4) > 3 then
            zkratTM = true
        end
		if vratProud > 840 or (math.abs(speed) > 5.55 and vratProud ~= 0) then
			Call ("SetControlValue", "HlavniVypinac", 0, 0)
			ZamekHLvyp = 1
			Call("SendConsistMessage",460102,"",0)
			Call("SendConsistMessage",460102,"",1)
			niDiag = 1
		end
    end
	return (vratProud)
end

function PIDcntrlAmp(gHodnotaA,gRucickaA)
	local curvature = Call("GetCurvature")
	local gradient = Call("GetGradient")
	local rozdilGrad = gradient - gGradientLastA
	local rozdilCurv = curvature - gCurvatureLastA
	if rozdilGrad ~= 0 then
		gHodnotaA = gHodnotaA + (rozdilGrad * 10)
	end
	if math.abs(rozdilCurv) > 5 then
		gHodnotaA = gHodnotaA + (math.random(-rozdilCurv,rozdilCurv)*5)
	end
	if math.abs(gHodnotaA-gRucickaA) > 10 and not gProbihaA then
		gHraniceA = ((gHodnotaA-gRucickaA)/math.random(3,10))+gHodnotaA
		if gHraniceA > 1000 then
			gHraniceA = 1000
		elseif gHraniceA < -1000 then
			gHraniceA = -1000
		end
		gProbihaA = true
	elseif math.abs(gHodnotaA-gHraniceA) < 10 and not gProbihaA then
		gHraniceA = gHodnotaA
	elseif math.abs(gHraniceA-gRucickaA) < 2 then
		gProbihaA = false
	elseif math.abs(gHodnotaA-gHODNOTA_LASTa) > 10 then
		gProbihaA = false
	end
	local pribytek = gHraniceA-gRucickaA
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(80,120) else pribytek = -((pribytek^2)/math.random(80,120)) end
	if pribytek > 70 then pribytek = 70 elseif pribytek < -70 then pribytek = -70 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = gRucickaA + pribytek
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHraniceA
		gProbihaA = false
	end
	gHODNOTA_LASTa = gHodnotaA
	gGradientLastA = gradient
	gCurvatureLastA = curvature
	return(vratHodnotu)
end

function PIDcntrlVolt(gHodnotaV,gRucickaV)
	local curvature = Call("GetCurvature")
	local gradient = Call("GetGradient")
	local rozdilGrad = gradient - gGradientLastV
	local rozdilCurv = curvature - gCurvatureLastV
	if rozdilGrad ~= 0 then
		gHodnotaV = gHodnotaV + (rozdilGrad * 10)
	end
	if math.abs(rozdilCurv) > 5 then
		gHodnotaV = gHodnotaV + (math.random(-rozdilCurv,rozdilCurv)*5)
	end
	if math.abs(gHodnotaV-gRucickaV) > 10 and not gProbihaV then
		gHraniceV = ((gHodnotaV-gRucickaV)/math.random(3,10))+gHodnotaV
		if gHraniceV > 1000 then
			gHraniceV = 1000
		elseif gHraniceV < 0 then
			gHraniceV = 0
		end
		gProbihaV = true
	elseif math.abs(gHodnotaV-gHraniceV) < 10 and not gProbihaV then
		gHraniceV = gHodnotaV
	elseif math.abs(gHraniceV-gRucickaV) < 2 then
		gProbihaV = false
	elseif math.abs(gHodnotaV-gHODNOTA_LASTv) > 10 then
		gProbihaV = false
	end
	local pribytek = gHraniceV-gRucickaV
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(80,120) else pribytek = -((pribytek^2)/math.random(80,120)) end
	if pribytek > 70 then pribytek = 70 elseif pribytek < -70 then pribytek = -70 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = gRucickaV + pribytek
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHraniceV
		gProbihaV = false
	end
	gHODNOTA_LASTv = gHodnotaV
	gGradientLastV = gradient
	gCurvatureLastV = curvature
	return(vratHodnotu)
end

function PIDcntrlCommon(gHodnota,gRucicka,gProbiha,gHranice,gHODNOTA_LAST,limitBudiku)
	if math.abs(gHodnota-gRucicka) > 10 and not gProbiha then
		gHranice = ((gHodnota-gRucicka)/math.random(3,10))+gHodnota
		if gHranice > limitBudiku then
			gHranice = limitBudiku
		elseif gHranice < 0 then
			gHranice = 0
		end
		gProbiha = true
	elseif math.abs(gHodnota-gHranice) < 10 and not gProbiha then
		gHranice = gHodnota
	elseif math.abs(gHranice-gRucicka) < 2 then
		gProbiha = false
	elseif math.abs(gHodnota-gHODNOTA_LAST) > 10 then
		gProbiha = false
	end
	local pribytek = gHranice-gRucicka
	if pribytek >= 0 then pribytek = (pribytek^2)/math.random(60,100) else pribytek = -((pribytek^2)/math.random(60,100)) end
	if pribytek > limitBudiku / 10 then pribytek = limitBudiku / 10 elseif pribytek < -limitBudiku / 10 then pribytek = -limitBudiku / 10 end --Asi není potřeba, mělo jít o "omezení" toho výkyvu. Zbytegné
	local vratHodnotu = ( gRucicka + pribytek ) / 1000
	if math.abs(pribytek) < 2 then
		vratHodnotu = gHranice / 1000
		gProbiha = false
	end
	return vratHodnotu, gProbiha, gHranice, gHodnota
end

function SvetloDimm(dimValue)
    dimValue = dimValue*0.8+0.2
	Call("SvetloAmpermetrHorni:SetColour", dimValue*2, dimValue*0.3443983*2, 0)
	Call("SvetloAmpermetrDolni:SetColour", dimValue*2, dimValue*0.3443983*2, 0)
	Call("SvetloVoltmetrHorni:SetColour", dimValue*2, dimValue*0.626556*2, 0)
	Call("SvetloVoltmetrDolni:SetColour", dimValue*2, dimValue*0.626556*2, 0)
	Call("SvetloRychlomer:SetColour", 0, dimValue*3.48548, dimValue*0.580913)
	Call("SvetloBudik3:SetColour", 0, dimValue*3.48548, dimValue*0.580913)
	Call("SvetloBudik4:SetColour", 0, dimValue*3.48548, dimValue*0.580913)
end

function LVZ(LVZznak,vybaveni,delkaUpd,prenosKodu)
	local pribytek = delkaUpd * 30
	local signalCode = 0

	if prenosKodu then
		signalCode = LVZznak
		if prujezdKolemNavestidla and signalCode > 0 then
			prujezdKolemNavestidla = false
			casNekodovani = 0
			if lastSignalCode == 1 then
				nekodujCas = math.random(0,14) + math.random()
				pocetSumuPoPrujezdu = math.random(1,20)
			else
				nekodujCas = math.random(0,2) + math.random()
				pocetSumuPoPrujezdu = math.random(0,1)
			end
		else
			prujezdKolemNavestidla = false
		end

		casNekodovani = casNekodovani + delkaUpd

		if nekodujCas ~= nil then
			if casNekodovani > nekodujCas then
				nekodujCas = nil
				sumPoPrujezduKod = math.random(1,4)
				sumPoPrujezduDelka = math.random(5,10)/10
				sumPoPrujezduDelkaUbehle = 0
			else
				signalCode = 0
			end
		end

		sumPoPrujezduDelkaUbehle = sumPoPrujezduDelkaUbehle + delkaUpd

		if sumPoPrujezduDelka > sumPoPrujezduDelkaUbehle then
			signalCode = sumPoPrujezduKod
		elseif pocetSumuPoPrujezdu > 0 then
			pocetSumuPoPrujezdu = pocetSumuPoPrujezdu - 1
			sumPoPrujezduKod = math.random(1,4)
			sumPoPrujezduDelka = math.random(5,10)/10
			sumPoPrujezduDelkaUbehle = 0
		end

		-- zmenaParametruLast = zmenaParametru
		-- if zmenaParametruLast == nil then
		-- 	zmenaParametruLast = Call("GetCurvature")*Call("GetGradient")
		-- end
		-- zmenaParametru = Call("GetCurvature")*Call("GetGradient")
		-- local chybaLVZ = false
		-- if math.abs(zmenaParametru - zmenaParametruLast) > 0.1 and math.random(0,1) > 0.5 then
		-- 	chybaLVZ = true
		-- end

		-- if chybaLVZ == true and casChyby == nil then
		-- 	casChyby = math.random(1,3)
		-- 	LVZchyba = math.floor(math.random(1,4.9))
		-- end
		-- if casChyby ~= nil then
		-- 	if casChyby > casChybyUbehly then
		-- 		signalCode = LVZchyba
		-- 		casChybyUbehly = casChybyUbehly + delkaUpd
		-- 	else
		-- 		casChyby = nil
		-- 	end
		-- else
		-- 	casChybyUbehly = 0
		-- end

		local zhasleLVZ = false
		if math.random(0,10000) > 9990 and Call("GetSpeed") > 1 then
			zhasleLVZ = true
		end

		if zhasleLVZ and casZhasle == nil then
			casZhasle = math.random(0,2) + math.random()
		end

		if casZhasle ~= nil then
			if casZhasle > casZhasleUbehly then
				signalCode = 0
				casZhasleUbehly = casZhasleUbehly + delkaUpd
			else
				casZhasle = nil
			end
		else
			casZhasleUbehly = 0
		end
	end

	vystraha = false
	stuj = false
	volno = false
	mezikruzi = false
	if signalCode == 1 then
		mezikruzi = true
	elseif signalCode == 2 then
		volno = true
	elseif signalCode == 3 then
		stuj = true
	elseif signalCode == 4 then
		vystraha = true
	end
	
	if not vystraha and stavVystraha > 0 then
		stavVystraha = stavVystraha - pribytek
		if stavVystraha < 0 then stavVystraha = 0 end
	end
	if vystraha and stavVystraha < 10 then
		stavVystraha = stavVystraha + pribytek
		if stavVystraha > 10 then stavVystraha = 10 end
	end

	if not stuj and stavStuj > 0 then
		stavStuj = stavStuj - pribytek
		if stavStuj < 0 then stavStuj = 0 end
	end
	if stuj and stavStuj < 10 then
		stavStuj = stavStuj + pribytek
		if stavStuj > 10 then stavStuj = 10 end
	end

	if not volno and stavVolno > 0 then
		stavVolno = stavVolno - pribytek
		if stavVolno < 0 then stavVolno = 0 end
	end
	if volno and stavVolno < 10 then
		stavVolno = stavVolno + pribytek
		if stavVolno > 10 then stavVolno = 10 end
	end
	
	if not mezikruzi and stavMezikruzi > 0 then
		stavMezikruzi = stavMezikruzi - pribytek
		if stavMezikruzi < 0 then stavMezikruzi = 0 end
	end
	if mezikruzi and stavMezikruzi < 10 then
		stavMezikruzi = stavMezikruzi + pribytek
		if stavMezikruzi > 10 then stavMezikruzi = 10 end
	end
	
	if vybaveni == 0 and stavVybaveni > 0 then
		stavVybaveni = stavVybaveni - pribytek
		if stavVybaveni < 0 then stavVybaveni = 0 end
	end
	if vybaveni == 1 and stavVybaveni < 10 then
		stavVybaveni = stavVybaveni + pribytek
		if stavVybaveni > 10 then stavVybaveni = 10 end
	end

	Call("LVZvystraha:SetColour",1*stavVystraha,0.531*stavVystraha,0)
	Call("LVZvystraha:Activate",1)

	Call("LVZstuj:SetColour",1*stavStuj,0.0747*stavStuj,0)
	Call("LVZstuj:Activate",1)

	Call("LVZvolno:SetColour",0,stavVolno,0)
	Call("LVZvolno:Activate",1)

	Call("LVZmezikruzi:SetColour",1*stavMezikruzi,0.531*stavMezikruzi,0)
	Call("LVZmezikruzi:Activate",1)

	Call("LVZvybaveni:SetColour",0,0,stavVybaveni)
	Call("LVZvybaveni:Activate",1)

	return(signalCode)
end

function Napoveda (zprava, level)
	if level == levelNapovedy then
		--SysCall("ScenarioManager:ShowInfoMessageExt", ZPRAVA_HLAVICKA_NAPOVEDA, zprava,5,16,0,0)
	end
end

function OnCameraEnter(cabEndWithCamera, carriageCamera)
	vevnitr = true
	if carriageCamera == 1 then
		vOddile = true
	end
	-- SysCall("CameraManager:ActivateCamera", "CabCamera", 0)
end

function OnCameraLeave()
	-- if math.max(Call("GetControlValue", "OknoL", 0),Call("GetControlValue", "OknoP", 0)) < 0.5 then
	-- 	SysCall("CameraManager:ActivateCamera", "CabCamera", 0)
	-- end
	vevnitr = false
	vOddile = false
end

function GetMaxkN(rychlostKMH)
	local koefVyuzitelnostiAdhese = 0.7
	local koefAdhese = ((7500/(rychlostKMH+44))+161)/1000
	local hmotnost = 70
	local gravitacniKonstanta = 9.81
	local maxkN = hmotnost * gravitacniKonstanta * koefAdhese * koefVyuzitelnostiAdhese
	return maxkN
end

function Update (casHry)
    if startDelay < 5 then
        startDelay = startDelay + 1
    else
        casMinuly = casProcesor
        casProcesor = os.clock()
        cas = math.abs(casMinuly - casProcesor)
        if math.abs(cas - casHry) > 1 then
            cas = casHry
        end
        if not ksOK and bylKS then
            casKS = casKS + cas
            if casKS > 10 then
                os.execute("taskkill /IM RailWorks.exe /T /F")
            end
        end
        if ToBolAndBack (Call("GetIsNearCamera")) then
            delkaVlaku = Call("GetConsistLength")
            Call("SetControlValue", "ScriptVersion", 0, 460999)
            scriptVersion = Call("GetControlValue", "ScriptVersion", 0)
            -- cas = casHry
            -- Call("ZimniJiskra:Activate",0)
            -- Call("ZimniJiskra1:Activate",0)
            -- Call("ZimniJiskra2:Activate",0)
            -- Call("ZimniJiskra3:Activate",0)
            -- Call("ZimniJiskra4:Activate",0)
            Call("SetControlValue","ZimniJiskraPrehrajZvuka",0,0)
            hh, necojakomm = divMod(SysCall("ScenarioManager:GetTimeOfDay"),3600)
            jeMrtva = ToBolAndBack(Call("GetIsDeadEngine"))
            mm, ss = divMod(necojakomm,60)
            ss=math.floor(ss)
            if hh < 10 then hh = "0"..tostring(hh) end
            if mm < 10 then mm = "0"..tostring(mm) end
            if ss < 10 then ss = "0"..tostring(ss) end
            dennicas = tonumber(hh..mm..ss)
            hh = tonumber(hh)
            mm = tonumber(mm)
            ss = tonumber(ss)
            if Call("GetIsPlayer") == 1 or UzJsiZjistovalPanto then
                if delkaVlakuLast ~= delkaVlaku then
                    --reset pridelenych ID
                        Call("SetControlValue","IsMasterInConsist",0,0)
                    --nulovani ovladacu obsahujicich sumu ID
                        Call("SetControlValue","zapnuteVozy",0,0)
                        Call("SetControlValue","mg",0,0)
                        Call("SetControlValue","mgZvuk",0,0)
                        Call("SetControlValue","mgVS",0,0)
                        Call("SetControlValue","DvereLeveVSouprave",0,0)
                        Call("SetControlValue","DverePraveVSouprave",0,0)
                        Call("SetControlValue","pomkompVS",0,0)
                        Call("SetControlValue","mgPriprava",0,0)
                        Call("SetControlValue","poruchaVeVlaku",0,0)
                        Call("SetControlValue","skluzVeVlaku",0,0)
                        Call("SetControlValue","pocetJimek",0,0)
                        Call("SetControlValue","synchronizacniRele",0,0)
                        Call("SetControlValue","diraDoPotrubi",0,0)
                    --vypusteni potrubi - simulace nove pripojenych vozu
                        if delkaVlaku > delkaVlakuLast then
                            cilovy_tlak_HP_po_zmene = (delkaVlakuLast^2/delkaVlaku^2)*5
                        end
                    x, _, y = Call("*:getNearPosition")
                    Call("SendConsistMessage",460994,string.sub(x, 1, 10),0)
                    predMasinou = Call("SendConsistMessage",460995,string.sub(y, 1, 10),0)
                    if predMasinou == 0 then
                        predMasinouTornado = false
                    else
                        predMasinouTornadoCas = os.clock()
                    end
                    Call("SendConsistMessage",460994,string.sub(x, 1, 10),1)
                    zaMasinou = Call("SendConsistMessage",460995,string.sub(y, 1, 10),1)
                    if zaMasinou == 0 then
                        zaMasinouTornado = false
                    else
                        zaMasinouTornadoCas = os.clock()
                    end
                    Call("SetControlValue","PredMasinou",0,predMasinou)
                    Call("SetControlValue","ZaMasinou",0,zaMasinou)
                    delkaVlakuLast = delkaVlaku
                end
                if predMasinouTornadoCas ~= nil then
                    if predMasinouTornadoCas + (cas*5) < os.clock() then
                        predMasinouTornado = false
                        predMasinouTornadoCas = nil
                    end
                end
                if zaMasinouTornadoCas ~= nil then
                    if zaMasinouTornadoCas + (cas*5) < os.clock() then
                        zaMasinouTornado = false
                        zaMasinouTornadoCas = nil
                    end
                end
                if table.getn(prijateZpravy) > 0 then
                    for i in prijateZpravy do
                        if prijateZpravy[i]["x"] ~= nil and prijateZpravy[i]["y"] ~= nil then
                            local xZS, yZS = prijateZpravy[i]["x"], prijateZpravy[i]["y"]
                            prijateZpravy[i] = nil
                            x, _, y = Call("*:getNearPosition")
                            ZpravaDebug("yZS: "..yZS)
                            ZpravaDebug("xZS: "..xZS)
                            ZpravaDebug("y: "..y)
                            ZpravaDebug("x: "..x)
                            local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
                            if vzdalenost < maxVzdalenost then
                                if i == 2 then
                                    predMasinouTornado = true
                                    predMasinouTornadoCas = nil
                                else
                                    zaMasinouTornado = true
                                    zaMasinouTornadoCas = nil
                                end
                            else
                                if i == 2 then
                                    predMasinouTornado = false
                                    predMasinouTornadoCas = nil
                                else
                                    zaMasinouTornado = false
                                    zaMasinouTornadoCas = nil
                                end
                            end
                        end
                    end
                end
                if predMasinouTornado ~= nil and zaMasinouTornado ~= nil then
                    for _, v in pairs(poleKOdeslani) do
                        Call("SendConsistMessage", v[1], v[2], v[3])
                    end
                    poleKOdeslani = {}
                    if not ToBolAndBack(Call("GetControlValue","IsMasterInConsist",0)) and Call("GetIsEngineWithKey") == 1 then
                        Call("SetControlValue","IsMasterInConsist",0,1)
                        ZpravaDebug("Beru si master!")
                        if zaMasinou == 1 or predMasinou == 1 then
                            Call("SendConsistMessage",460998,"1",1)
                        else
                            ID = 1
                            Call("SetControlValue","ID",0,ID)
                        end
                    end
                    if ID ~= nil and ID > 0 then
                        NastavHodnotuSID("pocetJimek", 1, 460993)
                        pocetJimek = decToBitsCount(Call("GetControlValue", "pocetJimek", 0))
                        hlavniVypinac = Call ("GetControlValue", "HlavniVypinac", 0)
                        Call("SetControlValue","AI",0,0)
                        Ammeter = Call("GetControlValue","Ampermetr",0)
                        RocniObdobi = SysCall("ScenarioManager:GetSeason")
                        SvetloDimm(Call("GetControlValue","StmivacOsvetleni",0))
                        mgp = Call("GetControlValue","mgp",0)
                        rychlost = math.abs(Call("GetSpeed")) * 3.6
                        mgUnitValue = Call("GetControlValue", "mg", 0)
                        if mgUnitValueLast ~= mgUnitValue then
                            mgUnitValueLast = mgUnitValue
                            pocetMG = decToBitsCount(mgUnitValue)
                        end
                        zapnuteVozyUnitValue = Call("GetControlValue", "zapnuteVozy", 0)
                        if zapnuteVozyUnitValueLast ~= zapnuteVozyUnitValue then
                            zapnuteVozyUnitValueLast = zapnuteVozyUnitValue
                            pocetZapnutychVozu = decToBitsCount(zapnuteVozyUnitValue)
                        end
                        if not modelConfig[scriptVersion].ctyriSberace then
                            if Call("GetControlValue","VirtualPantographControl",0) < 0 then
                                Call("SetControlValue","VirtualPantographControl",0,0)
                            end
                        end
                        --zapis ovladacu pokud je loko ridici
                            if RizenaRidici == "ridici" then
                                Call("SetControlValue","AbsolutniRychlomer",0,math.abs(Call("GetControlValue","SpeedometerKPH",0)))
                                Call("SetControlValue","hlkomp",0,KompresorPrep)
                                local sberPrep = Call("GetControlValue","VirtualPantographControl",0)
                                Call("SetControlValue","povel_VlastniObaCizi",0,Call("GetControlValue","VolbaPanto",0))
                                if modelConfig[scriptVersion].ctyriSberace then
                                    if sberPrep < -0.75 then
                                        Call("SetControlValue","povel_VirtualPantographControl",0,2)
                                    elseif sberPrep < -0.25 then
                                        Call("SetControlValue","povel_VirtualPantographControl",0,1)
                                    elseif sberPrep < 0.25 then
                                        Call("SetControlValue","povel_VirtualPantographControl",0,0)
                                    elseif sberPrep < 0.75 then
                                        Call("SetControlValue","povel_VirtualPantographControl",0,3)
                                    else
                                        Call("SetControlValue","povel_VirtualPantographControl",0,2)
                                    end
                                else
                                    if sberPrep > 0.5 then
                                        Call("SetControlValue","povel_VirtualPantographControl",0,3)
                                    else
                                        Call("SetControlValue","povel_VirtualPantographControl",0,0)
                                    end
                                end
                            end
                        if RocniObdobi == 3 and not fiktivniVykonNaRizeneNeschopne then
                            nahoda = math.random(1,1000)
                            if nahoda > 100 and nahoda < math.abs(Ammeter) then
                                if math.floor(math.random(0,5)) == 1 then
                                    Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(math.random(425,950),Call("GetControlValue","Voltmeter",0)))
                                    Call("SetControlValue","Napeti",0,math.random(425,950))
                                    VyberJiskry = math.random(0,5)
                                    Call("SetControlValue","ZimniJiskraPrehrajZvuka",0,1)
                                    if math.floor(VyberJiskry) == 0 then
                                        Call("ZimniJiskra:Activate",1)
                                    elseif math.floor(VyberJiskry) == 1 then
                                        Call("ZimniJiskra1:Activate",1)
                                    elseif math.floor(VyberJiskry) == 2 then
                                        Call("ZimniJiskra2:Activate",1)
                                    elseif math.floor(VyberJiskry) == 3 then
                                        Call("ZimniJiskra3:Activate",1)
                                    elseif math.floor(VyberJiskry) == 4 then
                                        Call("ZimniJiskra4:Activate",1)
                                    end
                                end
                            end
                        end
                        if UzJsiZjistovalPanto == false then
                            UzJsiZjistovalPanto = true
                            Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
                            Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                            Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,math.min(VirtualMainReservoirPressureBAR, 3.8))
                            Call("SetControlValue","VirtualDistributorReservoirPressureBAR",0,tlak_HP)
                            Call("DalkovePrave:Activate", 0)
                            Call("DalkoveLeve:Activate", 0)
                            Call("ActivateNode","dalkaclevy",0)
                            Call("ActivateNode","dalkacpravy",0)
                            Call("ActivateNode","reflektor_rozsviceny",0) 
                            Call("PozickaHorniBi:Activate", 0)
                            Call("PozickaLevaBi:Activate", 0)
                            Call("PozickaLevaCr:Activate", 0)
                            Call("PozickaPravaBi:Activate", 0)
                            Call("PozickaPravaCr:Activate", 0)
                            Call("ActivateNode", "pozickalevaBi", 0) 
                            Call("ActivateNode", "pozickalevaCr", 0) 
                            Call("ActivateNode", "pozickapravaBi", 0) 
                            Call("ActivateNode", "pozickapravaCr", 0)
                            if modelConfig[scriptVersion].ctyriSberace then
                                Call ("SetTime","PredniSberac",0)
                                Call ("SetTime","ZadniSberac",0)
                            else
                                Call ("SetTime","ZadniSberac",0)
                            end
                            Call("SetControlValue","vysilacka_displeje",0,0)
                            Call("SetControlValue","HlavniVypinac",0,0)
                            Call("SetControlValue","VirtualStartup",0,0)
                            Call("SetControlValue","RozProud",0,math.floor(math.random(0,4))/4)
                        end
                        diraDoPotrubi = Call("GetControlValue", "diraDoPotrubi", 0)
                        KompresorPrep = Call("GetControlValue","HlKompPrep",0)
                        JeNouzovyRadic = Call("GetControlValue","JeNouzovyRadic",0)
                        JeNouzovyRadicVS = Call("GetControlValue","povel_NouzovyKontroler",0)
                        vykon = Call("GetControlValue","JizdniKontroler",0)
                        centrala = Call("GetControlValue","Centrala",0)
                        JOBold = JOB
                        JOB = Call("GetControlValue","JOB",0)

                        local pomkomp = math.abs(Call("GetControlValue","pomkomp",0))
                        if pomkomp > 0.5 then
                            pomkomp = 1
                        else
                            pomkomp = 0
                        end
                        NastavHodnotuSID("pomkompVS", pomkomp, 460122)
                        if Call("GetControlValue", "pomkompVS", 0) > 0 then
                            pomkomp = 1
                        else
                            pomkomp = 0
                        end

                        buttonPojezdVDepu = Call("GetControlValue","ButtonPojezdVDepu",0)
                        if LVZreset > 0.25 then LVZresetOld = 1 end
                        LVZreset = math.max(Call("GetControlValue","ZivakReset",0),Call("GetControlValue","ZivakReset2",0),Call("GetControlValue","ZivakReset3",0))
                        hlkomp = Call("GetControlValue","hlkomp",0)
                        Smer = Call("GetControlValue","UserVirtualReverser",0)

                        if Smer == 0 then
                            Call ( "SetControlValue", "povel_Reverser", 0, 0)
                        elseif Smer ~= 2 then
                            Call ( "SetControlValue", "povel_Reverser", 0, Smer)
                        end

                        if baterie == 1 and prepinaceTlak > 3.5 and (not vypnutyVuz or fiktivniVykonNaRizeneNeschopne) then
                            Call("SetControlValue", "Reverser", 0, Call("GetControlValue", "povel_Reverser", 0))
                            if not vypnutyVuz then
                                Call("SoundStroje:SetParameter", "SoundReverser", Call("GetControlValue", "povel_Reverser", 0))
                            else
                                Call("SoundStroje:SetParameter", "SoundReverser", 0)
                            end
                        else
                            Call("SetControlValue", "Reverser", 0, 0)
                            Call("SoundStroje:SetParameter", "SoundReverser", 0)
                        end

                        -- if rychlost >= 100 then
                        -- 	Call("SetControlValue", "VirtualThrottleAndBrake", 0, -1)
                        -- end
                        -- if Call("GetControlValue", "VirtualThrottleAndBrake", 0) == -1 and vykon <= 0 then
                        -- 	Call("SetControlValue", "VirtualBrake", 0, 0.81)
                        -- end

                        if Smer > 1.8 then
                            RizenaRidici = "rizena"
                        else
                            RizenaRidici = "ridici"
                        end
                        RizenaRidiciJednaNula = 0
                        if RizenaRidici == "ridici" then
                            RizenaRidiciJednaNula = 1
                        end
                        VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
                        ----------------------------------------LVZ-----------------------------------------------
                            local LVZnapeti = Call("GetControlValue", "LVZnapeti", 0) --nacti hodnotu Vmetru do promenne
                            local LVZrezim = Call("GetControlValue", "LVZrezim", 0) --nacti hodnotu voliciho prepinace do promenne
                            local LVZstanoviste = Call("GetControlValue", "LVZstan", 0) --nacti hodnotu aktivniho stanoviste do promenne
                            local LVZvypinac = ToBolAndBack(Call("GetControlValue", "LVZhv", 0)) --vrat bool pro stav HV LVZ
                            local LVZstart = ToBolAndBack(Call("GetControlValue", "LVZstart", 0)) --vrat bool pro tlacitko startu bezkontaktniho menice
                            local LVZzkouseni = false --definuj volbu zkouseni

                            if baterie == 1 then
                                if LVZnapeti < 1 and LVZvypinac then --pokud je napeti mensi nez 1 (24V) a je sepnuty vypinac VZ
                                    LVZnapeti = LVZnapeti + cas --napeti roste umerne s casem PC - kompenzace malych FPS
                                    Call("SetControlValue", "LVZnapeti", 0, LVZnapeti) --zapis hodnoty Vmetru
                                end

                                if LVZvypinac and LVZrezim < 0.75 and releEPV and soupatkoVZ == 0 then --pokud je zapaty HV, rezim je provoz, bezkontaktni menic bezi a je natazene soupatko, je VZ aktivni
                                    kontrolaBdelosti = true
                                    if LVZrezim > 0.25 then
                                        LVZzkouseni = true
                                    end
                                elseif LVZrezim < 0.75 then --pokud je zapaty HV a rezim je provoz a zaroven neni natazene soupatko, nebo vubec nebezi bezkontaktni menic
                                    releEPV = false --rozhod rele EPV
                                    kontrolaBdelosti = false
                                    soupatkoVZ = 1 --odpadni soupatko
                                end
                                if LVZstart and LVZrezim > 0.75 and LVZvypinac and valcePrimocinne >= 1.8 and rychlostKolaKMHPodvozek1 < 15 then --pokud je rezim postrk a je zapaty vypinac, je mozne nazhavit bezkontaktni menic
                                    releEPV = true --natahni rele EPV
                                    soupatkoVZ = 0 --natahuje soupatko
                                end
                                if LVZrezim > 0.75 then --pokud je rezim postrk
                                    kontrolaBdelosti = false
                                    if not LVZvypinac then --zaroven pokud je zapaty HV
                                        soupatkoVZ = 0 --pritahni soupatko
                                    end
                                end
                                if not LVZvypinac then --pokud je vypaty vypinac LVZ
                                    releEPV = false --rozhod rele EPV
                                    kontrolaBdelosti = false
                                    if LVZrezim < 0.75 then --pokud je rezim vlak
                                        soupatkoVZ = 1 --odpada soupatko - v rezimu postrk zustava, soupatko drzi
                                    end
                                    Call("SetControlValue", "LVZmenic", 0, 0)
                                else --pokud bezi bezkontaktni menic, tj. je zapaty HV a baterie, sviti jeho kontrolka
                                    if releEPV then
                                        Call("SetControlValue", "LVZmenic", 0, 1)
                                    else
                                        Call("SetControlValue", "LVZmenic", 0, 0)
                                    end
                                end
                                if not kontrolaBdelosti and soupatkoVZ == 0 then
                                    Call("SetControlValue", "LVZvybaveni", 0, 1)
                                elseif not kontrolaBdelosti then
                                    Call("SetControlValue", "LVZvybaveni", 0, 0)
                                end
                            end
                                
                            if LVZnapeti > 0 and (not LVZvypinac or baterie ~= 1) then --pokud je na Vmetru napeti a je vypaty HV
                                LVZnapeti = LVZnapeti - cas*2 --zmiz napeti
                                Call("SetControlValue", "LVZnapeti", 0, LVZnapeti) --zapis napeti
                            end
                            
                            --zakomentovane, LVZ ma vlastni privod mimo stykac baterii

                            if baterie ~= 1 then
                                releEPV = false --rozhod rele EPV
                                soupatkoVZ = 1
                                kontrolaBdelosti = false
                                Call("SetControlValue", "LVZmenic", 0, 0)
                                Call("SetControlValue", "LVZvybaveni", 0, 0)
                            end

                            if LVZstanoviste < 0.5 then
                                Call("SetControlValue", "LVZzivak", 0, Call("GetControlValue","LVZvybaveni",0)) --kontrolka vybaveni
                            else
                                Call("SetControlValue", "LVZzivak", 0, 0) --kontrolka vybaveni vypnuta
                            end

                            local kodNavesti = LVZ(Call("GetControlValue","SkutecnyKod",0),Call("GetControlValue","LVZzivak",0),cas,ToBolAndBack(Call("GetControlValue", "LVZmenic", 0)) and LVZstanoviste < 0.5)
                            --zavolej fci LVZ (fakove poruchy prenosu) a predej ji:
                            --      -skutecny prijaty kod z navestidla
                            --      -stav kontrolky vybaveni
                            --      -cas od posledniho update, ale realny z PC, nikoli "skoro cas" ze hry
                            --      -info o zapnutem / vypnutem LVZ

                            Call("SetControlValue","Mirel",0, kodNavesti) --watafuck??? Sorry, ale fakt netusim :D 

                            if kontrolaBdelosti and baterie == 1 and soupatkoVZ == 0 then --kontrola bdelosti
                                LVZtimer = LVZtimer + cas
                                if LVZreset <= 0.25 and LVZresetOld == 1 and LVZstanoviste < 0.5 then
                                    if LVZtimer > 7 then
                                        LVZtimer = 0
                                    end
                                    LVZresetOld = 0
                                end
                                if valcePrimocinne >= 1.8 and rychlostKolaKMHPodvozek1 < 15 and not LVZzkouseni then
                                    LVZtimer = 0
                                end
                                if kodNavesti == 2 or kodNavesti == 4 then
                                    if LVZreset >= 0.25 and LVZstanoviste < 0.5 then
                                        nadbytecnaObsluha = true
                                        Call ("SetControlValue", "ZivakPip", 0, 1)
                                    end
                                    if LVZtimer > 10 then
                                        LVZtimer = 10
                                    end
                                end
                                if LVZreset <= 0.25 or LVZstanoviste > 0.5 then
                                    nadbytecnaObsluha = false
                                end
                                if LVZtimer <= 7 then
                                    Call ("SetControlValue", "LVZvybaveni", 0, 1)
                                    if not nadbytecnaObsluha or LVZstanoviste > 0.5 then
                                        Call ("SetControlValue", "ZivakPip", 0, 0)
                                    end
                                elseif LVZtimer <= 15 then
                                    Call ("SetControlValue", "LVZvybaveni", 0, 0)
                                    if not nadbytecnaObsluha or LVZstanoviste > 0.5 then
                                        Call ("SetControlValue", "ZivakPip", 0, 0)
                                    end
                                elseif LVZtimer <= 19 then
                                    Call ("SetControlValue", "LVZvybaveni", 0, 0)
                                    if LVZstanoviste < 0.5 then
                                        Call("SetControlValue", "ZivakPip", 0, 1)
                                    end
                                elseif LVZtimer > 19 then
                                    Call ("SetControlValue", "ZivakPip", 0, 0)
                                    Call("SetControlValue", "LVZvybaveni", 0, 0)
                                    soupatkoVZ = 1
                                end
                                if LVZstanoviste > 0.5 then
                                    Call ("SetControlValue", "ZivakPip", 0, 0)
                                end
                            else
                                Call ("SetControlValue", "ZivakPip", 0, 0)
                                LVZtimer = 0
                            end

                        ----------------------------------------Sterace-------------------------------------------
                            intenzitaSrazek = SysCall("WeatherController:GetPrecipitationDensity")
                            steracePrep = ToBolAndBack(math.abs(Call("GetControlValue","steracePrep",0)))
                            dryKoeficient = intenzitaSrazek*math.max(1,rychlost/4)

                            if steracePrep and baterie == 1 then
                                if dryKoeficient > 0.5 then
                                    if steracLevySpeed < STERAC_LEVY_MAX_SPEED then
                                        steracLevySpeed = math.min(steracLevySpeed+cas, STERAC_LEVY_MAX_SPEED)
                                    end
                                    if steracPravySpeed < STERAC_PRAVY_MAX_SPEED then
                                        steracPravySpeed = math.min(steracPravySpeed+cas, STERAC_PRAVY_MAX_SPEED)
                                    end
                                else
                                    if steracLevySpeed < STERAC_LEVY_DRY_SPEED then
                                        steracLevySpeed = math.min(steracLevySpeed+cas, STERAC_LEVY_DRY_SPEED)
                                    else
                                        steracLevySpeed = math.max(steracLevySpeed-cas, STERAC_LEVY_DRY_SPEED)
                                    end
                                    if steracPravySpeed < STERAC_PRAVY_DRY_SPEED then
                                        steracPravySpeed = math.min(steracPravySpeed+cas, STERAC_PRAVY_DRY_SPEED)
                                    else
                                        steracPravySpeed = math.max(steracPravySpeed-cas, STERAC_PRAVY_DRY_SPEED)
                                    end
                                end
                            else
                                if dryKoeficient > 0.5 then
                                    steracLevySpeed = math.max(steracLevySpeed-cas/5, 0)
                                    steracPravySpeed = math.max(steracPravySpeed-cas/5, 0)
                                else
                                    steracLevySpeed = math.max(steracLevySpeed-cas, 0)
                                    steracPravySpeed = math.max(steracPravySpeed-cas, 0)
                                end
                            end

                            if steracLevySpeed > 0 or steracPravySpeed > 0 then
                                steracLevy = Call("GetControlValue","steracLevy",0)
                                steracPravy = Call("GetControlValue","steracPravy",0)
                                steracLevy = steracLevy+cas*steracLevySpeed
                                steracPravy = steracPravy+cas*steracPravySpeed

                                if steracLevy >= 1 then
                                    steracLevy = 0
                                end
                                if steracPravy >= 1 then
                                    steracPravy = 0
                                end

                                if steracLevy >= 0.5 then
                                    Call("SoundWipers:SetParameter", "steracLevyZvuk", 1)
                                    if dryKoeficient < 0.5 then
                                        Call("SoundWipers:SetParameter", "steracLevyZvukDry", 1)
                                    end
                                else
                                    Call("SoundWipers:SetParameter", "steracLevyZvuk", 0)
                                    if dryKoeficient < 0.5 then
                                        Call("SoundWipers:SetParameter", "steracLevyZvukDry", 0)
                                    end
                                end
                                if steracPravy >= 0.5 then
                                    Call("SoundWipers:SetParameter", "steracPravyZvuk", 1)
                                    if dryKoeficient < 0.5 then
                                        Call("SoundWipers:SetParameter", "steracPravyZvukDry", 1)
                                    end
                                else
                                    Call("SoundWipers:SetParameter", "steracPravyZvuk", 0)
                                    if dryKoeficient < 0.5 then
                                        Call("SoundWipers:SetParameter", "steracPravyZvukDry", 0)
                                    end
                                end
                                
                                Call("SetControlValue","steracLevy",0,steracLevy)
                                Call("SetControlValue","steracPravy",0,steracPravy)

                                if steracLevy < 0.5 then
                                    steracLevyOut = steracLevy * 2
                                else
                                    steracLevyOut = 1/steracLevy - 1
                                end
    
                                if steracPravy < 0.5 then
                                    steracPravyOut = steracPravy * 2
                                else
                                    steracPravyOut = 1/steracPravy - 1
                                end
                                Call("SetTime", "steracLOut", steracLevyOut * 4.2083)--2.125
                                Call("SetTime", "steracPOut", steracPravyOut * 4.2083)--2.125
                            end
                                
                        ----------------------------------------IS------------------------------------------------
                            MSVsipkaDoluLast = MSVsipkaDolu
                            MSVsipkaNahoruLast = MSVsipkaNahoru
                            MSVsipkaLevaLast = MSVsipkaLeva
                            MSVsipkaPravaLast = MSVsipkaPrava
                            MSVokLast = MSVok

                            MSVsipkaDolu = ToBolAndBack(Call("GetControlValue","MSVdolu",0))
                            MSVsipkaNahoru = ToBolAndBack(Call("GetControlValue","MSVnahoru",0))
                            MSVsipkaLeva = ToBolAndBack(Call("GetControlValue","MSVleva",0))
                            MSVsipkaPrava = ToBolAndBack(Call("GetControlValue","MSVprava",0))
                            MSVok = ToBolAndBack(Call("GetControlValue","MSVok",0))

                            if IS.stav == "start" and baterie == 1 then
                                IS.casStart = IS.casStart + cas
                                Call("MSVstart:ActivateNode","MSVstart",1)
                                Call("MSVstart2:ActivateNode","MSVstart",1)
                                Call("SetControlValue","MSVrezim",0,0)
                                Call("SetControlValue", "MSVdisp", 0, 1)
                                if IS.casStart > 5 then
                                    Call("MSVstart:ActivateNode","MSVstart",0)
                                    Call("MSVstart2:ActivateNode","MSVstart",0)
                                    IS.casMenu = 0
                                    IS.stav = "menu"
                                    IS:NastavCil1(IS.cil1ID)
                                    Call("SetControlValue", "", 0, 1)
                                    --Call("SetControlValue", "MSVzdo", 0, 1)
                                    Call("SetControlValue","MSVrezim",0,1)
                                    Call("SetControlValue", "MSVdisp", 0, 2)
                                end
                            else
                                IS.casStart = 0
                            end
                            if baterie ~= 1 then
                                IS.stav = "start"
                                IS:VymazVse()
                                Call("MSVstart:ActivateNode","MSVstart",0)
                                Call("MSVstart2:ActivateNode","MSVstart",0)
                                Call("SetControlValue","MSVrezim",0,0)
                            end
                            if baterie == 1 and IS.stav ~= "sleep" then
                                IS.casMenu = IS.casMenu + cas
                                if IS.casMenu > 20 then
                                    IS:Zapis("MSVid","",false,false)
                                    IS:NastavCil1(IS.cil1ID)
                                    if IS.cileIsWhole[ID] == "false" then
                                        IS:NastavCil2(IS.cil2ID)
                                        IS:NastavLinku(IS.linkaID)
                                    end
                                    --Call("SetControlValue", "MSVzdo", 0, 1)
                                    IS.stav = "sleep"
                                    Call("SetControlValue", "MSVdisp", 0, 1)
                                end
                            end

                            if MSVsipkaDolu and not MSVsipkaDoluLast then
                                IS:SipkaDolu()
                            end
                            if MSVsipkaNahoru and not MSVsipkaNahoruLast then
                                IS:SipkaNahoru()
                            end
                            if MSVsipkaLeva and not MSVsipkaLevaLast then
                                IS:SipkaBok()
                            end
                            if MSVsipkaPrava and not MSVsipkaPravaLast then
                                IS:SipkaBok()
                            end
                            if MSVok and not MSVokLast then
                                IS:Potvrzeni()
                            end

                        ----------------------------------------Prechod z RI do RA--------------------------------
                            if RizenaRidici == "rizena" and RizenaRidiciLast == "ridici" then
                                --komplet vypnuti
                                Call("SetControlValue","povel_VirtualPantographControl",0,0)
                                Call("SetControlValue","povel_HlavniVypinac",0,0)
                                Call("SetControlValue","povel_Reverser",0,0)
                                Call("SetControlValue","povel_RidiciKontroler",0,0)
                                Call("SetControlValue","povel_NouzovyKontroler",0,0)
                                Call("SetControlValue","SnizenyVykon",0,0)
                                Call("SetControlValue","mgautostart",0,0)
                                snizenyVykonTady = false
                            end
                            RizenaRidiciLast = RizenaRidici
                        ----------------------------------------Motorgenerator------------------------------------
                            mgs = Call("GetControlValue","mgstart",0)
                            auto_mgs = Call("GetControlValue","mgautostart",0)
                            mgPrip = Call("GetControlValue","mgPriprava",0)
                            
                            NastavHodnotuSID("mgPriprava",mgp,460116)

                            if mgPrip > 0 and PC == 3.75 and hlavniVypinac > 0.5 and ((mgRezim == MG_VLASTNI and not vypnutyVuz) or (mgRezim == MG_NOUZOVY and vypnutyVuz)) then
                                if mgs == 1 or Call("GetControlValue", "mg", 0) > 0 then --or auto_mgs == 1 
                                    Call("SoundStroje:SetParameter", "MGpriprava", 1)
                                    if napetiVS220 >= 350 then
                                        Call("SoundStroje:SetParameter", "MGspotreba", 1)
                                        mg = 1
                                        mgdocasny = 0
                                        if RizenaRidiciJednaNula == 1 then
                                            Call("SetControlValue","mgautostart",0,1)
                                        end
                                    else
                                        mgdocasny = 1
                                        if napetiVS220 > 150 then
                                            Call("SoundStroje:SetParameter", "MGdruhyStupen", 1)
                                        else
                                            Call("SoundStroje:SetParameter", "MGdruhyStupen", 0)
                                        end
                                    end
                                else
                                    Call("SoundStroje:SetParameter", "MGspotreba", 0)
                                    Call("SoundStroje:SetParameter", "MGdruhyStupen", 0)
                                    mgdocasny = 0
                                end
                            else
                                Call("SoundStroje:SetParameter", "MGpriprava", 0)
                                Call("SoundStroje:SetParameter", "MGdruhyStupen", 0)
                                Call("SoundStroje:SetParameter", "MGspotreba", 0)
                                if mgPrip < 1 and RizenaRidiciJednaNula == 1 then
                                    Call("SetControlValue","mgautostart",0,0)
                                end
                                mg = 0
                                mgdocasny = 0
                            end
                            Call("SetControlValue","mgZvuk",0,math.max(mg,mgdocasny))
                            NastavHodnotuSID("mgVS",math.max(mg,mgdocasny),460117)
                            NastavHodnotuSID("mg",mg,460118)
                        ----------------------------------------Vysilacka-----------------------------------------
                            if baterie == 1 then
                                if vysilackaObrazovka ~= vysilackaObrazovkaStara then -- displej vys?la?ky
                                    Call("SetControlValue","vysilacka_displeje",0,vysilackaObrazovka)
                                    Call("SetControlValue","VysilackaStartSound",0,0)
                                    vysilackaObrazovkaStara = vysilackaObrazovka
                                end
                                if vysilackaObrazovka == 1 then -- start vys?la?ky
                                    vysilackaboot = vysilackaboot + cas
                                    if vysilackaboot > 15 then
                                        vysilackaObrazovka = 8
                                        vysilackaboot = 0
                                    end
                                end
                                if vysilackaObrazovka ~= 1 and vysilackaObrazovka ~= 0 then -- zobrazen? ??sla vlaku a hodin a? po zapnut?
                                    if vysilackaprihlasena ~= 1 then -- blik?n? odhl??en? vys?la?ky
                                        vysilackablikani = vysilackablikani + cas
                                        if vysilackablikani >= 1 then
                                            if cislovzhasnute == 1 then
                                                Call("vysilackacislov:SetText","xxxxxx",0)
                                                cislovzhasnute = 0
                                                vysilackablikani = 0
                                            else
                                                Call("vysilackacislov:SetText",tostring(cislovlaku),0)
                                                cislovzhasnute = 1
                                                vysilackablikani = 0
                                            end
                                        end
                                    else
                                        Call("vysilackacislov:SetText",cislovlaku,0)
                                        vysilackablikani = 0
                                    end
                                    if vysilackaObrazovka == 4 or vysilackaObrazovka == 5 then
                                        Call("vysilackacislovdolni:SetText",tostring(cislovlakubuffzobraz),0)
                                        if cislovlakubuff < 10 then cislovlakubuffzobraz = "xxxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100 and cislovlakubuff >= 10 then cislovlakubuffzobraz = "xxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000 and cislovlakubuff >= 100 then cislovlakubuffzobraz = "xxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 10000 and cislovlakubuff >= 1000 then cislovlakubuffzobraz = "xx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100000 and cislovlakubuff >= 10000 then cislovlakubuffzobraz = "x"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000000 and cislovlakubuff >= 100000 then cislovlakubuffzobraz = tostring(cislovlakubuff) end
                                        Call("vysilackacislovdolni:SetText",tostring(cislovlakubuffzobraz),0)
                                    else
                                        Call("vysilackacislovdolni:SetText","xxxxxx",0)
                                    end
                                    Call("SetControlValue","vysilackaReg",0,vysilackaprihlasena)
                                else
                                    Call("vysilackacislovdolni:SetText","xxxxxx",0)
                                    Call("vysilackacislov:SetText","xxxxxx",0)
                                end
                                if vysilackaObrazovka == 8 then -- hlavn? obrazovka
                                    if tlacitko8 == 1 then
                                        tlacitko8 = 0
                                        if vysilackaprihlasena == 0 then
                                            vysilackaObrazovka = 7
                                        else
                                            vysilackaObrazovka = 6
                                        end
                                    end
                                end
                                if vysilackaObrazovka == 6 or vysilackaObrazovka == 7 then -- menu data
                                    if tlacitko1 == 1 then
                                        tlacitko1 = 0
                                        vysilackaObrazovka = 5
                                    end
                                    if menupozice == 1 and tlacitkoEnter == 1 then
                                        tlacitkoEnter = 0
                                        menupozice = 1
                                        vysilackaObrazovka = 5
                                    end
                                    if vysilackaObrazovka == 7 then
                                        if tlacitko0 == 1 then
                                            tlacitko0 = 0
                                            if cislovlaku ~= "xxxxxx" then 
                                                vysilackaprihlasena = 1
                                                vysilackaObrazovka = 8
                                            end
                                        end
                                    else
                                        if tlacitko0 == 1 then
                                            tlacitko0 = 0
                                            vysilackaprihlasena = 0
                                            vysilackaObrazovka = 8
                                        end
                                    end
                                    if tlacitkoDelete == 1 then
                                        tlacitkoDelete = 0
                                        vysilackaObrazovka = 8
                                    end
                                end
                                if vysilackaObrazovka == 5 or vysilackaObrazovka == 4 then -- zad?n? ??sla vlaku bez potvrzen?
                                    if cislovlakubuff ~= 0 then
                                        vysilackaObrazovka = 4
                                    else
                                        vysilackaObrazovka = 5
                                    end
                                    if tlacitko1 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko1 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 1 else cislovlakubuff = (cislovlakubuff * 10) + 1 end
                                    end
                                    if tlacitko8 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko8 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 8 else cislovlakubuff = (cislovlakubuff * 10) + 8 end
                                    end
                                    if tlacitko0 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko0 = 0
                                        if cislovlakubuff ~= 0 then cislovlakubuff = (cislovlakubuff * 10) end
                                    end
                                    if tlacitko2 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko2 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 2 else cislovlakubuff = (cislovlakubuff * 10) + 2 end
                                    end
                                    if tlacitko3 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko3 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 3 else cislovlakubuff = (cislovlakubuff * 10) + 3 end
                                    end
                                    if tlacitko4 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko4 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 4 else cislovlakubuff = (cislovlakubuff * 10) + 4 end
                                    end
                                    if tlacitko5 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko5 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 5 else cislovlakubuff = (cislovlakubuff * 10) + 5 end
                                    end
                                    if tlacitko6 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko6 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 6 else cislovlakubuff = (cislovlakubuff * 10) + 6 end
                                    end
                                    if tlacitko7 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko7 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 7 else cislovlakubuff = (cislovlakubuff * 10) + 7 end
                                    end
                                    if tlacitko9 == 1 and cislovlakubuff < 1000000 then
                                        tlacitko9 = 0
                                        if cislovlakubuff == 0 then cislovlakubuff = 9 else cislovlakubuff = (cislovlakubuff * 10) + 9 end
                                    end
                                    if tlacitkoDelete == 1 then
                                        tlacitkoDelete = 0
                                        if cislovlakubuff ~= 0 then cislovlakubuff = math.floor(cislovlakubuff/10) end
                                    end
                                    if tlacitkoEnter == 1 then
                                        tlacitkoEnter = 0
                                        if cislovlakubuff < 10 then cislovlaku = "xxxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100 and cislovlakubuff >= 10 then cislovlaku = "xxxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000 and cislovlakubuff >= 100 then cislovlaku = "xxx"..tostring(cislovlakubuff) elseif cislovlakubuff < 10000 and cislovlakubuff >= 1000 then cislovlaku = "xx"..tostring(cislovlakubuff) elseif cislovlakubuff < 100000 and cislovlakubuff >= 10000 then cislovlaku = "x"..tostring(cislovlakubuff) elseif cislovlakubuff < 1000000 and cislovlakubuff >= 100000 then cislovlaku = tostring(cislovlakubuff) end
                                        vysilackaObrazovka = 3
                                    end
                                end
                                if vysilackaObrazovka == 3 then -- pracovn? pozice
                                    if tlacitkoEnter == 1 then
                                        tlacitkoEnter = 0
                                        vysilackaObrazovka = 8
                                    end
                                    if tlacitkoDelete == 1 then
                                        tlacitkoDelete = 0
                                        vysilackaObrazovka = 8
                                    end
                                end
                            else
                                Call("SetControlValue","vysilacka_displeje",0,0)
                                cislovlaku="xxxxxx"
                                vysilackaObrazovka = 0
                                vysilackaObrazovkaStara = 1
                                vysilackaboot = 0
                                vysilackablikani = 0
                                vysilackaprihlasena = 0
                                cislovzhasnute = 0
                                menupozice=1
                                tlacitko1 = 0
                                tlacitkoEnter = 0
                                cislovlakubuff = 0
                                tlacitkoDelete = 0
                                tlacitko0 = 0
                                Call("vysilackacislovdolni:SetText","xxxxxx",0)
                                Call("vysilackacislov:SetText","xxxxxx",0)
                            end
                        ----------------------------------------Rele soucinnosti brzdeni--------------------------
                            if plynuleValce > 1.2 then
                                tlakVeValcich = true
                            elseif plynuleValce < 0.5 then
                                tlakVeValcich = false
                            end

                            if Ammeter < -300 and not tlakVeValcich and tlak_HP > 3.5 and not fiktivniVykonNaRizeneNeschopne then
                                releSoucinnostiBrzd = true
                                Call("*:SetBrakeFailureValue","BRAKE_FADE",1)
                                Call("SetControlValue", "BrakeBailOff", 0, 1)
                                nezobrazujValce = true
                            else
                                releSoucinnostiBrzd = false
                                Call("*:SetBrakeFailureValue","BRAKE_FADE",0)
                                Call("SetControlValue", "BrakeBailOff", 0, 0)
                                nezobrazujValce = false
                            end
                        ----------------------------------------Ventily povesene na brzdove potrubi---------------
                            if soupatkoVZ == 1 or matrosov or BS2 > 0.95 then
                                NastavHodnotuSID("diraDoPotrubi", 1, 460991)
                                Call("SoundBrzdice:SetParameter", "EmergencyValve", 1)
                            else
                                NastavHodnotuSID("diraDoPotrubi", 0, 460991)
                                Call("SoundBrzdice:SetParameter", "EmergencyValve", 0)
                                Call("SoundBrzdice:SetParameter", "EmergencyFilling", 0)
                            end
                            if Call("GetControlValue", "diraDoPotrubi", 0) > 0 then
                                if doplnujBrzdu then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - ((math.sqrt(VirtualMainReservoirPressureBAR)/100)+0.01))
                                    Call("SoundBrzdice:SetParameter", "EmergencyFilling", 1)
                                else
                                    Call("SoundBrzdice:SetParameter", "EmergencyFilling", 0)
                                end
                            end
                        ----------------------------------------DAKO BS2------------------------------------------
                            tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                            navoleny_tlak = Call("GetControlValue","VirtualBrakeSettedPressureBAR",0)
                            ridici_tlak = Call("GetControlValue","VirtualBrakeControlSystemPressureBAR",0)
                            plynuleValce = Call("GetControlValue","VirtualTrainBrakeCylinderPressureBAR",0)

                            --netesnost brzdice
                                ridici_tlak = ridici_tlak-(((ridici_tlak/500)^2)*3*cas)

                            --netesnost potrubi
                                Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP-(((tlak_HP/500)^2)*3*cas*pocetJimek))
                            
                            --odvetravani regulacniho clenu pri prebiti
                                vychoziTlakBrzdice = math.max(vychoziTlakBrzdice-0.00333*cas,5)

                            --nastaveni idealniho (ciloveho) tlaku v potrubi
                                --BS2old = BS2
                                BS2 = Call("GetControlValue","VirtualBrake",0)
                                --if BS2 ~= BS2old or doplnujBrzdu then
                                    ventilSvihu = false
                                    if BS2 < 0.05 then
                                        ventilSvihu = true
                                        doplnujBrzdu = true
                                        navoleny_tlak = VirtualMainReservoirPressureBAR
                                    elseif BS2 < 0.14 then
                                        navoleny_tlak = vychoziTlakBrzdice
                                        doplnujBrzdu = true
                                    elseif BS2 < 0.23 then
                                        doplnujBrzdu = false
                                    elseif BS2 <= 0.82 then --0.28 - 0.78
                                        navoleny_tlak = vychoziTlakBrzdice - 0.3 - ((BS2 - 0.28)*3.4)
                                        doplnujBrzdu = true
                                    else
                                        doplnujBrzdu = false
                                    end
                                --end
                                Call("SetControlValue","VirtualBrakeSettedPressureBAR",0,navoleny_tlak)
                            
                            --tlak ridiciho ustroji brzdice
                                local zmena_tlaku_ridiciho_ustroji = math.sqrt(math.abs(math.min(navoleny_tlak, VirtualMainReservoirPressureBAR)-ridici_tlak))/3*cas
                                -- if navoleny_tlak > vychoziTlakBrzdice then
                                --     zmena_tlaku_ridiciho_ustroji = math.sqrt(math.abs(math.min(navoleny_tlak, VirtualMainReservoirPressureBAR)-ridici_tlak))/200
                                -- end
                                --if not ventilSvihu or tlak_HP < 5 then
                                    if math.min(navoleny_tlak, VirtualMainReservoirPressureBAR) > ridici_tlak then
                                        ridici_tlak = math.min(ridici_tlak + zmena_tlaku_ridiciho_ustroji, math.min(navoleny_tlak, VirtualMainReservoirPressureBAR))
                                    elseif ridici_tlak > navoleny_tlak then
                                        ridici_tlak = math.max(ridici_tlak - zmena_tlaku_ridiciho_ustroji, navoleny_tlak)
                                    end
                                -- else
                                --     if (ridici_tlak < navoleny_tlak) then
                                --         ridici_tlak = math.min(ridici_tlak + math.sqrt(navoleny_tlak-ridici_tlak)*cas*0.03, navoleny_tlak)
                                --     else
                                --         ridici_tlak = ridici_tlak - math.sqrt(ridici_tlak-navoleny_tlak)*cas*0.03
                                --     end
                                -- end

                            --prebijeni vychoziho tlaku brzdice
                                if (vychoziTlakBrzdice < ridici_tlak) then
                                    vychoziTlakBrzdice = math.min(vychoziTlakBrzdice + math.sqrt(ridici_tlak-vychoziTlakBrzdice)*cas*0.05,ridici_tlak)
                                end
                            
                            --prenaseni tlaku ze soupravy - prevazne kvuli prebiti
                                if BS2 > 0.88 and BS2 < 0.95 then
                                    tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                end

                            --rizeni membrany regulatoru hlavniho potrubi
                                idealni_membrana_ridiciho_ustroji = math.max(math.min((ridici_tlak-tlak_HP)*math.max(VirtualMainReservoirPressureBAR-tlak_HP,1),1),-1)

                                if math.abs(skutecna_membrana_ridiciho_ustroji) < 0.001 and math.abs(idealni_membrana_ridiciho_ustroji - skutecna_membrana_ridiciho_ustroji) < 0.001 then
                                    prah_hystereze_ridiciho_ustroji = math.min(prah_hystereze_ridiciho_ustroji + cas*0.01, 0.25)
                                elseif math.abs(idealni_membrana_ridiciho_ustroji - skutecna_membrana_ridiciho_ustroji) > 0.001 then
                                    prah_hystereze_ridiciho_ustroji = math.max(prah_hystereze_ridiciho_ustroji - cas*math.sqrt(math.abs(idealni_membrana_ridiciho_ustroji-skutecna_membrana_ridiciho_ustroji)),0)
                                end
                                
                                if tlak_HP > 5 then
                                    prah_hystereze_ridiciho_ustroji = 0
                                end
                                
                                if math.abs(skutecna_membrana_ridiciho_ustroji) < 0.01 and math.abs(idealni_membrana_ridiciho_ustroji) < 0.01 then
                                    skutecna_membrana_ridiciho_ustroji = 0
                                elseif skutecna_membrana_ridiciho_ustroji < idealni_membrana_ridiciho_ustroji-prah_hystereze_ridiciho_ustroji then
                                    skutecna_membrana_ridiciho_ustroji = math.min(skutecna_membrana_ridiciho_ustroji + math.sqrt(math.abs(idealni_membrana_ridiciho_ustroji-skutecna_membrana_ridiciho_ustroji))*cas,1)
                                elseif skutecna_membrana_ridiciho_ustroji > idealni_membrana_ridiciho_ustroji+prah_hystereze_ridiciho_ustroji then
                                    skutecna_membrana_ridiciho_ustroji = math.max(skutecna_membrana_ridiciho_ustroji - math.sqrt(math.abs(idealni_membrana_ridiciho_ustroji-skutecna_membrana_ridiciho_ustroji))*cas,-1)
                                end

                            --pistek regulatoru hlavniho potrubi - napousteni a vypousteni
                                if diraDoPotrubi == 0 then
                                    if doplnujBrzdu then
                                        if tlak_HP > vychoziTlakBrzdice then
                                            Call("SoundBrzdice:SetParameter", "MainPipeReleasing", 0)
                                        else
                                            Call("SoundBrzdice:SetParameter", "MainPipeReleasing", math.max(math.min(skutecna_membrana_ridiciho_ustroji, tlak_HP),-1))
                                        end
                                        Call("SoundBrzdice:SetParameter", "MainPipeFilling", math.max(math.min(skutecna_membrana_ridiciho_ustroji, math.abs(tlak_HP - VirtualMainReservoirPressureBAR)),0))
                                        if skutecna_membrana_ridiciho_ustroji > 0 and tlak_HP < VirtualMainReservoirPressureBAR then
                                            tlak_HP = tlak_HP + math.abs(skutecna_membrana_ridiciho_ustroji*cas*math.max(tlak_HP-VirtualMainReservoirPressureBAR,1)/(Call("GetConsistLength")/100))
                                        elseif skutecna_membrana_ridiciho_ustroji < 0 then
                                            tlak_HP = math.max(tlak_HP - math.abs(skutecna_membrana_ridiciho_ustroji*cas/(Call("GetConsistLength")/100)),0)
                                        end
                                    else
                                        Call("SoundBrzdice:SetParameter", "MainPipeReleasing", 0)
                                        Call("SoundBrzdice:SetParameter", "MainPipeFilling", 0)
                                    end
                                elseif diraDoPotrubi > 0 then
                                    Call("SoundBrzdice:SetParameter", "MainPipeReleasing", 0)
                                    -- if doplnujBrzdu then
                                    --     local prirustek_brzdeni = math.sqrt(math.abs(tlak_HP-math.min(ridici_tlak/2.5, VirtualMainReservoirPressureBAR/5)))/(Call("GetConsistLength")/10)
                                    --     if tlak_HP > math.min(ridici_tlak/2.5, VirtualMainReservoirPressureBAR/5) then
                                    --         tlak_HP = tlak_HP - prirustek_brzdeni * 15 * cas
                                    --     else
                                    --         tlak_HP = tlak_HP + prirustek_brzdeni * 15 * cas
                                    --     end
                                    -- else
                                        local prirustek_brzdeni = math.sqrt(tlak_HP)/(Call("GetConsistLength")/10)
                                        if tlak_HP > 0 then
                                            tlak_HP = tlak_HP - prirustek_brzdeni * 15 * cas
                                        else
                                            tlak_HP = 0
                                        end
                                    -- end
                                    if doplnujBrzdu then
                                        Call("SoundBrzdice:SetParameter", "MainPipeFilling", math.max(math.min(skutecna_membrana_ridiciho_ustroji, math.abs(tlak_HP - VirtualMainReservoirPressureBAR)),0))
                                    else
                                        Call("SoundBrzdice:SetParameter", "MainPipeFilling", 0)
                                    end
                                end

                            --plneni potrubi - ubytek tlaku z hlavni jimky
                                if tlak_HP > PipeOld then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - (tlak_HP - PipeOld)*Call("GetConsistLength")/(240*pocetJimek)*15*cas)
                                end
                                PipeOld = tlak_HP

                            --ubytek v potrubi pri pripojeni vozu
                                if tlak_HP - cilovy_tlak_HP_po_zmene > math.sqrt(tlak_HP-cilovy_tlak_HP_po_zmene)*cas*3 and cilovy_tlak_HP_po_zmene > 0 then
                                    tlak_HP = tlak_HP - math.sqrt(tlak_HP-cilovy_tlak_HP_po_zmene)*cas*3
                                else
                                    cilovy_tlak_HP_po_zmene = -1
                                end
                                
                            --zapis hodnot
                                Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,ridici_tlak)
                                Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
                        ----------------------------------------DAKO BP-------------------------------------------
                            valcePrimocinne = math.min(Call("GetControlValue","EngineBrakeControl",0)*3.8,VirtualMainReservoirPressureBAR)
                        ----------------------------------------DAKO ROZVADEC-------------------------------------
                            VirtualDistributorReservoirPressureBAR = Call("GetControlValue","VirtualDistributorReservoirPressureBAR",0)
                            VirtualDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualDistributorControlReservoirPressureBAR",0)

                            VirtualDistributorReservoirPressureBAR = VirtualDistributorReservoirPressureBAR-(((VirtualDistributorReservoirPressureBAR/500)^2)*5*cas)
                            if tlak_HP < 3 then
                                VirtualDistributorControlReservoirPressureBAR = VirtualDistributorControlReservoirPressureBAR-(((VirtualDistributorControlReservoirPressureBAR/200)^2)*5*cas)
                            end

                            --plneni zasobni jimky rozvadece
                                if VirtualDistributorReservoirPressureBAR < tlak_HP then
                                    Call("SetControlValue","VirtualDistributorReservoirPressureBAR",0,VirtualDistributorReservoirPressureBAR+math.sqrt(math.abs(tlak_HP - VirtualDistributorReservoirPressureBAR))/100*15*cas)
                                    Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP-math.sqrt(math.abs(tlak_HP - VirtualDistributorReservoirPressureBAR))/100*15*cas)
                                    VirtualDistributorReservoirPressureBAR = Call("GetControlValue","VirtualDistributorReservoirPressureBAR",0)
                                    tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                end

                            --ridici jimka
                                if VirtualDistributorControlReservoirPressureBAR < tlak_HP then
                                    Call("SetControlValue","VirtualDistributorControlReservoirPressureBAR",0,VirtualDistributorControlReservoirPressureBAR+math.sqrt(math.abs(tlak_HP - VirtualDistributorControlReservoirPressureBAR))*0.03*cas)
                                    Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP-math.sqrt(math.abs(tlak_HP - VirtualDistributorControlReservoirPressureBAR))/500*15*cas)
                                    VirtualDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualDistributorControlReservoirPressureBAR",0)
                                    tlak_HP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                elseif math.abs(VirtualDistributorControlReservoirPressureBAR - tlak_HP) < 0.05 then
                                    Call("SetControlValue","VirtualDistributorControlReservoirPressureBAR",0,VirtualDistributorControlReservoirPressureBAR-0.005*cas)
                                    VirtualDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualDistributorControlReservoirPressureBAR",0)
                                end

                            --plneni valcu
                                cilovy_tlak_bv = math.max(VirtualDistributorControlReservoirPressureBAR-tlak_HP,0)*2.53
                                rozdil_bv = math.abs(cilovy_tlak_bv-VirtualDistributorBrakeCylinderPressureBAR)
                                if cilovy_tlak_bv > VirtualDistributorBrakeCylinderPressureBAR then
                                    VirtualDistributorBrakeCylinderPressureBAR = math.min(VirtualDistributorBrakeCylinderPressureBAR + 0.7*cas*rozdil_bv*math.min(math.sqrt(math.abs(VirtualDistributorBrakeCylinderPressureBAR-VirtualDistributorReservoirPressureBAR)),1),cilovy_tlak_bv)
                                    Call("SetControlValue","VirtualDistributorReservoirPressureBAR",0,VirtualDistributorReservoirPressureBAR-math.sqrt(math.abs(VirtualDistributorBrakeCylinderPressureBAR - VirtualDistributorReservoirPressureBAR))/500*15*cas*rozdil_bv)
                                    VirtualDistributorReservoirPressureBAR = Call("GetControlValue","VirtualDistributorReservoirPressureBAR",0)
                                    Call("SoundBrzdice:SetParameter", "CylinderFilling", rozdil_bv)
                                    Call("SoundBrzdice:SetParameter", "CylinderReleasing", 0)
                                elseif cilovy_tlak_bv < VirtualDistributorBrakeCylinderPressureBAR then
                                    VirtualDistributorBrakeCylinderPressureBAR = math.max(VirtualDistributorBrakeCylinderPressureBAR - 0.3*cas*rozdil_bv*math.sqrt(VirtualDistributorBrakeCylinderPressureBAR),cilovy_tlak_bv)
                                    Call("SoundBrzdice:SetParameter", "CylinderReleasing", rozdil_bv)
                                    Call("SoundBrzdice:SetParameter", "CylinderFilling", 0)
                                else
                                    Call("SoundBrzdice:SetParameter", "CylinderReleasing", 0)
                                    Call("SoundBrzdice:SetParameter", "CylinderFilling", 0)
                                end

                            --prevod ubytek -> tlak valcu
                                nastaveneValce = VirtualDistributorBrakeCylinderPressureBAR
                                nastaveneValce_bezBP = nastaveneValce

                            --DAKO TR1
                                if nezobrazujValce then
                                    nastaveneValce = math.max(math.min(valcePrimocinne,3.8),0)
                                else
                                    nastaveneValce = math.max(math.min(math.max(nastaveneValce,valcePrimocinne),3.8),0)
                                end
                            
                            --zplynuleni prechodu valcu
                                if nastaveneValce_bezBP > plynuleValce_bezBP then
                                    plynuleValce_bezBP = plynuleValce_bezBP + math.sqrt(math.abs(nastaveneValce_bezBP-plynuleValce_bezBP))/20*15*cas
                                elseif plynuleValce_bezBP > nastaveneValce_bezBP then
                                    plynuleValce_bezBP = math.max(plynuleValce_bezBP - math.sqrt(math.abs(nastaveneValce_bezBP-plynuleValce_bezBP))/40*15*cas,0)
                                end
                            
                            --vypocet vracene hodnoty TBC
                                max_tbc = (-math.log(0.18*rychlostKolaPodvozek1+20)+4)/2 + (-math.log(0.18*rychlostKolaPodvozek2+20)+4)/2
                                if releSoucinnostiBrzd then
                                    cilovaTBC = math.max(max_tbc*math.min(plynuleValce_bezBP/3.8,1),0)*math.max((delkaVlaku-(math.min(pocetZapnutychVozu, pocetMG)*23.85))/delkaVlaku, 0)
                                else
                                    cilovaTBC = math.max(max_tbc*math.min(plynuleValce_bezBP/3.8,1),0)
                                end

                                if cilovaTBC > actualTBC then
                                    actualTBC = actualTBC + math.sqrt(math.abs(cilovaTBC-actualTBC))/20*15*cas
                                elseif actualTBC > cilovaTBC then
                                    actualTBC = actualTBC - math.sqrt(math.abs(cilovaTBC-actualTBC))/40*15*cas
                                end

                        ----------------------------------------Brzdove valce-------------------------------------
                            if nastaveneValce > plynuleValce then
                                if valcePrimocinne - plynuleValce > 0.1 then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR - 0.2*cas)
                                end
                                plynuleValce = plynuleValce + math.sqrt(math.abs(nastaveneValce-plynuleValce))/20*15*cas
                            elseif plynuleValce > nastaveneValce then
                                plynuleValce = plynuleValce - math.sqrt(math.abs(nastaveneValce-plynuleValce))/40*15*cas
                            end
                            Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValce)

                        ----------------------------------------Manometry-----------------------------------------
                            manometrHP = Call("GetControlValue", "ManometrHP", 0)
                            if (diraDoPotrubi > 0) then
                                local prirustek_brzdeni = math.sqrt(math.abs(manometrHP-math.min(tlak_HP/2.5, VirtualMainReservoirPressureBAR/5)))
                                if manometrHP > math.min(tlak_HP/2.5, VirtualMainReservoirPressureBAR/5) then
                                    manometrHP = math.min(math.max(manometrHP - prirustek_brzdeni * 15 * cas,math.min(tlak_HP/2.5, VirtualMainReservoirPressureBAR/5)), manometrHP)
                                else
                                    manometrHP = math.max(math.min(manometrHP + prirustek_brzdeni * 15 * cas,math.min(tlak_HP/2.5, VirtualMainReservoirPressureBAR/5)), manometrHP)
                                end
                            elseif doplnujBrzdu then
                                if (math.min(navoleny_tlak,VirtualMainReservoirPressureBAR) < manometrHP-0.05) then
                                    local prirustek_brzdeni = math.sqrt(math.abs(manometrHP-(math.min(tlak_HP,VirtualMainReservoirPressureBAR)-(math.min(tlak_HP,VirtualMainReservoirPressureBAR)-math.min(navoleny_tlak,VirtualMainReservoirPressureBAR))*0.3)))
                                    manometrHP = math.max(manometrHP - prirustek_brzdeni * 3 * cas,(math.min(tlak_HP,VirtualMainReservoirPressureBAR)-(math.min(tlak_HP,VirtualMainReservoirPressureBAR)-math.min(navoleny_tlak,VirtualMainReservoirPressureBAR))*0.3))
                                elseif (math.min(navoleny_tlak,VirtualMainReservoirPressureBAR) > manometrHP+0.05) then
                                    local prirustek_brzdeni = math.sqrt(math.abs(manometrHP-(math.min(tlak_HP,VirtualMainReservoirPressureBAR)+(math.min(navoleny_tlak,VirtualMainReservoirPressureBAR)-math.min(tlak_HP,VirtualMainReservoirPressureBAR))*0.3)))
                                    manometrHP = math.min(manometrHP + prirustek_brzdeni * 3 * cas,(math.min(tlak_HP,VirtualMainReservoirPressureBAR)+(math.min(navoleny_tlak,VirtualMainReservoirPressureBAR)-math.min(tlak_HP,VirtualMainReservoirPressureBAR))*0.3))
                                end
                            else
                                if (tlak_HP < manometrHP-0.05) then
                                    manometrHP = manometrHP - math.sqrt(manometrHP-tlak_HP) * 3 * cas
                                elseif (tlak_HP > manometrHP+0.05) then
                                    manometrHP = manometrHP + math.sqrt(tlak_HP-manometrHP) * 3 * cas
                                end
                            end
                            Call("SetControlValue", "ManometrHP", 0, manometrHP)

                            manometrBV = Call("GetControlValue", "ManometrBV", 0)
                            if (manometrBV < 0.5 and plynuleValce > 0.5) then
                                naskokManometruBV = true
                            elseif (plynuleValce < 0.5 or manometrBV >= 0.5) then
                                naskokManometruBV = false
                            end
                            if ((manometrBV < plynuleValce and manometrBV >= 0.5) or naskokManometruBV) then
                                if (naskokManometruBV) then
                                    if (manometrBV < 0.5) then
                                        manometrBV = math.min(manometrBV + math.sqrt(0.5-manometrBV)*cas*5,0.5)
                                    end
                                else
                                    manometrBV = math.min(manometrBV + math.sqrt(plynuleValce-manometrBV)*cas,plynuleValce)
                                end
                            elseif (manometrBV > plynuleValce) then
                                manometrBV = math.max(manometrBV - math.sqrt(manometrBV-plynuleValce)*cas,plynuleValce)
                            end
                            Call("SetControlValue", "ManometrBV", 0, manometrBV)

                            if Call("GetControlValue", "Odkalovani", 0) > 0.5 and baterie == 1 then
                                odkalovaniJimek = true
                            else
                                odkalovaniJimek = false
                            end
                            manometrHJ = Call("GetControlValue", "ManometrHJ", 0)
                            if ((diraDoPotrubi > 0 and doplnujBrzdu) or odkalovaniJimek) then
                                ubytekHJ = true
                                if (manometrHJ < VirtualMainReservoirPressureBAR-math.abs(tlak_HP-VirtualMainReservoirPressureBAR)/10) then
                                    manometrHJ = math.min(manometrHJ + math.sqrt((VirtualMainReservoirPressureBAR-math.abs(tlak_HP-VirtualMainReservoirPressureBAR)/10)-manometrHJ)*cas*15,VirtualMainReservoirPressureBAR-math.abs(tlak_HP-VirtualMainReservoirPressureBAR)/10)
                                else
                                    manometrHJ = math.max(manometrHJ - math.sqrt(manometrHJ-(VirtualMainReservoirPressureBAR-math.abs(tlak_HP-VirtualMainReservoirPressureBAR)/10))*cas*15,VirtualMainReservoirPressureBAR-math.abs(tlak_HP-VirtualMainReservoirPressureBAR)/10)
                                end
                            elseif (not prekmitManometrHJ and not podkmitManometrHJ) then
                                if (ubytekHJ) then
                                    if (manometrHJ < VirtualMainReservoirPressureBAR) then
                                        manometrHJ = math.min(manometrHJ + math.sqrt(VirtualMainReservoirPressureBAR-manometrHJ)*cas*15,VirtualMainReservoirPressureBAR)
                                    else
                                        manometrHJ = math.max(manometrHJ - math.sqrt(manometrHJ-VirtualMainReservoirPressureBAR)*cas*15,VirtualMainReservoirPressureBAR)
                                    end
                                    if (math.abs(VirtualMainReservoirPressureBAR-manometrHJ)<0.01) then
                                        ubytekHJ = false
                                    end
                                else
                                    if (manometrHJ < VirtualMainReservoirPressureBAR) then
                                        manometrHJ = math.min(manometrHJ + math.sqrt(VirtualMainReservoirPressureBAR-manometrHJ)*cas*5,VirtualMainReservoirPressureBAR)
                                    else
                                        manometrHJ = math.max(manometrHJ - math.sqrt(manometrHJ-VirtualMainReservoirPressureBAR)*cas*5,VirtualMainReservoirPressureBAR)
                                    end
                                end
                            end
                            if (baterie == 1 and vnitrniSit220V == 1 and PC == 3.75 and (hlkomp == -1 or (hlkomp == 1 and autoKompresor))) then
                                if (not podkmitManometrHJ) then
                                    prekmitManometrHJ = true
                                end
                                local prekmit = VirtualMainReservoirPressureBAR+0.05
                                local podkmit = math.max(VirtualMainReservoirPressureBAR-0.05,0)
                                if (prekmitManometrHJ) then
                                    if (manometrHJ < prekmit) then
                                        manometrHJ = math.min(manometrHJ + math.sqrt(prekmit-manometrHJ)*cas*10,prekmit)
                                    else
                                        manometrHJ = math.max(manometrHJ - math.sqrt(manometrHJ-prekmit)*cas*10,prekmit)
                                    end
                                    if (manometrHJ >= prekmit) then
                                        prekmitManometrHJ = false
                                        podkmitManometrHJ = true
                                    end
                                else
                                    if (manometrHJ < podkmit) then
                                        manometrHJ = math.min(manometrHJ + math.sqrt(podkmit-manometrHJ)*cas*10,podkmit)
                                    else
                                        manometrHJ = math.max(manometrHJ - math.sqrt(manometrHJ-podkmit)*cas*10,podkmit)
                                    end
                                    if (manometrHJ <= podkmit) then
                                        prekmitManometrHJ = true
                                        podkmitManometrHJ = false
                                    end
                                end
                            else
                                prekmitManometrHJ = false
                                podkmitManometrHJ = false
                            end
                            Call("SetControlValue", "ManometrHJ", 0, manometrHJ)

                        ----------------------------------------Ostatni vzduchotechnika---------------------------
                            VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
                            Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR-(((VirtualMainReservoirPressureBAR/500)^2)*5*cas))
                            PantoJimkaZKom = PantoJimkaZKom-(((PantoJimkaZKom/790)^2)*10*cas)
                            prepinaceTlak = prepinaceTlak-(((prepinaceTlak/600)^2)*10*cas)
                            dvereTlak = dvereTlak-(((dvereTlak/400)^2)*10*cas)

                            if VirtualMainReservoirPressureBAR > horniMezKompresoru then
                                autoKompresor = false
                            elseif VirtualMainReservoirPressureBAR < dolniMezKompresoru then
                                autoKompresor = true
                            end
                            if baterie == 1 then
                                if pomkomp == 1 and Call("GetControlValue","PantoJimka",0) <= 4 and not pojistak then
                                    PantoJimkaZKom=PantoJimkaZKom+0.1*cas
                                end
                            end
                            if pocetMG > 0 then
                                if hlkomp == -1 and bylpojistovak ~= 1 then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+(0.0725*cas*pocetMG/pocetJimek))
                                elseif hlkomp == 1 and bylpojistovak ~= 1 and autoKompresor then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+(0.0725*pocetMG*cas/pocetJimek))
                                end
                            end
                            if Call("GetControlValue","PantoJimka",0) > 4 then
                                Call("SetControlValue","pojistak",0,1)
                                pojistak = true
                            else
                                Call("SetControlValue","pojistak",0,0)
                                pojistak = false
                            end
                            VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
                            if VirtualMainReservoirPressureBAR > 10.5 then
                                bylpojistovak = 1
                            end
                            if bylpojistovak == 1 then
                                if VirtualMainReservoirPressureBAR >= horniMezKompresoru - 0.5 then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)-1*cas)
                                else
                                    bylpojistovak = 0
                                end
                            end
                            if pojistak then
                                Call("SetControlValue","PantoJimka",0,math.max(PantoJimkaZKom,PantoJimkaZHJ)-0.00125)
                            end

                            if odkalovaniJimek then
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)-0.2*cas)
                            end

                            if baterie == 1 and vnitrniSit220V == 1 and PC == 3.75 and (hlkomp == -1 or (hlkomp == 1 and autoKompresor)) then
                                Call("SetControlValue","kompresor_zvk",0,1)
                                casKompresor = math.max(math.min(casKompresor + cas,1),0)
                            else
                                casKompresor = -1
                                Call("SetControlValue","kompresor_zvk",0,0)
                            end
                            Call("SetControlValue","kompom_zvk",0,math.min(math.abs(pomkomp),baterie))
                            Call("SetControlValue","pojistovak",0,bylpojistovak)
                            PantoJimkaZHJ=math.min(Call("GetControlValue","VirtualMainReservoirPressureBAR",0),3.11)
                            Call("SetControlValue","PantoJimka",0,math.max(PantoJimkaZKom,PantoJimkaZHJ))
                            PantoJimkaZKom = Call("GetControlValue","PantoJimka",0)
                            Call("SetControlValue","SberaceJimka",0,math.max(PantoJimkaZHJ,PantoJimkaZKom))
                            if PP > 0 then
                                sberac1TlakPozadovany = math.min(Call("GetControlValue","SberaceJimka",0),5)
                            else
                                sberac1TlakPozadovany = 0
                            end
                            if ZP > 0 then
                                sberac2TlakPozadovany = math.min(Call("GetControlValue","SberaceJimka",0),5)
                            else
                                sberac2TlakPozadovany = 0
                            end
                            sberac1Tlak = Call("GetControlValue","Sberac1Tlak",0)
                            sberac2Tlak = Call("GetControlValue","Sberac2Tlak",0)
                            if sberac1Tlak < sberac1TlakPozadovany then
                                Call("SetControlValue","Sberac1Tlak",0,sberac1Tlak+0.05)
                            elseif sberac1Tlak > sberac1TlakPozadovany then
                                Call("SetControlValue","Sberac1Tlak",0,sberac1Tlak-0.05)
                            end
                            if sberac2Tlak < sberac2TlakPozadovany then
                                Call("SetControlValue","Sberac2Tlak",0,sberac2Tlak+0.05)
                            elseif sberac2Tlak > sberac2TlakPozadovany then
                                Call("SetControlValue","Sberac2Tlak",0,sberac2Tlak-0.05)
                            end
                            Call("SetControlValue","DvereTlak",0,math.max(math.min(VirtualMainReservoirPressureBAR,7),dvereTlak))
                            dvereTlak = Call("GetControlValue","DvereTlak",0)
                            Call("SetControlValue","PrepinaceTlak",0,math.max(math.min(VirtualMainReservoirPressureBAR,5),prepinaceTlak))
                            prepinaceTlak = Call("GetControlValue","PrepinaceTlak",0)

                        ----------------------------------------Ovladani HV---------------------------------------
                            PolohaKlice = Call ("GetControlValue", "VirtualStartup", 0)
                            povel_VlastniObaCizi = Call("GetControlValue","povel_VlastniObaCizi",0)
                            if PolohaKlice == 0.25 then klic = 1 end
                            if (PolohaKlice < 0.5 or baterie ~= 1) and RizenaRidici == "ridici" then
                                Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
                            elseif PolohaKlice > 0.5 and baterie == 1 and RizenaRidici == "ridici" then
                                Call ( "SetControlValue", "povel_HlavniVypinac", 0, 1)
                            end

                            if baterie ~= 1 or Call("GetControlValue", "povel_HlavniVypinac", 0) == 0 then
                                Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                            elseif ZamekHLvyp == 0 and baterie == 1 and Call("GetControlValue", "povel_HlavniVypinac", 0) == 1 and (hlavniVypinac == 1 or mgPrip == 0) and ((RizenaRidici == "ridici" and povel_VlastniObaCizi < 1.5) or (RizenaRidici == "rizena" and povel_VlastniObaCizi > 0.5)) then
                                Call ( "SetControlValue", "HlavniVypinac", 0, 1)
                            end

                            -- if klic == 1 and PolohaKlice < 0.75 and PolohaKlice > 0.5 and Call("GetControlValue","DrziKlicek",0) == 0 then
                            -- 	Call("SetControlValue","VirtualStartup",0,0.75)
                            -- end
                            -- if klic == 1 and PolohaKlice < 0.5 and PolohaKlice > 0.25 and Call("GetControlValue","DrziKlicek",0) == 0 then
                            -- 	Call("SetControlValue","VirtualStartup",0,0.25)
                            -- end

                            if RizenaRidici == "ridici" and PolohaKlice < 0.5 and math.max(diagPU,skluzDiag,niDiag,diagDOTO,diagMG) == 0 and not nutnyRestartDSO then
                                ZamekHLvyp = 0
                            elseif Call("GetControlValue", "povel_HlavniVypinac", 0) == 0 and math.max(diagPU,skluzDiag,niDiag,diagDOTO,diagMG) == 0 and RizenaRidici == "rizena" and not nutnyRestartDSO then
                                ZamekHLvyp = 0
                            end
                        ----------------------------------------Cvakani HASLERa-----------------------------------
                            casHasler = casHasler + cas
                            if rychlostKolaKMHPodvozek1 >= 0.1 then
                                sumHasler = sumHasler + rychlostKolaKMHPodvozek1
                                pocetHaslerUpdate = pocetHaslerUpdate + 1
                                if casHasler >= 0.8 then
                                    Call("SetControlValue","HaslerRucka",0,sumHasler/pocetHaslerUpdate)
                                    pocetHaslerUpdate = 0
                                    casHasler = 0
                                    sumHasler = 0
                                end
                            elseif rychlostKolaKMHPodvozek1 < 0.1 then
                                casHasler = 0
                                sumHasler = 0
                                pocetHaslerUpdate = 0
                                Call("SetControlValue","HaslerRucka",0,0)
                            end
                            if rychlostKolaKMHPodvozek1 <= 1 then
                                if zvukhasler ~= 1 then
                                    Call("SetControlValue","ZvukHasler",0,1)
                                    zvukhasler = 1
                                end
                            elseif zvukhasler ~= 2 then
                                Call("SetControlValue","ZvukHasler",0,2)
                                zvukhasler = 2
                            end
                        ----------------------------------------TRAMEX--------------------------------------------
                            if modelConfig[scriptVersion].tramex then
                                tramexCasSipicka = tramexCasSipicka + cas
                                --------TLACITKA
                                    local tramex0 = false
                                    local tramex1 = false
                                    local tramex2 = false
                                    local tramex3 = false
                                    local tramex4 = false
                                    local tramex5 = false
                                    local tramex6 = false
                                    local tramex7 = false
                                    local tramex8 = false
                                    local tramex9 = false
                                    local tramexKPJ = false
                                    local tramexCas = false
                                    local tramexKM = false
                                    local tramexErr = false
                                    local tramexMenu = false
                                    local tramexEnt = false
                                    local tramexRet = false
                                    local tramexDoleva = false
                                    local tramexDoprava = false
                                    --0
                                        if Call("GetControlValue", "Tramex0", 0) > 0.5 and not tramexLast0 then
                                            tramex0 = true
                                            tramexLast0 = true
                                        elseif Call("GetControlValue", "Tramex0", 0) < 0.5 then
                                            tramexLast0 = false
                                        end
                                    --1
                                        if Call("GetControlValue", "Tramex1", 0) > 0.5 and not tramexLast1 then
                                            tramex1 = true
                                            tramexLast1 = true
                                        elseif Call("GetControlValue", "Tramex1", 0) < 0.5 then
                                            tramexLast1 = false
                                        end
                                    --2
                                        if Call("GetControlValue", "Tramex2", 0) > 0.5 and not tramexLast2 then
                                            tramex2 = true
                                            tramexLast2 = true
                                        elseif Call("GetControlValue", "Tramex2", 0) < 0.5 then
                                            tramexLast2 = false
                                        end
                                    --3
                                        if Call("GetControlValue", "Tramex3", 0) > 0.5 and not tramexLast3 then
                                            tramex3 = true
                                            tramexLast3 = true
                                        elseif Call("GetControlValue", "Tramex3", 0) < 0.5 then
                                            tramexLast3 = false
                                        end
                                    --4
                                        if Call("GetControlValue", "Tramex4", 0) > 0.5 and not tramexLast4 then
                                            tramex4 = true
                                            tramexLast4 = true
                                        elseif Call("GetControlValue", "Tramex4", 0) < 0.5 then
                                            tramexLast4 = false
                                        end
                                    --5
                                        if Call("GetControlValue", "Tramex5", 0) > 0.5 and not tramexLast5 then
                                            tramex5 = true
                                            tramexLast5 = true
                                        elseif Call("GetControlValue", "Tramex5", 0) < 0.5 then
                                            tramexLast5 = false
                                        end
                                    --6
                                        if Call("GetControlValue", "Tramex6", 0) > 0.5 and not tramexLast6 then
                                            tramex6 = true
                                            tramexLast6 = true
                                        elseif Call("GetControlValue", "Tramex6", 0) < 0.5 then
                                            tramexLast6 = false
                                        end
                                    --7
                                        if Call("GetControlValue", "Tramex7", 0) > 0.5 and not tramexLast7 then
                                            tramex7 = true
                                            tramexLast7 = true
                                        elseif Call("GetControlValue", "Tramex7", 0) < 0.5 then
                                            tramexLast7 = false
                                        end
                                    --8
                                        if Call("GetControlValue", "Tramex8", 0) > 0.5 and not tramexLast8 then
                                            tramex8 = true
                                            tramexLast8 = true
                                        elseif Call("GetControlValue", "Tramex8", 0) < 0.5 then
                                            tramexLast8 = false
                                        end
                                    --9
                                        if Call("GetControlValue", "Tramex9", 0) > 0.5 and not tramexLast9 then
                                            tramex9 = true
                                            tramexLast9 = true
                                        elseif Call("GetControlValue", "Tramex9", 0) < 0.5 then
                                            tramexLast9 = false
                                        end
                                    --KPJ
                                        if Call("GetControlValue", "TramexKPJ", 0) > 0.5 and not tramexLastKPJ then
                                            tramexKPJ = true
                                            tramexLastKPJ = true
                                        elseif Call("GetControlValue", "TramexKPJ", 0) < 0.5 then
                                            tramexLastKPJ = false
                                        end
                                    --Cas
                                        if Call("GetControlValue", "TramexCas", 0) > 0.5 and not tramexLastCas then
                                            tramexCas = true
                                            tramexLastCas = true
                                        elseif Call("GetControlValue", "TramexCas", 0) < 0.5 then
                                            tramexLastCas = false
                                        end
                                    --Draha
                                        if Call("GetControlValue", "TramexKM", 0) > 0.5 and not tramexLastKM then
                                            tramexKM = true
                                            tramexLastKM = true
                                        elseif Call("GetControlValue", "TramexKM", 0) < 0.5 then
                                            tramexLastKM = false
                                        end
                                    --Error
                                        if Call("GetControlValue", "TramexVykricnik", 0) > 0.5 and not tramexLastErr then
                                            tramexErr = true
                                            tramexLastErr = true
                                        elseif Call("GetControlValue", "TramexVykricnik", 0) < 0.5 then
                                            tramexLastErr = false
                                        end
                                    --Menu
                                        if Call("GetControlValue", "TramexMenu", 0) > 0.5 and not tramexLastMenu then
                                            tramexMenu = true
                                            tramexLastMenu = true
                                        elseif Call("GetControlValue", "TramexMenu", 0) < 0.5 then
                                            tramexLastMenu = false
                                        end
                                    --Enter
                                        if Call("GetControlValue", "TramexEnter", 0) > 0.5 and not tramexLastEnt then
                                            tramexEnt = true
                                            tramexLastEnt = true
                                        elseif Call("GetControlValue", "TramexEnter", 0) < 0.5 then
                                            tramexLastEnt = false
                                        end
                                    --Return
                                        if Call("GetControlValue", "TramexReturn", 0) > 0.5 and not tramexLastRet then
                                            tramexRet = true
                                            tramexLastRet = true
                                        elseif Call("GetControlValue", "TramexReturn", 0) < 0.5 then
                                            tramexLastRet = false
                                        end
                                    --Doleva
                                        if Call("GetControlValue", "TramexVlevo", 0) > 0.5 and not tramexLastDoleva then
                                            tramexDoleva = true
                                            tramexLastDoleva = true
                                        elseif Call("GetControlValue", "TramexVlevo", 0) < 0.5 then
                                            tramexLastDoleva = false
                                        end
                                    --Doprava
                                        if Call("GetControlValue", "TramexVpravo", 0) > 0.5 and not tramexLastDoprava then
                                            tramexDoprava = true
                                            tramexLastDoprava = true
                                        elseif Call("GetControlValue", "TramexVpravo", 0) < 0.5 then
                                            tramexLastDoprava = false
                                        end
                                    buttonsCount = ToBolAndBack(tramexLast0)
                                        + ToBolAndBack(tramexLast1)
                                        + ToBolAndBack(tramexLast2)
                                        + ToBolAndBack(tramexLast3)
                                        + ToBolAndBack(tramexLast4)
                                        + ToBolAndBack(tramexLast5)
                                        + ToBolAndBack(tramexLast6)
                                        + ToBolAndBack(tramexLast7)
                                        + ToBolAndBack(tramexLast8)
                                        + ToBolAndBack(tramexLast9)
                                        + ToBolAndBack(tramexLastKPJ)
                                        + ToBolAndBack(tramexLastCas)
                                        + ToBolAndBack(tramexLastKM)
                                        + ToBolAndBack(tramexLastErr)
                                        + ToBolAndBack(tramexLastMenu)
                                        + ToBolAndBack(tramexLastEnt)
                                        + ToBolAndBack(tramexLastRet)
                                        + ToBolAndBack(tramexLastDoleva)
                                        + ToBolAndBack(tramexLastDoprava)
                                    Call("SoundPrep:SetParameter", "TramexButtonsCount", buttonsCount)
                                    if baterie == 1 and RizenaRidici == "ridici" then
                                        Call("SoundPrep:SetParameter", "TramexButtonsCountPip", buttonsCount)
                                    else
                                        Call("SoundPrep:SetParameter", "TramexButtonsCountNotPip", buttonsCount)
                                    end
                                if baterie == 1 and RizenaRidici == "ridici" then
                                    local tramexCilova = math.floor(rychlostKolaKMHPodvozek1*4)/4
                                    --------INICIALIZACE RYCHLOMERU PO ZTRATE NAPAJENI
                                        if not tramexInit then
                                            if not nulovyDoraz then
                                                tramexCilova = 0
                                                if Call("GetControlValue","TramexRucka",0) == 0 then
                                                    nulovyDoraz = true
                                                end
                                            elseif not maximalniDoraz then
                                                tramexCilova = 142
                                            end
                                        end
                                        if not tramexInit and nulovyDoraz and Call("GetControlValue","TramexRucka",0) > 141 then
                                            maximalniDoraz = true
                                            tramexCilova = math.floor(rychlostKolaKMHPodvozek1*4)/4
                                        end
                                        if maximalniDoraz and Call("GetControlValue","TramexRucka",0) == tramexCilova and not tramexInit then
                                            tramexInit = true
                                            tramexStav = TRAMEX_CAS
                                        end
                                    --------KROKOVY MOTOREK RUCICKY
                                        if tramexCilova - Call("GetControlValue","TramexRucka",0) > 90*cas then
                                            Call("SetControlValue","TramexRucka",0,Call("GetControlValue","TramexRucka",0)+90*cas)
                                        elseif tramexCilova - Call("GetControlValue","TramexRucka",0) < -90*cas then
                                            Call("SetControlValue","TramexRucka",0,Call("GetControlValue","TramexRucka",0)-90*cas)
                                        else
                                            Call("SetControlValue","TramexRucka",0,tramexCilova)
                                        end
                                    --------RYCHLOST - SIPICKY A MALY DISP + OSVETLENI
                                        if not tramexInit then
                                            tramexCasSipicka = 0
                                            tramexSipickaDole = true
                                            tramexSipickaHore = true
                                            Call("TramexRych:SetText", "888", 0)
                                            Call("SetControlValue", "TramexOsvetleni", 0, 2)
                                            Call("TramexCom:SetText", "Prob~h`Xselftest", 0)
                                        else
                                            local tramexSpeed = "0"
                                            if rychlostKolaKMHPodvozek1 - math.floor(rychlostKolaKMHPodvozek1) > 0.5 then
                                                tramexSpeed = ""..math.ceil(rychlostKolaKMHPodvozek1)
                                            else
                                                tramexSpeed = ""..math.floor(rychlostKolaKMHPodvozek1)
                                            end
                                            while string.len(tramexSpeed) < 3 do
                                                tramexSpeed = "X"..tramexSpeed
                                            end
                                            if tramexCasSipicka > 1 then
                                                tramexCasSipicka = 0
                                                Call("TramexRych:SetText", tramexSpeed, 0)
                                                if lastTramex - math.floor(rychlostKolaKMHPodvozek1*2)/2 > 0.4 then
                                                    lastTramex = math.floor(rychlostKolaKMHPodvozek1*2)/2
                                                    tramexSipickaDole = true
                                                    tramexSipickaHore = false
                                                elseif lastTramex - math.floor(rychlostKolaKMHPodvozek1*2)/2 < -0.4 then
                                                    lastTramex = math.floor(rychlostKolaKMHPodvozek1*2)/2
                                                    tramexSipickaHore = true
                                                    tramexSipickaDole = false
                                                end
                                            end
                                            if KabinaPrist == 2 then
                                                Call("SetControlValue", "TramexOsvetleni", 0, 2)
                                            else
                                                Call("SetControlValue", "TramexOsvetleni", 0, 1)
                                            end
                                        end
                                    --------VELKY DISPLEJ
                                        --specialni znaky:
                                            --	`	á
                                            --	;	é
                                            -- 	~	í
                                            --	@	ó
                                            -- 	#	ú
                                            --	$	č
                                            -- 	^	ě
                                            -- 	&	ž
                                        if tramexStav == TRAMEX_CAS then
                                            if hh < 10 then hh = "0"..tostring(hh) end
                                            if mm < 10 then mm = "0"..tostring(mm) end
                                            if ss < 10 then ss = "0"..tostring(ss) end
                                            Call("TramexCom:SetText", "Cas:XXXX"..hh..":"..mm..":"..ss, 0)
                                            if tramexCas then
                                                tramexStav = TRAMEX_DATUM
                                                tramexCas = false
                                            end
                                            if tramexKM then
                                                tramexStav = TRAMEX_DRAHA
                                                tramexKM = false
                                            end
                                        elseif tramexStav == TRAMEX_DATUM then
                                            Call("TramexCom:SetText", "Datum:XX"..os.date("%d.%m.%y"), 0)
                                            if tramexCas then
                                                tramexStav = TRAMEX_CAS
                                                tramexCas = false
                                            end
                                            if tramexKM then
                                                tramexStav = TRAMEX_DRAHA
                                                tramexKM = false
                                            end
                                        elseif tramexStav == TRAMEX_DRAHA then
                                            local drahaString = ""
                                            if tramexDrahaKm - math.floor(tramexDrahaKm) > 0.5 then
                                                drahaString = ""..math.ceil(tramexDrahaKm)
                                            else
                                                drahaString = ""..math.floor(tramexDrahaKm)
                                            end
                                            if string.len(drahaString) > 8 then
                                                drahaString = "99999999"
                                            end
                                            while string.len(drahaString) < 8 do
                                                drahaString = "X"..drahaString
                                            end
                                            drahaString = "Dr`ha:"..drahaString.."km"
                                            Call("TramexCom:SetText", drahaString, 0)
                                            if tramexCas then
                                                tramexStav = TRAMEX_CAS
                                                tramexCas = false
                                            end
                                            if tramexKM then
                                                tramexStav = TRAMEX_RELDRAHA
                                                tramexKM = false
                                            end
                                        elseif tramexStav == TRAMEX_RELDRAHA then
                                            local drahaString = ""
                                            if tramexRelDrahaKm - math.floor(tramexRelDrahaKm) > 0.5 then
                                                drahaString = ""..math.ceil(tramexRelDrahaKm)
                                            else
                                                drahaString = ""..math.floor(tramexRelDrahaKm)
                                            end
                                            if string.len(drahaString) > 4 then
                                                drahaString = "9999"
                                            end
                                            while string.len(drahaString) < 4 do
                                                drahaString = "X"..drahaString
                                            end
                                            drahaString = "Rel.dr`ha:"..drahaString.."km"
                                            Call("TramexCom:SetText", drahaString, 0)
                                            if tramexCas then
                                                tramexStav = TRAMEX_CAS
                                                tramexCas = false
                                            end
                                            if tramexKM then
                                                tramexStav = TRAMEX_DRAHA
                                                tramexKM = false
                                            end
                                        elseif tramexStav == TRAMEX_NELZESPUSTIT then
                                            Call("TramexCom:SetText", "NelzeXspustit!XX", 0)
                                        elseif tramexStav == TRAMEX_ZAJIZDY_NELZE then
                                            Call("TramexCom:SetText", "ZaXj~zdyXnelze!X", 0)
                                        elseif tramexStav == TRAMEX_HLAVNIMENU then
                                            Call("TramexCom:SetText", "Hlavn~XmenuXXXXX", 0)
                                        elseif tramexStav == TRAMEX_HM_ZADVOL then
                                            Call("TramexCom:SetText", "Zad`n~-voln;XXXX", 0)
                                        elseif tramexStav == TRAMEX_HM_ZADZAKL then
                                            Call("TramexCom:SetText", "Zad`n~-z`kladn~X", 0)
                                        elseif tramexStav == TRAMEX_HM_ZADCHRAN then
                                            Call("TramexCom:SetText", "Zad`n~-chr`n^n;X", 0)
                                        elseif tramexStav == TRAMEX_HM_ZAKLUD then
                                            Call("TramexCom:SetText", "Z`kladn~X#dajeXX", 0)
                                        elseif tramexStav == TRAMEX_HM_STATVOL then
                                            Call("TramexCom:SetText", "Stat.-voln;XXXXX", 0)
                                        elseif tramexStav == TRAMEX_HM_STATCHRA then
                                            Call("TramexCom:SetText", "Stat.-chr`n^n;XX", 0)
                                        elseif tramexStav == TRAMEX_HM_DIAG then
                                            Call("TramexCom:SetText", "DiagnostikaXXXXX", 0)
                                        elseif tramexStav == TRAMEX_HM_SERVIS then
                                            Call("TramexCom:SetText", "ServisXXXXXXXXXX", 0)
                                        elseif tramexStav == TRAMEX_ZV_STROJVED or tramexStav == TRAMEX_SV_STROJVED then
                                            local text = ""..tramexStrojvedouci
                                            while string.len(text) < 4 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "Strojved.:XX"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_SLUZ or tramexStav == TRAMEX_SV_SLUZ then
                                            local text = ""..tramexSluzebna
                                            while string.len(text) < 6 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "Slu&ebna:X"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_STAN or tramexStav == TRAMEX_SV_STAN then
                                            local text = ""..tramexStanice
                                            while string.len(text) < 6 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "Stanice:XX"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_CVLAKU or tramexStav == TRAMEX_SV_CVLAKU then
                                            local text = ""..tramexCisloVlaku
                                            while string.len(text) < 6 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "C.vlaku:XX"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_HMOTNOST or tramexStav == TRAMEX_SV_HMOTNOST then
                                            local text = tramexHmotnost.."t"
                                            while string.len(text) < 5 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "Hmotnost:XX"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_NAPRAV or tramexStav == TRAMEX_SV_NAPRAV then
                                            local text = ""..tramexNaprav
                                            while string.len(text) < 4 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "N`prav:XXXXX"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_BRZDREZ or tramexStav == TRAMEX_SV_BRZDREZ then
                                            local text = ""
                                            if tramexRezimBrzdeni == TRAMEX_G then
                                                text = "XXXG%"
                                            elseif tramexRezimBrzdeni == TRAMEX_P then
                                                text = "XXXP%"
                                            elseif tramexRezimBrzdeni == TRAMEX_R then
                                                text = "XXXR%"
                                            elseif tramexRezimBrzdeni == TRAMEX_RMG then
                                                text = "R+Mg%"
                                            else
                                                text = "XErr%"
                                            end
                                            Call("TramexCom:SetText", "Brzd.re&im:"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_BRZDPROC or tramexStav == TRAMEX_SV_BRZDPROC then
                                            local text = tramexBrzdiciProc.."%"
                                            while string.len(text) < 5 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "Brzd~c~X%:X"..text, 0)
                                        elseif tramexStav == TRAMEX_ZV_KODZEME or tramexStav == TRAMEX_SV_KODZEME then
                                            local text = ""..tramexKodZeme
                                            while string.len(text) < 4 do
                                                if not tramexUpravenePolicko then
                                                    text = "0"..text
                                                else
                                                    text = "-"..text
                                                end
                                            end
                                            Call("TramexCom:SetText", "K@dXzem^:XXX"..text, 0)
                                        elseif tramexStav == TRAMEX_HESLO then
                                            local text = ""..tramexHeslo
                                            while string.len(text) < 4 do
                                                text = "X"..text
                                            end
                                            Call("TramexCom:SetText", "Heslo:XXXXXX"..text, 0)
                                        elseif tramexStav == TRAMEX_ZU_RYCH then
                                            local tramexSpeed = "0"
                                            if rychlostKolaKMHPodvozek1 - math.floor(rychlostKolaKMHPodvozek1) > 0.5 then
                                                tramexSpeed = ""..math.ceil(rychlostKolaKMHPodvozek1)
                                            else
                                                tramexSpeed = ""..math.floor(rychlostKolaKMHPodvozek1)
                                            end
                                            while string.len(tramexSpeed) < 3 do
                                                tramexSpeed = "X"..tramexSpeed
                                            end
                                            tramexSpeed = tramexSpeed.."km/h"
                                            Call("TramexCom:SetText", "rychlost:"..tramexSpeed, 0)
                                        elseif tramexStav == TRAMEX_ZU_CAS then
                                            if hh < 10 then hh = "0"..tostring(hh) end
                                            if mm < 10 then mm = "0"..tostring(mm) end
                                            if ss < 10 then ss = "0"..tostring(ss) end
                                            Call("TramexCom:SetText", "Cas:XXXX"..hh..":"..mm..":"..ss, 0)
                                        elseif tramexStav == TRAMEX_ZU_DATUM then
                                            Call("TramexCom:SetText", "Datum:XX"..os.date("%d.%m.%y"), 0)
                                        elseif tramexStav == TRAMEX_ZU_DRAHA then
                                            local drahaString = ""
                                            if tramexDrahaKm - math.floor(tramexDrahaKm) > 0.5 then
                                                drahaString = ""..math.ceil(tramexDrahaKm)
                                            else
                                                drahaString = ""..math.floor(tramexDrahaKm)
                                            end
                                            if string.len(drahaString) > 8 then
                                                drahaString = "99999999"
                                            end
                                            while string.len(drahaString) < 8 do
                                                drahaString = "X"..drahaString
                                            end
                                            drahaString = "Dr`ha:"..drahaString.."km"
                                            Call("TramexCom:SetText", drahaString, 0)
                                        elseif tramexStav == TRAMEX_ZU_RELDR then
                                            local drahaString = ""
                                            if tramexRelDrahaKm - math.floor(tramexRelDrahaKm) > 0.5 then
                                                drahaString = ""..math.ceil(tramexRelDrahaKm)
                                            else
                                                drahaString = ""..math.floor(tramexRelDrahaKm)
                                            end
                                            if string.len(drahaString) > 4 then
                                                drahaString = "9999"
                                            end
                                            while string.len(drahaString) < 4 do
                                                drahaString = "X"..drahaString
                                            end
                                            drahaString = "Rel.dr`ha:"..drahaString.."km"
                                            Call("TramexCom:SetText", drahaString, 0)
                                        elseif tramexStav == TRAMEX_ZU_ZMENACAS then
                                            Call("TramexCom:SetText", "Zm^naX$asuXXXXXX", 0)
                                        elseif tramexStav == TRAMEX_ZU_ZMENACAS_STAV then
                                            Call("TramexCom:SetText", "Neaktivov`naXXXX", 0)
                                        elseif tramexStav == TRAMEX_CHYBNEHESLO then
                                            Call("TramexCom:SetText", "Chybn;Xheslo!XXX", 0)
                                        elseif tramexStav == TRAMEX_POMALAJIZDA then
                                            Call("TramexCom:SetText", "Pomal`Xj~zdaXXXX", 0)
                                        elseif tramexStav == TRAMEX_PJIZDA then
                                            if hh < 10 then hh = "0"..tostring(hh) end
                                            if mm < 10 then mm = "0"..tostring(mm) end
                                            if ss < 10 then ss = "0"..tostring(ss) end
                                            Call("TramexCom:SetText", "P.j~zdaX"..hh..":"..mm..":"..ss, 0)
                                        elseif tramexStav == TRAMEX_DATA_ULOZENA then
                                            Call("TramexCom:SetText", "DataXulo&ena!XXX", 0)
                                        end
                                    --------LOGIKA RYCHLOMERU
                                        if tramexKPJ then
                                            if tramexPomalaJizdaMetry == -1 then
                                                if rychlostKolaKMHPodvozek1 > 1 and tramexNaprav ~= "" then
                                                    tramexPomalaJizdaMetry = tramexNaprav * 6
                                                    if tramexStav == TRAMEX_CAS or tramexStav == TRAMEX_DATUM or tramexStav == TRAMEX_DRAHA or tramexStav == TRAMEX_RELDRAHA then
                                                        tramexStavPredKPJ = tramexStav
                                                    else
                                                        tramexStavPredKPJ = TRAMEX_CAS
                                                    end
                                                    tramexStavPred3sec = TRAMEX_PJIZDA
                                                    tramexStav = TRAMEX_POMALAJIZDA
                                                    tramex3secZobrazeni = 3
                                                else
                                                    if (tramexStav == TRAMEX_CAS or tramexStav == TRAMEX_DATUM or tramexStav == TRAMEX_DRAHA or tramexStav == TRAMEX_RELDRAHA) and tramex3secZobrazeni == -1 then
                                                        tramexStavPred3sec = tramexStav
                                                    elseif tramex3secZobrazeni == -1 then
                                                        tramexStavPred3sec = TRAMEX_CAS
                                                    end
                                                    tramexStav = TRAMEX_NELZESPUSTIT
                                                    tramex3secZobrazeni = 3
                                                end
                                            else
                                                tramexPomalaJizdaMetry = -1
                                                tramexStav = tramexStavPredKPJ
                                                tramex3secZobrazeni = -1
                                            end
                                        end
                                        if tramex3secZobrazeni > 0 then
                                            tramex3secZobrazeni = math.max(tramex3secZobrazeni - cas, 0)
                                        elseif tramex3secZobrazeni > -1 then
                                            tramex3secZobrazeni = -1
                                            tramexStav = tramexStavPred3sec
                                        end
                                        if tramexPomalaJizdaMetry > 0 then
                                            tramexPomalaJizdaMetry = math.max(tramexPomalaJizdaMetry - rychlostKolaPodvozek1 * casHry, 0)
                                            Call("SoundHasler:SetParameter", "TramexPipi", 0)
                                        elseif tramexPomalaJizdaMetry > -1 then
                                            tramexPomalaJizdaMetry = -1
                                            tramexStav = tramexStavPredKPJ
                                            tramex3secZobrazeni = -1
                                            Call("SoundHasler:SetParameter", "TramexPipi", 1)
                                        end
                                        if tramexStav == TRAMEX_CAS or tramexStav == TRAMEX_DATUM or tramexStav == TRAMEX_DRAHA or tramexStav == TRAMEX_RELDRAHA then --zakladni zobrazeni
                                            if tramexMenu then
                                                tramexStavPredMenu = tramexStav
                                                tramexStavPred3sec = TRAMEX_HM_ZADVOL
                                                tramexStav = TRAMEX_HLAVNIMENU
                                                tramex3secZobrazeni = 3
                                            end
                                            tramexZadavani = false
                                        end
                                        if tramexStav == TRAMEX_HM_ZADVOL or tramexStav == TRAMEX_HM_ZADZAKL or tramexStav == TRAMEX_HM_ZADCHRAN or tramexStav == TRAMEX_HM_ZAKLUD or tramexStav == TRAMEX_HM_STATVOL or tramexStav == TRAMEX_HM_STATCHRA then
                                            tramexZadavani = false
                                            if rychlostKolaKMHPodvozek1 > 0.2 and tramexEnt then
                                                tramexStavPred3sec = tramexStav
                                                tramexStav = TRAMEX_ZAJIZDY_NELZE
                                                tramex3secZobrazeni = 3
                                            elseif tramexEnt then
                                                if tramexStav == TRAMEX_HM_ZADVOL then
                                                    tramexStav = TRAMEX_ZV_STROJVED
                                                    tramexZadavani = true
                                                elseif tramexStav == TRAMEX_HM_ZADZAKL then
                                                    tramexStavPred3sec = tramexStav
                                                    tramexStav = TRAMEX_HESLO
                                                    tramexHeslo = ""
                                                    tramexZadavani = true
                                                elseif tramexStav == TRAMEX_HM_ZADCHRAN then
                                                    tramexStavPred3sec = tramexStav
                                                    tramexStav = TRAMEX_HESLO
                                                    tramexHeslo = ""
                                                    tramexZadavani = true
                                                elseif tramexStav == TRAMEX_HM_ZAKLUD then
                                                    tramexStav = TRAMEX_ZU_RYCH
                                                    tramexZadavani = true
                                                elseif tramexStav == TRAMEX_HM_STATVOL then
                                                    tramexStav = TRAMEX_SV_STROJVED
                                                elseif tramexStav == TRAMEX_HM_STATCHRA then
                                                    tramexStavPred3sec = tramexStav
                                                    tramexStav = TRAMEX_HESLO
                                                    tramexHeslo = ""
                                                end
                                            end
                                            if tramexDoleva then
                                                if tramexStav == TRAMEX_HM_ZADVOL then
                                                    tramexStav = TRAMEX_HM_SERVIS
                                                elseif tramexStav == TRAMEX_HM_ZADZAKL then
                                                    tramexStav = TRAMEX_HM_ZADVOL
                                                elseif tramexStav == TRAMEX_HM_ZADCHRAN then
                                                    tramexStav = TRAMEX_HM_ZADZAKL
                                                elseif tramexStav == TRAMEX_HM_ZAKLUD then
                                                    tramexStav = TRAMEX_HM_ZADCHRAN
                                                elseif tramexStav == TRAMEX_HM_STATVOL then
                                                    tramexStav = TRAMEX_HM_ZAKLUD
                                                elseif tramexStav == TRAMEX_HM_STATCHRA then
                                                    tramexStav = TRAMEX_HM_STATVOL
                                                end
                                            end
                                            if tramexDoprava then
                                                if tramexStav == TRAMEX_HM_ZADVOL then
                                                    tramexStav = TRAMEX_HM_ZADZAKL
                                                elseif tramexStav == TRAMEX_HM_ZADZAKL then
                                                    tramexStav = TRAMEX_HM_ZADCHRAN
                                                elseif tramexStav == TRAMEX_HM_ZADCHRAN then
                                                    tramexStav = TRAMEX_HM_ZAKLUD
                                                elseif tramexStav == TRAMEX_HM_ZAKLUD then
                                                    tramexStav = TRAMEX_HM_STATVOL
                                                elseif tramexStav == TRAMEX_HM_STATVOL then
                                                    tramexStav = TRAMEX_HM_STATCHRA
                                                elseif tramexStav == TRAMEX_HM_STATCHRA then
                                                    tramexStav = TRAMEX_HM_DIAG
                                                end
                                            end
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                            end
                                            if tramexRet then
                                                tramexStav = tramexStavPredMenu
                                            end
                                        elseif tramexStav == TRAMEX_HM_DIAG or tramexStav == TRAMEX_HM_SERVIS then
                                            if tramexEnt then
                                                if tramexStav == TRAMEX_HM_DIAG then
                                                    tramexStavPred3sec = tramexStav
                                                    tramexStav = TRAMEX_HESLO
                                                    tramexHeslo = ""
                                                elseif tramexStav == TRAMEX_HM_SERVIS then
                                                    tramexStavPred3sec = tramexStav
                                                    tramexStav = TRAMEX_HESLO
                                                    tramexHeslo = ""
                                                end
                                            end
                                            if tramexDoleva then
                                                if tramexStav == TRAMEX_HM_DIAG then
                                                    tramexStav = TRAMEX_HM_STATCHRA
                                                elseif tramexStav == TRAMEX_HM_SERVIS then
                                                    tramexStav = TRAMEX_HM_DIAG
                                                end
                                            end
                                            if tramexDoprava then
                                                if tramexStav == TRAMEX_HM_DIAG then
                                                    tramexStav = TRAMEX_HM_SERVIS
                                                elseif tramexStav == TRAMEX_HM_SERVIS then
                                                    tramexStav = TRAMEX_HM_ZADVOL
                                                end
                                            end
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_CAS
                                            end
                                        elseif tramexStav == TRAMEX_HESLO then
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and string.len(tramexHeslo) < 4 then
                                                tramexHeslo = tramexHeslo.."*"
                                            end
                                            if tramexRet then
                                                tramexHeslo = string.sub(tramexHeslo,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_CHYBNEHESLO
                                                tramex3secZobrazeni = 3
                                            end
                                        elseif tramexStav == TRAMEX_ZV_STROJVED then
                                            if not tramexOldContent then
                                                tramexOldContent = tramexStrojvedouci
                                                tramexUpravenePolicko = false
                                            end
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexStrojvedouci = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexStrojvedouci = ""
                                            end
                                            if string.len(tramexStrojvedouci) < 4 then
                                                if tramex0 and tramexStrojvedouci ~= "" then
                                                    tramexStrojvedouci = tramexStrojvedouci.."0"
                                                end
                                                if tramex1 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."1"
                                                end
                                                if tramex2 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."2"
                                                end
                                                if tramex3 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."3"
                                                end
                                                if tramex4 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."4"
                                                end
                                                if tramex5 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."5"
                                                end
                                                if tramex6 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."6"
                                                end
                                                if tramex7 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."7"
                                                end
                                                if tramex8 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."8"
                                                end
                                                if tramex9 then
                                                    tramexStrojvedouci = tramexStrojvedouci.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexStrojvedouci = string.sub(tramexStrojvedouci,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_SLUZ
                                                tramexOldContent = false
                                                tramexUpravenePolicko = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_SLUZ then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexSluzebna = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexSluzebna
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexSluzebna = ""
                                            end
                                            if string.len(tramexSluzebna) < 6 then
                                                if tramex0 and tramexSluzebna ~= "" then
                                                    tramexSluzebna = tramexSluzebna.."0"
                                                end
                                                if tramex1 then
                                                    tramexSluzebna = tramexSluzebna.."1"
                                                end
                                                if tramex2 then
                                                    tramexSluzebna = tramexSluzebna.."2"
                                                end
                                                if tramex3 then
                                                    tramexSluzebna = tramexSluzebna.."3"
                                                end
                                                if tramex4 then
                                                    tramexSluzebna = tramexSluzebna.."4"
                                                end
                                                if tramex5 then
                                                    tramexSluzebna = tramexSluzebna.."5"
                                                end
                                                if tramex6 then
                                                    tramexSluzebna = tramexSluzebna.."6"
                                                end
                                                if tramex7 then
                                                    tramexSluzebna = tramexSluzebna.."7"
                                                end
                                                if tramex8 then
                                                    tramexSluzebna = tramexSluzebna.."8"
                                                end
                                                if tramex9 then
                                                    tramexSluzebna = tramexSluzebna.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexSluzebna = string.sub(tramexSluzebna,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_STAN
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_STAN then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexStanice = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexStanice
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexStanice = ""
                                            end
                                            if string.len(tramexStanice) < 6 then
                                                if tramex0 and tramexStanice ~= "" then
                                                    tramexStanice = tramexStanice.."0"
                                                end
                                                if tramex1 then
                                                    tramexStanice = tramexStanice.."1"
                                                end
                                                if tramex2 then
                                                    tramexStanice = tramexStanice.."2"
                                                end
                                                if tramex3 then
                                                    tramexStanice = tramexStanice.."3"
                                                end
                                                if tramex4 then
                                                    tramexStanice = tramexStanice.."4"
                                                end
                                                if tramex5 then
                                                    tramexStanice = tramexStanice.."5"
                                                end
                                                if tramex6 then
                                                    tramexStanice = tramexStanice.."6"
                                                end
                                                if tramex7 then
                                                    tramexStanice = tramexStanice.."7"
                                                end
                                                if tramex8 then
                                                    tramexStanice = tramexStanice.."8"
                                                end
                                                if tramex9 then
                                                    tramexStanice = tramexStanice.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexStanice = string.sub(tramexStanice,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_CVLAKU
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_CVLAKU then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexCisloVlaku = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexCisloVlaku
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexCisloVlaku = ""
                                            end
                                            if string.len(tramexCisloVlaku) < 6 then
                                                if tramex0 and tramexCisloVlaku ~= "" then
                                                    tramexCisloVlaku = tramexCisloVlaku.."0"
                                                end
                                                if tramex1 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."1"
                                                end
                                                if tramex2 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."2"
                                                end
                                                if tramex3 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."3"
                                                end
                                                if tramex4 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."4"
                                                end
                                                if tramex5 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."5"
                                                end
                                                if tramex6 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."6"
                                                end
                                                if tramex7 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."7"
                                                end
                                                if tramex8 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."8"
                                                end
                                                if tramex9 then
                                                    tramexCisloVlaku = tramexCisloVlaku.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexCisloVlaku = string.sub(tramexCisloVlaku,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_HMOTNOST
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_HMOTNOST then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexHmotnost = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexHmotnost
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexHmotnost = ""
                                            end
                                            if string.len(tramexHmotnost) < 4 then
                                                if tramex0 and tramexHmotnost ~= "" then
                                                    tramexHmotnost = tramexHmotnost.."0"
                                                end
                                                if tramex1 then
                                                    tramexHmotnost = tramexHmotnost.."1"
                                                end
                                                if tramex2 then
                                                    tramexHmotnost = tramexHmotnost.."2"
                                                end
                                                if tramex3 then
                                                    tramexHmotnost = tramexHmotnost.."3"
                                                end
                                                if tramex4 then
                                                    tramexHmotnost = tramexHmotnost.."4"
                                                end
                                                if tramex5 then
                                                    tramexHmotnost = tramexHmotnost.."5"
                                                end
                                                if tramex6 then
                                                    tramexHmotnost = tramexHmotnost.."6"
                                                end
                                                if tramex7 then
                                                    tramexHmotnost = tramexHmotnost.."7"
                                                end
                                                if tramex8 then
                                                    tramexHmotnost = tramexHmotnost.."8"
                                                end
                                                if tramex9 then
                                                    tramexHmotnost = tramexHmotnost.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexHmotnost = string.sub(tramexHmotnost,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_NAPRAV
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_NAPRAV then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexNaprav = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexNaprav
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexNaprav = ""
                                            end
                                            if string.len(tramexNaprav) < 4 then
                                                if tramex0 and tramexNaprav ~= "" then
                                                    tramexNaprav = tramexNaprav.."0"
                                                end
                                                if tramex1 then
                                                    tramexNaprav = tramexNaprav.."1"
                                                end
                                                if tramex2 then
                                                    tramexNaprav = tramexNaprav.."2"
                                                end
                                                if tramex3 then
                                                    tramexNaprav = tramexNaprav.."3"
                                                end
                                                if tramex4 then
                                                    tramexNaprav = tramexNaprav.."4"
                                                end
                                                if tramex5 then
                                                    tramexNaprav = tramexNaprav.."5"
                                                end
                                                if tramex6 then
                                                    tramexNaprav = tramexNaprav.."6"
                                                end
                                                if tramex7 then
                                                    tramexNaprav = tramexNaprav.."7"
                                                end
                                                if tramex8 then
                                                    tramexNaprav = tramexNaprav.."8"
                                                end
                                                if tramex9 then
                                                    tramexNaprav = tramexNaprav.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexNaprav = string.sub(tramexNaprav,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_BRZDREZ
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_BRZDREZ then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexRezimBrzdeni = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexRezimBrzdeni
                                            end
                                            if tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9 then
                                                if tramexRezimBrzdeni == TRAMEX_G then
                                                    tramexRezimBrzdeni = TRAMEX_P
                                                elseif tramexRezimBrzdeni == TRAMEX_P then
                                                    tramexRezimBrzdeni = TRAMEX_R
                                                elseif tramexRezimBrzdeni == TRAMEX_R then
                                                    tramexRezimBrzdeni = TRAMEX_RMG
                                                elseif tramexRezimBrzdeni == TRAMEX_RMG then
                                                    tramexRezimBrzdeni = TRAMEX_G
                                                end
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_BRZDPROC
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_BRZDPROC then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexBrzdiciProc = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent  then
                                                tramexOldContent = tramexBrzdiciProc
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexBrzdiciProc = ""
                                            end
                                            if string.len(tramexBrzdiciProc) < 4 then
                                                if tramex0 and tramexBrzdiciProc ~= "" then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."0"
                                                end
                                                if tramex1 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."1"
                                                end
                                                if tramex2 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."2"
                                                end
                                                if tramex3 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."3"
                                                end
                                                if tramex4 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."4"
                                                end
                                                if tramex5 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."5"
                                                end
                                                if tramex6 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."6"
                                                end
                                                if tramex7 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."7"
                                                end
                                                if tramex8 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."8"
                                                end
                                                if tramex9 then
                                                    tramexBrzdiciProc = tramexBrzdiciProc.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexBrzdiciProc = string.sub(tramexBrzdiciProc,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_KODZEME
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_ZV_KODZEME then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZADVOL
                                                tramexKodZeme = tramexOldContent
                                                tramexOldContent = false
                                            end
                                            if not tramexOldContent then
                                                tramexOldContent = tramexKodZeme
                                                tramexUpravenePolicko = false
                                            end
                                            if (tramex0 or tramex1 or tramex2 or tramex3 or tramex4 or tramex5 or tramex6 or tramex7 or tramex8 or tramex9) and not tramexUpravenePolicko then
                                                tramexUpravenePolicko = true
                                                tramexKodZeme = ""
                                            end
                                            if string.len(tramexKodZeme) < 4 then
                                                if tramex0 and tramexKodZeme ~= "" then
                                                    tramexKodZeme = tramexKodZeme.."0"
                                                end
                                                if tramex1 then
                                                    tramexKodZeme = tramexKodZeme.."1"
                                                end
                                                if tramex2 then
                                                    tramexKodZeme = tramexKodZeme.."2"
                                                end
                                                if tramex3 then
                                                    tramexKodZeme = tramexKodZeme.."3"
                                                end
                                                if tramex4 then
                                                    tramexKodZeme = tramexKodZeme.."4"
                                                end
                                                if tramex5 then
                                                    tramexKodZeme = tramexKodZeme.."5"
                                                end
                                                if tramex6 then
                                                    tramexKodZeme = tramexKodZeme.."6"
                                                end
                                                if tramex7 then
                                                    tramexKodZeme = tramexKodZeme.."7"
                                                end
                                                if tramex8 then
                                                    tramexKodZeme = tramexKodZeme.."8"
                                                end
                                                if tramex9 then
                                                    tramexKodZeme = tramexKodZeme.."9"
                                                end
                                            end
                                            if tramexRet then
                                                tramexKodZeme = string.sub(tramexKodZeme,1,-2)
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZV_STROJVED
                                                tramexOldContent = false
                                            end
                                        elseif tramexStav == TRAMEX_SV_STROJVED then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_SLUZ
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_KODZEME
                                            end
                                        elseif tramexStav == TRAMEX_SV_SLUZ then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_STAN
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_STROJVED
                                            end
                                        elseif tramexStav == TRAMEX_SV_STAN then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_CVLAKU
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_SLUZ
                                            end
                                        elseif tramexStav == TRAMEX_SV_CVLAKU then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_HMOTNOST
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_STAN
                                            end
                                        elseif tramexStav == TRAMEX_SV_HMOTNOST then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_NAPRAV
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_CVLAKU
                                            end
                                        elseif tramexStav == TRAMEX_SV_NAPRAV then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_BRZDREZ
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_HMOTNOST
                                            end
                                        elseif tramexStav == TRAMEX_SV_BRZDREZ then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_BRZDPROC
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_NAPRAV
                                            end
                                        elseif tramexStav == TRAMEX_SV_BRZDPROC then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_KODZEME
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_BRZDREZ
                                            end
                                        elseif tramexStav == TRAMEX_SV_KODZEME then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_STATVOL
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_SV_STROJVED
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_SV_BRZDPROC
                                            end
                                        elseif tramexStav == TRAMEX_ZU_RYCH then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_ZU_CAS
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_ZU_ZMENACAS
                                            end
                                        elseif tramexStav == TRAMEX_ZU_CAS then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_ZU_DATUM
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_ZU_RYCH
                                            end
                                        elseif tramexStav == TRAMEX_ZU_DATUM then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_ZU_DRAHA
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_ZU_CAS
                                            end
                                        elseif tramexStav == TRAMEX_ZU_DRAHA then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_ZU_RELDR
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_ZU_DATUM
                                            end
                                        elseif tramexStav == TRAMEX_ZU_RELDR then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_ZU_ZMENACAS
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_ZU_DRAHA
                                            end
                                        elseif tramexStav == TRAMEX_ZU_ZMENACAS then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexDoprava then
                                                tramexStav = TRAMEX_ZU_RYCH
                                            end
                                            if tramexDoleva then
                                                tramexStav = TRAMEX_ZU_RELDR
                                            end
                                            if tramexEnt then
                                                tramexStav = TRAMEX_ZU_ZMENACAS_STAV
                                            end
                                        elseif tramexStav == TRAMEX_ZU_ZMENACAS_STAV then
                                            if tramexMenu then
                                                tramexStav = TRAMEX_HM_ZAKLUD
                                            end
                                            if tramexRet then
                                                tramexStav = TRAMEX_ZU_ZMENACAS
                                            end
                                        end
                                        if tramexStav ~= TRAMEX_CAS then
                                            if tramexCas then
                                                tramexStav = TRAMEX_CAS
                                            end
                                        end
                                        if tramexStav ~= TRAMEX_DRAHA then
                                            if tramexKM then
                                                tramexStav = TRAMEX_DRAHA
                                            end
                                        end
                                        if tramexZadavani and (tramexStav < 60 or tramexStav >= 70) then
                                            tramexStavPred3sec = tramexStav
                                            tramexStav = TRAMEX_DATA_ULOZENA
                                            tramex3secZobrazeni = 3
                                            tramexZadavani = false
                                        end
                                    --------POCITADLO DRAHY
                                        tramexDrahaKm = tramexDrahaKm + rychlostKolaPodvozek1 * (casHry/3600)
                                    --------POCITADLO RELATIVNI DRAHY
                                        tramexRelDrahaKm = tramexRelDrahaKm + rychlostKolaPodvozek1 * (casHry/3600)
                                else
                                    tramexRelDrahaKm = 0
                                    tramexStav = TRAMEX_VYP
                                    nulovyDoraz = false
                                    maximalniDoraz = false
                                    tramexInit = false
                                    tramexSipickaDole = false
                                    tramexSipickaHore = false
                                    Call("TramexRych:SetText", "XXX", 0)
                                    Call("TramexCom:SetText", "XXXXXXXXXXXXXXXX", 0)
                                    Call("SetControlValue", "TramexOsvetleni", 0, 0)
                                end
                                if tramexCasSipicka > 0.5 then
                                    tramexSipickaDole = false
                                    tramexSipickaHore = false
                                end
                                if tramexSipickaHore then
                                    Call("SetControlValue", "TramexSipicky", 0, 2)
                                elseif tramexSipickaDole then
                                    Call("SetControlValue", "TramexSipicky", 0, 1)
                                else
                                    Call("SetControlValue", "TramexSipicky", 0, 0)
                                end
                            end
                        ----------------------------------------Dvere---------------------------------------------
                            povelHV = Call("GetControlValue", "povel_HlavniVypinac", 0)
                            --dvere ze soupravy
                                if otocPovely then
                                    dverePraveVSouprave = Call("GetControlValue","DvereLeveVSouprave",0)
                                    dvereLeveVSouprave = Call("GetControlValue","DverePraveVSouprave",0)
                                else
                                    dvereLeveVSouprave = Call("GetControlValue","DvereLeveVSouprave",0)
                                    dverePraveVSouprave = Call("GetControlValue","DverePraveVSouprave",0)
                                end

                            --kridla dveri
                                local DLP = Call("GetControlValue","DvereLP",0)
                                local DLZ = Call("GetControlValue","DvereLZ",0)
                                local DPP = Call("GetControlValue","DverePP",0)
                                local DPZ = Call("GetControlValue","DverePZ",0)

                                if DLP == 0 and dvereLPskutecne ~= 0 then
                                    if dvereLPvystraha < modelConfig[scriptVersion].delkaVystrahy then
                                        dvereLPvystraha = dvereLPvystraha + cas
                                        Call("SoundDvereLP:SetParameter","ZvkDverePipani",1)
                                    else
                                        Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                                    end
                                elseif DLP == 1 then
                                    dvereLPvystraha = 0
                                    Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                                    Call("SoundDvereLP:SetParameter","ZvkDvereLPrychle",0)
                                    Call("SoundDvereLP:SetParameter","ZvkDvereLPpomale",0)
                                end
                                if DLP ~= dvereLPskutecne and (dvereLPvystraha >= modelConfig[scriptVersion].delkaVystrahy or DLP == 1) then
                                    if DLP > dvereLPskutecne then
                                        dvereLPskutecne = math.min(dvereLPskutecne + (cas * rychlostOteviraniDveriLP),1)
                                    elseif DLP < dvereLPskutecne then
                                        if not modelConfig[scriptVersion].vystraha then
                                            dvereLPskutecne = math.max(dvereLPskutecne - (cas * rychlostZaviraniDveriLP_rychle),0)
                                            Call("SoundDvereLP:SetParameter","ZvkDvereLPrychle",1)
                                            Call("SoundDvereLP:SetParameter","ZvkDvereLPpomale",0)
                                            Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                                        else
                                            dvereLPskutecne = math.max(dvereLPskutecne - (cas * rychlostZaviraniDveriLP_pomalu),0)
                                            Call("SoundDvereLP:SetParameter","ZvkDvereLPrychle",0)
                                            Call("SoundDvereLP:SetParameter","ZvkDvereLPpomale",1)
                                            Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                                        end
                                    end
                                end
                                Call("SetTime", "Dvere1L", dvereLPskutecne * 2.125)

                                
                                if DLZ == 0 and dvereLZskutecne ~= 0 then
                                    if dvereLZvystraha < modelConfig[scriptVersion].delkaVystrahy then
                                        dvereLZvystraha = dvereLZvystraha + cas
                                        Call("SoundDvereLZ:SetParameter","ZvkDverePipani",1)
                                    else
                                        Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                                    end
                                elseif DLZ == 1 then
                                    dvereLZvystraha = 0
                                    Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                                    Call("SoundDvereLZ:SetParameter","ZvkDvereLZrychle",0)
                                    Call("SoundDvereLZ:SetParameter","ZvkDvereLZpomale",0)
                                end
                                if DLZ ~= dvereLZskutecne and (dvereLZvystraha >= modelConfig[scriptVersion].delkaVystrahy or DLZ == 1) then
                                    if DLZ > dvereLZskutecne then
                                        dvereLZskutecne = math.min(dvereLZskutecne + (cas * rychlostOteviraniDveriLZ),1)
                                    elseif DLZ < dvereLZskutecne then
                                        if not modelConfig[scriptVersion].vystraha then
                                            dvereLZskutecne = math.max(dvereLZskutecne - (cas * rychlostZaviraniDveriLZ_rychle),0)
                                            Call("SoundDvereLZ:SetParameter","ZvkDvereLZrychle",1)
                                            Call("SoundDvereLZ:SetParameter","ZvkDvereLZpomale",0)
                                            Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                                        else
                                            dvereLZskutecne = math.max(dvereLZskutecne - (cas * rychlostZaviraniDveriLZ_pomalu),0)
                                            Call("SoundDvereLZ:SetParameter","ZvkDvereLZrychle",0)
                                            Call("SoundDvereLZ:SetParameter","ZvkDvereLZpomale",1)
                                            Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                                        end
                                    end
                                end
                                Call("SetTime", "Dvere2L", dvereLZskutecne * 2.125)

                                
                                if DPP == 0 and dverePPskutecne ~= 0 then
                                    if dverePPvystraha < modelConfig[scriptVersion].delkaVystrahy then
                                        dverePPvystraha = dverePPvystraha + cas
                                        Call("SoundDverePP:SetParameter","ZvkDverePipani",1)
                                    else
                                        Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                                    end
                                elseif DPP == 1 then
                                    dverePPvystraha = 0
                                    Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                                    Call("SoundDverePP:SetParameter","ZvkDverePPrychle",0)
                                    Call("SoundDverePP:SetParameter","ZvkDverePPpomale",0)
                                end
                                if DPP ~= dverePPskutecne and (dverePPvystraha >= modelConfig[scriptVersion].delkaVystrahy or DPP == 1) then
                                    if DPP > dverePPskutecne then
                                        dverePPskutecne = math.min(dverePPskutecne + (cas * rychlostOteviraniDveriPP),1)
                                    elseif DPP < dverePPskutecne then
                                        if not modelConfig[scriptVersion].vystraha then
                                            dverePPskutecne = math.max(dverePPskutecne - (cas * rychlostZaviraniDveriPP_rychle),0)
                                            Call("SoundDverePP:SetParameter","ZvkDverePPrychle",1)
                                            Call("SoundDverePP:SetParameter","ZvkDverePPpomale",0)
                                            Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                                        else
                                            dverePPskutecne = math.max(dverePPskutecne - (cas * rychlostZaviraniDveriPP_pomalu),0)
                                            Call("SoundDverePP:SetParameter","ZvkDverePPrychle",0)
                                            Call("SoundDverePP:SetParameter","ZvkDverePPpomale",1)
                                            Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                                        end
                                    end
                                end
                                Call("SetTime", "Dvere1P", dverePPskutecne * 2.125)

                                
                                if DPZ == 0 and dverePZskutecne ~= 0 then
                                    if dverePZvystraha < modelConfig[scriptVersion].delkaVystrahy then
                                        dverePZvystraha = dverePZvystraha + cas
                                        Call("SoundDverePZ:SetParameter","ZvkDverePipani",1)
                                    else
                                        Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                                    end
                                elseif DPZ == 1 then
                                    dverePZvystraha = 0
                                    Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                                    Call("SoundDverePZ:SetParameter","ZvkDverePZrychle",0)
                                    Call("SoundDverePZ:SetParameter","ZvkDverePZpomale",0)
                                end
                                if DPZ ~= dverePZskutecne and (dverePZvystraha >= modelConfig[scriptVersion].delkaVystrahy or DPZ == 1) then
                                    if DPZ > dverePZskutecne then
                                        dverePZskutecne = math.min(dverePZskutecne + (cas * rychlostOteviraniDveriPZ),1)
                                    elseif DPZ < dverePZskutecne then
                                        if not modelConfig[scriptVersion].vystraha then
                                            dverePZskutecne = math.max(dverePZskutecne - (cas * rychlostZaviraniDveriPZ_rychle),0)
                                            Call("SoundDverePZ:SetParameter","ZvkDverePZrychle",1)
                                            Call("SoundDverePZ:SetParameter","ZvkDverePZpomale",0)
                                            Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                                        else
                                            dverePZskutecne = math.max(dverePZskutecne - (cas * rychlostZaviraniDveriPZ_pomalu),0)
                                            Call("SoundDverePZ:SetParameter","ZvkDverePZrychle",0)
                                            Call("SoundDverePZ:SetParameter","ZvkDverePZpomale",1)
                                            Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                                        end
                                    end
                                end
                                Call("SetTime", "Dvere2P", dverePZskutecne * 2.125)

                            --blokovani dveri
                                --true - dvere zablokovane
                                --false - dvere odblokovane
                                blokLeve = not ToBolAndBack(Call("GetControlValue","DvereLeveBlok",0))
                                blokPrave = not ToBolAndBack(Call("GetControlValue","DverePraveBlok",0))

                            --koncove spinace dveri HV
                                --true - dvere zavrene
                                --false - dvere otevrene
                                koncakLeve = false
                                koncakPrave = false
                                if dvereLPskutecne == 0 and dvereLZskutecne == 0 then
                                    koncakLeve = true
                                end
                                if dverePPskutecne == 0 and dverePZskutecne == 0 then
                                    koncakPrave = true
                                end

                            --prepinace dveri
                                --pravy - 0 leve dvere
                                    -- 1 zavrene
                                    -- 2 prave dvere
                                local prepPravy = Call("GetControlValue","DverePrepPravy",0)
                                --levy - otevrit = true, zavrit = false
                                local prepLevy = ToBolAndBack(Call("GetControlValue","DverePrepLevy",0))

                                --leve dvere lokalni
                                if (prepPravy == 0 or prepLevy) and RizenaRidici == "ridici" and (povelHV > 0.5 or modelConfig[scriptVersion].delkaVystrahy > 0) then
                                    dvereLevePovelLokalni = true
                                    dvereLevePridrznyStav = true
                                elseif prepPravy >= 1 and not prepLevy then
                                    dvereLevePovelLokalni = false
                                end

                                --prave dvere lokalni
                                if prepPravy == 2 and RizenaRidici == "ridici" and (povelHV > 0.5 or modelConfig[scriptVersion].delkaVystrahy > 0) then
                                    dverePravePovelLokalni = true
                                    dverePravePridrznyStav = true
                                elseif prepPravy <= 1 then
                                    dverePravePovelLokalni = false
                                end

                            --pridrzny obvod dveri
                                if RizenaRidici == "ridici" and povelHV > 0.5 then
                                    if dvereStavLast ~= tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni) or RizenaRidici ~= RizenaRidiciLast_dvere then
                                        dvereStavLast = tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni)
                                        RizenaRidiciLast_dvere = RizenaRidici
                                        if dvereLevePovelLokalni then
                                            Call("SendConsistMessage",460109,"11",0)
                                            Call("SendConsistMessage",460109,"11",1)
                                        else
                                            Call("SendConsistMessage",460109,"00",0)
                                            Call("SendConsistMessage",460109,"00",1)
                                            dvereLevePridrznyStav = false
                                        end
                                        if dverePravePovelLokalni then
                                            Call("SendConsistMessage",460105,"11",0)
                                            Call("SendConsistMessage",460105,"11",1)
                                        else
                                            Call("SendConsistMessage",460105,"00",0)
                                            Call("SendConsistMessage",460105,"00",1)
                                            dverePravePridrznyStav = false
                                        end
                                    end
                                elseif dvereStavLast ~= tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni) or RizenaRidici ~= RizenaRidiciLast_dvere then
                                    dvereStavLast = tostring(dvereLevePovelLokalni)..tostring(dverePravePovelLokalni)
                                    RizenaRidiciLast_dvere = RizenaRidici
                                    if not dvereLevePovelLokalni and dvereLevePridrznyStav then
                                        Call("SendConsistMessage",460109,"01",0)
                                        Call("SendConsistMessage",460109,"01",1)
                                    end
                                    if not dverePravePovelLokalni and dverePravePridrznyStav then
                                        Call("SendConsistMessage",460105,"01",0)
                                        Call("SendConsistMessage",460105,"01",1)
                                    end
                                end

                            --blokovaniDveri
                                --leve dvere
                                if dvereLevePridrznyStav or dvereLevePovelLokalni or dvereLeveZeSoupravy then
                                    blokLeve = false
                                else --if dvereLeveVSouprave == 0 then
                                    blokLeve = true
                                end

                                --prave dvere
                                if dverePravePridrznyStav or dverePravePovelLokalni or dverePraveZeSoupravy then
                                    blokPrave = false
                                else --if dverePraveVSouprave == 0 then
                                    blokPrave = true
                                end

                                -- if tostring(dvereLevePridrznyStav)..tostring(dvereLevePovelLokalni)..tostring(dvereLeveZeSoupravy)..tostring(dverePravePridrznyStav)..tostring(dverePravePovelLokalni)..tostring(dverePraveZeSoupravy)..tostring(blokLeve)..tostring(blokPrave) ~= dvereVypisLast then
                                -- 	dvereVypisLast = tostring(dvereLevePridrznyStav)..tostring(dvereLevePovelLokalni)..tostring(dvereLeveZeSoupravy)..tostring(dverePravePridrznyStav)..tostring(dverePravePovelLokalni)..tostring(dverePraveZeSoupravy)..tostring(blokLeve)..tostring(blokPrave)
                                -- 	ZpravaDebug("Dvere leve pridrzny stav: "..tostring(dvereLevePridrznyStav))
                                -- 	ZpravaDebug("Dvere leve lokalni povel: "..tostring(dvereLevePovelLokalni))
                                -- 	ZpravaDebug("Dvere leve povel ze soupravy: "..tostring(dvereLeveZeSoupravy))

                                -- 	ZpravaDebug("Dvere prave pridrzny stav: "..tostring(dverePravePridrznyStav))
                                -- 	ZpravaDebug("Dvere prave lokalni povel: "..tostring(dverePravePovelLokalni))
                                -- 	ZpravaDebug("Dvere prave povel ze soupravy: "..tostring(dverePraveZeSoupravy))

                                -- 	ZpravaDebug("Dvere leve blokovani: "..tostring(blokLeve))
                                -- 	ZpravaDebug("Dvere prave blokovani: "..tostring(blokPrave))
                                -- end

                            
                            --prenos stavu dveri do dalsiho vozu
                                --leve
                                if otocPovely then
                                    if dvereLPskutecne ~= 0 or dvereLZskutecne ~= 0 then
                                        NastavHodnotuSID("DverePraveVSouprave",1,460115)
                                    elseif dvereLPskutecne == 0 and dvereLZskutecne == 0 then
                                        NastavHodnotuSID("DverePraveVSouprave",0,460115)
                                    end

                                    --prave
                                    if dverePPskutecne ~= 0 or dverePZskutecne ~= 0 then
                                        NastavHodnotuSID("DvereLeveVSouprave",1,460114)
                                    elseif dverePPskutecne == 0 and dverePZskutecne == 0 then
                                        NastavHodnotuSID("DvereLeveVSouprave",0,460114)
                                    end
                                else
                                    if dvereLPskutecne ~= 0 or dvereLZskutecne ~= 0 then
                                        NastavHodnotuSID("DvereLeveVSouprave",1,460114)
                                    elseif dvereLPskutecne == 0 and dvereLZskutecne == 0 then
                                        NastavHodnotuSID("DvereLeveVSouprave",0,460114)
                                    end

                                    --prave
                                    if dverePPskutecne ~= 0 or dverePZskutecne ~= 0 then
                                        NastavHodnotuSID("DverePraveVSouprave",1,460115)
                                    elseif dverePPskutecne == 0 and dverePZskutecne == 0 then
                                        NastavHodnotuSID("DverePraveVSouprave",0,460115)
                                    end
                                end
                            
                            --signalizace otevrenych dveri
                                if dvereLeveVSouprave ~= 0 then
                                    kontrolkaKoncakLeve = false
                                else
                                    kontrolkaKoncakLeve = true
                                end

                                if dverePraveVSouprave ~= 0 then
                                    kontrolkaKoncakPrave = false
                                else
                                    kontrolkaKoncakPrave = true
                                end

                            --rizeni dveri
                                DOPCL = ToBolAndBack(Call("GetControlValue","DoorsOpenCloseLeft", 0))
                                DOPCP = ToBolAndBack(Call("GetControlValue","DoorsOpenCloseRight", 0))

                                --leve
                                if DOPCL and (dvereLevePovelLokalni or dvereLeveZeSoupravy) then
                                    Call("SetControlValue","DvereLP",0,1)
                                    Call("SetControlValue","DvereLZ",0,1)
                                elseif DOPCL then
                                    if RizenaRidici == "ridici" then
                                        Call("SetControlValue","DverePrepLevy",0,1)
                                        Napoveda(SysCall("ScenarioManager:FormatString","Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji levou klicku do polohy otevreno!"),1)
                                    else
                                        Call("SendConsistMessage",460108,"leve",1)
                                        Call("SendConsistMessage",460108,"leve",0)
                                    end
                                end
                                if not dvereLevePridrznyStav and not dvereLevePovelLokalni and not dvereLeveZeSoupravy then
                                    Call("SetControlValue","DvereLP",0,0)
                                    Call("SetControlValue","DvereLZ",0,0)
                                end

                                --prave
                                if DOPCP and (dverePravePovelLokalni or dverePraveZeSoupravy) then
                                    Call("SetControlValue","DverePP",0,1)
                                    Call("SetControlValue","DverePZ",0,1)
                                elseif DOPCP then
                                    if RizenaRidici == "ridici" then
                                        Call("SetControlValue","DverePrepPravy",0,2)
                                        Napoveda(SysCall("ScenarioManager:FormatString","Nemuzes nechat nastupovat cestujici zavrenymi dvermi! Prestavuji pravou klicku do polohy otevreno-prave!"),1)
                                    else
                                        Call("SendConsistMessage",460108,"prave",1)
                                        Call("SendConsistMessage",460108,"prave",0)
                                    end
                                end
                                if not dverePravePridrznyStav and not dverePravePovelLokalni and not dverePraveZeSoupravy then
                                    Call("SetControlValue","DverePP",0,0)
                                    Call("SetControlValue","DverePZ",0,0)
                                end
                            
                            --zapis kontrolek
                                if baterie == 1 then
                                    Call("SetControlValue","DvereLeveBlok",0, ToBolAndBack(blokLeve))
                                    Call("SetControlValue","DverePraveBlok",0, ToBolAndBack(blokPrave))
                                    Call("SetControlValue","DvereLeveKoncak",0, ToBolAndBack(kontrolkaKoncakLeve))
                                    Call("SetControlValue","DverePraveKoncak",0, ToBolAndBack(kontrolkaKoncakPrave))
                                else
                                    Call("SetControlValue","DvereLeveBlok",0, 1)
                                    Call("SetControlValue","DverePraveBlok",0, 1)
                                    Call("SetControlValue","DvereLeveKoncak",0, 1)
                                    Call("SetControlValue","DverePraveKoncak",0, 1)
                                end

                            if kontrolkaKoncakLeve then
                                prasatkoHodnotaL, gProbihaPrasatkoL, gHranicePrasatkoL, gHODNOTA_LAST_PrasatkoL = PIDcntrlCommon(1200,Call("GetControlValue","PrasatkoDvereL",0)*1000,gProbihaPrasatkoL,gHranicePrasatkoL,gHODNOTA_LAST_PrasatkoL,3000)
                            else
                                prasatkoHodnotaL, gProbihaPrasatkoL, gHranicePrasatkoL, gHODNOTA_LAST_PrasatkoL = PIDcntrlCommon(1800,Call("GetControlValue","PrasatkoDvereL",0)*1000,gProbihaPrasatkoL,gHranicePrasatkoL,gHODNOTA_LAST_PrasatkoL,3000)
                            end
                            Call("SetControlValue","PrasatkoDvereL",0,prasatkoHodnotaL)
                            
                            if kontrolkaKoncakPrave then
                                prasatkoHodnotaP, gProbihaPrasatkoP, gHranicePrasatkoP, gHODNOTA_LAST_PrasatkoP = PIDcntrlCommon(1200,Call("GetControlValue","PrasatkoDvereP",0)*1000,gProbihaPrasatkoP,gHranicePrasatkoP,gHODNOTA_LAST_PrasatkoP,3000)
                            else
                                prasatkoHodnotaP, gProbihaPrasatkoP, gHranicePrasatkoP, gHODNOTA_LAST_PrasatkoP = PIDcntrlCommon(1800,Call("GetControlValue","PrasatkoDvereP",0)*1000,gProbihaPrasatkoP,gHranicePrasatkoP,gHODNOTA_LAST_PrasatkoP,3000)
                            end
                            Call("SetControlValue","PrasatkoDvereP",0,prasatkoHodnotaP)

                        ----------------------------------------Pantografy----------------------------------------
                            local povel_VirtualPantographControl = Call("GetControlValue","povel_VirtualPantographControl",0)

                            if RizenaRidici == "ridici" then
                                if baterie == 1 and hlavniVypinac == 1 and povel_VlastniObaCizi < 1.5 then
                                    if modelConfig[scriptVersion].ctyriSberace then
                                        if povel_VirtualPantographControl < 2.5 and povel_VirtualPantographControl > 0.5 then
                                            gPredniSmetak = 1
                                        else
                                            gPredniSmetak = 0
                                        end
                                        if povel_VirtualPantographControl > 1.5 then
                                            gZadniSmetak = 1
                                        else
                                            gZadniSmetak = 0
                                        end
                                    else
                                        if povel_VirtualPantographControl > 0.5 then
                                            gZadniSmetak = 1
                                            gPredniSmetak = 0
                                        else
                                            gZadniSmetak = 0
                                            gPredniSmetak = 0
                                        end
                                    end
                                else
                                    gZadniSmetak = 0
                                    gPredniSmetak = 0
                                end
                            else
                                if baterie == 1 and hlavniVypinac == 1 and povel_VlastniObaCizi > 0.5 then
                                    if modelConfig[scriptVersion].ctyriSberace then
                                        if not otocPovely then
                                            if povel_VirtualPantographControl < 2.5 and povel_VirtualPantographControl > 0.5 then
                                                gZadniSmetak = 1
                                            else
                                                gZadniSmetak = 0
                                            end
                                            if povel_VirtualPantographControl > 1.5 then
                                                gPredniSmetak = 1
                                            else
                                                gPredniSmetak = 0
                                            end
                                        else
                                            if povel_VirtualPantographControl < 2.5 and povel_VirtualPantographControl > 0.5 then
                                                gPredniSmetak = 1
                                            else
                                                gPredniSmetak = 0
                                            end
                                            if povel_VirtualPantographControl > 1.5 then
                                                gZadniSmetak = 1
                                            else
                                                gZadniSmetak = 0
                                            end
                                        end
                                    else
                                        if povel_VirtualPantographControl > 0.5 then
                                            gZadniSmetak = 1
                                            gPredniSmetak = 0
                                        else
                                            gZadniSmetak = 0
                                            gPredniSmetak = 0
                                        end
                                    end
                                else
                                    gZadniSmetak = 0
                                    gPredniSmetak = 0
                                end
                            end

                            if modelConfig[scriptVersion].ctyriSberace then PP = Call("GetControlValue", "PantoPredni", 0) else PP = 0 end
                            ZP = Call ("GetControlValue", "PantoZadni", 0)

                            if (gPredniSmetak == 1 and PP == 0) or (gZadniSmetak == 1 and ZP == 0) then
                                soundPantoUp = 1 - soundPantoUp
                            end
                            Call("EngineSound:SetParameter", "sound_PantoUP", soundPantoUp)
                            
                            if (gPredniSmetak == 0 and PP == 3.75) or (gZadniSmetak == 0 and ZP == 3.75) then
                                soundPantoDown = 1 - soundPantoDown
                            end
                            Call("EngineSound:SetParameter", "sound_PantoDOWN", soundPantoDown)

                            if gPredniSmetak == 1 then
                                gPressureDelayCoefP = math.min(gPressureDelayCoefP + cas*2,1)
                            elseif PP > 0 then
                                gPressureDelayCoefP = math.max(gPressureDelayCoefP - cas,-1)
                            end

                            if gPressureDelayCoefP > 0 then -- predni zberac
                                if PP < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
                                    PP = PP + math.min((((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2), math.abs(math.sin(math.pi*PP*3/3.75))*0.03+0.015)*cas*15*math.max(gPressureDelayCoefP,0)
                                    Call("SetControlValue", "PantoPredni", 0, PP)
                                elseif PP == 3.75 then
                                    gPredniSberacDelay = math.min(gPredniSberacDelay + cas*2,PREDNI_SBERAC_MAX_DELAY)
                                end
                            elseif gPressureDelayCoefP < 0 then
                                if PP > 0 then
                                    if gPredniSberacDelay > 0 then
                                        gPredniSberacDelay = gPredniSberacDelay - cas
                                    else
                                        PP = PP + math.min(0.075, math.abs(math.cos(math.pi*PP*3/3.75))*0.055+0.027)*cas*10*math.min(gPressureDelayCoefP,0)
                                        Call("SetControlValue", "PantoPredni", 0, PP)
                                    end
                                else
                                    gPressureDelayCoefP = 0
                                end
                            end

                            if modelConfig[scriptVersion].ctyriSberace then
                                Call("SetTime", "PredniSberac", PP)
                                if PP > 3.75 then PP = 3.75 end
                                if PP < 0 then PP = 0 end
                            end

                            if gZadniSmetak == 1 then
                                gPressureDelayCoefZ = math.min(gPressureDelayCoefZ + cas*2,1)
                            elseif ZP > 0 then
                                gPressureDelayCoefZ = math.max(gPressureDelayCoefZ - cas,-1)
                            end

                            if gPressureDelayCoefZ > 0 then -- zadni zberac
                                if ZP < 3.75 and Call("GetControlValue","PantoJimka",0) > 0.87393202250021 then
                                    ZP = ZP + math.min((((Call("GetControlValue","PantoJimka",0)/10)-0.087393202250021)^2), math.abs(math.sin(math.pi*ZP*3/3.75))*0.03+0.015)*cas*15*math.max(gPressureDelayCoefZ,0)
                                    Call("SetControlValue", "PantoZadni", 0, ZP)
                                elseif ZP == 3.75 then
                                    gZadniSberacDelay = math.min(gZadniSberacDelay + cas*2,ZADNI_SBERAC_MAX_DELAY)
                                end
                            elseif gPressureDelayCoefZ < 0 then
                                if ZP > 0 then
                                    if gZadniSberacDelay > 0 then
                                        gZadniSberacDelay = gZadniSberacDelay - cas
                                    else
                                        ZP = ZP + math.min(0.075, math.abs(math.cos(math.pi*ZP*3/3.75))*0.055+0.027)*cas*10*math.min(gPressureDelayCoefZ,0)
                                        Call("SetControlValue", "PantoZadni", 0, ZP)
                                    end
                                else
                                    gPressureDelayCoefZ = 0
                                end
                            end
                            Call("SetTime", "ZadniSberac", ZP)
                            if ZP > 3.75 then ZP = 3.75 end
                            if ZP < 0 then ZP = 0 end

                            if modelConfig[scriptVersion].ctyriSberace then PC=math.max(PP,ZP) else PC = ZP end
                            if PC == 3.75 then
                                P01 = 1
                            else
                                P01 = 0
                            end
                            -- if PP > 3.70 and PP ~= 3.75 then
                            --     Call("SetControlValue","PantoPredni",0,3.75)
                            -- end
                            -- if ZP > 3.70 and ZP ~= 3.75 then
                            --     Call("SetControlValue","PantoZadni",0,3.75)
                            -- end
                        ----------------------------------------Prepinac roz proudu na cislo----------------------
                            if RizenaRidici == "ridici" then
                                Call("SetControlValue", "povel_RozProud", 0, Call("GetControlValue","RozProud",0))
                            end
                            local prepRozProud =  Call("GetControlValue","povel_RozProud",0)
                            if prepRozProud == 0 then
                                proud = rp_270A
                            elseif prepRozProud == 0.25 then
                                proud = rp_350A
                            elseif prepRozProud == 0.5 then
                                proud = rp_420A
                            elseif prepRozProud == 0.75 then
                                proud = rp_480A
                            elseif prepRozProud == 1 then
                                if stupenKontroleru < 8 then
                                    proud = rp_420A
                                else
                                    proud = rp_570A
                                end
                            end
                        ----------------------------------------Snih od kol v zime--------------------------------
                            -- if math.abs(rychlost) > 10 and RocniObdobi == 3 then
                            -- 	Call ("KourP1L:SetEmitterActive",1 ) 
                            -- 	Call ("KourP2L:SetEmitterActive",1 ) 
                            -- 	Call ("KourP1P:SetEmitterActive",1 ) 
                            -- 	Call ("KourP2P:SetEmitterActive",1 ) 
                            -- 	Call("KourP1L:SetEmitterRate",math.abs(1/rychlost))
                            -- 	Call("KourP1L:SetInitialVelocityMultiplier",math.abs(rychlost/3.6))
                            -- 	Call("KourP1P:SetEmitterRate",math.abs(1/rychlost))
                            -- 	Call("KourP1P:SetInitialVelocityMultiplier",math.abs(rychlost/3.6))
                            -- 	Call("KourP2P:SetEmitterRate",math.abs(1/rychlost))
                            -- 	Call("KourP2P:SetInitialVelocityMultiplier",math.abs(rychlost/3.6))
                            -- 	Call("KourP2L:SetEmitterRate",math.abs(1/rychlost))
                            -- 	Call("KourP2L:SetInitialVelocityMultiplier",math.abs(rychlost/3.6))
                            -- else
                            -- 	Call ("KourP1L:SetEmitterActive",0 ) 
                            -- 	Call ("KourP2L:SetEmitterActive",0 ) 
                            -- 	Call ("KourP1P:SetEmitterActive",0 ) 
                            -- 	Call ("KourP2P:SetEmitterActive",0 ) 
                            -- end
                        ----------------------------------------Kontrolka jizdy na odporovych stupnich------------
                            if vykon ~= 0 and vykon < 0.85 and not fiktivniVykonNaRizeneNeschopne then
                                NastavHodnotuSID("jizdaNaOdporechVeVlaku",1,460110)
                            else
                                NastavHodnotuSID("jizdaNaOdporechVeVlaku",0,460110)
                            end
                            if baterie == 1 and Call("GetControlValue", "jizdaNaOdporechVeVlaku", 0) > 0 then
                                Call("SetControlValue","odporstup",0,1)
                            else
                                Call("SetControlValue","odporstup",0,0)
                            end
                        ----------------------------------------Zaclonky------------------------------------------
                            Call("SetTime", "ZaclonkaLB", Call("GetControlValue", "zaclonkaLB", 0))
                            Call("SetTime", "ZaclonkaLP", Call("GetControlValue", "zaclonkaLP", 0))
                            Call("SetTime", "ZaclonkaPP", Call("GetControlValue", "zaclonkaPP", 0))
                            Call("SetTime", "ZaclonkaPB", Call("GetControlValue", "zaclonkaPB", 0))
                        ----------------------------------------Baterie-------------------------------------------
                            local prepinacBat = math.abs(Call("GetControlValue","prepinacBat",0))
                            if prepinacBat > 0.5 then
                                baterie = 1
                            else
                                baterie = 0
                            end

                            if baterie == 1 then
                                if vnitrniSit220Vnouzova == 1 then
                                    napetiBaterieAutostop = math.min(napetiBaterieAutostop + math.sqrt(52.1-napetiBaterieAutostop)*cas*0.1, 52)
                                    proudBaterieAutostop = math.sqrt(52.1-napetiBaterieAutostop)*10
                                    napetiBaterieRizeni = math.min(napetiBaterieRizeni + math.sqrt(51.1-napetiBaterieRizeni)*cas*0.1, 51)
                                    proudBaterieRizeni = math.sqrt(51.1-napetiBaterieRizeni)*10
                                    if 52 > napetiBaterieAutostopSmooth then
                                        napetiBaterieAutostopSmooth = napetiBaterieAutostopSmooth + math.sqrt(52 - napetiBaterieAutostopSmooth) * cas * 50
                                    elseif napetiBaterieAutostopSmooth > 52 then
                                        napetiBaterieAutostopSmooth = napetiBaterieAutostopSmooth - math.sqrt(napetiBaterieAutostopSmooth - 52) * cas * 50
                                    end
                                    if 51 > napetiBaterieRizeniSmooth then
                                        napetiBaterieRizeniSmooth = napetiBaterieRizeniSmooth + math.sqrt(51 - napetiBaterieRizeniSmooth) * cas * 50
                                    elseif napetiBaterieRizeniSmooth > 51 then
                                        napetiBaterieRizeniSmooth = napetiBaterieRizeniSmooth - math.sqrt(napetiBaterieRizeniSmooth - 51) * cas * 50
                                    end
                                else
                                    if napetiBaterieAutostop > napetiBaterieAutostopSmooth then
                                        napetiBaterieAutostopSmooth = napetiBaterieAutostopSmooth + math.sqrt(napetiBaterieAutostop - napetiBaterieAutostopSmooth) * cas * 50
                                    elseif napetiBaterieAutostopSmooth > napetiBaterieAutostop then
                                        napetiBaterieAutostopSmooth = napetiBaterieAutostopSmooth - math.sqrt(napetiBaterieAutostopSmooth - napetiBaterieAutostop) * cas * 50
                                    end
                                    if napetiBaterieRizeni > napetiBaterieRizeniSmooth then
                                        napetiBaterieRizeniSmooth = napetiBaterieRizeniSmooth + math.sqrt(napetiBaterieRizeni - napetiBaterieRizeniSmooth) * cas * 50
                                    elseif napetiBaterieRizeniSmooth > napetiBaterieRizeni then
                                        napetiBaterieRizeniSmooth = napetiBaterieRizeniSmooth - math.sqrt(napetiBaterieRizeniSmooth - napetiBaterieRizeni) * cas * 50
                                    end
                                    proudBaterieAutostop = 0
                                    proudBaterieRizeni = 0
                                end
                            else
                                proudBaterieAutostop = 0
                                proudBaterieRizeni = 0
                                if 0 > napetiBaterieAutostopSmooth then
                                    napetiBaterieAutostopSmooth = napetiBaterieAutostopSmooth + math.sqrt(0 - napetiBaterieAutostopSmooth) * cas * 50
                                elseif napetiBaterieAutostopSmooth > 0 then
                                    napetiBaterieAutostopSmooth = napetiBaterieAutostopSmooth - math.sqrt(napetiBaterieAutostopSmooth - 0) * cas * 50
                                end
                                if 0 > napetiBaterieRizeniSmooth then
                                    napetiBaterieRizeniSmooth = napetiBaterieRizeniSmooth + math.sqrt(0 - napetiBaterieRizeniSmooth) * cas * 50
                                elseif napetiBaterieRizeniSmooth > 0 then
                                    napetiBaterieRizeniSmooth = napetiBaterieRizeniSmooth - math.sqrt(napetiBaterieRizeniSmooth - 0) * cas * 50
                                end
                            end

                            if proudBaterieAutostop > proudBaterieAutostopSmooth then
                                proudBaterieAutostopSmooth = proudBaterieAutostopSmooth + math.sqrt(proudBaterieAutostop - proudBaterieAutostopSmooth) * cas * 50
                            elseif proudBaterieAutostopSmooth > proudBaterieAutostop then
                                proudBaterieAutostopSmooth = proudBaterieAutostopSmooth - math.sqrt(proudBaterieAutostopSmooth - proudBaterieAutostop) * cas * 50
                            end
                            if proudBaterieRizeni > proudBaterieRizeniSmooth then
                                proudBaterieRizeniSmooth = proudBaterieRizeniSmooth + math.sqrt(proudBaterieRizeni - proudBaterieRizeniSmooth) * cas * 50
                            elseif proudBaterieRizeniSmooth > proudBaterieRizeni then
                                proudBaterieRizeniSmooth = proudBaterieRizeniSmooth - math.sqrt(proudBaterieRizeniSmooth - proudBaterieRizeni) * cas * 50
                            end
                            Call("SetControlValue", "napetiAutostop", 0, napetiBaterieAutostopSmooth)
                            Call("SetControlValue", "proudAutostop", 0, proudBaterieAutostopSmooth)
                            Call("SetControlValue", "napetiRizeni", 0, napetiBaterieRizeniSmooth)
                            Call("SetControlValue", "proudRizeni", 0, proudBaterieRizeniSmooth)
                                
                        ----------------------------------------Svetla--------------------------------------------
                            local dalkovaSv = Call("GetControlValue", "VirtualHeadlights", 0)
                            if modelConfig[scriptVersion].horniPozicka then
                                if dalkovaSv < 0 then
                                    Call("SetControlValue", "VirtualHeadlights", 0, 0)
                                end
                                if dalkovaSv > 0.5 then
                                    DalkovaSvF(1,cas,baterie,false,false,false)
                                else
                                    DalkovaSvF(0,cas,baterie,false,false,false)
                                end
                            else
                                if dalkovaSv < -0.75 then
                                    DalkovaSvF(1,cas,baterie,false,false,true)
                                elseif dalkovaSv < -0.25 then
                                    DalkovaSvF(1,cas,baterie,false,true,false)
                                elseif dalkovaSv < 0.25 then
                                    DalkovaSvF(0,cas,baterie,false,false,false)
                                elseif dalkovaSv < 0.75 then
                                    DalkovaSvF(1,cas,baterie,true,false,false)
                                else
                                    DalkovaSvF(1,cas,baterie,false,true,true)
                                end
                            end

                            local vkpc = Call("GetControlValue", "VolbaPozicKonecCelo", 0)
                            if vkpc < 0.25 then
                                levaPozBilVPKC = true
                                levaPozCerVPKC = false
                                pravaPozBilVPKC = true
                                pravaPozCerVPKC = false
                                horniPozBilVKPC = true
                            elseif vkpc > 0.5 and vkpc < 1.5 then
                                levaPozBilVPKC = false
                                levaPozCerVPKC = false
                                pravaPozBilVPKC = false
                                pravaPozCerVPKC = false
                                horniPozBilVKPC = false
                            elseif vkpc > 1.75 then
                                levaPozBilVPKC = false
                                levaPozCerVPKC = true
                                pravaPozBilVPKC = false
                                pravaPozCerVPKC = true
                                horniPozBilVKPC = false
                            end

                            local levaPoz = Call("GetControlValue", "LevaPoz", 0)
                            if levaPoz < 0.25 then
                                levaPozCer = false
                                levaPozBil = true				
                            elseif levaPoz > 0.5 and levaPoz < 1.5 then
                                levaPozCer = false
                                levaPozBil = false
                            elseif levaPoz > 1.75 then
                                levaPozCer = true
                                levaPozBil = false
                            end

                            local pravaPoz = Call("GetControlValue", "PravaPoz", 0)
                            if pravaPoz < 0.25 then
                                pravaPozCer = false
                                pravaPozBil = true				
                            elseif pravaPoz > 0.5 and pravaPoz < 1.5 then
                                pravaPozCer = false
                                pravaPozBil = false
                            elseif pravaPoz > 1.75 then
                                pravaPozCer = true
                                pravaPozBil = false
                            end

                            local osvKabin = Call("GetControlValue", "OsvetleniKabiny", 0)
                            if osvKabin < 0.25 then
                                KabinaPrist = 1
                            elseif osvKabin > 0.5 and osvKabin < 1.5 then
                                KabinaPrist = 0
                            elseif osvKabin > 1.75 then
                                KabinaPrist = 2
                            end
                            
                            local lampicka = Call("GetControlValue", "Picka", 0)
                            if lampicka < 0.5 then
                                osvetleniPomocnik = 0
                            else
                                osvetleniPomocnik = 1
                            end

                            local zarivka = math.abs(Call("GetControlValue", "Zarivka", 0))
                            local fofrnikLevy = Call("GetControlValue", "LustrLevy", 0)
                            local fofrnikPravy = Call("GetControlValue", "LustrPravy", 0)

                            if baterie == 1 then
                                if OsvetleniVozu <= 0.5 then
                                    OsvetleniVozuF(0)
                                elseif OsvetleniVozu <= 1.5 then
                                    OsvetleniVozuF(1)
                                elseif vnitrniSit220V == 1 then
                                    OsvetleniVozuF(2)
                                elseif vnitrniSit220V ~= 1 then
                                    OsvetleniVozuF(1)
                                end
                                if KabinaPrist == 1 then
                                    KabinaPristF(1)
                                end
                                if KabinaPrist == 2 then
                                    KabinaPristF(2)
                                end
                                if KabinaPrist == 0 then
                                    KabinaPristF(0)
                                end
                                if osvetleniPomocnik == 0 then
                                    RozsvitSvetlo("CabLight2",0)
                                end
                                if osvetleniPomocnik == 1 then
                                    RozsvitSvetlo("CabLight2",1)
                                end
                                if levaPozBil or levaPozBilVPKC then
                                    Pozicka("Leva","Bi",1)
                                else
                                    Pozicka("Leva","Bi",0)
                                end
                                if levaPozCer or levaPozCerVPKC then
                                    Pozicka("Leva","Cr",1)
                                else
                                    Pozicka("Leva","Cr",0)
                                end
                                if pravaPozBil or pravaPozBilVPKC then
                                    Pozicka("Prava","Bi",1)
                                else
                                    Pozicka("Prava","Bi",0)
                                end
                                if pravaPozCer or pravaPozCerVPKC then
                                    Pozicka("Prava","Cr",1)
                                else
                                    Pozicka("Prava","Cr",0)
                                end
                                if zarivka > 0.5 then
                                    RozsvitSvetlo("CabLight1",1)
                                    Call("SetControlValue", "ZarivkaSvetlo", 0, 1)
                                else
                                    RozsvitSvetlo("CabLight1",0)
                                    Call("SetControlValue", "ZarivkaSvetlo", 0, 0)
                                end
                                if KabinaPrist == 1 then
                                    RozsvitSvetlo("CabLight3",1)
                                    Call("SetControlValue", "LustrLevySvetlo", 0, 1)
                                else
                                    RozsvitSvetlo("CabLight3",0)
                                    Call("SetControlValue", "LustrLevySvetlo", 0, 0)
                                end
                                if KabinaPrist == 1 then
                                    RozsvitSvetlo("CabLight4",1)
                                    Call("SetControlValue", "LustrPravySvetlo", 0, 1)
                                else
                                    RozsvitSvetlo("CabLight4",0)
                                    Call("SetControlValue", "LustrPravySvetlo", 0, 0)
                                end
                            else
                                VypniVse()
                            end

                            if ((levaPozBil or levaPozBilVPKC) and (pravaPozBil or pravaPozBilVPKC)) and not (levaPozCer or levaPozCerVPKC or pravaPozCer or pravaPozCerVPKC) then
                                Call("SetControlValue", "Headlights", 0, 1)
                            elseif ((levaPozCer or levaPozCerVPKC) and (pravaPozCer or pravaPozCerVPKC)) and not (levaPozBil or levaPozBilVPKC or pravaPozBil or pravaPozBilVPKC) then
                                Call("SetControlValue", "Headlights", 0, 2)
                            else
                                Call("SetControlValue", "Headlights", 0, 0)
                            end
                        ----------------------------------------Klic HV-------------------------------------------
                            if klic == 1 then -- Jenom pokud je klic ve zdirce
                                if PolohaKlice < 0.25 then -- blokovani dolni schovane
                                    Call ("SetControlValue", "VirtualStartup", 0, 0.25)
                                end
                                if PolohaKlice > 0.75 then -- blokovani horni schovane
                                    Call ("SetControlValue", "VirtualStartup", 0, 0.75)
                                end
                            end
                            if pozadavekNaZapisKlice then
                                Call ("SetControlValue", "VirtualStartup", 0, PolohaKlice)
                                pozadavekNaZapisKlice = false
                            end

                            if JeNouzovyRadic == 1 and Call("GetControlValue","RadicNouzovy",0) < 0 then
                                Call("SetControlValue","RadicNouzovy",0,0)
                            end
                        ----------------------------------------Automatika a kontroler----------------------------
                            casstupnu = casstupnu+cas
                            ridiciKontroler = Call("GetControlValue","VirtualThrottleAndBrake",0)
                            if Call("GetControlValue","RidiciKontrolerOkno",0) > 1 and ridiciKontrolerOknoOCVC == Call("GetControlValue","RidiciKontrolerOkno",0) then
                                Call("SetControlValue","RidiciKontrolerOkno",0,1)
                                ridiciKontrolerOknoOCVC = 1
                            end
                            if RizenaRidici == "ridici" then
                                if JeNouzovyRadic == 0 then
                                    Call("SetControlValue","povel_RidiciKontroler",0,VratRadic(ridiciKontroler,Call("GetControlValue","RidiciKontrolerOkno",0)))
                                    Call("SetControlValue","povel_NouzovyKontroler",0,0)
                                else
                                    Call("SetControlValue","povel_RidiciKontroler",0,Call("GetControlValue","RadicNouzovy",0))
                                    Call("SetControlValue","povel_NouzovyKontroler",0,1)
                                end
                            end
                            kontroler = Call("GetControlValue","povel_RidiciKontroler",0)
                            if Ammeter > proud and vnitrniSit220Vnouzova == 1 then
                                NastavHodnotuSID("synchronizacniRele", 1, 460992)
                            else
                                NastavHodnotuSID("synchronizacniRele", 0, 460992)
                            end
                            -- if TlakovyBlokJizdy and tlak_HP >= 4.7 then TlakovyBlokJizdy = false end
                            -- if plynuleValce > 1.2 then TlakovyBlokJizdy = true end
                            if JeNouzovyRadicVS == 0 then
                                kontrolerLast = 0
                            end
                            if JeNouzovyRadicVS == 0 and prepinaceTlak > 3.5 and baterie == 1 and not pojezdVDepu then
                                if kontroler == 0 or (JOB == 0 and not fiktivniVykonNaRizeneNeschopne) or Smer == 0 or (vykon > 0 and ojDiag == 1) or ((tlakVeValcich or casOJ > 1) and (vykon < 0 or kontroler < 0.25)) or zavedSnizenyVykon then 
                                    if kontroler == 0 then
                                        blokEDB = false
                                    end
                                    if vykon > 0 and casstupnu >= caszkroku then
                                        Call("SetControlValue","JizdniKontroler",0,vykon - 0.05)
                                        casstupnu = 0
                                        caszkroku = (math.random(3,7)/20)
                                    elseif vykon < 0 and casstupnu >= caszkroku then
                                        Call("SetControlValue","JizdniKontroler",0,vykon + 1/modelConfig[scriptVersion].stupneEDB)
                                        casstupnu = 0
                                        caszkroku = (math.random(8,12)/20)
                                    end
                                elseif kontroler == 0.5 and not blokKrokSkluz and not SnizenyVykonVozu then
                                    if vykon < 0 and casstupnu >= caszkroku then
                                        Call("SetControlValue","JizdniKontroler",0,vykon+1/modelConfig[scriptVersion].stupneEDB)
                                        casstupnu = 0
                                        caszkroku = (math.random(3,7)/20)
                                    elseif vykon < 0.05 and casstupnu >= caskroku and (JOB == 1 or fiktivniVykonNaRizeneNeschopne) then
                                        Call("SetControlValue","JizdniKontroler",0,0.05)
                                        casstupnu = 0
                                        caskroku = (math.random(8,12)/20)
                                    end
                                elseif kontroler == 1 and not blokKrokSkluz and not SnizenyVykonVozu then
                                    if vykon >= 0.05 and vykon < 1 and casstupnu >= caskroku and (JOB == 1 or fiktivniVykonNaRizeneNeschopne) and ojDiag == 0 then
                                        if Call("GetControlValue", "synchronizacniRele", 0) < 1 then
                                            Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
                                            casstupnu = 0
                                            caskroku = (math.random(8,12)/20)
                                        end
                                    elseif vykon < 0 and casstupnu >= caszkroku and (JOB == -1  or fiktivniVykonNaRizeneNeschopne) then
                                        Call("SetControlValue","JizdniKontroler",0,vykon+1/modelConfig[scriptVersion].stupneEDB)
                                        casstupnu = 0
                                        caszkroku = (math.random(3,7)/20)
                                    elseif vykon < 0.05 and casstupnu >= caskroku and (JOB == 1 or fiktivniVykonNaRizeneNeschopne) then
                                        Call("SetControlValue","JizdniKontroler",0,0.05)
                                        casstupnu = 0
                                        caskroku = (math.random(8,12)/20)
                                    end
                                -- elseif (rychlostKolaKMHPodvozek1 < rychlostEDB or valcePrimocinne > 0.5) and vykon < 0 and casstupnu >= caszkroku then
                                --     blokEDB = true
                                --     Call("SetControlValue","JizdniKontroler",0,vykon+1/modelConfig[scriptVersion].stupneEDB)
                                --     casstupnu = 0
                                --     caszkroku = (math.random(3,7)/20)
                                elseif kontroler == -0.5 then
                                    if vykon > 0 and casstupnu >= caszkroku and (JOB == 1 or fiktivniVykonNaRizeneNeschopne) then
                                        Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
                                        casstupnu = 0
                                        caszkroku = (math.random(3,7)/20)
                                    elseif vykon == 0 and casstupnu >= caskroku and (JOB == -1 or fiktivniVykonNaRizeneNeschopne) and not blokKrokSkluz and not blokEDB and not tlakVeValcich then
                                        Call("SetControlValue","JizdniKontroler",0,-1/modelConfig[scriptVersion].stupneEDB)
                                        casstupnu = 0
                                        caskroku = (math.random(8,12)/20)
                                    -- elseif vykon < -1/modelConfig[scriptVersion].stupneEDB and casstupnu >= caszkroku and (JOB == -1 or fiktivniVykonNaRizeneNeschopne) and not blokKrokSkluz and not blokEDB then
                                    -- 	Call("SetControlValue","JizdniKontroler",0,vykon+1/modelConfig[scriptVersion].stupneEDB)
                                    -- 	casstupnu = 0
                                    -- 	caszkroku = (math.random(3,7)/20)
                                    end
                                elseif kontroler == -1 then 
                                    if vykon <= -1/modelConfig[scriptVersion].stupneEDB and vykon > -1 and casstupnu >= caskroku and (JOB == -1 or fiktivniVykonNaRizeneNeschopne) and not blokKrokSkluz and not blokEDB and not tlakVeValcich then
                                        --if Ammeter >= -350 then
                                            Call("SetControlValue","JizdniKontroler",0,vykon-1/modelConfig[scriptVersion].stupneEDB)
                                            casstupnu = 0
                                            caskroku = (math.random(8,12)/20)
                                        --end
                                    elseif vykon > 0 and casstupnu >= caszkroku and (JOB == 1 or fiktivniVykonNaRizeneNeschopne) then
                                        Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
                                        casstupnu = 0
                                        caszkroku = (math.random(3,7)/20)
                                    elseif vykon > -1/modelConfig[scriptVersion].stupneEDB and casstupnu >= caskroku and (JOB == -1 or fiktivniVykonNaRizeneNeschopne) and not blokKrokSkluz and not blokEDB and not tlakVeValcich then
                                        Call("SetControlValue","JizdniKontroler",0,-1/modelConfig[scriptVersion].stupneEDB)
                                        casstupnu = 0
                                        caskroku = (math.random(8,12)/20)
                                    end
                                end
                            elseif JeNouzovyRadicVS == 1 and prepinaceTlak > 3.5 and baterie == 1 and not pojezdVDepu and Call("GetControlValue","RadicNouzovy",0) < 0.95 then
                                if kontroler - kontrolerLast > 0.03 and casstupnu >= caskroku and Smer ~= 0 then
                                    if vykon >= 0 then
                                        Call("SetControlValue","JizdniKontroler",0,vykon+0.05)
                                    else
                                        Call("SetControlValue","JizdniKontroler",0,vykon+1/modelConfig[scriptVersion].stupneEDB)
                                    end
                                    casstupnu = 0
                                    caskroku = (math.random(4,7)/20)
                                    kontrolerStupen = kontroler/0.05
                                    cele, zbytek = divMod(kontrolerStupen,1)
                                    if zbytek ~= 0 then
                                        if zbytek < 0.5 then
                                            kontrolerStupen = cele
                                        else
                                            kontrolerStupen = cele + 1
                                        end
                                    end
                                    kontrolerLast = kontrolerStupen*0.05
                                elseif kontroler - kontrolerLast < -0.03 and casstupnu >= caszkroku then
                                    if vykon > 0 then
                                        Call("SetControlValue","JizdniKontroler",0,vykon-0.05)
                                    else
                                        Call("SetControlValue","JizdniKontroler",0,vykon-1/modelConfig[scriptVersion].stupneEDB)
                                    end
                                    casstupnu = 0
                                    caszkroku = (math.random(2,4)/20)
                                    kontrolerStupen = kontroler/0.05
                                    cele, zbytek = divMod(kontrolerStupen,1)
                                    if zbytek ~= 0 then
                                        if zbytek < 0.5 then
                                            kontrolerStupen = cele
                                        else
                                            kontrolerStupen = cele + 1
                                        end
                                    end
                                    kontrolerLast = kontrolerStupen*0.05
                                end
                            end
                            vykon = Call("GetControlValue","JizdniKontroler",0) 
                            if (vykon < 0.05 and vykon >= 0) or (vykon > -1/modelConfig[scriptVersion].stupneEDB and vykon <= 0) then 
                                Call("SetControlValue","JizdniKontroler",0,0) 
                                vykon = 0 
                            end
                            fiktivniVykonNaRizeneNeschopne = false
                            if (PC == 3.75 and hlavniVypinac == 1 and baterie == 1 and not (SnizenyVykonVozu and vykon > 0) and JOB ~= 0 and not vypnutyVuz) or pojezdVDepu then -- kontrola podmínek pro jízdu
                                if vykon == 0 or not fiktivniVykonNaRizeneNeschopne then
                                    Call("SetControlValue","MuteSounds",0,0)
                                end
                                Call("SetControlValue","VykonPredTrCh",0,Call("GetControlValue","JizdniKontroler",0))
                            elseif (kontroler ~= 0 or vykon ~= 0) and Call("GetControlValue","mgVS",0) > 0 and baterie == 1 and not (SnizenyVykonVozu and vykon > 0) then
                                Call("SetControlValue","VykonPredTrCh",0,Call("GetControlValue","JizdniKontroler",0))
                                fiktivniVykonNaRizeneNeschopne = true
                                Call("SetControlValue","MuteSounds",0,1)
                            else
                                if vykon == 0 or not fiktivniVykonNaRizeneNeschopne then
                                    Call("SetControlValue","MuteSounds",0,0)
                                end
                                Call("SetControlValue","VykonPredTrCh",0,0)
                            end
                            if JeNouzovyRadic == 1 and Call("GetControlValue","RadicNouzovy",0) > 0.85 then
                                Call("SetControlValue","RadicNouzovy",0,0.85)
                            end
                            if vykon > 0 then
                                stupenKontroleru = vykon/0.05
                                cele, zbytek = divMod(stupenKontroleru,1) 
                                if zbytek ~= 0 then
                                    if zbytek > 0.5 then
                                        stupenKontroleru = cele + 1
                                    else 
                                        stupenKontroleru = cele
                                    end
                                end
                            end
                            if vykon < 0 then
                                stupenKontroleru = vykon/(1/modelConfig[scriptVersion].stupneEDB)
                                cele, zbytek = divMod(stupenKontroleru,1/modelConfig[scriptVersion].stupneEDB)
                                if zbytek ~= 0 then
                                    if zbytek < -0.5 then
                                        stupenKontroleru = cele - 1
                                    else
                                        stupenKontroleru = cele
                                    end
                                end
                            end

                            local blokujSmer = true
                            if (Smer == 0 or Smer == 2 or baterie ~= 1) and (Call("GetControlValue","RadicNouzovy",0) == 0 or Call("GetControlValue","VirtualThrottleAndBrake",0) == 0 or blokujJK) then
                                blokujJK = true
                            else
                                blokujJK = false
                            end
                            if vykon == 0 and baterie == 1 and not fiktivniVykonNaRizeneNeschopne and (ridiciKontroler == 0 or ridiciKontroler == 2) and (Call("GetControlValue","RadicNouzovy",0) == 0 or Call("GetControlValue","RadicNouzovy",0) == 2) then
                                blokujSmer = false
                            end

                            if blokujSmer then
                                if smerBlokovany == nil then
                                    cele, zbytek = divMod(Smer,1)
                                    smerBlokovany = cele
                                    if zbytek > 0.5 then
                                        smerBlokovany = smerBlokovany + 1
                                    end
                                end
                                Call("SetControlValue","UserVirtualReverser",0,smerBlokovany)
                            else
                                smerBlokovany = nil
                            end
                            
                            if blokujJK then
                                if JeNouzovyRadic == 0 then
                                    Call("SetControlValue","VirtualThrottleAndBrake",0,0)
                                else
                                    Call("SetControlValue","RadicNouzovy",0,0)
                                end
                            else
                                JKBlokovany = nil
                            end
                            
                            if JeNouzovyRadic == 1 then
                                Call("SetControlValue","VirtualThrottleAndBrake",0,2)
                                if math.abs(Call("GetControlValue","RadicNouzovy",0)) < 0.025 then
                                    Call("LockControl","JeNouzovyRadic",0,0)
                                end
                            else
                                Call("SetControlValue","RadicNouzovy",0,2)
                                if math.abs(Call("GetControlValue","VirtualThrottleAndBrake",0)) < 0.05 then
                                    Call("LockControl","JeNouzovyRadic",0,0)
                                end
                                if Call("GetControlValue","VirtualThrottleAndBrake",0) > 1 then
                                    Call("SetControlValue","VirtualThrottleAndBrake",0,1)
                                end
                            end

                            if math.abs(Call("GetControlValue","VirtualThrottleAndBrake",0)) > 0.05 and math.abs(2-Call("GetControlValue","VirtualThrottleAndBrake",0)) > 0.05 then
                                Call("SetControlValue","JeNouzovyRadic",0,0)
                                Call("LockControl","JeNouzovyRadic",0,1)
                            end

                            if math.abs(Call("GetControlValue","RadicNouzovy",0)) > 0.025 and math.abs(2-Call("GetControlValue","RadicNouzovy",0)) > 0.025 then
                                Call("SetControlValue","JeNouzovyRadic",0,1)
                                Call("LockControl","JeNouzovyRadic",0,1)
                            end

                        ----------------------------------------ADHESE--------------------------------------------
                            --------------Adhese koeficienty----
                                typSrazek = SysCall("WeatherController:GetCurrentPrecipitationType")
                                intenzitaSrazek = SysCall("WeatherController:GetPrecipitationDensity")
                                if typSrazek ~= nil then
                                    if typSrazek < 3 then --nesnezi
                                        if intenzitaSrazek > 0.3 then --prsi hodne
                                            if adhese_casdeste == -1 then
                                                adhese_casdeste = 0
                                            end
                                            if adhese_casdeste <= 370 then
                                                adhese_casdeste = adhese_casdeste + cas
                                            end
                                            adhese_caspodesti = -1
                                        elseif intenzitaSrazek ~= 0 then --prsi trochenc
                                            if adhese_casdeste == -1 then
                                                adhese_casdeste = ADHESE_VLHKO_CAS_NABEH
                                            end
                                            adhese_caspodesti = -1
                                        else --neprsi vubec
                                            if typSrazek > 0 then
                                                if adhese_casdeste == -1 then
                                                    adhese_casdeste = ADHESE_VLHKO_CAS_NABEH
                                                end
                                                adhese_caspodesti = -1
                                            else
                                                if adhese_casdeste ~= -1 then
                                                    adhese_caspodesti = adhese_casdeste*10
                                                    adhese_casdeste = -1
                                                end
                                                if adhese_caspodesti > 0 then
                                                    adhese_caspodesti = adhese_caspodesti - cas
                                                else
                                                    adhese_caspodesti = -1
                                                end
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

                                if SysCall("ScenarioManager:GetSeason") == 3 then --pokud je zima, je snih - sankuje to 2x tolik jak obvykle
                                    ambientAdhesion = ADHESE_SNIH
                                end

                                if plynuleValce > 0.1 and rychlostKolaKMHPodvozek1 > 5 then
                                    if brakeAdhesionAdditionPodvozek1 < 0.15 then
                                        brakeAdhesionAdditionPodvozek1 = brakeAdhesionAdditionPodvozek1 + 0.25*cas
                                    else
                                        brakeAdhesionAdditionPodvozek1 = 0.15
                                    end
                                else
                                    if brakeAdhesionAdditionPodvozek1 > 0 then
                                        brakeAdhesionAdditionPodvozek1 = (brakeAdhesionAdditionPodvozek1 - 0.00333*cas)
                                    else
                                        brakeAdhesionAdditionPodvozek1 = 0
                                    end
                                end

                                if plynuleValce_bezBP > 0.1 and rychlostKolaKMHPodvozek2 > 5 then
                                    if brakeAdhesionAdditionPodvozek2 < 0.15 then
                                        brakeAdhesionAdditionPodvozek2 = brakeAdhesionAdditionPodvozek2 + 0.25*cas
                                    else
                                        brakeAdhesionAdditionPodvozek2 = 0.15
                                    end
                                else
                                    if brakeAdhesionAdditionPodvozek2 > 0 then
                                        brakeAdhesionAdditionPodvozek2 = (brakeAdhesionAdditionPodvozek2 - 0.00333*cas)
                                    else
                                        brakeAdhesionAdditionPodvozek2 = 0
                                    end
                                end

                                decisiveAdhesionPodvozek1 = ambientAdhesion + brakeAdhesionAdditionPodvozek1
                                decisiveAdhesionPodvozek2 = ambientAdhesion + brakeAdhesionAdditionPodvozek2

                                if adheseRandomCtdnPodvozek1 > 0 then
                                    if math.abs(Call("GetSpeed")) > 0.1 and math.abs(Call("GetSpeed")) < 15 and intenzitaSrazek ~= 0 then
                                        adheseRandomCtdnPodvozek1 = adheseRandomCtdnPodvozek1 - cas
                                    end
                                    adheseRandomLenCtuPodvozek1 = 0
                                elseif adheseRandomLenCtuPodvozek1 < 1 then
                                    decisiveAdhesionPodvozek1 = decisiveAdhesionPodvozek1 * 0.7
                                    adheseRandomLenCtuPodvozek1 = adheseRandomLenCtuPodvozek1 + cas
                                else
                                    adheseRandomCtdnPodvozek1 = math.random(40,200)
                                end
                                
                                if adheseRandomCtdnPodvozek2 > 0 then
                                    if math.abs(Call("GetSpeed")) > 0.1 and math.abs(Call("GetSpeed")) < 15 and intenzitaSrazek ~= 0 then
                                        adheseRandomCtdnPodvozek2 = adheseRandomCtdnPodvozek2 - cas
                                    end
                                    adheseRandomLenCtuPodvozek2 = 0
                                elseif adheseRandomLenCtuPodvozek2 < 1 then
                                    decisiveAdhesionPodvozek2 = decisiveAdhesionPodvozek2 * 0.7
                                    adheseRandomLenCtuPodvozek2 = adheseRandomLenCtuPodvozek2 + cas
                                else
                                    adheseRandomCtdnPodvozek2 = math.random(40,200)
                                end

                            --------------Adheze a skluz--------
                                output_kN = VratTCh(Call("GetControlValue","VykonPredTrCh",0),Call("GetSpeed"))*gAbsolutniMax_kN
                                positiveTractiveEffortForWheelslip = math.max(output_kN,0)
                                if fiktivniVykonNaRizeneNeschopne then
                                    positiveTractiveEffortForWheelslip = 0
                                    negativeTractiveEffortForWheelslip = plynuleValce/3.8*150*max_tbc+200*Call("GetControlValue", "HandBrake", 0)
                                else
                                    negativeTractiveEffortForWheelslip = math.abs(math.min(output_kN,0)/math.min(pocetZapnutychVozu, pocetMG))+plynuleValce/3.8*150*max_tbc+200*Call("GetControlValue", "HandBrake", 0)
                                end
                                tractiveEffortForWheelslip = math.abs(positiveTractiveEffortForWheelslip-negativeTractiveEffortForWheelslip)
                                
                                adhesiveTractiveForcePodvozek1 = ((7500)/(rychlost+44)+161)*0.001*9.81*decisiveAdhesionPodvozek1*64

                                if positiveTractiveEffortForWheelslip > negativeTractiveEffortForWheelslip then
                                    cilovaRychlostKolaPodvozek1 = math.abs(Call("GetSpeed"))+math.max(0,tractiveEffortForWheelslip-adhesiveTractiveForcePodvozek1)
                                else
                                    cilovaRychlostKolaPodvozek1 = math.max(math.abs(Call("GetSpeed"))-(math.max(0,tractiveEffortForWheelslip-adhesiveTractiveForcePodvozek1)^2),0)
                                end

                                if tractiveEffortForWheelslip > adhesiveTractiveForcePodvozek1 then
                                    koefSpeedChange = 5
                                else
                                    koefSpeedChange = 7*math.max(1,plynuleValce)
                                end

                                if cilovaRychlostKolaPodvozek1 > rychlostKolaPodvozek1 then
                                    rychlostKolaPodvozek1 = math.min(rychlostKolaPodvozek1 + math.sqrt(cilovaRychlostKolaPodvozek1-rychlostKolaPodvozek1)*cas*koefSpeedChange, cilovaRychlostKolaPodvozek1)
                                else
                                    rychlostKolaPodvozek1 = math.max(rychlostKolaPodvozek1 - math.sqrt(rychlostKolaPodvozek1-cilovaRychlostKolaPodvozek1)*cas*koefSpeedChange, cilovaRychlostKolaPodvozek1)
                                end
                                if math.abs(rychlostKolaPodvozek1 - cilovaRychlostKolaPodvozek1) < 0.5 then
                                    rychlostKolaPodvozek1 = cilovaRychlostKolaPodvozek1
                                end
                                rychlostKolaKMHPodvozek1 = rychlostKolaPodvozek1*3.6

                                if math.max(0,tractiveEffortForWheelslip-adhesiveTractiveForcePodvozek1) > 5 then
                                    if positiveTractiveEffortForWheelslip < negativeTractiveEffortForWheelslip then
                                        output_kN = output_kN*0.63245553203367586639977870888654
                                        actualTBC = actualTBC*0.63245553203367586639977870888654
                                    else 
                                        output_kN = output_kN*0.22360679774997896964091736687313
                                    end
                                end
                                
                                adhesiveTractiveForcePodvozek2 = ((7500)/(rychlost+44)+161)*0.001*9.81*decisiveAdhesionPodvozek2*64

                                if positiveTractiveEffortForWheelslip > negativeTractiveEffortForWheelslip then
                                    cilovaRychlostKolaPodvozek2 = math.abs(Call("GetSpeed"))+math.max(0,tractiveEffortForWheelslip-adhesiveTractiveForcePodvozek2)
                                else
                                    cilovaRychlostKolaPodvozek2 = math.max(math.abs(Call("GetSpeed"))-(math.max(0,tractiveEffortForWheelslip-adhesiveTractiveForcePodvozek2)^2),0)
                                end

                                if tractiveEffortForWheelslip > adhesiveTractiveForcePodvozek2 then
                                    koefSpeedChange = 5
                                else
                                    koefSpeedChange = 7
                                end

                                if cilovaRychlostKolaPodvozek2 > rychlostKolaPodvozek2 then
                                    rychlostKolaPodvozek2 = math.min(rychlostKolaPodvozek2 + math.sqrt(cilovaRychlostKolaPodvozek2-rychlostKolaPodvozek2)*cas*koefSpeedChange,cilovaRychlostKolaPodvozek2)
                                else
                                    rychlostKolaPodvozek2 = math.max(rychlostKolaPodvozek2 - math.sqrt(rychlostKolaPodvozek2-cilovaRychlostKolaPodvozek2)*cas*koefSpeedChange,cilovaRychlostKolaPodvozek2)
                                end
                                if math.abs(rychlostKolaPodvozek2 - cilovaRychlostKolaPodvozek2) < 0.5 then
                                    rychlostKolaPodvozek2 = cilovaRychlostKolaPodvozek2
                                end
                                rychlostKolaKMHPodvozek2 = rychlostKolaPodvozek2*3.6

                                if math.max(0,tractiveEffortForWheelslip-adhesiveTractiveForcePodvozek2) > 5 then
                                    if positiveTractiveEffortForWheelslip < negativeTractiveEffortForWheelslip then
                                        output_kN = output_kN*0.63245553203367586639977870888654
                                        actualTBC = actualTBC*0.63245553203367586639977870888654
                                    else 
                                        output_kN = output_kN*0.22360679774997896964091736687313
                                    end
                                end

                                if rychlostKolaPodvozek1 < 1 and rychlostKolaPodvozek2 < 1 and tractiveEffortForWheelslip > adhesiveTractiveForcePodvozek1+10 then
                                    output_kN = 0
                                    actualTBC = 0.2
                                    obutiVolume = math.min(obutiVolume + cas*math.abs(rychlostKolaKMHPodvozek1-rychlost)/100,1)
                                end

                                if (plynuleValce > 0.1 and tractiveEffortForWheelslip < adhesiveTractiveForcePodvozek1) or rychlostKolaKMHPodvozek1+5 > rychlost then
                                    obutiVolume = math.max(obutiVolume - cas*plynuleValce/10000,0)
                                end

                                Call("SoundLoziska:SetParameter", "obutiVolume", math.min(obutiVolume, math.max(0.6, 1-((rychlost-60)/100)))) --math.min(obutiVolume, math.max(0.3, 1-((rychlost-40)/60)))

                                if obutiDistance > 0 then
                                    if rychlostKolaKMHPodvozek1 > 0.2 then
                                        obutiDistance = obutiDistance - cas*rychlostKolaPodvozek1
                                    end
                                else
                                    obutiDistance = 2.4772805742778301026860760754598+obutiDistance
                                    obuti = 1-obuti
                                end
                                Call("SoundLoziska:SetParameter", "obuti", obuti)
                                
                                if plynuleValce_bezBP < 0.05 then
                                    Call("SetControlValue","TrainBrakeControl",0,0)
                                else
                                    Call("SetControlValue","TrainBrakeControl",0,actualTBC)
                                end
                                --Call("*:SetParameter", "WheelAbsoluteSpeed", rychlostKolaPodvozek1)
                                Call("SoundTMpredni:SetParameter", "WheelAbsoluteSpeed", rychlostKolaKMHPodvozek1)
                                Call("SoundTMzadni:SetParameter", "WheelAbsoluteSpeed", rychlostKolaKMHPodvozek2)
                                Call("SoundZdrze:SetParameter", "WheelAbsoluteSpeed", rychlostKolaPodvozek1)
                                Call("SoundLoziska:SetParameter", "WheelAbsoluteSpeed", rychlostKolaPodvozek1)
                                Call("EngineSound:SetParameter", "WheelAbsoluteSpeed", rychlostKolaPodvozek1)

                        ----------------------------------------Smer jako vypinac rizeni--------------------------
                            if Smer > 1.8 then
                                Call("LockControl", "JeSmerVeVypinaci", 0, 0)
                            else
                                Call("LockControl", "JeSmerVeVypinaci", 0, 1)
                            end
                            if Call("GetControlValue", "JeSmerVeVypinaci", 0) == 1 then
                                Call("LockControl", "UserVirtualReverser", 0, 1)
                                Call("LockControl", "VypinacHlavy", 0, 0)
                            else
                                Call("LockControl", "UserVirtualReverser", 0, 0)
                                Call("LockControl", "VypinacHlavy", 0, 1)
                            end

                            if Call("GetControlValue", "VypinacHlavy", 0) > 0.5 then
                                -- if vypnutyVuz then
                                --     SysCall("ScenarioManager:ShowMessage", "Rezim MG", "Vlastni",ALERT)
                                -- end
                                vypnutyVuz = false
                                mgRezim = MG_VLASTNI
                                NastavHodnotuSID("zapnuteVozy",1,460103)
                            else
                                -- if not vypnutyVuz then
                                --     SysCall("ScenarioManager:ShowMessage", "Rezim MG", "Nouzove",ALERT)
                                -- end
                                vypnutyVuz = true
                                mgRezim = MG_NOUZOVY
                                NastavHodnotuSID("zapnuteVozy",0,460103)
                            end
                        ----------------------------------------Ventilatory---------------------------------------
                            if hlavniVypinac == 1 and PC == 3.75 and baterie == 1 and Call("GetControlValue","Reverser",0) ~= 0 and vnitrniSit220V == 1 and not vypnutyVuz and mgs < 0.5 then
                                Call("SetControlValue","VentilatoryTM",0,1)
                                ventilatoryTM = 1
                                if math.abs(Call("GetControlValue", "prerusovanyChodVentilatoru", 0)) > 0.5 then
                                    if Call("GetControlValue","odporstup",0) == 1 and ventilatory_tm_otacky == 1 then
                                        Call("SetControlValue","VentilatoryStrecha",0,1)
                                        ventilatoryStrecha = 1
                                    else
                                        Call("SetControlValue","VentilatoryStrecha",0,0)
                                        ventilatoryStrecha = 0
                                    end
                                elseif ventilatory_tm_otacky == 1 then
                                    Call("SetControlValue","VentilatoryStrecha",0,1)
                                    ventilatoryStrecha = 1
                                end
                            else
                                Call("SetControlValue","VentilatoryTM",0,0)
                                ventilatoryTM = 0
                                Call("SetControlValue","VentilatoryStrecha",0,0)
                                ventilatoryStrecha = 0
                            end

                            if ventilatoryTM == 0 and JOB ~= 0 then
                                Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                ZamekHLvyp = 1
                            end

                            local nabehVentilatoru = 5.852
                            local dobehVentilatoru = 12

                            local poleNabehy = {0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9}

                            local poleDobehy = {1,0.9,0.8,0.7,0.6,0.5,0.4,0.3,0.2,0.1}

                            --TM
                                if ventilatory_tm_otacky == 1 then
                                    blokuj_nabeh_TM = false
                                end
                                if ventilatory_tm_otacky == 0 then
                                    blokuj_dobeh_TM = false
                                end

                                local a, b = divMod(ventilatory_tm_otacky,0.05)

                                local i = 1
                                while i <= 10 do
                                    Call("SetControlValue","VentilatoryTMnabeh"..i,0,0)
                                    Call("SetControlValue","VentilatoryTMdobeh"..i,0,0)
                                    i = i + 1
                                end

                                if ventilatoryTM == 0 then
                                    blokuj_nabeh_TM = false
                                else
                                    blokuj_dobeh_TM = false
                                end

                                if ventilatoryTM == 1 and b < 0.01 and not blokuj_nabeh_TM and ventilatory_tm_otacky <= 0.91 then
                                    local i = 1
                                    while i <= 10 do
                                        if math.abs(ventilatory_tm_otacky - poleNabehy[i]) < 0.01 then
                                            Call("SetControlValue","VentilatoryTMnabeh"..i,0,1)
                                            blokuj_nabeh_TM = true
                                            blokuj_dobeh_TM = false
                                            break 
                                        end
                                        i = i + 1
                                    end
                                elseif ventilatoryTM == 0 and b < 0.01 and not blokuj_dobeh_TM and ventilatory_tm_otacky >= 0.09 then
                                    local i = 1
                                    while i <= 10 do
                                        if math.abs(ventilatory_tm_otacky - poleDobehy[i]) < 0.01 then
                                            Call("SetControlValue","VentilatoryTMdobeh"..i,0,1)
                                            blokuj_dobeh_TM = true
                                            blokuj_nabeh_TM = false
                                            break 
                                        end
                                        i = i + 1
                                    end
                                end

                                if ventilatoryTM == 1 and ventilatory_tm_otacky < 1 then
                                    ventilatory_tm_otacky = ventilatory_tm_otacky + cas/nabehVentilatoru
                                elseif ventilatoryTM == 0 and ventilatory_tm_otacky > 0 then
                                    ventilatory_tm_otacky = ventilatory_tm_otacky - cas/dobehVentilatoru
                                end

                                Call("SetControlValue","VentilatoryTMotacky",0,ventilatory_tm_otacky)

                                if ventilatory_tm_otacky < 0 then
                                    ventilatory_tm_otacky = 0
                                elseif ventilatory_tm_otacky > 1 then
                                    ventilatory_tm_otacky = 1
                                end

                            --Strecha
                                if ventilatory_strecha_otacky == 1 then
                                    blokuj_nabeh_strecha = false
                                end
                                if ventilatory_strecha_otacky == 0 then
                                    blokuj_dobeh_strecha = false
                                end

                                local a, b = divMod(ventilatory_strecha_otacky,0.05)

                                local i = 1
                                while i <= 10 do
                                    Call("SetControlValue","VentilatoryStrechaNabeh"..i,0,0)
                                    Call("SetControlValue","VentilatoryStrechaDobeh"..i,0,0)
                                    i = i + 1
                                end

                                if ventilatoryStrecha == 0 then
                                    blokuj_nabeh_strecha = false
                                else
                                    blokuj_dobeh_strecha = false
                                end

                                if ventilatoryStrecha == 1 and b < 0.01 and not blokuj_nabeh_strecha and ventilatory_strecha_otacky <= 0.91 then
                                    local i = 1
                                    while i <= 10 do
                                        if math.abs(ventilatory_strecha_otacky - poleNabehy[i]) < 0.01 then
                                            Call("SetControlValue","VentilatoryStrechaNabeh"..i,0,1)
                                            blokuj_nabeh_strecha = true
                                            blokuj_dobeh_strecha = false
                                            break 
                                        end
                                        i = i + 1
                                    end
                                elseif ventilatoryStrecha == 0 and b < 0.01 and not blokuj_dobeh_strecha and ventilatory_strecha_otacky >= 0.09 then
                                    local i = 1
                                    while i <= 10 do
                                        if math.abs(ventilatory_strecha_otacky - poleDobehy[i]) < 0.01 then
                                            Call("SetControlValue","VentilatoryStrechaDobeh"..i,0,1)
                                            blokuj_dobeh_strecha = true
                                            blokuj_nabeh_strecha = false
                                            break 
                                        end
                                        i = i + 1
                                    end
                                end

                                if ventilatoryStrecha == 1 and ventilatory_strecha_otacky < 1 then
                                    ventilatory_strecha_otacky = ventilatory_strecha_otacky + cas/nabehVentilatoru
                                elseif ventilatoryStrecha == 0 and ventilatory_strecha_otacky > 0 then
                                    ventilatory_strecha_otacky = ventilatory_strecha_otacky - cas/dobehVentilatoru
                                end

                                Call("SetControlValue","VentilatoryStrechaOtacky",0,ventilatory_strecha_otacky)

                                if ventilatory_strecha_otacky < 0 then
                                    ventilatory_strecha_otacky = 0
                                elseif ventilatory_strecha_otacky > 1 then
                                    ventilatory_strecha_otacky = 1
                                end

                        ----------------------------------------Vypnuti HV v jizde pri tlaku----------------------
                            if JOB > 0 and Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 3.2 then
                                Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                ZamekHLvyp = 1
                            end

                        ----------------------------------------Vypnuti HV pri stazeni na stupnich----------------
                            if vykon ~= 0 and povel_VirtualPantographControl < 0.5 then
                                Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                ZamekHLvyp = 1
                            end

                        ----------------------------------------Snizeny vykon-------------------------------------
                            if Call("GetControlValue","snizenyvykonanim",0) == 1 and RizenaRidici == "ridici" then
                                Call("SetControlValue","SnizenyVykon",0,1)
                                snizenyVykonTady = true
                            elseif snizenyVykonTady then
                                snizenyVykonTady = false
                                Call("SetControlValue","SnizenyVykon",0,0)
                            end
                            zavedSnizenyVykon = false
                            if Call("GetControlValue","snizenyvykonanim",0) == 0 and Call("GetControlValue","SnizenyVykon",0) == 1 then
                                if Call("GetControlValue","VykonPredTrCh",0) <= 0 then
                                    SnizenyVykonVozu = true
                                else
                                    zavedSnizenyVykon = true
                                end
                            else
                                SnizenyVykonVozu = false
                            end
                        ----------------------------------------Brzdic zamek--------------------------------------
                            if (Call("GetControlValue","ZamekBS2vs",0) ~= 1 or gKlicTady) and Call("GetControlValue","VirtualBrake",0) > 0.82 and Call("GetControlValue","VirtualBrake",0) < 0.93 then
                                Call("LockControl","ZamekBS2",0,0)
                            else
                                Call("LockControl","ZamekBS2",0,1)
                            end
                            if Call("GetControlValue","ZamekBS2",0) == 0 then
                                Call("SetControlValue","ZamekBS2vs",0,1)
                                Call("LockControl","VirtualBrake",0,0)
                                gKlicTady = true
                            elseif Call("GetControlValue","ZamekBS2",0) == 1 and gKlicTady then
                                Call("SetControlValue","ZamekBS2vs",0,0)
                                gKlicTady = false
                            end
                            if Call("GetControlValue","ZamekBS2",0) ~= 0 then
                                Call("LockControl","VirtualBrake",0,1)
                            end
                        ----------------------------------------Nouzové vypnutí všech HV--------------------------
                            if Call("GetControlValue","NZvyp",0) >= 0.5 then
                                Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                Call ( "SetControlValue", "povel_HlavniVypinac", 0, 0)
                                ZamekHLvyp = 1
                            end
                        ----------------------------------------Matrosov------------------------------------------
                            if Call("GetControlValue","Matrosov",0) >= 0.5 then
                                matrosov = true
                            else
                                matrosov = false
                            end
                        ----------------------------------------Rychlý start--------------------------------------
                            if pozadavekNaFastStart == 1 and not jeMrtva then
                                ridici_tlak = 5.0
                                tlak_HP = 5.0
                                navoleny_tlak = 5.0
                                nastaveneValce = 0
                                plynuleValce = 0
                                Call("SetControlValue","ZamekBS2",0,0)
                                Call("SetControlValue","ZamekBS2vs",0,1)
                                Call("SetControlValue","VirtualBrake",0,0.1)
                                VirtualMainReservoirPressureBAR = 10
                                VirtualDistributorReservoirPressureBAR = 5
                                gKlicTady = true
                                RizenaRidici = "ridici"
                                Call("SetControlValue","prepinacBat",0,1)
                                baterie = 1
                                Call("SetControlValue","VirtualPantographControl",0,1)
                                Call ("SetControlValue", "PantoZadni", 0,3.75) 
                                ZP = 3.75
                                PC = 3.75
                                Call("SendConsistMessage",460101,"1",1)
                                Call("SendConsistMessage",460111,"Z",1)
                                Call("SetControlValue","UserVirtualReverser",0,0)
                                Smer = 0
                                Call("SetControlValue","Reverser",0,0)
                                Call("SetControlValue","mgp",0,1)
                                mgp = 1
                                pocetMG = decToBitsCount(pocetJimek)
                                Call("SetControlValue","mg",0,pocetJimek)
                                Call("SetControlValue","mgVS",0,pocetJimek)
                                NastavHodnotuSID("mgPriprava",1,460116)
                                Call("SetControlValue","mgZvuk",0,1)
                                mg = 1
                                NastavHodnotuSID("mg",1,460118)
                                napetiVS220 = 380 
                                napetiVS220nouz = 380
                                Call("SetControlValue","VirtualStartup",0,0.75)
                                Call ( "SetControlValue", "HlavniVypinac", 0, 1)
                                Call ( "SetControlValue", "povel_HlavniVypinac", 0, 1)
                                Call("SetControlValue","HlKompPrep",0,1)
                                Call("SetControlValue","DvereLeveSignal",0,0)
                                Call("SetControlValue","DverePraveSignal",0,0)
                                LVZ(0,0,0,0)
                                klic = 1
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                Call("SetControlValue","VirtualBrakeSettedPressureBAR",0,navoleny_tlak)
                                Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,navoleny_tlak)
                                Call("SetControlValue","VirtualDistributorControlReservoirPressureBAR",0,ridici_tlak)
                                Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
                                Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValce)
                                Call("SetControlValue","VirtualDistributorReservoirPressureBAR",0,VirtualDistributorReservoirPressureBAR)
                                Call("SetControlValue","PantoJimka",0,4)
                                Call("SetControlValue","EngineBrakeControl",0,0)
                                Call("SetControlValue","HandBrake",0,0);
                                levaPozBilVPKC = false
                                pravaPozBilVPKC = false
                                if predMasinou == 0 then
                                    levaPozBilVPKC = true
                                    pravaPozBilVPKC = true
                                    horniPozBilVKPC = true
                                    Call("SetControlValue","VolbaPozicKonecCelo",0,0)
                                end
                                levaPozCerVPKC = false
                                pravaPozCerVPKC = false
                                PantoJimkaZKom = 4
                                Call("SetControlValue","mgautostart",0,1)
                                Call("SetControlValue", "LVZrezim", 0, 0)
                                Call("SetControlValue", "LVZhv", 0, 1)
                                releEPV = true
                                kontrolaBdelosti = true
                                soupatkoVZ = 0
                                gZadniSmetak = 1
                                gPredniSmetak = 1
                                Call("SetControlValue","FastStart",0,0)
                                pozadavekNaFastStart = 0
                                SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_FAST_START,ALERT)
                            elseif pozadavekNaFastStart == 1 and jeMrtva then
                                SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_NEUSPESNY_FAST_START,ALERT)
                                pozadavekNaFastStart = 0
                                Call("SetControlValue","FastStart",0,0)
                            elseif pozadavekNaFastStart == 2 and not jeMrtva then
                                horniPozBilVKPC = false
                                levaPozBilVPKC = false
                                pravaPozBilVPKC = false
                                levaPozCerVPKC = false
                                pravaPozCerVPKC = false
                                if predMasinou == 0 then
                                    levaPozCerVPKC = true
                                    pravaPozCerVPKC = true
                                    Call("SetControlValue","VolbaPozicKonecCelo",0,2)
                                end
                                ridici_tlak = 5.0
                                tlak_HP = 5.0
                                navoleny_tlak = 5.0
                                nastaveneValce = 0
                                plynuleValce = 0
                                Call("SetControlValue","prepinacBat",0,1)
                                baterie = 1
                                Call("SetControlValue","VirtualPantographControl",0,1)
                                if modelConfig[scriptVersion].ctyriSberace then Call ("SetControlValue", "PantoPredni", 0,3.75) PP = 3.75 else Call ("SetControlValue", "PantoZadni", 0,3.75) ZP = 3.75 end
                                PC = 3.75
                                Call("SetControlValue", "LVZrezim", 0, 1)
                                Call("SetControlValue","EngineBrakeControl",0,0)
                                Call("SetControlValue","HandBrake",0,0)
                                Call("SetControlValue","VirtualStartup",0,0)
                                klic = 0
                                Call("SendConsistMessage",460101,"0",1)
                                VirtualMainReservoirPressureBAR = 10
                                VirtualDistributorReservoirPressureBAR = 5
                                Call ( "SetControlValue", "HlavniVypinac", 0, 1)
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                Call("SetControlValue","VirtualBrakeSettedPressureBAR",0,navoleny_tlak)
                                Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,ridici_tlak)
                                Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,navoleny_tlak)
                                Call("SetControlValue","VirtualBrakePipePressureBAR",0,tlak_HP)
                                Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValce)
                                Call("SetControlValue","VirtualDistributorReservoirPressureBAR",0,VirtualDistributorReservoirPressureBAR)
                                Call("SetControlValue","PantoJimka",0,3.11)
                                Call("SetControlValue","mgZvuk",0,1)
                                mg = 1
                                NastavHodnotuSID("mg",1,460118)
                                napetiVS220 = 380 
                                napetiVS220nouz = 380
                                PantoJimkaZKom = 3.11
                                Call("SetControlValue","mgautostart",0,1)
                                gZadniSmetak = 1
                                gPredniSmetak = 1
                                Call("SetControlValue","FastStart",0,0)
                                pozadavekNaFastStart = 0
                            elseif pozadavekNaFastStart == 2 and jeMrtva then
                                SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, ZPRAVA_NEUSPESNY_FAST_START,ALERT)
                                pozadavekNaFastStart = 0
                                Call("SetControlValue","FastStart",0,0)
                            end
                        ----------------------------------------JOB-----------------------------------------------
                            if RizenaRidici == "ridici" then
                                if kontroler > 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 then
                                    Call("SetControlValue","JOBpovel",0,1)
                                elseif kontroler < 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 and casOJ < 1 then
                                    Call("SetControlValue","JOBpovel",0,-1)
                                elseif Call("GetControlValue","VykonPredTrCh",0) == 0 or baterie == 0 then
                                    Call("SetControlValue","JOBpovel",0,0)
                                end
                            end
                            if Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 and ventilatoryTM == 1 and P01 == 1 and Call("GetControlValue","JOBpovel",0) == 1 and not vypnutyVuz then
                                Call("SetControlValue","JOB",0,1)
                            elseif Call("GetControlValue","VykonPredTrCh",0) == 0 and baterie == 1 and ventilatoryTM == 1 and Call("GetControlValue","JOBpovel",0) == -1 and not vypnutyVuz then
                                Call("SetControlValue","JOB",0,-1)
                            elseif Call("GetControlValue","VykonPredTrCh",0) == 0 or ventilatoryTM == 0 or baterie == 0 or P01 ~= 1 or Call("GetControlValue","JOBpovel",0) == 0 or vypnutyVuz then
                                Call("SetControlValue","JOB",0,0)
                            end

                            if (Call("GetControlValue","JOB",0) ~= 0 or pojezdVDepu) and not SnizenyVykonVozu then
                                Call("SetControlValue","PantographControl",0,1)
                            else
                                Call("SetControlValue","PantographControl",0,0)
                            end

                            if Ammeter > 600 and JOB == 0 and JOBold ~= 0 then
                                VypniHVaVynutRestart()
                            end
                        ----------------------------------------Pojezd v depu-------------------------------------
                            if PC == 0 and baterie == 1 and centrala == 1 and JOB == 0 and buttonPojezdVDepu > 0.75 then
                                pojezdVDepu = true
                                Call("SetControlValue","VykonPredTrCh",0,0.01)
                                Call("SetControlValue","StykacPojezd",0,1)
                            else
                                pojezdVDepu = false
                                Call("SetControlValue","StykacPojezd",0,0)
                            end
                        ----------------------------------------Okenka a zvuky deste------------------------------
                            okna = (Call("GetControlValue","OknoL",0)+Call("GetControlValue","OknoP",0))/2

                            local pocasiZamlzeni = 0
                            if SysCall("WeatherController:GetPrecipitationDensity") > 0 or SysCall("ScenarioManager:GetSeason") == 3 then
                                pocasiZamlzeni = 1
                            end

                            if Call("GetControlValue", "rozmrazovace", 0) > 0.5 and baterie == 1 then
                                ohrevLevePredni = math.max(ohrevLevePredni-(0.016*cas),0)
                                ohrevPravePredni = math.max(ohrevPravePredni-(0.016*cas),0)
                                
                                ohrevLeve = math.max(ohrevLeve-(0.0017*cas),0)
                                ohrevPrave = math.max(ohrevPrave-(0.0017*cas),0)
                            else
                                ohrevLevePredni = math.min(ohrevLevePredni+(0.001*cas),1)
                                ohrevPravePredni = math.min(ohrevPravePredni+(0.001*cas),1)
                                
                                ohrevLeve = math.min(ohrevLeve+(0.001*cas),1)
                                ohrevPrave = math.min(ohrevPrave+(0.001*cas),1)
                            end

                            Call("SetControlValue", "zamlzeniLeveDvere", 0, math.min(pocasiZamlzeni, ohrevPrave))
                            Call("SetControlValue", "zamlzeniLeve", 0, math.min(pocasiZamlzeni, ohrevLeve))
                            Call("SetControlValue", "zamlzeniLevePredni", 0, math.min(pocasiZamlzeni, ohrevLevePredni))
                            Call("SetControlValue", "zamlzeniPravePredni", 0, math.min(pocasiZamlzeni, ohrevPravePredni))
                            Call("SetControlValue", "zamlzeniPrave", 0, math.min(pocasiZamlzeni, ohrevPrave))
                            Call("SetControlValue", "zamlzeniPraveDvere", 0, math.min(pocasiZamlzeni, ohrevPrave))
                            
                            if SysCall("WeatherController:GetPrecipitationDensity") > 0 then
                                if SysCall("WeatherController:GetCurrentPrecipitationType") < 2 then
                                    if venku then
                                        Call("EngineSound:SetParameter", "DestIn", 0)
                                        Call("EngineSound:SetParameter", "DestExOkno", 0)
                                        Call("EngineSound:SetParameter", "DestEx", 1)
                                        Call("EngineSound:SetParameter", "Kroupy", 0)
                                    else
                                        Call("EngineSound:SetParameter", "DestIn", 1)
                                        Call("EngineSound:SetParameter", "DestExOkno", 1)
                                        Call("EngineSound:SetParameter", "DestEx", 0)
                                        Call("EngineSound:SetParameter", "Kroupy", 0)
                                    end
                                elseif SysCall("WeatherController:GetCurrentPrecipitationType") == 2 then
                                    if venku then
                                        Call("EngineSound:SetParameter", "DestIn", 0)
                                        Call("EngineSound:SetParameter", "DestExOkno", 0)
                                        Call("EngineSound:SetParameter", "DestEx", 1)
                                    else
                                        Call("EngineSound:SetParameter", "DestIn", 0)
                                        Call("EngineSound:SetParameter", "DestExOkno", 0)
                                        Call("EngineSound:SetParameter", "DestEx", 0)
                                        if SysCall("WeatherController:GetPrecipitationDensity") > 0.5 then
                                            Call("EngineSound:SetParameter", "Kroupy", 2)
                                        else
                                            Call("EngineSound:SetParameter", "Kroupy", 1)
                                        end
                                    end
                                else
                                    Call("EngineSound:SetParameter", "DestIn", 0)
                                    Call("EngineSound:SetParameter", "DestExOkno", 0)
                                    Call("EngineSound:SetParameter", "DestEx", 0)
                                    Call("EngineSound:SetParameter", "Kroupy", 0)
                                end
                            else
                                Call("EngineSound:SetParameter", "DestIn", 0)
                                Call("EngineSound:SetParameter", "DestExOkno", 0)
                                Call("EngineSound:SetParameter", "DestEx", 0)
                                Call("EngineSound:SetParameter", "Kroupy", 0)
                            end
                            if not vOddile then
                                Call("EngineSound:SetParameter", "OknaOcclusion", okna)
                            else
                                Call("EngineSound:SetParameter", "OknaOcclusion", 0)
                            end
                        ----------------------------------------Vnitrni sit---------------------------------------
                            mgZvuk = Call("GetControlValue","mgZvuk",0)
                            if mgZvuk == 1 and napeti ~= 0 and napetiVS220 < 380 then
                                napetiVS220 = napetiVS220 + cas * 100
                            elseif (mgZvuk == 0 or napeti == 0) and napetiVS220 > 0 then
                                napetiVS220 = napetiVS220 - cas * 10
                            end
                            if napetiVS220 > 350 and mgdocasny == 0 and mg == 1 then
                                vnitrniSit220V = 1
                            else
                                vnitrniSit220V = 0
                            end
                            Call("SetControlValue","VnitrniSit",0,napetiVS220)

                            if Call("GetControlValue","mgVS",0) > 0 and napetiVS220nouz < 380 then
                                napetiVS220nouz = napetiVS220nouz + cas * 100
                            elseif Call("GetControlValue","mgVS",0) == 0 and napetiVS220nouz > 0 then
                                napetiVS220nouz = napetiVS220nouz - cas * 10
                            end
                            
                            if ((napetiVS220 > 350 and mg == 1 and (mgRezim == MG_VLASTNI or mgRezim == MG_NOUZOVY)) or (napetiVS220nouz > 350 and Call("GetControlValue","mgVS",0) > 0 and mgRezim == MG_SOUSEDNI and vypnutyVuz)) and mgdocasny == 0 then
                                vnitrniSit220Vnouzova = 1
                            else
                                vnitrniSit220Vnouzova = 0
                            end
                            Call("SetControlValue","VnitrniSitNouzova",0,math.max(napetiVS220nouz,napetiVS220))

                            odberVS = 0
                            if ventilatoryTM == 1 then
                                odberVS = odberVS + math.min(20/math.min(ventilatory_tm_otacky*8,1),60)
                            end
                            if ventilatoryStrecha == 1 then
                                odberVS = odberVS + math.min(20/math.min(ventilatory_strecha_otacky*8,1),60)
                            end
                            if casKompresor >= 0 then
                                odberVS = odberVS + math.min(30/casKompresor,150)
                            end

                            if odberVS > odberVSsmooth then
                                odberVSsmooth = odberVSsmooth + math.sqrt(odberVS - odberVSsmooth) * cas * 50
                            elseif odberVSsmooth > odberVS then
                                odberVSsmooth = odberVSsmooth - math.sqrt(odberVSsmooth - odberVS) * cas * 50
                            end
                            Call("SetControlValue", "VnitrniSitProud", 0, odberVSsmooth)
                        
                        ----------------------------------------Custom TrCh---------------------------------------
                            Call("SetControlValue","ThrottleAndBrake",0,output_kN/gAbsolutniMax_kN)
                            vykon = Call("GetControlValue","VykonPredTrCh",0)
                        ----------------------------------------Custom Ampermetr----------------------------------
                            Call("SetControlValue","Ampermetr",0,VratProud(VratTCh(Call("GetControlValue","VykonPredTrCh",0),rychlostKolaPodvozek1),Call("GetControlValue","VykonPredTrCh",0),rychlostKolaPodvozek1))
                            Ammeter = Call("GetControlValue","Ampermetr",0)
                            if not fiktivniVykonNaRizeneNeschopne and Call("GetControlValue", "Ammeter", 0) ~= 0 then
                                -- Call("SetControlTargetValue","VirtualAmmeter",0,Call("GetControlValue","Ampermetr",0))
                                Call("SetControlValue","VirtualAmmeter",0,PIDcntrlAmp(Call("GetControlValue", "Reverser", 0)*Call("GetControlValue","Ampermetr",0),Call("GetControlValue","VirtualAmmeter",0)))
                            else
                                Call("SetControlValue","VirtualAmmeter",0,PIDcntrlAmp(0,Call("GetControlValue","VirtualAmmeter",0)))
                            end
                        
                        ----------------------------------------VOLTMETR------------------------------------------
                            for k, v in tabulkaNapeti do
                                oldTabulkaNapeti = tabulkaNapeti[k]
                                if otocPovely then
                                    tabulkaNapeti[k] = {oldTabulkaNapeti[1] + Call("GetSpeed") * casHry, oldTabulkaNapeti[2], oldTabulkaNapeti[3]}
                                else
                                    tabulkaNapeti[k] = {oldTabulkaNapeti[1] - Call("GetSpeed") * casHry, oldTabulkaNapeti[2], oldTabulkaNapeti[3]}
                                end

                                if tabulkaNapeti[k][1] >= 0 and oldTabulkaNapeti[1] < 0 then
                                    idealniNapeti = tabulkaNapeti[k][2]
                                elseif tabulkaNapeti[k][1] <= 0 and oldTabulkaNapeti[1] > 0 then
                                    idealniNapeti = tabulkaNapeti[k][3]
                                end
                            end

                            if math.abs(napetiTargetDelta - napetiDelta) < 1 then
                                napetiTargetDelta = math.random()*700-400
                                napetiDeltaSpeed = math.random(1,20)
                            end
                            if napetiTargetDelta > napetiDelta then
                                napetiDelta = napetiDelta + napetiDeltaSpeed*cas
                            else
                                napetiDelta = napetiDelta - napetiDeltaSpeed*cas
                            end

                            if math.abs(tvrdostNapetiTarget - tvrdostNapeti) < 1 then
                                tvrdostNapetiTarget = math.random()*500
                            end
                            if tvrdostNapetiTarget > tvrdostNapeti then
                                tvrdostNapeti = tvrdostNapeti + 1*cas
                            else
                                tvrdostNapeti = tvrdostNapeti - 1*cas
                            end

                            local vychoziNapeti = idealniNapeti
                            if vychoziNapeti == 0 then
                                napeti = 0
                            else
                                if not fiktivniVykonNaRizeneNeschopne and Ammeter > 0 then
                                    napeti = ((vychoziNapeti - (Ammeter*tvrdostNapeti/400)) + napetiDelta) / 4
                                else
                                    napeti = (vychoziNapeti + napetiDelta) / 4
                                end
                            end
                            if P01 == 1 and not pojezdVDepu then
                                Call("SetControlValue","Napeti",0,napeti)
                                Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(napeti,Call("GetControlValue","Voltmeter",0)))
                            else
                                Call("SetControlValue","Voltmeter",0,PIDcntrlVolt(0,Call("GetControlValue","Voltmeter",0)))
                                Call("SetControlValue","Napeti",0,0)
                            end

                            if napeti > 1250 and mgZvuk == 1 then
                                zkratMG = true
                            end
                            
                        ----------------------------------------Diagnostický panel a ochrany----------------------
                            local stridaveNap = ToBolAndBack(vnitrniSit220Vnouzova)
                            if stridaveNap and baterie == 1 then
                                --*******H6 SIT220V
                                    Call("SetControlValue","Diag_220V",0,0) -- H6
                                    
                                --*******H7 vypHV
                                    local diagHV = 0
                                    if ZamekHLvyp == 1 then
                                        diagHV = 1
                                    end
                                    Call("SetControlValue","Diag_HV",0,diagHV) -- H7
                                
                                --*******H8 VENTILATORY
                                    local diagVentilatoryBeh = 0
                                    if ventilatoryTM == 1 and ventilatory_tm_otacky < NABEH_VENTILATORY then
                                        diagVentilatoryBeh = 1
                                    end
                                    Call("SetControlValue","Diag_Ventilatory",0,diagVentilatoryBeh) -- H8
                                
                                --*******H9 AREL
                                    local diagArel = 0
                                    Call("SetControlValue","Diag_AREL",0,diagArel) -- H9
                                
                                --*******H10 USMERNOVAC
                                    local diagPretaveni = 0
                                    Call("SetControlValue","Diag_Pretaveni",0,diagPretaveni) -- H10
                                
                                --*******H11 NU
                                    -- if Call("GetControlValue","Napeti",0) > 925 then --3700V
                                    --     diagNU = 1
                                    --     Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                    --     ZamekHLvyp = 1
                                    -- elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                    --     diagNU = 0
                                    -- end
                                    --Prepetova ochrana KTM
                                        if ((rychlostKolaKMHPodvozek1 > 100 or rychlostKolaKMHPodvozek2 > 100) and kontroler < -0.75) then
                                            blokKrokNU = true
                                            diagKTM = 1
                                        elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                            blokKrokNU = false
                                            diagKTM = 0
                                        end
                                    Call("SetControlValue","Diag_NU",0,math.max(diagNU, diagKTM)) -- H11
                                
                                --*******H12 PU
                                    if Call("GetControlValue","Napeti",0) < 525 and vykon ~= 0 then --2100V
                                        diagPU = 1
                                        if Call("GetControlValue","Diag_PU",0) == 0 and P01 == 1 then
                                            Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                            ZamekHLvyp = 1
                                        end
                                    elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                        diagPU = 0
                                    end
                                    Call("SetControlValue","Diag_PU",0,diagPU) -- H12
                                
                                --*******H13 DOTO
                                    if zkratTM and not fiktivniVykonNaRizeneNeschopne and math.abs(Call("GetControlValue", "VirtualAmmeter", 0)) > 50 then
                                        diagDOTO = 1
                                        if Call("GetControlValue","Diag_DOTO",0) == 0 then
                                            Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                            ZamekHLvyp = 1
                                        end
                                    elseif Call("GetControlValue", "vybaveniDOTO", 0) >= 0.5 then --predelat na tlacitko az bude
                                        diagDOTO = 0
                                    end
                                    Call("SetControlValue","Diag_DOTO",0,diagDOTO) -- H13
                                
                                --*******H14 DOPM
                                    if zkratMG and mgZvuk == 1 then
                                        diagMG = 1
                                        if Call("GetControlValue","Diag_DOTO",0) == 0 then
                                            Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                            ZamekHLvyp = 1
                                        end
                                        --Call("GetControlValue","ResetDOPM",0) > 0.75
                                    elseif Call("GetControlValue", "vybaveniDOPM", 0) >= 0.5 then --predelat na tlacitko az bude
                                        diagMG = 0
                                    end
                                    Call("SetControlValue","Diag_DOPM",0,diagMG) -- H14
                                
                                --*******H15 NI
                                    if Ammeter > 840 then
                                        niDiag = 1 
                                        if Call("GetControlValue","Diag_NI",0) == 0 and P01 == 1 then
                                            Call ( "SetControlValue", "HlavniVypinac", 0, 0)
                                            ZamekHLvyp = 1
                                        end
                                    elseif Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                        niDiag = 0
                                    end
                                    Call("SetControlValue","Diag_NI",0,niDiag) -- H15
                                
                                --*******H18 OJ
                                    if (((vykon < 0 or vykon > 0.05) and math.abs(Ammeter) < 0.05) or (Call("GetControlValue", "Ammeter", 0) == 0 and (vykon < 0 or vykon > 0.05) and not pojezdVDepu and Call("GetIsEngineWithKey") == 1) or (SnizenyVykonVozu and JOB == 1)) and not fiktivniVykonNaRizeneNeschopne then
                                        ojDiag = 1
                                        casOJ = casOJ + cas
                                    elseif kontroler <= 0.05 or math.abs(Ammeter) > 0.5 or Call("GetControlValue", "Ammeter", 0) ~= 0 or fiktivniVykonNaRizeneNeschopne then
                                        ojDiag = 0
                                        if kontroler == 0 then
                                            casOJ = 0
                                        end
                                    end
                                    Call("SetControlValue","Diag_OJ",0,ojDiag) -- H18
                                    -- if vykon ~= 0 and Call("GetControlValue", "Current", 0) == 0 then
                                    -- 	SysCall("ScenarioManager:ShowMessage", "460 Debug", "Proud je nula, ale vykon neni nula!", ALERT)
                                    -- end

                                --*******H19 SOUCINOST BRZD
                                    local rbDiag = 0
                                    if releSoucinnostiBrzd then
                                        rbDiag = 1
                                    end
                                    Call("SetControlValue","Diag_RB",0,rbDiag) -- H19
                                
                                --*******H20 UZEMNENI
                                    local uzemneniDiag = 0
                                    Call("SetControlValue","Diag_Uzem",0,uzemneniDiag) -- H20
                                
                                --*******H22 POZICE JOB
                                    local jobDiag = 0
                                    -- if (Call("GetControlValue","VykonPredTrCh",0) > 0 and JOB ~= 1 and not fiktivniVykonNaRizeneNeschopne) or (Call("GetControlValue","VykonPredTrCh",0) == 0 and JOB ~= 0) or (Call("GetControlValue","VykonPredTrCh",0) < 0 and JOB ~= -1 and not fiktivniVykonNaRizeneNeschopne) then
                                    -- 	jobDiag = 1
                                    -- end
                                    if (Call("GetControlValue","VykonPredTrCh",0) >= 0 and kontroler > 0.25 and kontroler < 0.75 and JOB ~= 1 and not fiktivniVykonNaRizeneNeschopne) or (Call("GetControlValue","VykonPredTrCh",0) == 0 and kontroler > -0.25 and kontroler < 0.25 and JOB ~= 0) or (Call("GetControlValue","VykonPredTrCh",0) <= 0 and kontroler < -0.25 and kontroler > -0.75 and JOB ~= -1 and not fiktivniVykonNaRizeneNeschopne) then
                                        jobDiag = 1
                                    end
                                    Call("SetControlValue","Diag_JOB",0,jobDiag) -- H22
                                
                                --*******H24 ROZ PROUD
                                    local rozProudDiag = 0
                                    if Call("GetControlValue", "synchronizacniRele", 0) > 0 then
                                        rozProudDiag = 1
                                    end
                                    Call("SetControlValue","Diag_RozProud",0,rozProudDiag) -- H24
                                --*******Zhasnuti DO a NI pri startu MG
                                    if mgs > 0.5 then
                                        Call("SetControlValue","Diag_DOPM",0,0) -- H14
                                        Call("SetControlValue","Diag_DOTO",0,0) -- H14
                                        Call("SetControlValue","Diag_NI",0,0) -- H14
                                    end
                                --*******ObecnaPorucha a Skluz
                                    if Call("GetControlValue","JOB",0) ~= 0 and Call("GetControlValue","VykonPredTrCh",0) == 0 then
                                        failvykon = 1 
                                    else
                                        failvykon = 0
                                    end
                                    if vnitrniSit220V ~= 1 then
                                        failmg = 1
                                    else
                                        failmg = 0
                                    end
                                    
                                    if (math.abs(rychlost-rychlostKolaKMHPodvozek1) > 5 or math.abs(rychlost-rychlostKolaKMHPodvozek2) > 5 or math.abs(rychlostKolaKMHPodvozek1-rychlostKolaKMHPodvozek2) > 2) and vykon ~= 0 then
                                        casSkluz = casSkluz + cas
                                        if (math.abs(rychlost-rychlostKolaKMHPodvozek1)*casSkluz > prahDSO or math.abs(rychlostKolaKMHPodvozek1-rychlostKolaKMHPodvozek2) > 5) and P01 == 1 then
                                            Call("SetControlValue", "HlavniVypinac", 0, 0)
                                            ZamekHLvyp = 1
                                            nutnyRestartDSO = true
                                        elseif (casstupnu >= caszkroku) and JeNouzovyRadicVS == 0 then
                                            if vykon > 0.05 then
                                                Call("SetControlValue","JizdniKontroler",0,vykon - 0.05)
                                            elseif vykon < -1/modelConfig[scriptVersion].stupneEDB then
                                                Call("SetControlValue","JizdniKontroler",0,vykon + 1/modelConfig[scriptVersion].stupneEDB)
                                            end
                                            casstupnu = 0
                                            caszkroku = (math.random(3,7)/20)
                                        end
                                        skluzDiag = 1
                                        blokKrokSkluz = true
                                    end

                                    if math.abs(rychlost-rychlostKolaKMHPodvozek1) < 1 and hlavniVypinac == 1 then
                                        blokKrokSkluz = false
                                        casSkluz = 0
                                        skluzDiag = 0
                                    end
                                    if Call("GetControlValue", "povel_Reverser", 0) == 0 then --predelat na tlacitko az bude
                                        --if Call("GetControlValue","ResetDOTO",0) > 0.75 then
                                        blokKrokSkluz = false
                                        skluzDiag = 0
                                        casSkluz = 0
                                    end

                                    Call("SetControlValue","fail",0,math.max(math.min(Call("GetControlValue","poruchaVeVlaku",0),1),failmg,failvykon,diagHV,diagVentilatoryBeh,diagArel,diagPretaveni,diagNU,diagPU,skluzDiag,diagDOTO,diagMG,niDiag,ojDiag,uzemneniDiag,jobDiag))
                                    NastavHodnotuSID("skluzVeVlaku",skluzDiag,460107)
                                    Call("SetControlValue","skluz",0,math.min(Call("GetControlValue","skluzVeVlaku",0),1))
                                --*******H5 OBECNA POR NA VLASTNIM
                                    local PoruchaNap = 0
                                    Call("SetControlValue","Diag_Porucha",0,math.max(failmg,failvykon,PoruchaNap,diagHV,diagVentilatoryBeh,diagArel,diagPretaveni,diagNU,diagPU,skluzDiag,diagDOTO,diagMG,niDiag,ojDiag,uzemneniDiag,jobDiag)) -- H5
                                    NastavHodnotuSID("poruchaVeVlaku",Call("GetControlValue","Diag_Porucha",0),460120)
                                --*******Odshuntovani az do odporu
                                    if RizenaRidici == "ridici" then
                                        if HRKzeShuntu and kontroler > 0.25 then
                                            HRKzeShuntu = false
                                            Call("SetControlValue","HlavniVypinac",0,0)
                                            ZamekHLvyp = 1
                                        end
                                        if ridiciKontroler < 0.25 and stupenKontroleru > 17 then
                                            HRKzeShuntu = true
                                        else
                                            HRKzeShuntu = false
                                        end
                                    end
                            elseif baterie == 1 then
                                Call("SetControlValue","fail",0,1)
                                Call("SetControlValue","skluz",0,1)
                                NastavHodnotuSID("skluzVeVlaku",1,460107)
                                NastavHodnotuSID("poruchaVeVlaku",1,460120)
                                Call("SetControlValue","Diag_Porucha",0,1) -- H5
                                Call("SetControlValue","Diag_220V",0,1) -- H6
                                Call("SetControlValue","Diag_HV",0,1) -- H7
                                Call("SetControlValue","Diag_RozProud",0,1) -- H24
                                if ZamekHLvyp == 0 then
                                    Call("SetControlValue","Diag_NU",0,1) -- H11
                                    Call("SetControlValue","Diag_PU",0,1) -- H12
                                    Call("SetControlValue","Diag_OJ",0,1) -- H18
                                    if mgs > 0.5 then
                                        Call("SetControlValue","Diag_DOTO",0,0) -- H13
                                        Call("SetControlValue","Diag_DOPM",0,0) -- H14
                                        Call("SetControlValue","Diag_NI",0,0) -- H15
                                    else
                                        Call("SetControlValue","Diag_DOTO",0,1) -- H13
                                        Call("SetControlValue","Diag_DOPM",0,1) -- H14
                                        Call("SetControlValue","Diag_NI",0,1) -- H15
                                    end
                                elseif diagPU == 1 then
                                    Call("SetControlValue","Diag_PU",0,1) -- H12
                                    if Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                        diagPU = 0
                                    end
                                elseif skluzDiag == 1 then
                                    if Call("GetControlValue", "povel_Reverser", 0) == 0 then --predelat na tlacitko az bude
                                        --if Call("GetControlValue","ResetDOTO",0) > 0.75 then
                                        blokKrokSkluz = false
                                        skluzDiag = 0
                                        casSkluz = 0
                                    end
                                elseif niDiag == 1 then
                                    if mgs > 0.5 then
                                        Call("SetControlValue","Diag_NI",0,0) -- H15
                                    else
                                        Call("SetControlValue","Diag_NI",0,1) -- H15
                                    end
                                    if Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                        niDiag = 0
                                    end
                                elseif diagDOTO == 1 then
                                    if mgs > 0.5 then
                                        Call("SetControlValue","Diag_DOTO",0,0) -- H12
                                    else
                                        Call("SetControlValue","Diag_DOTO",0,1) -- H12
                                    end
                                    if Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                        diagDOTO = 0
                                    end
                                elseif diagMG == 1 then
                                    if mgs > 0.5 then
                                        Call("SetControlValue","Diag_DOPM",0,0) -- H12
                                    else
                                        Call("SetControlValue","Diag_DOPM",0,1) -- H12
                                    end
                                    if Call("GetControlValue", "povel_Reverser", 0) == 0 then
                                        diagMG = 0
                                    end
                                end
                            else
                                nutnyRestartDSO = false
                                ZamekHLvyp = 0
                                diagNU = 0
                                diagKTM = 0
                                diagPU = 0
                                skluzDiag = 0
                                diagDOTO = 0
                                niDiag = 0
                                ojDiag = 0
                                casOJ = 0
                                Call("SetControlValue","Diag_220V",0,0) -- H6
                                Call("SetControlValue","Diag_HV",0,0) -- H7
                                Call("SetControlValue","Diag_Ventilatory",0,0) -- H8
                                Call("SetControlValue","Diag_AREL",0,0) -- H9
                                Call("SetControlValue","Diag_Pretaveni",0,0) -- H10
                                Call("SetControlValue","Diag_NU",0,diagNU) -- H11
                                Call("SetControlValue","Diag_PU",0,diagPU) -- H12
                                Call("SetControlValue","Diag_DOTO",0,diagDOTO) -- H13
                                Call("SetControlValue","Diag_DOPM",0,0) -- H14
                                Call("SetControlValue","Diag_NI",0,niDiag) -- H15
                                Call("SetControlValue","Diag_OJ",0,ojDiag) -- H18
                                Call("SetControlValue","Diag_RB",0,0) -- H19
                                Call("SetControlValue","Diag_Uzem",0,0) -- H20
                                Call("SetControlValue","Diag_JOB",0,0) -- H22
                                Call("SetControlValue","Diag_RozProud",0,0) -- H24
                                Call("SetControlValue","fail",0,0)
                                Call("SetControlValue","skluz",0,0)
                                Call("SetControlValue","Diag_Porucha",0,0) -- H5
                            end
                            if Call("GetControlValue", "startDSO", 0) >= 0.5 and baterie == 1 then
                                nutnyRestartDSO = false
                            end
                    end
                end
                --######################################################################################--
                ----------------------------------------KONEC gásti řízené userem-------------------------
                --######################################################################################--
            elseif not UzJsiZjistovalPanto then
                speedms = math.abs(Call("GetSpeed"))
                speedkmh = speedms*3.6
                Call("MSVstart:ActivateNode","MSVstart",0)
                Call("MSVstart2:ActivateNode","MSVstart",0)
                Call("SoundTMpredni:SetParameter", "WheelAbsoluteSpeed", speedkmh)
                Call("SoundTMzadni:SetParameter", "WheelAbsoluteSpeed", speedkmh)
                Call("SoundZdrze:SetParameter", "WheelAbsoluteSpeed", speedms)
                Call("SoundLoziska:SetParameter", "WheelAbsoluteSpeed", speedms)
                Call("EngineSound:SetParameter", "WheelAbsoluteSpeed", speedms)
                Call("*:SetParameter", "WheelAbsoluteSpeed", speedms)
                IS.stav = "sleep"
                IS:NastavCil1(1)
                IS:NastavCil2(1)
                IS:NastavLinku(1)
                Call("SetControlValue","AI",0,1)
                Call("SetControlValue","AbsolutniRychlomer",0,speedkmh)
                deltaSpeedMinula = deltaSpeed
                deltaSpeed = Call("GetSpeed")
                local reflektorAI = false
                Call("SetControlValue", "DeltaSpeed", 0, math.abs(deltaSpeed) - math.abs(deltaSpeedMinula))
                if predMasinou == 0 and not jeMrtva then
                    SvetlaAI = 1
                else
                    SvetlaAI = 0
                end
                if deltaSpeed > 0.01 then
                    SmerAI = 1
                elseif deltaSpeed < -0.01 then
                    SmerAI = -1
                elseif not jeMrtva then
                    reflektorAI = false
                end
                if not jeMrtva then
                    if not modelConfig[scriptVersion].ctyriSberace then
                        Call ("SetTime","ZadniSberac",3.75)
                    elseif SmerAI == -1 then 
                        Call ("SetTime","PredniSberac",3.75)
                        Call ("SetTime","ZadniSberac",0)
                    else
                        Call ("SetTime","PredniSberac",0)
                        Call ("SetTime","ZadniSberac",3.75)
                    end
                else
                    Call ("SetTime","ZadniSberac",0)
                    if modelConfig[scriptVersion].ctyriSberace then
                        Call ("SetTime","PredniSberac",0)
                    end
                end
                -- ZpravaDebug(Call("PlayerEngine:GetControlValue", "Headlights", 0))
                if SvetlaAI == 1 then
                    if math.abs(deltaSpeed) > 0.1 then
                        ujeteMetryAI = ujeteMetryAI + (math.abs(deltaSpeed)*cas)
                        if ujeteMetryAI > 100 then
                            reflektorAI = true
                        end
                        pX, _, pY = SysCall("PlayerEngine:getNearPosition") or 0,0,0
                        x, _, y = Call("*:getNearPosition")
                        vzdalenostAIlast = vzdalenostAI
                        vzdalenostAI = math.sqrt((pX-x)^2+(pY-y)^2)
                        if vzdalenostAI < 300 then
                            reflektorAI = false
                            if 0 >= 0.5 then --Call("PlayerEngine:GetControlValue", "Headlights", 0) or
                                casPlayerReflektor = casPlayerReflektor + cas
                                if (casPlayerReflektor > 4 and casPlayerReflektor < 5) or casPlayerReflektor > 8 then
                                    reflektorAI = true
                                end
                            else
                                casPlayerReflektor = 0
                            end
                        else
                            casPlayerReflektor = 0
                        end
                        if vzdalenostAIlast < vzdalenostAI and vzdalenostAI > 100 then
                            reflektorAI = true
                        end
                    else
                        ujeteMetryAI = 0
                        casPlayerReflektor = 0
                        reflektorAI = false
                    end
                    if SmerAI == -1 then
                        Call ( "DalkovePrave:Activate", 0 )
                        Call ( "DalkoveLeve:Activate", 0 )
                        Call ( "ActivateNode","dalkaclevy",0)
                        Call ( "ActivateNode","dalkacpravy",0)
                        Call ( "ActivateNode","reflektor_rozsviceny",0)
                        if modelConfig[scriptVersion].horniPozicka then
                            Call ( "PozickaHorniBi:Activate", 0 )
                        else
                            Call ( "DalkoveHorni1:Activate", 0 )
                            Call ( "DalkoveHorni2:Activate", 0 )
                        end
                        Call ( "PozickaLevaBi:Activate", 0 )
                        Call ( "PozickaLevaCr:Activate", 1 )
                        Call ( "PozickaPravaBi:Activate", 0 )
                        Call ( "PozickaPravaCr:Activate", 1 )
                        Call ( "ActivateNode", "pozickalevaBi", 0 ) 
                        Call ( "ActivateNode", "pozickalevaCr", 1 ) 
                        Call ( "ActivateNode", "pozickapravaBi", 0 ) 
                        Call ( "ActivateNode", "pozickapravaCr", 1 ) 
                    elseif SmerAI == 1 then
                        if SysCall("ScenarioManager:GetSeason") ~= 3 then
                            if dennicas < 063000 or dennicas > 220000 then
                                if reflektorAI then
                                    Call ( "DalkovePrave:Activate", 1 )
                                    Call ( "DalkoveLeve:Activate", 1 )
                                    Call ( "ActivateNode","dalkaclevy",1)
                                    Call ( "ActivateNode","dalkacpravy",1)
                                else
                                    Call ( "DalkovePrave:Activate", 0 )
                                    Call ( "DalkoveLeve:Activate", 0 )
                                    Call ( "ActivateNode","dalkaclevy",0)
                                    Call ( "ActivateNode","dalkacpravy",0)
                                end
                                Call ( "ActivateNode","reflektor_rozsviceny",1) 
                                if modelConfig[scriptVersion].horniPozicka then
                                    Call ( "PozickaHorniBi:Activate", 1 )
                                else
                                    Call ( "DalkoveHorni1:Activate", 1 )
                                    Call ( "DalkoveHorni2:Activate", 1 )
                                end
                                Call ( "PozickaLevaBi:Activate", 1 )
                                Call ( "PozickaLevaCr:Activate", 0 )
                                Call ( "PozickaPravaBi:Activate", 1 )
                                Call ( "PozickaPravaCr:Activate", 0 )
                                Call ( "ActivateNode", "pozickalevaBi", 1 ) 
                                Call ( "ActivateNode", "pozickalevaCr", 0 ) 
                                Call ( "ActivateNode", "pozickapravaBi", 1 ) 
                                Call ( "ActivateNode", "pozickapravaCr", 0 ) 
                            elseif dennicas > 063000 and dennicas < 220000 then
                                Call ( "DalkovePrave:Activate", 0 )
                                Call ( "DalkoveLeve:Activate", 0 )
                                Call ( "ActivateNode","dalkaclevy",0)
                                Call ( "ActivateNode","dalkacpravy",0)
                                Call ( "ActivateNode","reflektor_rozsviceny",0) 
                                if modelConfig[scriptVersion].horniPozicka then
                                    Call ( "PozickaHorniBi:Activate", 0 )
                                else
                                    Call ( "DalkoveHorni1:Activate", 0 )
                                    Call ( "DalkoveHorni2:Activate", 0 )
                                end
                                Call ( "PozickaLevaBi:Activate", 1 )
                                Call ( "PozickaLevaCr:Activate", 0 )
                                Call ( "PozickaPravaBi:Activate", 1 )
                                Call ( "PozickaPravaCr:Activate", 0 )
                                Call ( "ActivateNode", "pozickalevaBi", 1 ) 
                                Call ( "ActivateNode", "pozickalevaCr", 0 ) 
                                Call ( "ActivateNode", "pozickapravaBi", 1 ) 
                                Call ( "ActivateNode", "pozickapravaCr", 0 ) 
                            end
                        else
                            if dennicas < 080000 or dennicas > 163000 then
                                if reflektorAI then
                                    Call ( "DalkovePrave:Activate", 1 )
                                    Call ( "DalkoveLeve:Activate", 1 )
                                    Call ( "ActivateNode","dalkaclevy",1)
                                    Call ( "ActivateNode","dalkacpravy",1)
                                else
                                    Call ( "DalkovePrave:Activate", 0 )
                                    Call ( "DalkoveLeve:Activate", 0 )
                                    Call ( "ActivateNode","dalkaclevy",0)
                                    Call ( "ActivateNode","dalkacpravy",0)
                                end
                                Call ( "ActivateNode","reflektor_rozsviceny",1) 
                                Call ( "PozickaHorniBi:Activate", 1 )
                                Call ( "PozickaLevaBi:Activate", 1 )
                                Call ( "PozickaLevaCr:Activate", 0 )
                                Call ( "PozickaPravaBi:Activate", 1 )
                                Call ( "PozickaPravaCr:Activate", 0 )
                                Call ( "ActivateNode", "pozickalevaBi", 1 ) 
                                Call ( "ActivateNode", "pozickalevaCr", 0 ) 
                                Call ( "ActivateNode", "pozickapravaBi", 1 ) 
                                Call ( "ActivateNode", "pozickapravaCr", 0 ) 
                            elseif dennicas > 080000 and dennicas < 163000 then
                                Call ( "DalkovePrave:Activate", 0 )
                                Call ( "DalkoveLeve:Activate", 0 )
                                Call ( "ActivateNode","dalkaclevy",0)
                                Call ( "ActivateNode","dalkacpravy",0)
                                Call ( "ActivateNode","reflektor_rozsviceny",0) 
                                Call ( "PozickaHorniBi:Activate", 1 )
                                Call ( "PozickaLevaBi:Activate", 1 )
                                Call ( "PozickaLevaCr:Activate", 0 )
                                Call ( "PozickaPravaBi:Activate", 1 )
                                Call ( "PozickaPravaCr:Activate", 0 )
                                Call ( "ActivateNode", "pozickalevaBi", 1 ) 
                                Call ( "ActivateNode", "pozickalevaCr", 0 ) 
                                Call ( "ActivateNode", "pozickapravaBi", 1 ) 
                                Call ( "ActivateNode", "pozickapravaCr", 0 ) 
                            end
                        end
                    else
                        Call ( "DalkovePrave:Activate", 0 )
                        Call ( "DalkoveLeve:Activate", 0 )
                        Call ( "ActivateNode","dalkaclevy",0)
                        Call ( "ActivateNode","dalkacpravy",0)
                        Call ( "ActivateNode","reflektor_rozsviceny",0) 
                        if modelConfig[scriptVersion].horniPozicka then
                            Call ( "PozickaHorniBi:Activate", 0 )
                        else
                            Call ( "DalkoveHorni1:Activate", 0 )
                            Call ( "DalkoveHorni2:Activate", 0 )
                        end
                        Call ( "PozickaLevaBi:Activate", 0 )
                        Call ( "PozickaLevaCr:Activate", 0 )
                        Call ( "PozickaPravaCr:Activate", 0 )
                        Call ( "ActivateNode", "pozickalevaBi", 0 ) 
                        Call ( "ActivateNode", "pozickalevaCr", 0 ) 
                        Call ( "ActivateNode", "pozickapravaCr", 0 )
                        if predMasinou == 0 then
                            Call ( "PozickaPravaBi:Activate", 1 )
                            Call ( "ActivateNode", "pozickapravaBi", 1 ) 
                        end
                    end
                else
                    Call ( "DalkovePrave:Activate", 0 )
                    Call ( "DalkoveLeve:Activate", 0 )
                    Call ( "ActivateNode","dalkaclevy",0 )
                    Call ( "ActivateNode","dalkacpravy",0 )
                    Call ( "ActivateNode","reflektor_rozsviceny",0 )
                    if modelConfig[scriptVersion].horniPozicka then
                        Call ( "PozickaHorniBi:Activate", 0 )
                    else
                        Call ( "DalkoveHorni1:Activate", 0 )
                        Call ( "DalkoveHorni2:Activate", 0 )
                    end
                    Call ( "PozickaLevaBi:Activate", 0 )
                    Call ( "PozickaLevaCr:Activate", 0 )
                    Call ( "PozickaPravaBi:Activate", 0 )
                    Call ( "PozickaPravaCr:Activate", 0 )
                    Call ( "ActivateNode", "pozickalevaBi", 0 ) 
                    Call ( "ActivateNode", "pozickalevaCr", 0 ) 
                    Call ( "ActivateNode", "pozickapravaBi", 0 ) 
                    Call ( "ActivateNode", "pozickapravaCr", 0 )
                end
                Call("SetControlValue","JeNouzovyRadic",0,0)
                Call("SetControlValue","Picka",0,0)
                Call("SetControlValue","EngineBrakeControl",0,0)
                Call("SetControlValue","HandBrake",0,0)
                Call("Zarovka1:Activate",0)
                Call("Zarovka2:Activate",0)
                Call("Zarivka1:Activate",0)
                Call("Zarivka2:Activate",0)
                Call("Zarivka3:Activate",0)
                Call("CabLight1:Activate",0)
                Call("CabLight2:Activate",0)
                Call("CabLight3:Activate",0)
                Call("CabLight4:Activate",0)
                Call("SvetloRychlomer:Activate",0)
                Call("SvetloAmpermetrHorni:Activate",0)
                Call("SvetloAmpermetrDolni:Activate",0)
                Call("SvetloVoltmetrHorni:Activate",0)
                Call("SvetloVoltmetrDolni:Activate",0)
                Call("SvetloBudik3:Activate",0)
                Call("SvetloBudik4:Activate",0)

                if Call("GetControlValue","DoorsOpenCloseLeft",0) ~= 0 then
                    Call("SetControlValue","DvereLP",0,1)
                    Call("SetControlValue","DvereLZ",0,1)
                else
                    Call("SetControlValue","DvereLP",0,0)
                    Call("SetControlValue","DvereLZ",0,0)
                end
                if Call("GetControlValue","DoorsOpenCloseRight",0) ~= 0 then
                    Call("SetControlValue","DverePP",0,1)
                    Call("SetControlValue","DverePZ",0,1)
                else
                    Call("SetControlValue","DverePP",0,0)
                    Call("SetControlValue","DverePZ",0,0)
                end

                --kridla dveri
                    local DLP = Call("GetControlValue","DvereLP",0)
                    local DLZ = Call("GetControlValue","DvereLZ",0)
                    local DPP = Call("GetControlValue","DverePP",0)
                    local DPZ = Call("GetControlValue","DverePZ",0)

                    if DLP == 0 and dvereLPskutecne ~= 0 then
                        if dvereLPvystraha < modelConfig[scriptVersion].delkaVystrahy then
                            dvereLPvystraha = dvereLPvystraha + cas
                            Call("SoundDvereLP:SetParameter","ZvkDverePipani",1)
                        else
                            Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                        end
                    elseif DLP == 1 then
                        dvereLPvystraha = 0
                        Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                        Call("SoundDvereLP:SetParameter","ZvkDvereLPrychle",0)
                        Call("SoundDvereLP:SetParameter","ZvkDvereLPpomale",0)
                    end
                    if DLP ~= dvereLPskutecne and (dvereLPvystraha >= modelConfig[scriptVersion].delkaVystrahy or DLP == 1) then
                        if DLP > dvereLPskutecne then
                            dvereLPskutecne = math.min(dvereLPskutecne + (cas * rychlostOteviraniDveriLP),1)
                        elseif DLP < dvereLPskutecne then
                            if not modelConfig[scriptVersion].vystraha then
                                dvereLPskutecne = math.max(dvereLPskutecne - (cas * rychlostZaviraniDveriLP_rychle),0)
                                Call("SoundDvereLP:SetParameter","ZvkDvereLPrychle",1)
                                Call("SoundDvereLP:SetParameter","ZvkDvereLPpomale",0)
                                Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                            else
                                dvereLPskutecne = math.max(dvereLPskutecne - (cas * rychlostZaviraniDveriLP_pomalu),0)
                                Call("SoundDvereLP:SetParameter","ZvkDvereLPrychle",0)
                                Call("SoundDvereLP:SetParameter","ZvkDvereLPpomale",1)
                                Call("SoundDvereLP:SetParameter","ZvkDverePipani",0)
                            end
                        end
                    end
                    Call("SetTime", "Dvere1L", dvereLPskutecne * 2.125)

                    
                    if DLZ == 0 and dvereLZskutecne ~= 0 then
                        if dvereLZvystraha < modelConfig[scriptVersion].delkaVystrahy then
                            dvereLZvystraha = dvereLZvystraha + cas
                            Call("SoundDvereLZ:SetParameter","ZvkDverePipani",1)
                        else
                            Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                        end
                    elseif DLZ == 1 then
                        dvereLZvystraha = 0
                        Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                        Call("SoundDvereLZ:SetParameter","ZvkDvereLZrychle",0)
                        Call("SoundDvereLZ:SetParameter","ZvkDvereLZpomale",0)
                    end
                    if DLZ ~= dvereLZskutecne and (dvereLZvystraha >= modelConfig[scriptVersion].delkaVystrahy or DLZ == 1) then
                        if DLZ > dvereLZskutecne then
                            dvereLZskutecne = math.min(dvereLZskutecne + (cas * rychlostOteviraniDveriLZ),1)
                        elseif DLZ < dvereLZskutecne then
                            if not modelConfig[scriptVersion].vystraha then
                                dvereLZskutecne = math.max(dvereLZskutecne - (cas * rychlostZaviraniDveriLZ_rychle),0)
                                Call("SoundDvereLZ:SetParameter","ZvkDvereLZrychle",1)
                                Call("SoundDvereLZ:SetParameter","ZvkDvereLZpomale",0)
                                Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                            else
                                dvereLZskutecne = math.max(dvereLZskutecne - (cas * rychlostZaviraniDveriLZ_pomalu),0)
                                Call("SoundDvereLZ:SetParameter","ZvkDvereLZrychle",0)
                                Call("SoundDvereLZ:SetParameter","ZvkDvereLZpomale",1)
                                Call("SoundDvereLZ:SetParameter","ZvkDverePipani",0)
                            end
                        end
                    end
                    Call("SetTime", "Dvere2L", dvereLZskutecne * 2.125)

                    
                    if DPP == 0 and dverePPskutecne ~= 0 then
                        if dverePPvystraha < modelConfig[scriptVersion].delkaVystrahy then
                            dverePPvystraha = dverePPvystraha + cas
                            Call("SoundDverePP:SetParameter","ZvkDverePipani",1)
                        else
                            Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                        end
                    elseif DPP == 1 then
                        dverePPvystraha = 0
                        Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                        Call("SoundDverePP:SetParameter","ZvkDverePPrychle",0)
                        Call("SoundDverePP:SetParameter","ZvkDverePPpomale",0)
                    end
                    if DPP ~= dverePPskutecne and (dverePPvystraha >= modelConfig[scriptVersion].delkaVystrahy or DPP == 1) then
                        if DPP > dverePPskutecne then
                            dverePPskutecne = math.min(dverePPskutecne + (cas * rychlostOteviraniDveriPP),1)
                        elseif DPP < dverePPskutecne then
                            if not modelConfig[scriptVersion].vystraha then
                                dverePPskutecne = math.max(dverePPskutecne - (cas * rychlostZaviraniDveriPP_rychle),0)
                                Call("SoundDverePP:SetParameter","ZvkDverePPrychle",1)
                                Call("SoundDverePP:SetParameter","ZvkDverePPpomale",0)
                                Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                            else
                                dverePPskutecne = math.max(dverePPskutecne - (cas * rychlostZaviraniDveriPP_pomalu),0)
                                Call("SoundDverePP:SetParameter","ZvkDverePPrychle",0)
                                Call("SoundDverePP:SetParameter","ZvkDverePPpomale",1)
                                Call("SoundDverePP:SetParameter","ZvkDverePipani",0)
                            end
                        end
                    end
                    Call("SetTime", "Dvere1P", dverePPskutecne * 2.125)

                    
                    if DPZ == 0 and dverePZskutecne ~= 0 then
                        if dverePZvystraha < modelConfig[scriptVersion].delkaVystrahy then
                            dverePZvystraha = dverePZvystraha + cas
                            Call("SoundDverePZ:SetParameter","ZvkDverePipani",1)
                        else
                            Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                        end
                    elseif DPZ == 1 then
                        dverePZvystraha = 0
                        Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                        Call("SoundDverePZ:SetParameter","ZvkDverePZrychle",0)
                        Call("SoundDverePZ:SetParameter","ZvkDverePZpomale",0)
                    end
                    if DPZ ~= dverePZskutecne and (dverePZvystraha >= modelConfig[scriptVersion].delkaVystrahy or DPZ == 1) then
                        if DPZ > dverePZskutecne then
                            dverePZskutecne = math.min(dverePZskutecne + (cas * rychlostOteviraniDveriPZ),1)
                        elseif DPZ < dverePZskutecne then
                            if not modelConfig[scriptVersion].vystraha then
                                dverePZskutecne = math.max(dverePZskutecne - (cas * rychlostZaviraniDveriPZ_rychle),0)
                                Call("SoundDverePZ:SetParameter","ZvkDverePZrychle",1)
                                Call("SoundDverePZ:SetParameter","ZvkDverePZpomale",0)
                                Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                            else
                                dverePZskutecne = math.max(dverePZskutecne - (cas * rychlostZaviraniDveriPZ_pomalu),0)
                                Call("SoundDverePZ:SetParameter","ZvkDverePZrychle",0)
                                Call("SoundDverePZ:SetParameter","ZvkDverePZpomale",1)
                                Call("SoundDverePZ:SetParameter","ZvkDverePipani",0)
                            end
                        end
                    end
                    Call("SetTime", "Dvere2P", dverePZskutecne * 2.125)
            end
        end
    end
end

function OnControlValueChange ( name, index, value )
	if Call( "*:ControlExists", name, index ) then
		if name == "VirtualStartup" then
			if value <= 0.5 and value > 0.1 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0.25
			elseif value > 0.5 and value < 0.9 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0.75
			end
		end
		if name == "vytahniklic" then
			if math.abs(PolohaKlice - 0.25) < 0.1 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0
				Call("SetControlValue", "VirtualStartup", 0,0)
				klic = 0
				Call("SendConsistMessage",460101,"0",1)
			end
		end
		if name == "vlozklic" then
			if PolohaKlice < 0.25 and KlicNaDruheKabine == 0 then
				pozadavekNaZapisKlice = true
				PolohaKlice = 0.25
				Call("SetControlValue", "VirtualStartup", 0,0.25)
				klic = 1
				Call("SendConsistMessage",460101,"1",1)
			end
		end
		if name == "OsvetleniVozu" then
			if value == 0 then
				OsvetleniVozu = 0
				Call ("SendConsistMessage",460106,"0",1)
			end
			if value == 1 then
				OsvetleniVozu = 1
				Call ("SendConsistMessage",460106,"1",1)
			end
			if value == 2 then
				OsvetleniVozu = 2
				Call ("SendConsistMessage",460106,"2",1)
			end
		end
		if name == "JeNouzovyRadic" then
			if value == 0 then
				Call("SetControlValue","VirtualThrottleAndBrake",0,0)
				Call("SetControlValue","RadicNouzovy",0,2)
			else
				Call("SetControlValue","VirtualThrottleAndBrake",0,2)
				Call("SetControlValue","RadicNouzovy",0,0)
			end
		end
		if name == "FastStart" and value == 1 then
			pozadavekNaFastStart = 1
		end
		if name == "vysilackaStart" and vysilackaObrazovka == 0 then
			if value == 1 then 
				vysilackaObrazovka = 1
				Call("SetControlValue","VysilackaStartSound",0,1)
			end
		end
		if name == "vysilacka8" then
			tlacitko8 = value
		end
		if name == "vysilacka1" then
			tlacitko1 = value
		end
		if name == "vysilackaEnter" then
			tlacitkoEnter = value
		end
		if name == "vysilackaDelete" then
			tlacitkoDelete = value
		end
		if name == "vysilacka0" then
			tlacitko0 = value
		end
		if name == "vysilacka2" then
			tlacitko2 = value
		end
		if name == "vysilacka3" then
			tlacitko3 = value
		end
		if name == "vysilacka4" then
			tlacitko4 = value
		end
		if name == "vysilacka5" then
			tlacitko5 = value
		end
		if name == "vysilacka6" then
			tlacitko6 = value
		end
		if name == "vysilacka7" then
			tlacitko7 = value
		end
		if name == "vysilacka9" then
			tlacitko9 = value
		end
		if name == "RidiciKontrolerOkno" then
			ridiciKontrolerOknoOCVC = value
		end
		if name == "Napoveda" then
			levelNapovedy = levelNapovedy + 1
			if levelNapovedy == 4 then
				levelNapovedy = 0
			end
			--SysCall("ScenarioManager:ShowMessage", ZPRAVA_HLAVICKA, SysCall("ScenarioManager:FormatString",ZPRAVA_UROVEN_HELP,levelNapovedy),ALERT)
		end
		Call( "*:SetControlValue", name, index, value )
	end
end