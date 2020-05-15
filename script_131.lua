--**********************skript lokomotivy 131**************************--
DEBUG = true
--TRCH
    absolutniMax_kN = 249.1
    --              X.  1.      2.      3.      4.      5.      6.      7.      8.      9.      10.     11.     12.     13.     14.     15.     16.     17.     18.     19.     20.     21.     22.     23.     24.     25.     A.      B.      26.     27.     28.     29.     30.     31.     32.     33.     34.     35.     36.     37.
    max_kN =        {0, 35,    75,     119,    152,    175,     195,   213,    230,    274,    318,    350,    381,    430,    478.5,  585,    685,    729,    769,    820,    870,    1110,   1420,   1580,   1730,   1610,    1610,   400,    400,    520,    610,    780,    813,    871,    1180,   1317,   1235,   1420,   1475,   1600}  
    koeficient =    {0, -0.16, -0.165, -0.19,  -0.202, -0.213, -0.22, -0.222,  -0.223, -0.238, -0.25,  -0.256, -0.26,  -0.273, -0.28,  -0.3,   -0.31,  -0.316, -0.32,  -0.304, -0.31,  -0.34,  -0.36,  -0.366, -0.37,  -0.36,   -0.36,  -0.135, -0.135, -0.15,  -0.155, -0.165, -0.165, -0.165, -0.18,  -0.185, -0.175, -0.180, -0.175, -0.175}
    --shunty        P1                  P2                  P3                  P4                  P5
        shuntA =    {0.000002723641913, 0.000002667283741,  0.000002170566889,  0.000001689060872,  0.000000385024433}
        shuntB =    {0.000062154936193, 0.000003500765482,  0.000008156276308,  0.000045329611931,  0.000197702626047}
        shuntC =    {0.004383702116102, 0.002615835696392,  0.002448164863195,  0.004172234992123,  0.009682175029911}
        shuntMin =  {30.35,             30.7,               31.8,               38.1,               45.03}

startDelay = 0
casProcesor = os.clock()
casMinuly = casProcesor
wasUserControlled = false

sberac01Time = 0
sberac02Time = 0
zaluzieTime = 0
sberac01 = false
sberac02 = false
zaluzie = false

firstStart = true

rizeniZap = false
koncova = false
vedouci = false
poruchaVedouci = false
poruchaKoncova = false
jednotlive = false

delkaVlakuLast = 0
delkaVlaku = 0

ID = nil

prijataPoloha = {}
maxVzdalenost = 3

consistCheckDelay = -1

S101vlastni = 0
S101vlastniLast = 0
S101koncova = -1

S101_JEDNOTLIVA = 1
S101_KONCOVA = 2
S101_VYPNUTO = 3
S101_VEDOUCI = 4
S101_PORUCHA_VEDOUCI = 5
S101_PORUCHA_KONCOVA = 6

baterie = false
baterieLast = false
baterieKoncova = false

napetiMIREL = false
napetiMIRELlast = false
napetiMIRELkoncova = false

F156 = false
F156last = false
F156koncova = false

napetiRM = false
napetiRMlast = false
napetiRMkoncova = false

napetiMIRER = false
napetiMIRERlast = false
napetiMIRERkoncova = false
napetiMIRERkoncovaLast = false

napetiVO67 = false
napetiVO67last = false
napetiVO67koncova = false

vykonVlastni = 0
vykonVlastniLast = 0
tabulkaVykonu = {}

povelSberace = 0
povelSberaceLast = 0
povelSberaceZVedouci = 0

--rozvadec
    cilovaTBC = 0
    idealTBC = 0
    outputTBC = 0
    cilovy_tlak_HP_po_zmene = -1
    VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 = 0
    VirtualDistributorLocoBrakeCylinderPressureBAR = 0
    VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 = 0
    VirtualDistributorTrainBrakeCylinderPressureBAR = 0
    plynuleValce = 0
    tlakHP_vlak = 0
VirtualMainReservoirPressureBAR = math.random(0,10)
--VirtualMainReservoirPressureBAR = 10
naskokManometruBV = false
ubytekHJ = false
prekmitManometrHJ = false
podkmitManometrHJ = false
--BSE
    BSE_nouzove = false
    BSE_YO = false
    BSE_YB = false
    BSE_YS = false
    BSE_YZ = false
    BSE_YP = false
    BSE_RB = false
    BSE_tlakHP = 0
    BSE_tlakHPlast = 0
    BSE_casovaciVzduchojem = 0
    BSE_rozvodovyVentilTarget = 0
    BSE_rozvodovyVentil = 0
    BSE_rozvodovyVentilHystereze = 0.25
    BSE_zvysenyPrutok = false
--BP
    valcePrimocinne = 0
    valcePrimocinneLast = 0
soupatkoVZ = false
dolniMezKompresoru = 8
horniMezKompresoru = 9.7
pojistovaciVentilHJ = false

brzdicKeyPressTimer = nil
brzdicLastKey = nil
brzdicUnlocked = true
brzdicWasUnlocked = true
OBE = 0
OBElast = 0
dummyVirtualBrakeLast = 0

dummyVirtualThrottleLast = 0
dummyVirtualThrottle = 0
virtualThrottleLast = 0
virtualThrottle = 0
syncDummyThrottle = true
wasKontrolerOCVC = false
kontrolerOCVC = 0
dummy_Brzdit = false
dummy_BrzditLast = false
dummy_Odbrzdit = false
dummy_OdbrzditLast = false
virtualBrakeLast = 0
virtualBrake = 0
wasOBE_OCVC = false
OBE_OCVC = 0
mouseControlledOBE = false
vykonovaPaka = 0
vykonovaPakaLast = 0
vykonovaPakaMIRELLast = 0

kompresoryNaVlaku = 0
kompresoryNaVlakuLast = 0
pocetKompresoru = 0
IDnaVlaku = 0
IDnaVlakuLast = 0

rezimBrzdeniVlakP = false
rezimBrzdeniVlakG = false
rezimBrzdeniLokoP = false
rezimBrzdeniLokoG = false
rezimBrzdeni = "0000"
rezimBrzdeniLast = "0000"
OL2 = false

vykonJednotlive = 0
vykonJednotliveLast = 0

prechodoveStupneNahoru = false
prechodoveStupneDolu = false

proudTM1plynule = 0
proudTM2plynule = 0

idealniNapetiPZ = 3000
idealniNapetiZZ = 3000
idealniNapeti = 3000
tabulkaNapeti = {}
zkratSberace = false

napetiTargetDelta = math.random()*700-400
napetiDeltaSpeed = math.random(1,20)
napetiDelta = napetiTargetDelta

tvrdostNapetiTarget = math.random()
tvrdostNapeti = tvrdostNapetiTarget

napetiTrolej = 0
napetiTrolejPlynule = 0

hlavniKontrolerPozadovany = 0
hlavniKontrolerZadniPozadovany = 0
hlavniKontrolerZadniPozadovanyLast = 0
zpozdeniSynchronizaceHKcas = casProcesor
synchronizaceHKcas = casProcesor
krokCas = casProcesor
zpozdeniPneuventiluHK = 0.170--math.random()+0.4
zpozdeniSynchronizaceHK = 0.5--zpozdeniPneuventiluHK/2
trvalyMinus = false
trvalyMinusLast = true
trvalyMinusKoncova = false
stupenHK = 0
stupenHKKoncova = 0
stupenHKLast = 0
stupenHKKoncovaLast = 0
tlacPlus = false
tlacPlusLast = false
tlacMinus = false
tlacMinusLast = false

predMasinou = 0
zaMasinouLast = 0
zaMasinou = 0
deltaSpeedMinula = 0
deltaSpeed = 0
ujeteMetryAI = 0
svetlaAI = 1
smerAI = 0
reflektorTyp = 0
vzdalenostAIlast = 0
vzdalenostAI = 0

casMIRER = casProcesor
dvojteckaMIRER = true
DOHO = false
DOPO = false
strataVentilacie = false
nadprudVK = false
strataNapatia = false

pocetLoko = 1

venku = false

output_kN_TM1 = 0
output_kN_TM2 = 0
absolutnikN = 0

S103Clast = 0
edbPrevodnikZRozvadece = 0
edbPrevodnikRucne = 0
edbPrevodnikKoncova = 0
edbCas = 0
EDB_ULS = false
EDB_LSO_delay = 0
EDB_LSO_trigger = math.random()/3
EDB_LSO = false
EDB_LSOlast = false
EDB_LSOkoncova = false
EDB_CHOD = false
EDB_CHODlast = false
EDB_CHODkoncova = false
EDB_Y109 = false

kontrolerSnd = false
ventilatoryOdporOtackyTarget = 0
ventilatoryOdporOtacky = 0
ventilatoryNabehStart = 0

proudTM1 = 0
proudTM2 = 0

bdelostLast = false

cisloLoko = 0
cisloLokoKoncova = 0

driverHere = false
citlivostEDB = 0.1+math.random(1)/5

napeti = 0

rychlost = 0
absolutniRychlost = 0
rychlostKMH = 0
absolutniRychlostKMH = 0

zarivka1CasStart = nil
zarivka1Blik = math.random()*0.5
zarivka1Cas = 0
zarivka1BlikCas = 0
zarivka1 = false
zarivka2CasStart = nil
zarivka2Blik = math.random()*0.5
zarivka2Cas = 0
zarivka2BlikCas = 0
zarivka2 = false

Y138cas = -1000000

indikaceHV = 0
indikaceHVOut = 0
indikaceHVLast = 0
prekmitIndikaceHV = 0
indikaceHVKoncova = 0
indikaceHVKoncovaOut = 0
indikaceHVKoncovaLast = 0
prekmitIndikaceHVKoncova = 0
indikaceTopeni = 0
indikaceTopeniOut = 0
indikaceTopeniLast = 0
prekmitIndikaceTopeni = 0

impulsor = false
impulsorDelay = 0

steraceAnim1 = 0
steraceAnim2 = 0
steraceAnim1Smer = 1
steraceAnim1Smer_skutecny = 0
steraceAnim2Smer = 1
steraceAnim2Smer_skutecny = 0

klapka1H = false
klapka2H = false
klapka3H = false
klapka4H = false
klapka5H = false
klapka6H = false

napetiBaterie = math.random(35,50)
proudBaterie = 0
vMetrBaterie = 0
vMetrBateriePlynule = 0

zarovkaIntensity = 0
zarivka1Intensity = 0
zarivka2Intensity = 0

dvereStrojovna = false

zamcenySmer = false
isKlicek = false
isKlicekLast = false
isKlicekNaSousedni = false
blokovanySmer = nil

blokovanaS101 = nil

idSynchroDelay = nil

obsazenaSousedni = false
obsazenaLast = false
obsazena = false
obsazenaVeHre = false
hlavniKontrolerPK = 0
hlavniKontrolerPKLast = 0
aktivniPostrk = false
postrkKeyLast = false
aktivniPostrkLast = false

ventilatoryAI = 0
kontrolerAI = 0

jeLicha = false
jeSuda = false
jeKoncovaLicha = false
jeKoncovaSuda = false

koloPredniAnim = 0
koloZadniAnim = 0

tlakValceMAX = 3.8

klickaTopeniTrigger = false
klickaTopeniTriggerLast = false
klickaTopeniVisibility = false

--adhese
    ADHESE_VYUZITI = 0.87
    ADHESE_SUCHO = 1*ADHESE_VYUZITI
    ADHESE_VLHKO_START = 0.5*ADHESE_VYUZITI
    ADHESE_VLHKO_CAS_NABEH = 70
    ADHESE_VLHKO = 0.75*ADHESE_VYUZITI
    ADHESE_VLHKO_CAS_SNIZENI = 300
    ADHESE_VLHKO_PODESTI = 700
    ADHESE_SNIH = 0.5*ADHESE_VYUZITI
    ADHESE_KOEF_LISTI = 0.3 --0.7 pouze na test!, jinak 0.3
    ADHESE_KOEF_LISTI_TARGET = math.random()*0.4+0.3
    ADHESE_KOEF_LISTI_DELTA = math.random()/3

    adhese_casdeste = -1
    adhese_caspodesti = -1

    ambientAdhesion = 0
    sourceAdhesion = 0

    adheseRandomPodvozek1 = math.random()/2+0.3
    adheseRandomCtdnPodvozek1 = math.random(40, 200)
    adheseRandomLenCtuPodvozek1 = 0

    adheseRandomPodvozek2 = math.random()/2+0.3
    adheseRandomCtdnPodvozek2 = math.random(40, 200)
    adheseRandomLenCtuPodvozek2 = 0

    decisiveAdhesionPodvozek1 = 0
    decisiveAdhesionPodvozek2 = 0
    sandAdhesionAddition = 0
    brakeAdhesionAdditionPodvozek1 = 0
    brakeAdhesionAdditionPodvozek2 = 0
    randomDifferAdhesionPodvozek1 = math.random()/20
    randomDifferAdhesionPodvozek2 = math.random()/20
    firstAxleLossPodvozek1 = math.random()/10
    firstAxleLossPodvozek2 = math.random()/10

    cilovaRychlostKolaPodvozek1 = 0
    rychlostKolaPodvozek1 = 0
    absolutniRychlostKolaPodvozek1 = 0
    rychlostKolaKMHPodvozek1 = 0

    cilovaRychlostKolaPodvozek2 = 0
    rychlostKolaPodvozek2 = 0
    absolutniRychlostKolaPodvozek2 = 0
    rychlostKolaKMHPodvozek2 = 0

    --prahDSO = math.random(10,60)/2
    tabulkaObuti = {
        [math.random(-10,10)] = math.random(),
        [math.random(-10,10)] = math.random(),
        [math.random(-10,10)] = math.random()
    }
    obutiVolume = math.max(math.random(-3,1),0)
    obuti = 0
    obutiDistance = 2.4772805742778301026860760754598

--diagnostika
    diag1 = false
    diag2 = false
    diag3 = false
    diag4 = false
    diag5 = false
    diag6 = false
    diag7 = false
    diag8 = false
    diag9 = false
    diag10 = false
    diag11 = false
    diag12 = false
    diag13 = false
    diag14 = false
    diag15 = false
    diag16 = false
    diag17 = false
    diag18 = false
    diag19 = false
    diag20 = false

--obvod HV
    F104 = false --jistic pridrzneho obvodu HV
    F115 = false --jistic zapinani HV
    K153 = false --zapinaci stykac HV
    Q01 = false --hlavni vypinac
    Q01Last = false
    Q01P = 0 --poloha hlavniho vypinace
    K02 = false --napetove rele
    K03 = false --DOTO
    K09 = false --NI topeni
    K11 = false --DOPM
    K15 = false --proudové rele ztraty ventilacie
    K15delay = 0 --zpozdovaci clen
    K21 = false --skluz 1TM
    K22 = false --skluz 2TM
    K116 = false --blokovaci rele pom. obvodu
    HK0X1 = false --HK v 0, X, 1
    S221 = false --spinac "prevadzka bez ventilacie"
    koncoveDotekyZaluzie = false --koncove spinace zaluzii
    K154 = false --blokovaci rele HV
    K154delay = 1 --zpozdovani K154
    S511 = false --tlakovy spinac 3.5BAR
    HK0 = false --HK v 0
    S123 = false --tlacitko vypnuti HV
    K155 = false --vypinaci rele HV
    K152 = false --bezpecnostni rele
    K151 = false --bezpecnostni rele
    S121 = false --sberace
    K111 = false --klapkovnik

--obvod sberacu odpojovacu a zaluzii
    F112 = false
    F113 = false
    Q03 = false --odpojovac sberace 1
    Q03A = false --odpojovac sberace 1 zapojit
    Q03B = false --odpojovac sberace 1 odpojit
    Q03P = 0 --poloha pohonu odpojovace sberace 1
    Q04 = false --odpojovac sberace 2
    Q04A = false --odpojovac sberace 2 zapojit
    Q04B = false --odpojovac sberace 2 odpojit
    Q04P = 0 --poloha pohonu odpojovace sberace 2
    Q05 = true --uzemnovac
    Q05A = false --uzemnovac uzemnit
    Q05B = false --uzemnovac odzemnit
    Q05P = 0 --poloha pohonu uzemnovace
    Q08 = true --uzemnovac topeni
    Q08A = false --uzemnovac topeni uzemnit
    Q08B = false --uzemnovac topeni odzemnit
    Q08P = 0 --poloha pohonu uzemnovace
    S121_12 = false --sberace P
    S121_56 = false --sberace Z
    S119 = false --topeni vlaku
    K85 = false --stykac topeni
    H207 = false --signalka topeni
    K157 = false --rele odpojovace
    K157delay = 0
    K158 = false --rele odpojovace
    K158delay = 0
    K159 = false --blokovaci rele zaluzii
    K159delay = 0
    K160 = false --zprostredkovaci rele zaluzii
    H3 = false --porucha zaluzii
    HK0X2537 = false --HK v 0°, X°, 25°, nebo 37°+
    HKodpor = false
    HKnot025 = false --HK krome 0° a 25°

--obvod navestnich svetel
    F150 = false --jistic dalkoveho reflektoru
    E101A = false --leve svetlo reflektoru
    E101A_TL = false --leve svetlo reflektoru tlumene
    E101B = false --prave svetlo reflektoru
    E101B_TL = false --prave svetlo reflektoru tlumene
    F155 = false --jistic pozicnich svetel
    S143 = 0 --prepinac pravych celnich
    S145 = 0 --prepinac levych celnich
    S147 = 0 --prepinac pravych zadnich
    S149 = 0 --prepinac levych zadnich
    E103B = false --prave bile
    E103C = false --prave cervene
    E105B = false --leve bile
    E105C = false --leve cervene

--obvod pomocnych pohonu
    F105 = false --jistic PP
    F121 = false --jistic PK
    K12 = false --tepelne rele ventilatoru chlazeni
    K13 = false --tepelne rele kompresoru
    K81 = false --stykac ventilatoru 1. stupen
    K82 = false --stykac ventilatoru 2. stupen
    K83 = false --stykac kompresoru 1. stupen
    K84 = false --stykac kompresoru 2. stupen
    S501 = false --tlakovy spinac hlavni jimky
    S502 = false --tlakovy spinac pomocne jimky sberacu
    S503 = false --tlakovy spinac mazani kompresoru
    S503delay = 0
    S113_A = false --spinac ventilatoru - automaticky
    S113_T = false --spinac ventilatoru - trvale
    S117_PK = false --spinac kompresoru vlastni - automaticky
    S115_A = false --spinac kompresoru vlastni - automaticky
    S115_T = false --spinac kompresoru vlastni - trvale
    S117_A = false --spinac kompresoru koncova - automaticky
    S117_T = false --spinac kompresoru koncova - trvale
    K116 = false --blokovaci rele PP
    K117 = false --zpozdovaci rele ventilatoru
    K117delay = 0
    K126 = false --zpozdovaci rele kompresoru
    K126delay = 0
    K131 = false --stykac PK
    HKnot0X = false --HK krome 0° a X°
    H9 = false --porucha mazani vlastni
    H10 = false --porucha mazani koncova

--mnohoclen
    X202vlastni = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
        [7] = false,
        [8] = false,
        [9] = false,
        [10] = false,
        [11] = false,
        [12] = false,
        [13] = false,
        [14] = false,
        [15] = false,
        [16] = false,
        [17] = false,
        [18] = false,
        [21] = false,
        [22] = false,
        [23] = false,
        [24] = false,
        [36] = false,
        [37] = false,
        [41] = false,
        [42] = false,
        [43] = false,
        [44] = false,
        [45] = false,
        [46] = false,
        [47] = false
    }
    X202vlastniLast = {}
    --X202vlastniLast = clone(X202vlastni)
    X202cizi = {}
    X202spojeni = {
        [1] = 2,
        [2] = 1,
        [3] = 5,
        [4] = 6,
        [5] = 3,
        [6] = 4,
        [7] = 7,
        [8] = 8,
        [9] = 10,
        [10] = 9,
        [11] = 12,
        [12] = 11,
        [13] = 13,
        [14] = 14,
        [15] = 15,
        [16] = 16,
        [17] = 17,
        [18] = 18,
        [21] = 22,
        [22] = 21,
        [23] = 24,
        [24] = 23,
        [36] = 37,
        [37] = 36,
        [41] = 42,
        [42] = 41,
        [43] = 44,
        [44] = 43,
        [45] = 46,
        [46] = 45,
        [47] = 47
    }

    X204vlastni = {
        [1] = false,
        [2] = false,
        [3] = false,
        [4] = false,
        [5] = false,
        [6] = false,
        [7] = false,
        [8] = false,
        [9] = false,
        [10] = false,
        [11] = false,
        [12] = false,
        [13] = false,
        [14] = false,
        [15] = false
    }
    X204vlastniLast = {}
    X204cizi = {}
    X204spojeni = {
        [1] = 3,
        [2] = 4,
        [3] = 1,
        [4] = 2,
        [5] = 5,
        [6] = 6,
        [7] = 7,
        [8] = 8,
        [9] = 9,
        [10] = 10,
        [11] = 11,
        [12] = 13,
        [13] = 12,
        [14] = 14,
        [15] = 15
    }
--MIRER
    MIRER = {
        blokovaniSmeru = false,
        pozadovanaRychlost = 0,
        rucniSnizeni = 0,
        rezimDict = {
            [0] = "0",
            [1] = "S",
            [2] = "N"
        },
        navolenyRezim = 2,
        vynucenyRezim = 2,
        vynucenyRezimKoncova = 2,
        navolenyRezimLast = 2,
        stavy = {
            ["tlak prevodnik"] = {},
            ["tlak brz.valce"] = {},
            ["rucna brzda"] = {},
            ["Porucha st.nab."] = {},
            ["EDB vypnuta"] = {}
        },
        stavyContains = function (self, k)
            if MIRER.stavy[k] ~= nil then
                return MIRER.stavy[k] ~= nil and (MIRER.stavy[k].vedouci or MIRER.stavy[k].koncova or MIRER.stavy[k].text ~= nil)
            end
            return false
        end,
        stavIndex = 0,
        poruchy = {
            ["V-dif.ochr.HO"] = false,
            ["K-dif.ochr.HO"] = false,
            ["V-dif.ochr.PO"] = false,
            ["K-dif.ochr.PO"] = false,
            ["V-strata vent."] = false,
            ["K-strata vent."] = false,
            ["V-nadp.vl.kur."] = false,
            ["K-nadp.vl.kur."] = false,
            ["V-strata nap."] = false,
            ["K-strata nap."] = false,
            ["Zberace P+Z"] = false,
            ["V-LTS-410 A"] = false,
            ["K-LTS-410 A"] = false,
            ["LTS-410 A"] = false,
            ["V-LTS-510 A"] = false,
            ["K-LTS-510 A"] = false,
            ["LTS-510 A"] = false,
            ["Draha"] = false,
            ["Prestav S101"] = false,
            ["Prenos V+K"] = false,
            ["Prekr.rychl."] = false
        },
        poruchyContains = function (self, k)
            if MIRER.poruchy[k] ~= nil then
                return MIRER.poruchy[k] ~= nil
            end
            return false
        end,
        poruchaIndex = 0,
        parael = false,
        draha = 720,
        drahaAbs = 720,
        synchroCas = false,
        blokovaniVykonu = false,
        EPV = false,
        casSnizeni = 0,
        cilovyTlak = 5,
        drahaUpousteni = 0,
        casOdkalovani = casProcesor,
        zpozdeniOdkalovani = casProcesor,
        odkalovaniJimek = false
    }
sberac01Delay = 0
SBERAC01_MAX_DELAY = math.random(5,15)/10
sberac01pressureDelayCoef = 0
sberac02Delay = 0
SBERAC02_MAX_DELAY = math.random(5,15)/10
sberac02pressureDelayCoef = 0

function emergencyBraking()
end
function releaseEmergency()
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
                
		--ZpravyNavestidel()
			--PARAMETRY:
				--zprava -message from signal;
			--VRACI:
				--nil;
			--function which is called to push message from signal to MIREL;

    --MIREL SETTINGS
        isHere = false, --tells to MIREL if the control unit is here or on another section (usage on multi section loco with one MIREL unit) --998100 - 998104 are reserved for MIREL and should call MIREL:SynchronizaceRidiciJednotky()
		isControlerMovementVigilanceAcknowledgement = true, --true if vigilance alert can be confirmed by control movement (Call function VybaveniBdelostiOvladacem() on every move)
		maxDesignSpeed = 100, --max design speed of loco, should not be bigger than 160
		displayChildName = "MIREL", --name of child, where text will be displayed
        MIRELversion = 4, --version of MIREL [3,4]
        displayNationalitySettings = true, --true if nationality settings can be set on display, false if nationality is selected by loco automaticly (f.e. based on display settings) - NastavNarodniVolbu() to set
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
		zamekRychlostiOld = false,
		zobrazenaRychlost = 0,
		zobrazenaRychlostLast = 0,
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
        wasThisCabActive = false,
        casDosahnutiKrivky = 10,
        bylaBdelostnaVyzvaKrivka = false,
        bylaOpakovanaVyzvaKrivka = false,
        casPrenasenehoKodu = 0,
        casSynchronizace = 0,
        pingSent = false,
        casPing = 0,
        telegramLast = 0,
        prenosDruhaSekce = true,
        ztrataKoduSent = -1,
        inicializovanyDekoder = false,

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
            NO1olde = false,
			NO2 = false,
			NO2old = false,
			NO3 = false,
			NO3old = false,
			NO4 = false,
			NO4old = false,
			NO5 = false,
			NO5old = false,
			NO7 = false,
			NO7old = false,
			NO8 = false,
			NO8old = false,
			NO9 = false,
			NO9old = false,
			NO10 = false,
			NO10old = false,
            NO11 = "BBB",
            NO11write =  "BBB",
			NO11old =  "BBB",
            NO11writeOld =  "BBB",
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
			D1_1old = false,
			D1_2 = false,
			D1_2old = false,
			D1_3 = false,
			D1_3old = false,
			D1_4 = false,
			D1_4old = false,
			D1_5 = false,
			D1_5old = false,
			D1_6 = false,
			D1_6old = false,
			D1_7 = false,
			D1_7old = false,
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
				-- Print("Zapisuji do souboru NO.rez, vÃ½sledek operace: ")
				-- Print(f:write(NOrezim))
				f:close()
				MIREL.NO.rezimOld = NOrezim
			end,
    },
    
    zvuky = {
        ZS1 = 0,
        ZS1old = 0,
        ZS1B = 0,
        ZS1Bold = 0,
        ZS2 = 0,
        ZS2old = 0,
        ZS3 = 0,
        ZS3old = 0,
        ZS7 = 0,
        ZS7old = 0,
        ZS8 = 0,
        ZS8old = 0,
        ZS11 = 0,
        ZS11old = 0,
        ZS20 = 0,
        ZS20old = 0
    },

    prenaseneOvladace = {
        NO12 = false,
        NO12old = false,
        NO13 = false,
        NO13old = false,
        NO14 = false,
        NO14old = false,
        smerovyOvladac = 0,
        smerovyOvladacOld = 0,
        tlakBV = 0,
        tlakBVOld = 0,
        bdelost = false,
        bdelostOld = false,
        casSent = 0
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
                        MIREL.NO.NO12 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.minusControlValueName,0)) or MIREL.prenaseneOvladace.NO12 --minus
                        MIREL.NO.NO13 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.plusControlValueName,0)) or MIREL.prenaseneOvladace.NO13 --plus
                        MIREL.NO.NO14 = MIREL:BolToDecToBol(Call("GetControlValue",MIREL.enterControlValueName,0)) or MIREL.prenaseneOvladace.NO14 --Enter
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
                    
                    --pokud je zapnuty spinac rizeni na stanovisti kde se prave nachazime, pak je to aktivni stanoviste
                        MIREL.wasThisCabActive = MIREL.isThisCabActive
                        if (MIREL.actualCab == 1 and MIREL.isCab1Active) or (MIREL.actualCab == 2 and MIREL.isCab2Active) then
                            MIREL.isThisCabActive = true
                        else
                            MIREL.isThisCabActive = false
                        end
                        if MIREL.wasThisCabActive ~= MIREL.isThisCabActive then
                            MIREL.prenosDruhaSekce = false
                            Call("SetControlValue", "NO1", 0, 0)
                            Call("SetControlValue", "NO2", 0, 0)
                            Call("SetControlValue", "NO3", 0, 0)
                            Call("SetControlValue", "NO4", 0, 0)
                            MIREL.NO.NO1 = false
                            MIREL.NO.NO2 = false
                            MIREL.NO.NO3 = false
                            MIREL.NO.NO4 = false
                            -- MIREL:PackDisplayMessage()
                            -- MIREL:PackSoundMessage()
                            -- MIREL:PackControlsMessage()
                        end

                    if MIREL.isHere then
                        if jeKoncovaLicha or cisloLokoKoncova == 0 then
                            MIREL.odpadleSoupatkoVZ = true
                            MIREL.NO11 = "ERR"
                            if Call("GetControlValue",MIREL.enterControlValueName,0) > 0.5 then
                                MIREL.NO11 = "E05"
                            end
                            Call("MIREL:SetText", MIREL.NO11, 0)
                            MIREL.NO.blokujBlikaniTest = true
                            MIREL.NO.NO1 = false
                            MIREL.NO.NO2 = false
                            MIREL.NO.NO3 = false
                            MIREL.NO.NO4 = false
                            MIREL.NO.NO5 = false
                            MIREL.NO.NO7 = false
                            MIREL.NO.NO8 = false
                            MIREL.NO.NO9 = false
                            MIREL.NO.NO10 = false
                            Call("SetControlValue","NO_bodka",0)
                            Call("SetControlValue", "NO1", 0, 0)
                            Call("SetControlValue", "NO2", 0, 0)
                            Call("SetControlValue", "NO3", 0, 0)
                            Call("SetControlValue", "NO4", 0, 0)
                            Call("SetControlValue", "ZS1", 0, 0)
                            Call("SetControlValue", "ZS2", 0, 0)
                            Call("SetControlValue", "ZS3", 0, 0)
                            Call("SetControlValue", "ZS20", 0, 0)
                        else
                            smerovyOvladac = 0
                            if MIREL.isCab1Active then
                                smerovyOvladac = Call("GetControlValue", "UserVirtualReverser", 0)
                            elseif MIREL.isCab2Active then
                                smerovyOvladac = MIREL.prenaseneOvladace.smerovyOvladac
                            end
                            if smerovyOvladac > 0.5 then
                                MIREL.skutecnySmer = 1
                            elseif smerovyOvladac > -0.5 then
                                MIREL.skutecnySmer = 0
                            else
                                MIREL.skutecnySmer = -1
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
                                MIREL.rychlostKMH = rychlostKolaPodvozek1*3.6
                                -- if Call("GetSpeed") < 0 then
                                --     MIREL.rychlostKMH = -MIREL.rychlostKMH
                                -- end
                                MIREL.rychlostKMHabs = math.abs(MIREL.rychlostKMH)

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
                                        MIREL.zvuky.ZS11 = 0
                                        Call("SetControlValue","ZS11",0,0)
                                    else
                                        MIREL.zvuky.ZS11 = 1
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

                                if (MIREL.isCab1Active or MIREL.isCab2Active) then --and gObrazovky == 1
                                    if MIREL.isThisCabActive then
                                        if Call("GetControlValue","UserVirtualReverser",0) == 0 or MIREL.prenaseneOvladace.smerovyOvladac == 0 then
                                            MIREL.D1_smer0 = true
                                        end
                                        if Call("GetControlValue","UserVirtualReverser",0) == 1 or MIREL.prenaseneOvladace.smerovyOvladac == 1 then
                                            MIREL.D1_smerP = true
                                        end
                                        if MIREL.D1_smer0 and MIREL.D1_smerP and MIREL.NO.D1_3 then
                                            MIREL.NO.D1_3 = false
                                            -- Print("Test MIREL.NO.D1_3 uspesny!")
                                        end

                                        if Call("GetControlValue","UserVirtualReverser",0) == 0 or MIREL.prenaseneOvladace.smerovyOvladac == 0 then
                                            MIREL.D1_smer0 = true
                                        end
                                        if Call("GetControlValue","UserVirtualReverser",0) == -1 or MIREL.prenaseneOvladace.smerovyOvladac == -1 then
                                            MIREL.D1_smerZ = true
                                        end
                                        if MIREL.D1_smer0 and MIREL.D1_smerZ and MIREL.NO.D1_4 then
                                            MIREL.NO.D1_4 = false
                                            -- Print("Test MIREL.NO.D1_4 uspesny!")
                                        end
                                        
                                        if Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) >= tlakValceMAX*0.8 or MIREL.prenaseneOvladace.tlakBV > tlakValceMAX*0.8 then
                                            MIREL.D1_BP_od = true
                                        end
                                        if Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) < tlakValceMAX*0.1 and MIREL.prenaseneOvladace.tlakBV < tlakValceMAX*0.1 then
                                            MIREL.D1_BP_za = true
                                        end
                                        if MIREL.D1_BP_od and MIREL.D1_BP_za and MIREL.NO.D1_5 then
                                            MIREL.NO.D1_5 = false
                                            -- Print("Test MIREL.NO.D1_5 uspesny!")
                                        end
                                    end
                                    
                                    if Call("GetControlValue","VirtualBrakePipePressureBAR",0) >= 4.9 and MIREL.NO.D1_6 and not MIREL.blokujEPV_NZ then
                                        MIREL.odpadleSoupatkoVZ = true
                                        MIREL.D1_testEPV = true
                                        -- Print("Zahajuji test MIREL.NO.D1_6!")
                                    end
                                    if MIREL.D1_testEPV and Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 3 and MIREL.NO.D1_6 then
                                        MIREL.D1_testEPV = false
                                        MIREL.odpadleSoupatkoVZ = false
                                        MIREL.NO.D1_6 = false
                                        -- Print("Test MIREL.NO.D1_6 uspesny!")
                                    end

                                    if Call("GetControlValue","VirtualBrakePipePressureBAR",0) >= 4.9 and not MIREL.NO.D1_6 and MIREL.NO.D1_7 and not MIREL.blokujEPV_NZ then
                                        MIREL.odpadleSoupatkoVZ = true
                                        MIREL.D1_testEPV = true
                                        -- Print("Zahajuji test MIREL.NO.D1_7!")
                                    end
                                    if MIREL.D1_testEPV and Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 3 and not MIREL.NO.D1_6 then
                                        MIREL.D1_testEPV = false
                                        MIREL.odpadleSoupatkoVZ = false
                                        MIREL.NO.D1_7 = false
                                        -- Print("Test MIREL.NO.D1_7 uspesny!")
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
                                                        MIREL.zvuky.ZS1 = 0
                                                        MIREL.zvuky.ZS20 = 0
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
                                                                    MIREL.zvuky.ZS8 = 0
                                                                    Call("SetControlValue","ZS8",0,0)
                                                                else
                                                                    MIREL.zvuky.ZS8 = 1
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
                                                            MIREL.zvuky.ZS1B = 0
                                                            Call("SetControlValue", "ZS1B", 0, 0)
                                                        else
                                                            MIREL.zvuky.ZS1B = 1
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
                                                MIREL.zvuky.ZS20 = 0
                                                MIREL.zvuky.ZS1 = 0
                                                MIREL.zvuky.ZS2 = 0
                                                MIREL.zvuky.ZS3 = 0
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
                                                MIREL.zvuky.ZS20 = 1
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
                                                    --     MIREL.zvuky.ZS20 = 0
                                                    --     Call("SetControlValue", "ZS20", 0, 0)
                                                    --     MIREL.zvuky.ZS1 = 0
                                                    --     Call("SetControlValue","ZS1",0,0)
                                                    --     MIREL.casBdelost = 0
                                                    -- end

                                                --ztrata kodu pokud neprisel aktivni kod pred mene jak 5 sec
                                                    if math.abs(os.clock()-MIREL.posledniKodCas) > 5 and MIREL.NO.rezim == "PRE" and MIREL.rychlostPodleNavesti >= 120 and not MIREL.prenosDruhaSekce then
                                                        MIREL.kod = 0
                                                        MIREL.kodOld = 0
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
                                                    elseif math.abs(os.clock()-MIREL.posledniKodCas) > 23 and MIREL.NO.rezim == "PRE" and MIREL.prodlouzeniKodovaniStuj < 0 and not MIREL.prenosDruhaSekce then
                                                        MIREL.kod = 0
                                                        MIREL.kodOld = 0
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
                                                    elseif math.abs(os.clock()-MIREL.posledniKodCas) > 0.5 and not MIREL.prenosDruhaSekce then
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
                                                            if (not MIREL.NO.prenosNavesti or MIREL.bdelostBezModre or (MIREL.rychlostKrivky == 40 and MIREL.kod == 2) or (MIREL.rychlostKMHabs > 90 and MIREL.kod == 1 and MIREL.rychlostKrivky == 120) or (MIREL.kod == 4 and MIREL.mezikruziZvyseni > 0)) and not (MIREL.rychlostKMHabs < 1 or (MIREL.rychlostKMHabs < 15 and (Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) > 2 or MIREL.prenaseneOvladace.tlakBV > 2))) then
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
                                                            if MIREL.rychlostKMHabs < 1 or (MIREL.rychlostKMHabs < 15 and (Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) > 2 or MIREL.prenaseneOvladace.tlakBV > 2)) then
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
                                                        MIREL.zvuky.ZS3 = math.max(MIREL:BolToDecToBol(MIREL.smerZS3),MIREL:BolToDecToBol(MIREL.nezabrzdenieZS3))
                                                        Call("SetControlValue","ZS3",0,MIREL.zvuky.ZS3)
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

                                                if (MIREL.rychlostKMHabs > 1 or Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) > 0.1 or MIREL.prenaseneOvladace.tlakBV > 0.1 or Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 4.5) and MIREL.SHPnezabrzdenie < 25 then
                                                    MIREL.SHPnezabrzdenie = 0
                                                end

                                                if MIREL.SHPnezabrzdenie > 25 then
                                                    MIREL.zvuky.ZS3 = 0
                                                    Call("SetControlValue","ZS3",0,0)
                                                    if MIREL.isThisCabActive then
                                                        MIREL.NO.NO11 = "HAM"
                                                    end
                                                    MIREL.blokujEPV_NZ = true
                                                    MIREL.odpadleSoupatkoVZ = true
                                                    if MIREL.NO.NO14 and (Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) > 0.1 or MIREL.prenaseneOvladace.tlakBV > 0.1 or Call("GetControlValue","VirtualBrakePipePressureBAR",0) < 4.5) and MIREL.isThisCabActive then
                                                        MIREL.odpadleSoupatkoVZ = false
                                                        MIREL.SHPnezabrzdenie = 0
                                                    end
                                                elseif MIREL.SHPnezabrzdenie > 15 then
                                                    if MIREL.isThisCabActive then
                                                        MIREL.zvuky.ZS3 = 1
                                                        Call("SetControlValue","ZS3",0,1)
                                                    end
                                                else
                                                    MIREL.zvuky.ZS3 = 0
                                                    Call("SetControlValue","ZS3",0,0)
                                                end

                                                if Call("GetControlValue",MIREL.resetButtonControlValueName,0) > 0.5 or MIREL.prenaseneOvladace.bdelost then
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
                                                        MIREL.zvuky.ZS1 = 0
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
                                                            MIREL.zvuky.ZS1 = 1
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
                                                        MIREL.zvuky.ZS1 = 0
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
                                                        MIREL.zvuky.ZS1 = 0
                                                        Call("SetControlValue","ZS1",0,0)
                                                    end
                                                else
                                                    if MIREL.SHPresetCounter > 5.5 then
                                                        MIREL.blokujEPV_NZ = true
                                                        MIREL.odpadleSoupatkoVZ = true
                                                        MIREL.zvuky.ZS1 = 0
                                                        Call("SetControlValue","ZS1",0,0)
                                                    elseif MIREL.SHPresetCounter > 3.5 then
                                                        if MIREL.isThisCabActive then
                                                            MIREL.zvuky.ZS1 = 1
                                                            Call("SetControlValue","ZS1",0,1)
                                                        end
                                                    elseif MIREL.SHPresetCounter > 1 then
                                                        MIREL.zvuky.ZS1 = 0
                                                        Call("SetControlValue","ZS1",0,0)
                                                    end
                                                end

                                                
                                                if MIREL.NO.NO12 and MIREL.isThisCabActive and MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP then --zobrazeni napisu PKP pri drzeni tlacitka -
                                                    MIREL.NO.NO11 = "PKP"
                                                end

                                                if (Call("GetControlValue",MIREL.resetButtonControlValueName,0) > 0.5 or MIREL.prenaseneOvladace.bdelost) and MIREL.NO.NO13 and MIREL.NO.NO11 ~= "HAM" and MIREL.isThisCabActive then
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
                                                        MIREL.zvuky.ZS20 = 1
                                                        Call("SetControlValue", "ZS20", 0, 1)
                                                        MIREL.blokujEPV_NZ = true
                                                        MIREL.odpadleSoupatkoVZ = true
                                                    end
                                                elseif MIREL.NO.rezim == "MEN" then
                                                    MIREL.rychlostRezimu = 160
                                                    MIREL.nulovaTolerancia = false
                                                    if MIREL.rychlostKMHabs > 167 then
                                                        MIREL.zvuky.ZS20 = 1
                                                        Call("SetControlValue", "ZS20", 0, 1)
                                                        MIREL.blokujEPV_NZ = true
                                                        MIREL.odpadleSoupatkoVZ = true
                                                    end
                                                    if MIREL.rychlostniPrikaz == 0 and MIREL.rychlostKMHabs > 17 then
                                                        MIREL.zvuky.ZS20 = 1
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
                                                MIREL.zvuky.ZS20 = 0
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
                                            MIREL.zvuky.ZS1 = 0
                                            MIREL.zvuky.ZS2 = 0
                                            MIREL.zvuky.ZS3 = 0
                                            MIREL.zvuky.ZS20 = 0
                                        elseif MIREL.narodniVolba == MIREL.madarsko then
                                            MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                            if MIREL.rychlostKMHabs > 1 then
                                                MIREL.zvuky.ZS20 = 1
                                                Call("SetControlValue", "ZS20", 0, 1)
                                                MIREL.blokujEPV_NZ = true
                                                MIREL.odpadleSoupatkoVZ = true
                                            end
                                            Call("SetControlValue", "ZS2", 0, 0)
                                            Call("SetControlValue", "ZS3", 0, 0)
                                            MIREL.zvuky.ZS2 = 0
                                            MIREL.zvuky.ZS3 = 0
                                        else
                                            MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.NEAKTIVNE
                                            Call("SetControlValue", "ZS1", 0, 0)
                                            Call("SetControlValue", "ZS2", 0, 0)
                                            Call("SetControlValue", "ZS3", 0, 0)
                                            Call("SetControlValue", "ZS20", 0, 0)
                                            MIREL.zvuky.ZS1 = 0
                                            MIREL.zvuky.ZS2 = 0
                                            MIREL.zvuky.ZS3 = 0
                                            MIREL.zvuky.ZS20 = 0
                                        end
                                        -- if MIREL.rychlostKMHabs > 3 and not (MIREL.isCab1Active or MIREL.isCab2Active) then
                                        -- 	MIREL:NouzoveZastaveni(2)
                                        -- end
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

                                if MIREL.NO.blokujBlikaniPoZmene and MIREL.NO.casBlokovaniBlikani > 0.7 then
                                    MIREL.NO.blokujBlikaniPoZmene = false
                                end

                            --pokud jsou splnene podminky pro zobrazeni skutecne rychlosti
                                if MIREL.testRychlost then
                                    MIREL.NO.NO11 = math.floor(MIREL.rychlostKMHabs)
                                end

                            --pokud jsou splnene podminky pro zobrazeni skutecneho tlaku
                                if MIREL.testTlak then
                                    MIREL.NO.NO11 = string.sub(tostring(Call("GetControlValue","VirtualBrakePipePressureBAR",0)),0,3)
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
                                                    MIREL.NO.NO11write = MIREL.NO.dreimalEmptyChar
                                                else
                                                    MIREL.NO.stavBlikani = true
                                                    MIREL.NO.NO11write = MIREL.NO.NO11
                                                end
                                            end
                                    --pokud blika rychle
                                        else
                                            if MIREL.NO.casBlikani > 0.2 then
                                                MIREL.NO.casBlikani = 0
                                                if MIREL.NO.stavBlikani then
                                                    MIREL.NO.stavBlikani = false
                                                    MIREL.NO.NO11write = MIREL.NO.dreimalEmptyChar
                                                else
                                                    MIREL.NO.stavBlikani = true
                                                    MIREL.NO.NO11write = MIREL.NO.NO11
                                                end
                                            end
                                        end
                            --pokud neni potvrzena bdelost po NZ1 ve V4, 1 v NZ1 blika
                                elseif MIREL.aktualniNZ == 1 and (MIREL.casBdelost > 0 or MIREL.casBdelostJednorazova > 0) and MIREL.MIRELversion == 4 and MIREL.isThisCabActive then
                                    if MIREL.NO.casBlikani > 0.5 then
                                        MIREL.NO.casBlikani = 0
                                        if MIREL.NO.stavBlikani then
                                            MIREL.NO.stavBlikani = false
                                            MIREL.NO.NO11write = "NZ"..MIREL.emptyCharacter
                                        else
                                            MIREL.NO.stavBlikani = true
                                            MIREL.NO.NO11write = MIREL.NO.NO11
                                        end
                                    end
                            --jinak zapis na displej nezmeneny vstup
                                else
                                    MIREL.NO.NO11write = MIREL.NO.NO11
                                    MIREL.NO.stavBlikani = false
                                end
                            Call("MIREL:SetText", MIREL.NO.NO11write, 0)
                            if MIREL.NO.NO11write ~= MIREL.NO.NO11writeOld then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage", 998109, tostring(MIREL.NO.NO11write), 1)
                                end
                                MIREL.NO.NO11writeOld = MIREL.NO.NO11write
                            end

                            if MIREL.zvuky.ZS1 ~= MIREL.zvuky.ZS1old or MIREL.zvuky.ZS1B ~= MIREL.zvuky.ZS1Bold or MIREL.zvuky.ZS2 ~= MIREL.zvuky.ZS2old or MIREL.zvuky.ZS3 ~= MIREL.zvuky.ZS3old or MIREL.zvuky.ZS7 ~= MIREL.zvuky.ZS7old or MIREL.zvuky.ZS8 ~= MIREL.zvuky.ZS8old or MIREL.zvuky.ZS11 ~= MIREL.zvuky.ZS11old or MIREL.zvuky.ZS20 ~= MIREL.zvuky.ZS20old then
                                MIREL:PackSoundMessage()
                                MIREL.zvuky.ZS1old = MIREL.zvuky.ZS1
                                MIREL.zvuky.ZS1Bold = MIREL.zvuky.ZS1B
                                MIREL.zvuky.ZS2old = MIREL.zvuky.ZS2
                                MIREL.zvuky.ZS3old = MIREL.zvuky.ZS3
                                MIREL.zvuky.ZS7old = MIREL.zvuky.ZS7
                                MIREL.zvuky.ZS8old = MIREL.zvuky.ZS8
                                MIREL.zvuky.ZS11old = MIREL.zvuky.ZS11
                                MIREL.zvuky.ZS20old = MIREL.zvuky.ZS20
                            end

                            if MIREL.NO.NO1 ~= MIREL.NO.NO1old or MIREL.NO.NO2 ~= MIREL.NO.NO2old or MIREL.NO.NO3 ~= MIREL.NO.NO3old or MIREL.NO.NO4 ~= MIREL.NO.NO4old or MIREL.NO.NO5 ~= MIREL.NO.NO5old or MIREL.NO.NO7 ~= MIREL.NO.NO7old or MIREL.NO.NO8 ~= MIREL.NO.NO8old or MIREL.NO.NO9 ~= MIREL.NO.NO9old or MIREL.NO.NO10 ~= MIREL.NO.NO10old or (MIREL.NO.D1_1 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_1old or (MIREL.NO.D1_2 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_2old or (MIREL.NO.D1_3 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_3old or (MIREL.NO.D1_4 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_4old or (MIREL.NO.D1_5 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_5old or (MIREL.NO.D1_6 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_6old or (MIREL.NO.D1_7 and not MIREL.NO.blokujBlikaniTest) ~= MIREL.NO.D1_7old or MIREL.zamekRychlosti ~= MIREL.zamekRychlostiOld then
                                MIREL:PackDisplayMessage()
                                MIREL.NO.NO1old = MIREL.NO.NO1
                                MIREL.NO.NO2old = MIREL.NO.NO2
                                MIREL.NO.NO3old = MIREL.NO.NO3
                                MIREL.NO.NO4old = MIREL.NO.NO4
                                MIREL.NO.NO5old = MIREL.NO.NO5
                                MIREL.NO.NO7old = MIREL.NO.NO7
                                MIREL.NO.NO8old = MIREL.NO.NO8
                                MIREL.NO.NO9old = MIREL.NO.NO9
                                MIREL.NO.NO10old = MIREL.NO.NO10
                                MIREL.NO.D1_1old = MIREL.NO.D1_1 and not MIREL.NO.blokujBlikaniTest
                                MIREL.NO.D1_2old = MIREL.NO.D1_2 and not MIREL.NO.blokujBlikaniTest
                                MIREL.NO.D1_3old = MIREL.NO.D1_3 and not MIREL.NO.blokujBlikaniTest
                                MIREL.NO.D1_4old = MIREL.NO.D1_4 and not MIREL.NO.blokujBlikaniTest
                                MIREL.NO.D1_5old = MIREL.NO.D1_5 and not MIREL.NO.blokujBlikaniTest
                                MIREL.NO.D1_6old = MIREL.NO.D1_6 and not MIREL.NO.blokujBlikaniTest
                                MIREL.NO.D1_7old = MIREL.NO.D1_7 and not MIREL.NO.blokujBlikaniTest
                                MIREL.zamekRychlostiOld = MIREL.zamekRychlosti
                            end

                            if (MIREL.zobrazenaRychlost ~= MIREL.zobrazenaRychlostLast and not MIREL.manual) or (MIREL.rychlostKrivky ~= MIREL.zobrazenaRychlostLast and MIREL.manual) then
                                if zaMasinouDvojicka then
                                    if MIREL.manual then
                                        Call("SendConsistMessage", 998111, tostring(MIREL.rychlostKrivky), 1)
                                    else
                                        Call("SendConsistMessage", 998111, tostring(MIREL.zobrazenaRychlost), 1)
                                    end
                                end
                                MIREL.zobrazenaRychlostLast = MIREL.zobrazenaRychlost
                            end
                        end
                    else --MIREL pouze zobrazovac
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
                        MIREL.aktualniNZ = -1
                        MIREL.casBdelost = 0
                        MIREL.casBdelostJednorazova = -1
                        MIREL.casPrenasenehoKodu = 0
                        --ztrata kodu pokud neprisel aktivni kod pred mene jak 5 sec
                            if math.abs(os.clock()-MIREL.posledniKodCas) > 5 and MIREL.NO.rezim == "PRE" and MIREL.rychlostPodleNavesti >= 120 and MIREL.ztrataKoduSent ~= 1 then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage", 998110, "1", 1)
                                end
                                MIREL.ztrataKoduSent = 1
                        --ztrata kodu pri kodovani omezujiciho znaku, prodlouzeni platnosti na 23 sec a proti stuj jeste 1000m
                            elseif math.abs(os.clock()-MIREL.posledniKodCas) > 23 and MIREL.NO.rezim == "PRE" and MIREL.ztrataKoduSent ~= 1 then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage", 998110, "1", 1)
                                end
                                MIREL.ztrataKoduSent = 1
                        --zhasnuti aktivniho prenosu pokud je prekroceny cas 0.5 sec od posledniho stabilniho kodu
                            elseif math.abs(os.clock()-MIREL.posledniKodCas) > 0.5 and MIREL.ztrataKoduSent < 0 then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage", 998110, "0", 1)
                                end
                                MIREL.ztrataKoduSent = 0
                            end
                        casNow = os.clock()
                        if casNow - MIREL.casSynchronizace > 5 then
                            MIREL.NO11 = "ERR"
                            if Call("GetControlValue",MIREL.enterControlValueName,0) > 0.5 then
                                MIREL.NO11 = "E00"
                            end
                            MIREL.NO.D1_1 = false
                            MIREL.NO.D1_2 = false
                            MIREL.NO.D1_3 = false
                            MIREL.NO.D1_4 = false
                            MIREL.NO.D1_5 = false
                            MIREL.NO.D1_6 = false
                            MIREL.NO.D1_7 = false
                            MIREL.NO.NO1 = false
                            MIREL.NO.NO2 = false
                            MIREL.NO.NO3 = false
                            MIREL.NO.NO4 = false
                            MIREL.NO.NO5 = false
                            MIREL.NO.NO7 = false
                            MIREL.NO.NO8 = false
                            MIREL.NO.NO9 = false
                            MIREL.NO.NO10 = false
                            if not MIREL.pingSent or casNow - MIREL.casPing > 1 then
                                MIREL:Ping()
                                MIREL.pingSent = true
                                MIREL.casPing = casNow
                            end
                        else
                            if casNow - MIREL.casSynchronizace > 2 and not MIREL.pingSent then
                                MIREL:Ping()
                                MIREL.pingSent = true
                            end
                            MIREL.prenaseneOvladace.NO12 = Call("GetControlValue",MIREL.minusControlValueName,0) > 0.5
                            MIREL.prenaseneOvladace.NO13 = Call("GetControlValue",MIREL.plusControlValueName,0) > 0.5
                            MIREL.prenaseneOvladace.NO14 = Call("GetControlValue",MIREL.enterControlValueName,0) > 0.5
                            smerovyOvladac = Call("GetControlValue", "UserVirtualReverser", 0)
                            if smerovyOvladac > 0.5 then
                                MIREL.prenaseneOvladace.smerovyOvladac = 1
                                MIREL.skutecnySmer = 1
                            elseif smerovyOvladac > -0.5 then
                                MIREL.prenaseneOvladace.smerovyOvladac = 0
                                MIREL.skutecnySmer = 0
                            else
                                MIREL.prenaseneOvladace.smerovyOvladac = -1
                                MIREL.skutecnySmer = -1
                            end
                            MIREL.prenaseneOvladace.tlakBV = Call("GetControlValue", "VirtualLocoBrakeCylinderPressureBAR", 0)
                            MIREL.prenaseneOvladace.bdelost = Call("GetControlValue",MIREL.resetButtonControlValueName,0) > 0.5
                            if MIREL.prenaseneOvladace.NO12 ~= MIREL.prenaseneOvladace.NO12old or MIREL.prenaseneOvladace.NO13 ~= MIREL.prenaseneOvladace.NO13old or MIREL.prenaseneOvladace.NO14 ~= MIREL.prenaseneOvladace.NO14old or MIREL.prenaseneOvladace.smerovyOvladac ~= MIREL.prenaseneOvladace.smerovyOvladacOld or MIREL.prenaseneOvladace.bdelost ~= MIREL.prenaseneOvladace.bdelostOld or math.abs(MIREL.prenaseneOvladace.tlakBV - MIREL.prenaseneOvladace.tlakBVOld) > 0.5 then
                                MIREL:PackControlsMessage()
                                MIREL.prenaseneOvladace.NO12old = MIREL.prenaseneOvladace.NO12
                                MIREL.prenaseneOvladace.NO13old = MIREL.prenaseneOvladace.NO13
                                MIREL.prenaseneOvladace.NO14old = MIREL.prenaseneOvladace.NO14
                                MIREL.prenaseneOvladace.smerovyOvladacOld = MIREL.prenaseneOvladace.smerovyOvladac
                                MIREL.prenaseneOvladace.bdelostOld = MIREL.prenaseneOvladace.bdelost
                                MIREL.prenaseneOvladace.tlakBVOld = MIREL.prenaseneOvladace.tlakBV
                            end
                        end
                        Call("SetControlValue", "NO1", 0, MIREL:BolToDecToBol(MIREL.NO.NO1))
                        Call("SetControlValue", "NO2", 0, MIREL:BolToDecToBol(MIREL.NO.NO2))
                        Call("SetControlValue", "NO3", 0, MIREL:BolToDecToBol(MIREL.NO.NO3))
                        Call("SetControlValue", "NO4", 0, MIREL:BolToDecToBol(MIREL.NO.NO4))
                        Call("SetControlValue", "ZS1", 0, MIREL.zvuky.ZS1)
                        Call("SetControlValue", "ZS1B", 0, MIREL.zvuky.ZS1B)
                        Call("SetControlValue", "ZS2", 0, MIREL.zvuky.ZS2)
                        Call("SetControlValue", "ZS3", 0, MIREL.zvuky.ZS3)
                        Call("SetControlValue", "ZS7", 0, MIREL.zvuky.ZS7)
                        Call("SetControlValue", "ZS8", 0, MIREL.zvuky.ZS8)
                        Call("SetControlValue", "ZS11", 0, MIREL.zvuky.ZS11)
                        Call("SetControlValue", "ZS20", 0, MIREL.zvuky.ZS20)
                        Call("MIREL:SetText", MIREL.NO11, 0)
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
                    MIREL.zvuky.ZS1 = 0
                    MIREL.zvuky.ZS2 = 0
                    MIREL.zvuky.ZS3 = 0
                    MIREL.zvuky.ZS20 = 0
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
            if MIREL.isHere then
                if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                    if MIREL.rychlostKMHabs < 1 then --zadavÃ¡nÃ­ do menu pri stati
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
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP
                        MIREL.NO.NO11 = MIREL.NO.dreimalEmptyChar
                        MIREL.NO.DISPLEJ.blikej = false
                    end
                end
                if MIREL.rychlostKMHabs < 1 then
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PL then
                    --     MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.H
                    --     MIREL.NO.NO11 = MIREL.emptyCharacter.."H"..MIREL.emptyCharacter
                    --     MIREL.NO.DISPLEJ.blikej = true
                    -- elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.H then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.CS
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."CS"
                        MIREL.NO.DISPLEJ.blikej = true
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PKP_VYBER then
                    --     MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAV
                    --     MIREL.NO.NO11 = "MAV"
                    --     MIREL.NO.DISPLEJ.blikej = true
                    -- elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAV then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ZSR
                        MIREL.NO.NO11 = "ZSR"
                        MIREL.NO.DISPLEJ.blikej = true
                    end
                end
            end
		end,

        Plus = function(self)
            if MIREL.isHere then
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
                    elseif MIREL.kodovaneMezikruzi and MIREL.rychlostKMHabs > 1 and MIREL.mezikruziZvyseni < 80 then -- zvysovanie maximalnej rychlosti pri kodovani medzikruzia
                        MIREL.NO.DISPLEJ.blikej = true
                        MIREL.NO.casMenu = 3 -- zavre se za 2 vteriny
                        MIREL.NO.blokujZobrazeniRychlosti = true
                        -- if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
                        --     MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.mezikruziRYCH
                        --     MIREL.NO.NO11 = MIREL.mezikruziZvyseni + 40
                        --     -- Print("Zapinam MIREL.NO.rezim zmeny rychlosti mezikruzi; Aktualni: "..MIREL.mezikruziZvyseni+40)
                        if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.RYCH then
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
                            SysCall("ScenarioManager:ShowMessage", "MIREL", "R", 1)
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.R
                            MIREL.NO.NO11 = MIREL.emptyCharacter.."R"..MIREL.emptyCharacter
                            MIREL.NO.DISPLEJ.blikej = false
                        else
                            SysCall("ScenarioManager:ShowMessage", "MIREL", "Neny R: "..MIREL.NO.DISPLEJ.stav, 1)
                        end
                    end
                end
                if MIREL.rychlostKMHabs < 1 then
                    if MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZSR then
                    --     MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.MAV
                    --     MIREL.NO.NO11 = "MAV"
                    --     MIREL.NO.DISPLEJ.blikej = true
                    -- elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.MAV then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PKP_VYBER
                        MIREL.NO.NO11 = "PKP"
                        MIREL.NO.DISPLEJ.blikej = true
                    elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.CS then
                    --     MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.H
                    --     MIREL.NO.NO11 = MIREL.emptyCharacter.."H"..MIREL.emptyCharacter
                    --     MIREL.NO.DISPLEJ.blikej = true
                    -- elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.H then
                        MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.PL
                        MIREL.NO.NO11 = MIREL.emptyCharacter.."PL"
                        MIREL.NO.DISPLEJ.blikej = true
                    end
                end
            end
		end,

		Enter = function(self)
			-- Print("Enter zmack")
            if MIREL.isHere then
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
                            if zaMasinouDvojicka then
                                Call("SendConsistMessage", 998102, "POS", 1)
                            end
                        elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.PRE then
                            MIREL.NO.rezim = "PRE"
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                            MIREL.blokujPrenosNavesti = false
                            MIREL.NO.zopakujPriUlozeni = "PRE"
                            MIREL.rychlostRezimu = 160
                            MIREL.NO.DISPLEJ.blikej = false
                            if zaMasinouDvojicka then
                                Call("SendConsistMessage", 998102, "PRE", 1)
                            end
                        elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.VYL then
                            MIREL.NO.rezim = "VYL"
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                            MIREL.blokujPrenosNavesti = true
                            MIREL.NO.zopakujPriUlozeni = "VYL"
                            MIREL.rychlostRezimu = 120
                            MIREL.NO.DISPLEJ.blikej = false
                            if zaMasinouDvojicka then
                                Call("SendConsistMessage", 998102, "VYL", 1)
                            end
                        elseif MIREL.NO.DISPLEJ.stav == MIREL.NO.DISPLEJ.ZAV then
                            MIREL.NO.rezim = "ZAV"
                            MIREL.NO.DISPLEJ.stav = MIREL.NO.DISPLEJ.ULOZ
                            MIREL.NO.NO11 = MIREL.NO.dreimalFullChar
                            MIREL.blokujPrenosNavesti = true
                            MIREL.NO.zopakujPriUlozeni = "ZAV"
                            MIREL.rychlostRezimu = 160
                            MIREL.NO.DISPLEJ.blikej = false
                            if zaMasinouDvojicka then
                                Call("SendConsistMessage", 998102, "ZAV", 1)
                            end
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
                                if Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) > 0.1 or MIREL.prenaseneOvladace.tlakBV > 0.1 then
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
                                if Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) > 0.1 or MIREL.prenaseneOvladace.tlakBV > 0.1 then
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
                    if zaMasinouDvojicka then
                        Call("SendConsistMessage", 998101, MIREL.narodniVolba, 1)
                    end
                end
            end
		end,

		JednorazovaBdelostnaVyzva = function(self,opakovana)
			MIREL.casBdelost = 0
            MIREL.blokujBdelostVyzva = true
            MIREL.casBdelostJednorazova = 0
            MIREL.NO.NO5 = false
            if MIREL.isThisCabActive then
                MIREL.zvuky.ZS1 = 1
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
                            MIREL.zvuky.ZS1 = 0
                            Call("SetControlValue","ZS1",0,0)
                        end
                        MIREL.NO.NO5 = false
                    elseif MIREL.casBdelost > MIREL.bdelostInterval - 3.5 then
                        MIREL.zvuky.ZS1 = 1
                        Call("SetControlValue","ZS1",0,1)
                        MIREL.NO.NO5 = false
                    elseif MIREL.casBdelost > MIREL.bdelostInterval / 4 and not MIREL.bdelostBezModre then
                        MIREL.NO.NO5 = false
                        if not MIREL.ZS1B then
                            MIREL.zvuky.ZS1 = 0
                            Call("SetControlValue","ZS1",0,0)
                        end
                    elseif MIREL.casBdelost > 8.5 and MIREL.bdelostBezModre then
                        MIREL.NO.NO5 = false
                        if not MIREL.ZS1B then
                            MIREL.zvuky.ZS1 = 0
                            Call("SetControlValue","ZS1",0,0)
                        end
                    elseif MIREL.aktualniNZ == -1 then
                        if MIREL.isThisCabActive then
                            MIREL.NO.NO5 = true
                        end
                        if not MIREL.ZS1B then
                            MIREL.zvuky.ZS1 = 0
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
                        MIREL.zvuky.ZS1 = 0
                        Call("SetControlValue","ZS1",0,0)
                    end
                end
            else
                if MIREL.casBdelostJednorazova > 3.5 then
                    MIREL:NouzoveZastaveni(1)
                    if MIREL.MIRELversion == 3 then
                        MIREL.zvuky.ZS1 = 0
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
                --     MIREL.zvuky.ZS1 = 0
                --     MIREL.zvuky.ZS20 = 0
                -- end
            end
            -- else
            --     MIREL.casBdelost = 0
            --     if not MIREL.bdelostnaVyzvaZmenaPrikazu and not MIREL.ZS1B and not MIREL.blokujBdelostVyzva then
            --         Call("SetControlValue","ZS1",0,0)
            --         Call("SetControlValue", "ZS20", 0, 0)
            --         MIREL.zvuky.ZS1 = 0
            --         MIREL.zvuky.ZS20 = 0
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
                    MIREL.zvuky.ZS20 = 1
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
                MIREL:NouzoveZastaveni(2)
                if MIREL.MIRELversion == 3 then
                    MIREL.zvuky.ZS2 = 0
                    Call("SetControlValue","ZS2",0,0)
                end
			elseif (MIREL.rychlostKMHabs > MIREL.zobrazenaRychlost + 5) and not MIREL.nulovaTolerancia then
                MIREL.zvuky.ZS2 = 1
				Call("SetControlValue","ZS2",0,1)
            elseif MIREL.rychlostKMHabs < MIREL.zobrazenaRychlost+0.5 or MIREL.MIRELversion == 3 then
                MIREL.zvuky.ZS2 = 0
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
            if MIREL.isCab1Active then
                if MIREL.rychlostKMH > 5 and MIREL.skutecnySmer == -1 then
                    MIREL:NouzoveZastaveni(3)
                    MIREL.smerZS3 = false
                elseif MIREL.rychlostKMH > 1 and MIREL.skutecnySmer == -1 then
                    MIREL.smerZS3 = true
                end
                if MIREL.rychlostKMH < -5 and MIREL.skutecnySmer == 1 then
                    MIREL:NouzoveZastaveni(3)
                    MIREL.smerZS3 = false
                elseif MIREL.rychlostKMH < -1 and MIREL.skutecnySmer == 1 then
                    MIREL.smerZS3 = true
                end
                if MIREL.rychlostKMHabs > 5 and MIREL.skutecnySmer == 0 then
                    MIREL:NouzoveZastaveni(3)
                    MIREL.smerZS3 = false
                elseif MIREL.rychlostKMHabs > 1 and MIREL.skutecnySmer == 0 then
                    MIREL.smerZS3 = true
                end
            elseif MIREL.isCab2Active then
                if MIREL.rychlostKMH > 5 and MIREL.skutecnySmer == 1 then
                    MIREL:NouzoveZastaveni(3)
                    MIREL.smerZS3 = false
                elseif MIREL.rychlostKMH > 1 and MIREL.skutecnySmer == 1 then
                    MIREL.smerZS3 = true
                end
                if MIREL.rychlostKMH < -5 and MIREL.skutecnySmer == -1 then
                    MIREL:NouzoveZastaveni(3)
                    MIREL.smerZS3 = false
                elseif MIREL.rychlostKMH < -1 and MIREL.skutecnySmer == -1 then
                    MIREL.smerZS3 = true
                end
                if MIREL.rychlostKMHabs > 5 and MIREL.skutecnySmer == 0 then
                    MIREL:NouzoveZastaveni(3)
                    MIREL.smerZS3 = false
                elseif MIREL.rychlostKMHabs > 1 and MIREL.skutecnySmer == 0 then
                    MIREL.smerZS3 = true
                end
            end
		end,

		OchranaNezajisteni = function(self)
			if MIREL.rychlostKMHabs < 1 and (Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0) < 0.1 and MIREL.prenaseneOvladace.tlakBV < 0.1) then
				if not MIREL.pocitejCasNZ5 then
					MIREL.ubehlyCasNZ5 = 0
				end
				MIREL.pocitejCasNZ5 = true
                if MIREL.ubehlyCasNZ5 > 25 then
                    if MIREL.narodniVolba ~= MIREL.madarsko then
                        MIREL:NouzoveZastaveni(5)
                    else
                        MIREL.zvuky.ZS20 = 1
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

        ZmenaDelkyVlaku = function(self)
            MIREL.prenosDruhaSekce = false
        end,

        ZpravyNavestidel = function(self,zprava,zadniSekce)
            if MIREL.isHere then
                if not MIREL.blokujPrenosNavesti and MIREL.baterie and not MIREL.D1_blokujPrenos then
                    if MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko then
                        if MIREL.NO.rezim == "PRE" and (predMasinou == 0 or zadniSekce) then
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
                                if (vzdalenost < MIREL.nejblizsiNavestidlo) or (math.abs(MIREL.nejblizsiNavestidlo - vzdalenost) < 20) or zadniSekce then
                                    MIREL.nejblizsiNavestidlo = vzdalenost
                                elseif (MIREL.nejblizsiNavestidlo < 0) then
                                    MIREL.nejblizsiNavestidlo = vzdalenost
                                    MIREL.kod = 0
                                    MIREL.kodOld = 0
                                    MIREL.posledniKodCas = os.clock()
                                    NO = 0
                                end
                            end
                            --vypis("MIREL.nejblizsiNavestidlo: "..tostring(MIREL.nejblizsiNavestidlo))
                            if NO ~= 0 then
                                if zadniSekce then
                                    MIREL.prenosDruhaSekce = true
                                end
                                if MIREL.nejblizsiNavestidlo == vzdalenost then
                                    if NO == 15 then			-- Stuj
                                        MIREL.kod = 2
                                        MIREL.NO.prenosNavesti = true
                                        if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 or zadniSekce then
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
                                        if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 or zadniSekce then
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
                                        if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 120 or zadniSekce then
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
                                        if MIREL.casPrenasenehoKodu > 5 or zadniSekce then
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
                                        if MIREL.casPrenasenehoKodu > 5 or zadniSekce then
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
                                    --  MIREL.kodOld = 0
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
                                        MIREL.zvuky.ZS7 = 0
                                        Call("SetControlValue","ZS7",0,0)
                                    else
                                        MIREL.zvuky.ZS7 = 1
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
                                MIREL.kodOld = 0
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
                            MIREL.kodOld = 0
                        end
                    elseif MIREL.narodniVolba == MIREL.madarsko then
                        local telegram = tonumber(string.sub(zprava, 1, string.find(zprava, "|")-1))
                        -- SysCall("ScenarioManager:ShowAlertMessageExt", "MIREL", telegram, 2, 0)

                        if telegram ~= nil then
                            if (MIREL.rychlostKMHabs < 15 and MIREL.rychlostniPrikaz == 0) or (MIREL.rychlostniPrikaz == 1 and 4-telegram > MIREL.rychlostniPrikaz) then --pri rychlosti < 15km/h a zmene prikazu vygeneruj bdelostnou vyzvu
                                MIREL.bdelostnaVyzvaZmenaPrikazu = true
                                MIREL.zvuky.ZS20 = 1
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
                    MIREL.kodOld = 0
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
            else
                if zprava == "SHP" then
                    if zaMasinouDvojicka then
                        Call("SendConsistMessage", 998104, "SHP", 1)
                    end
                elseif MIREL.narodniVolba == MIREL.cesko or MIREL.narodniVolba == MIREL.slovensko and MIREL.NO.Rezim == "PRE" then
                    if predMasinou == 0 and MIREL.isCab2Active and MIREL.inicializovanyDekoder then
                        local NO
                        local vzdalenost
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
                                MIREL.kodOld = 0
                                MIREL.posledniKodCas = os.clock()
                                NO = 0
                            end
                        end
                        if NO ~= 0 then
                            if MIREL.nejblizsiNavestidlo == vzdalenost then
                                if not MIREL.prenosDruhaSekce then
                                    if zaMasinouDvojicka then
                                        Call("SendConsistMessage", 998104, zprava, 1)
                                        MIREL.prenosDruhaSekce = true
                                    end
                                end
                                if NO == 15 then			-- Stuj
                                    MIREL.kod = 2
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.kodOld ~= MIREL.kod then
                                        if zaMasinouDvojicka then
                                            Call("SendConsistMessage", 998104, zprava, 1)
                                        end
                                    end
                                    if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 then
                                        if MIREL.stabilniKodOld ~= MIREL.kod then
                                            MIREL.stabilniKodOld = MIREL.kod
                                        end
                                        MIREL.rychlostPodleNavesti = 40
                                        MIREL.kodovaneMezikruzi = false
                                        MIREL.mezikruziZvyseni = 0
                                        MIREL.prodlouzeniKodovaniStuj = 1000
                                    end
                                    MIREL.posledniKodCas = os.clock()
                                elseif NO == 30 then	    -- Opakovana Vystraha na 4AB
                                    MIREL.kod = 2
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.kodOld ~= MIREL.kod then
                                        if zaMasinouDvojicka then
                                            Call("SendConsistMessage", 998104, zprava, 1)
                                        end
                                    end
                                    if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 40 then
                                        if MIREL.stabilniKodOld ~= MIREL.kod then
                                            MIREL.stabilniKodOld = MIREL.kod
                                        end
                                        MIREL.rychlostPodleNavesti = 40
                                        MIREL.kodovaneMezikruzi = false
                                        MIREL.mezikruziZvyseni = 0
                                        MIREL.prodlouzeniKodovaniStuj = -1
                                    end
                                    MIREL.posledniKodCas = os.clock()
                                elseif NO == 17 then		-- Vystraha
                                    MIREL.kod = 1
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.kodOld ~= MIREL.kod then
                                        if zaMasinouDvojicka then
                                            Call("SendConsistMessage", 998104, zprava, 1)
                                        end
                                    end
                                    if MIREL.casPrenasenehoKodu > 5 or MIREL.rychlostPodleNavesti >= 120 then
                                        if MIREL.stabilniKodOld ~= MIREL.kod then
                                            MIREL.stabilniKodOld = MIREL.kod
                                        end
                                        MIREL.rychlostPodleNavesti = 120
                                        MIREL.kodovaneMezikruzi = false
                                        MIREL.mezikruziZvyseni = 0
                                        MIREL.prodlouzeniKodovaniStuj = -1
                                    end
                                    MIREL.posledniKodCas = os.clock()
                                elseif NO == 16 then		-- Volno
                                    MIREL.kod = 3
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.kodOld ~= MIREL.kod then
                                        if zaMasinouDvojicka then
                                            Call("SendConsistMessage", 998104, zprava, 1)
                                        end
                                    end
                                    if MIREL.casPrenasenehoKodu > 5 then
                                        if MIREL.stabilniKodOld ~= MIREL.kod then
                                            MIREL.stabilniKodOld = MIREL.kod
                                        end
                                        MIREL.rychlostPodleNavesti = 160
                                        MIREL.kodovaneMezikruzi = false
                                        MIREL.mezikruziZvyseni = 0
                                        MIREL.prodlouzeniKodovaniStuj = -1
                                    end
                                    MIREL.posledniKodCas = os.clock()
                                elseif NO >= 19 and NO <= 24 or MIREL.rychlostPodleNavesti >= 40 then		-- omezene rychlosti
                                    MIREL.kod = 4
                                    MIREL.NO.prenosNavesti = true
                                    if MIREL.kodOld ~= MIREL.kod then
                                        if zaMasinouDvojicka then
                                            Call("SendConsistMessage", 998104, zprava, 1)
                                        end
                                    end
                                    if MIREL.casPrenasenehoKodu > 5 then
                                        if MIREL.stabilniKodOld ~= 4 then
                                            MIREL.mezikruziZvyseni = 0
                                            MIREL.stabilniKodOld = MIREL.kod
                                        end
                                        MIREL.rychlostPodleNavesti = 40
                                        MIREL.kodovaneMezikruzi = true
                                        MIREL.prodlouzeniKodovaniStuj = -1
                                    end
                                    MIREL.posledniKodCas = os.clock()
                                end
                            end
                            if MIREL.kod ~= MIREL.kodOld then
                                MIREL.casPrenasenehoKodu = 0
                            end
                            MIREL.kodOld = MIREL.kod
                        elseif MIREL.nejblizsiNavestidlo == vzdalenost then
                            if MIREL.prenosDruhaSekce then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage", 998104, "-1 10", 1)
                                end
                            end
                            MIREL.prenosDruhaSekce = false
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
                            MIREL.kodOld = 0
                        end
                    elseif MIREL.prenosDruhaSekce then
                        if zaMasinouDvojicka then
                            Call("SendConsistMessage", 998104, "-1 10", 1)
                        end
                        MIREL.prenosDruhaSekce = false
                    end
                elseif MIREL.prenosDruhaSekce then
                    if zaMasinouDvojicka then
                        Call("SendConsistMessage", 998104, "-1 10", 1)
                    end
                    MIREL.prenosDruhaSekce = false
                end
            end
        end,
        
        SynchronizaceRidiciJednotky = function(self,messID,argument)
            --998100 - MIREL prenasene ovladace
            --998101 - MIREL NaVo
            --998102 - MIREL rezim
            --998103 - MIREL zobraz
            --998104 - MIREL zprava navestidla
            --998105 - MIREL ping
            --998106 - MIREL pong
            --998107 - MIREL bdelost
            --998108 - MIREL prehraj zvuk
            --998109 - MIREL text
            --998110 - MIREL ztrata kodu
            --998111 - MIREL prenos zobrazene rychlosti
            if MIREL.isHere then --ridici jednotka
                if messID == 998100 then
                    MIREL:ParseControlsMessage(argument)
                elseif messID == 998101 then
                elseif messID == 998102 then
                elseif messID == 998103 then
                    MIREL:PackDisplayMessage()
                elseif messID == 998104 then
                    MIREL:ZpravyNavestidel(argument,true)
                elseif messID == 998105 then
                    ZpravaDebug("Ping")
                    MIREL:Pong()
                elseif messID == 998107 then
                    if argument == "0" then
                        MIREL:VybaveniBdelosti()
                    else
                        MIREL:VybaveniBdelostiOvladacem()
                    end
                elseif messID == 998110 then
                    if argument == "1" then
                        MIREL.prenosDruhaSekce = false
                    else
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
                end
            else --zobrazovaci jednotka
                if messID == 998101 then
                    MIREL.narodniVolba = tonumber(argument)
                elseif messID == 998102 then
                    MIREL.NO.Rezim = argument
                elseif messID == 998103 then
                    MIREL:ParseDisplayMessage(argument)
                elseif messID == 998106 then
                    ZpravaDebug("Pong")
                    MIREL.casSynchronizace = os.clock()
                    MIREL.pingSent = false
                elseif messID == 998108 then
                    MIREL:ParseSoundMessage(argument)
                elseif messID == 998109 then
                    MIREL.NO11 = argument
                    ZpravaDebug("Text: "..argument)
                elseif messID == 998111 then
                    MIREL.zobrazenaRychlost = tonumber(argument)
                end
            end
        end,

        Ping = function(self)
            if MIREL.baterie then
                if zaMasinouDvojicka then
                    MIREL:PackControlsMessage()
                    Call("SendConsistMessage", 998105, "1", 1)
                end
            end
        end,

        Pong = function(self)
            if MIREL.baterie then
                if zaMasinouDvojicka then
                    Call("SendConsistMessage", 998101, tostring(MIREL.narodniVolba), 1)
                    Call("SendConsistMessage", 998106, "1", 1)
                    Call("SendConsistMessage", 998109, tostring(MIREL.NO.NO11write), 1)
                    ZpravaDebug("Text: "..MIREL.NO.NO11write..", text orig: "..MIREL.NO.NO11)
                    MIREL:PackDisplayMessage()
                end
            end
        end,

        PackControlsMessage = function(self)
            if zaMasinouDvojicka then
                argument = MIREL:BolToDecToBol(MIREL.prenaseneOvladace.NO12)..MIREL:BolToDecToBol(MIREL.prenaseneOvladace.NO13)..MIREL:BolToDecToBol(MIREL.prenaseneOvladace.NO14)..tostring(MIREL.prenaseneOvladace.smerovyOvladac+1)..MIREL:BolToDecToBol(MIREL.prenaseneOvladace.bdelost)..tostring(MIREL.prenaseneOvladace.tlakBV)
                Call("SendConsistMessage", 998100, argument, 1)
            end
        end,

        ParseControlsMessage = function(self,argument)
            ZpravaDebug("Parse controls message: "..argument)
            MIREL.prenaseneOvladace.NO12 = string.sub(argument,1,1) == "1"
            MIREL.prenaseneOvladace.NO13 = string.sub(argument,2,2) == "1"
            MIREL.prenaseneOvladace.NO14 = string.sub(argument,3,3) == "1"
            MIREL.prenaseneOvladace.smerovyOvladac = tonumber(string.sub(argument,4,4))-1
            MIREL.prenaseneOvladace.bdelost = string.sub(argument,5,5) == "1"
            MIREL.prenaseneOvladace.tlakBV = tonumber(string.sub(argument,6))
        end,

        PackDisplayMessage = function(self)
            if zaMasinouDvojicka then
                argument = MIREL:BolToDecToBol(MIREL.NO.NO1)..MIREL:BolToDecToBol(MIREL.NO.NO2)..MIREL:BolToDecToBol(MIREL.NO.NO3)..MIREL:BolToDecToBol(MIREL.NO.NO4)..MIREL:BolToDecToBol(MIREL.NO.NO5)..MIREL:BolToDecToBol(MIREL.NO.NO7)..MIREL:BolToDecToBol(MIREL.NO.NO8)..MIREL:BolToDecToBol(MIREL.NO.NO9)..MIREL:BolToDecToBol(MIREL.NO.NO10)..MIREL:BolToDecToBol(MIREL.zamekRychlosti)..MIREL:BolToDecToBol(MIREL.NO.D1_1 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(MIREL.NO.D1_2 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(MIREL.NO.D1_3 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(MIREL.NO.D1_4 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(MIREL.NO.D1_5 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(MIREL.NO.D1_6 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(MIREL.NO.D1_7 and not MIREL.NO.blokujBlikaniTest)..MIREL:BolToDecToBol(not MIREL.blokujPrenosNavesti and MIREL.baterie and not MIREL.D1_blokujPrenos)
                Call("SendConsistMessage", 998103, argument, 1)
            end
        end,

        ParseDisplayMessage = function(self,argument)
            ZpravaDebug("Parse display message: "..argument)
            MIREL.NO.NO1 = string.sub(argument,1,1) == "1"
            MIREL.NO.NO2 = string.sub(argument,2,2) == "1"
            MIREL.NO.NO3 = string.sub(argument,3,3) == "1"
            MIREL.NO.NO4 = string.sub(argument,4,4) == "1"
            MIREL.NO.NO5 = string.sub(argument,5,5) == "1"
            MIREL.NO.NO7 = string.sub(argument,6,6) == "1"
            MIREL.NO.NO8 = string.sub(argument,7,7) == "1"
            MIREL.NO.NO9 = string.sub(argument,8,8) == "1"
            MIREL.NO.NO10 = string.sub(argument,9,9) == "1"
            MIREL.zamekRychlosti = string.sub(argument,10,10) == "1"
            MIREL.NO.D1_1 = string.sub(argument,11,11) == "1"
            MIREL.NO.D1_2 = string.sub(argument,12,12) == "1"
            MIREL.NO.D1_3 = string.sub(argument,13,13) == "1"
            MIREL.NO.D1_4 = string.sub(argument,14,14) == "1"
            MIREL.NO.D1_5 = string.sub(argument,15,15) == "1"
            MIREL.NO.D1_6 = string.sub(argument,16,16) == "1"
            MIREL.NO.D1_7 = string.sub(argument,17,17) == "1"
            MIREL.inicializovanyDekoder = string.sub(argument,18,18) == "1"
        end,

        PackSoundMessage = function(self)
            if zaMasinouDvojicka then
                argument = MIREL.zvuky.ZS1..MIREL.zvuky.ZS1B..MIREL.zvuky.ZS2..MIREL.zvuky.ZS3..MIREL.zvuky.ZS7..MIREL.zvuky.ZS8..MIREL.zvuky.ZS11..MIREL.zvuky.ZS20
                Call("SendConsistMessage", 998108, argument, 1)
            end
        end,

        ParseSoundMessage = function(self,argument)
            ZpravaDebug("Parse sound message: "..argument)
            MIREL.zvuky.ZS1 = tonumber(string.sub(argument,1,1))
            MIREL.zvuky.ZS1B = tonumber(string.sub(argument,2,2))
            MIREL.zvuky.ZS2 = tonumber(string.sub(argument,3,3))
            MIREL.zvuky.ZS3 = tonumber(string.sub(argument,4,4))
            MIREL.zvuky.ZS7 = tonumber(string.sub(argument,5,5))
            MIREL.zvuky.ZS8 = tonumber(string.sub(argument,6,6))
            MIREL.zvuky.ZS11 = tonumber(string.sub(argument,7,7))
            MIREL.zvuky.ZS20 = tonumber(string.sub(argument,8,8))
        end
};
MIREL:NastavMIREL()

MIREL_RM1 = {
    IN = {
        dreimalEmptyChar = "BBB",
        IN1 = 0,
        IN1cilova = 0,
        IN1cilovaLast = casProcesor,
        IN1lastKrok = casProcesor,
        IN2skutecna = 0,
        IN2blik = 0,
        IN2blikStav = false,
        IN2blikCas = casProcesor,
        IN2out = 0,
        IN4 = "BBB"
    },
    Update = function(self,casUpdate)
        --zobrazovac rychlosti
            if (napetiRM and jeLicha) or (napetiRMkoncova and jeSuda) then
                if jeSuda and (jeKoncovaSuda or cisloLokoKoncova == 0) then --E00
                    MIREL_RM1.IN.IN4 = "Err"
                    MIRER.synchroCas = false
                elseif jeLicha and (jeKoncovaLicha or cisloLokoKoncova == 0) then --E05
                    MIREL_RM1.IN.IN4 = "Err"
                    MIRER.synchroCas = false
                else
                    MIRER.synchroCas = true
                    if (vedouci or jednotlive) and not (S101koncova ~= S101_VYPNUTO and S101koncova ~= S101_KONCOVA and S101koncova ~= -1) then
                        if casProcesor - MIREL_RM1.IN.IN1cilovaLast > 0.5 then
                            MIREL_RM1.IN.IN1cilova = math.min(round(rychlostKolaKMHPodvozek1), 176)
                            MIREL_RM1.IN.IN1cilovaLast = casProcesor
                        end
                        MIREL_RM1.IN.IN4 = tostring(MIREL_RM1.IN.IN1cilova)
                        while string.len(MIREL_RM1.IN.IN4) < 3 do
                            MIREL_RM1.IN.IN4 = " "..MIREL_RM1.IN.IN4
                        end
                        -- if MIREL.manual then
                        --     MIREL_RM1.IN.IN2skutecna = MIREL.rychlostKrivky
                        -- else
                            MIREL_RM1.IN.IN2skutecna = MIREL.zobrazenaRychlost
                        -- end
                        MIREL_RM1.IN.IN2blik = round(MIREL_RM1.IN.IN4/5)*5
                        if MIREL_RM1.IN.IN1cilova >= MIREL_RM1.IN.IN2skutecna+3 and MIREL_RM1.IN.IN2blikStav then
                            MIREL_RM1.IN.IN2out = MIREL_RM1.IN.IN2blik
                        else
                            MIREL_RM1.IN.IN2out = MIREL_RM1.IN.IN2skutecna
                        end
                    else
                        MIREL_RM1.IN.IN1cilova = 0
                        MIREL_RM1.IN.IN2out = 0
                        if not (vedouci or jednotlive) and (S101koncova == S101_VYPNUTO or S101koncova == S101_KONCOVA or S101koncova == -1) then
                            MIREL_RM1.IN.IN4 = "ST-"
                        else
                            if jeSuda then
                                MIREL_RM1.IN.IN4 = "ST1"
                            else
                                MIREL_RM1.IN.IN4 = "ST2"
                            end
                        end
                    end
                end
                if casProcesor - MIREL_RM1.IN.IN2blikCas > 0.4 then
                    MIREL_RM1.IN.IN2blikStav = not MIREL_RM1.IN.IN2blikStav
                    MIREL_RM1.IN.IN2blikCas = casProcesor
                end
                Call("RM1:SetText", MIREL_RM1.IN.IN4, 0)
                if casProcesor - MIREL_RM1.IN.IN1lastKrok > 0.1 then
                    if MIREL_RM1.IN.IN1 < MIREL_RM1.IN.IN1cilova then
                        MIREL_RM1.IN.IN1 = math.min(MIREL_RM1.IN.IN1 + 1, 120)
                    elseif MIREL_RM1.IN.IN1cilova < MIREL_RM1.IN.IN1 then
                        MIREL_RM1.IN.IN1 = math.max(MIREL_RM1.IN.IN1 - 1, 0)
                    end
                    MIREL_RM1.IN.IN1lastKrok = casProcesor
                end
                Call("SetControlValue", "RM1_IN1", 0, MIREL_RM1.IN.IN1)
                Call("SetControlValue", "RM1_IN2", 0, 125-MIREL_RM1.IN.IN2out)
                Call("SetControlValue", "RM1_IN3", 0, 1)
                Call("RM1_ID1_horni:SetText", " "..hh..":"..mm..":"..ss.." ", 10)
                Call("RM1_ID1_dolni:SetText", os.date("%d.%m.%Y"), 10)
            else
                MIRER.synchroCas = false
                MIREL_RM1.IN.IN2blikStav = false
                MIREL_RM1.IN.IN4 = MIREL_RM1.IN.dreimalEmptyChar
                Call("RM1:SetText", MIREL_RM1.IN.IN4, 0)
                Call("RM1_ID1_horni:SetText", "          ", 10)
                Call("RM1_ID1_dolni:SetText", "          ", 10)
                Call("SetControlValue", "RM1_IN2", 0, 0)
                Call("SetControlValue", "RM1_IN3", 0, 0)
            end
    end
};

VO67 = {
    cisloVlaku = tostring(math.random(41000,79999)),
    cisloVlakuOut = "",
    casStartu = -100,
    obraz = 0,
    simplex = false,
    volnyKanal = false,
    registrovan = false,
    registrovanCas = -100,
    zadavaniCisla = false,
    tlacitka = {
        zap = false,
        F1 = false,
        F2 = false,
        F3 = false,
        F4 = false,
        F5 = false,
        simplex = false,
        num0 = false,
        num1 = false,
        num2 = false,
        num3 = false,
        num4 = false,
        num5 = false,
        num6 = false,
        num7 = false,
        num8 = false,
        num9 = false,
        numHvezdicka = false,
        numMrizka = false,
        null = false,
        zapLast = false,
        F1Last = false,
        F2Last = false,
        F3Last = false,
        F4Last = false,
        F5Last = false,
        simplexLast = false,
        num0Last = false,
        num1Last = false,
        num2Last = false,
        num3Last = false,
        num4Last = false,
        num5Last = false,
        num6Last = false,
        num7Last = false,
        num8Last = false,
        num9Last = false,
        numHvezdickaLast = false,
        numMrizkaLast = false,
        nullLast = false
    },
    OBRAZY = {
        VYP = 0,
        DEF = 1,
        START = 2,
        VLAK = 3
    },
    sumTlacitka = "",
    sumTlacitkaLast = "",
    vysZvukCas = casProcesor,
    vysZvuk = 0,
    vysSumCas = casProcesor,
    soupatko = false,
    baterie = false,
    blink = false,
    blinkCounter = casProcesor,
    Update = function(self,cas)
        if VO67.baterie then
            VO67.soupatko = true
            VO67.tlacitka.zap = Call("GetControlValue", "vysON", 0) > 0.5
            if VO67.obraz == VO67.OBRAZY.VYP and VO67.tlacitka.zap then
                VO67.obraz = VO67.OBRAZY.START
                VO67.casStartu = casProcesor
                Call("SendConsistMessage",999100,"0",1)
            else
                if casProcesor - VO67.casStartu > 37 and VO67.obraz == VO67.OBRAZY.START then
                    VO67.obraz = VO67.OBRAZY.DEF
                elseif VO67.obraz ~= VO67.OBRAZY.START and VO67.obraz ~= VO67.OBRAZY.VYP then
                    VO67.tlacitka.F1Last = VO67.tlacitka.F1
                    VO67.tlacitka.F1 = Call("GetControlValue", "vysF1", 0) > 0.5
                    VO67.tlacitka.F2Last = VO67.tlacitka.F2
                    VO67.tlacitka.F2 = Call("GetControlValue", "vysF2", 0) > 0.5
                    VO67.tlacitka.F3Last = VO67.tlacitka.F3
                    VO67.tlacitka.F3 = Call("GetControlValue", "vysF3", 0) > 0.5
                    VO67.tlacitka.F4Last = VO67.tlacitka.F4
                    VO67.tlacitka.F4 = Call("GetControlValue", "vysF4", 0) > 0.5
                    VO67.tlacitka.F5Last = VO67.tlacitka.F5
                    VO67.tlacitka.F5 = Call("GetControlValue", "vysF5", 0) > 0.5
                    VO67.tlacitka.simplexLast = VO67.tlacitka.simplex
                    VO67.tlacitka.simplex = Call("GetControlValue", "vysSIM", 0) > 0.5
                    VO67.tlacitka.num0Last = VO67.tlacitka.num0
                    VO67.tlacitka.num0 = Call("GetControlValue", "vys0", 0) > 0.5
                    VO67.tlacitka.num1Last = VO67.tlacitka.num1
                    VO67.tlacitka.num1 = Call("GetControlValue", "vys1", 0) > 0.5
                    VO67.tlacitka.num2Last = VO67.tlacitka.num2
                    VO67.tlacitka.num2 = Call("GetControlValue", "vys2", 0) > 0.5
                    VO67.tlacitka.num3Last = VO67.tlacitka.num3
                    VO67.tlacitka.num3 = Call("GetControlValue", "vys3", 0) > 0.5
                    VO67.tlacitka.num4Last = VO67.tlacitka.num4
                    VO67.tlacitka.num4 = Call("GetControlValue", "vys4", 0) > 0.5
                    VO67.tlacitka.num5Last = VO67.tlacitka.num5
                    VO67.tlacitka.num5 = Call("GetControlValue", "vys5", 0) > 0.5
                    VO67.tlacitka.num6Last = VO67.tlacitka.num6
                    VO67.tlacitka.num6 = Call("GetControlValue", "vys6", 0) > 0.5
                    VO67.tlacitka.num7Last = VO67.tlacitka.num7
                    VO67.tlacitka.num7 = Call("GetControlValue", "vys7", 0) > 0.5
                    VO67.tlacitka.num8Last = VO67.tlacitka.num8
                    VO67.tlacitka.num8 = Call("GetControlValue", "vys8", 0) > 0.5
                    VO67.tlacitka.num9Last = VO67.tlacitka.num9
                    VO67.tlacitka.num9 = Call("GetControlValue", "vys9", 0) > 0.5
                    VO67.tlacitka.numHvezdickaLast = VO67.tlacitka.numHvezdicka
                    VO67.tlacitka.numHvezdicka = Call("GetControlValue", "vysHvezd", 0) > 0.5
                    VO67.tlacitka.numMrizkaLast = VO67.tlacitka.numMrizka
                    VO67.tlacitka.numMrizka = Call("GetControlValue", "vysHash", 0) > 0.5
                    VO67.tlacitka.nullLast = VO67.tlacitka.null
                    VO67.tlacitka.null = Call("GetControlValue", "vysNULL", 0) > 0.5
                    VO67.sumTlacitkaLast = VO67.sumTlacitka
                    VO67.sumTlacitka = 0
                    for k,v in pairs(VO67.tlacitka) do
                        if not string.find(k, "Last") then
                            VO67.sumTlacitka = VO67.sumTlacitka + toInt(v)
                        end
                    end
                    Call("SoundCab:SetParameter", "VysTlac", VO67.sumTlacitka)
                    if not VO67.registrovan then
                        if VO67.tlacitka.F1 and not VO67.tlacitka.F1Last then
                            if VO67.obraz == VO67.OBRAZY.VLAK and not VO67.zadavaniCisla then
                                VO67.obraz = VO67.OBRAZY.DEF
                                VO67.registrovanCas = casProcesor
                                VO67.zadavaniCisla = false
                            end
                        end
                        if VO67.tlacitka.F2 and not VO67.tlacitka.F2Last then
                            if VO67.obraz == VO67.OBRAZY.VLAK and not VO67.zadavaniCisla then
                                VO67.obraz = VO67.OBRAZY.DEF
                                VO67.registrovanCas = casProcesor
                                VO67.zadavaniCisla = false
                            end
                        end
                        if VO67.tlacitka.F3 and not VO67.tlacitka.F3Last then
                            if VO67.obraz == VO67.OBRAZY.DEF then
                                VO67.obraz = VO67.OBRAZY.VLAK
                            elseif VO67.obraz == VO67.OBRAZY.VLAK and not VO67.zadavaniCisla then
                                VO67.obraz = VO67.OBRAZY.DEF
                                VO67.registrovanCas = casProcesor
                                VO67.zadavaniCisla = false
                            end
                        end
                        if VO67.tlacitka.F4 and not VO67.tlacitka.F4Last then
                            if VO67.obraz == VO67.OBRAZY.VLAK and not VO67.zadavaniCisla then
                                VO67.obraz = VO67.OBRAZY.DEF
                                VO67.registrovanCas = casProcesor
                                VO67.zadavaniCisla = false
                            end
                        end
                        if VO67.tlacitka.F5 and not VO67.tlacitka.F5Last then
                            if VO67.obraz == VO67.OBRAZY.VLAK and not VO67.zadavaniCisla then
                                VO67.obraz = VO67.OBRAZY.DEF
                                VO67.registrovanCas = casProcesor
                                VO67.zadavaniCisla = false
                            end
                        end
                    else
                        if VO67.tlacitka.F4 and not VO67.tlacitka.F4Last then
                            if VO67.obraz == VO67.OBRAZY.DEF then
                                VO67.registrovan = false
                                VO67.registrovanCas = -100
                            end
                        end
                    end
                    if casProcesor - VO67.registrovanCas > 5 and VO67.registrovanCas > 0 then
                        VO67.registrovan = true
                    end
                    if VO67.tlacitka.simplex and not VO67.tlacitka.simplexLast then
                        VO67.simplex = not VO67.simplex
                    end
                    if VO67.obraz == VO67.OBRAZY.VLAK then
                        if VO67.tlacitka.num0 and not VO67.tlacitka.num0Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."0"
                            end
                        elseif VO67.tlacitka.num1 and not VO67.tlacitka.num1Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."1"
                            end
                        elseif VO67.tlacitka.num2 and not VO67.tlacitka.num2Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."2"
                            end
                        elseif VO67.tlacitka.num3 and not VO67.tlacitka.num3Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."3"
                            end
                        elseif VO67.tlacitka.num4 and not VO67.tlacitka.num4Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."4"
                            end
                        elseif VO67.tlacitka.num5 and not VO67.tlacitka.num5Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."5"
                            end
                        elseif VO67.tlacitka.num6 and not VO67.tlacitka.num6Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."6"
                            end
                        elseif VO67.tlacitka.num7 and not VO67.tlacitka.num7Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."7"
                            end
                        elseif VO67.tlacitka.num8 and not VO67.tlacitka.num8Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."8"
                            end
                        elseif VO67.tlacitka.num9 and not VO67.tlacitka.num9Last then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif string.len(VO67.cisloVlaku) < 6 then
                                VO67.cisloVlaku = VO67.cisloVlaku.."9"
                            end
                        elseif VO67.tlacitka.numHvezdicka and not VO67.tlacitka.numHvezdickaLast then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            elseif tonumber(VO67.cisloVlaku) ~= 0 then
                                -- while string.len(VO67.cisloVlaku) < 6 do
                                --     VO67.cisloVlaku = "0"..VO67.cisloVlaku
                                -- end
                                Call("SendConsistMessage",999101,VO67.cisloVlaku,1)
                                VO67.zadavaniCisla = false
                            end
                        elseif VO67.tlacitka.numMrizka and not VO67.tlacitka.numMrizkaLast then
                            if not VO67.zadavaniCisla then
                                VO67.zadavaniCisla = true
                                VO67.cisloVlaku = ""
                            else
                                VO67.cisloVlaku = string.sub(VO67.cisloVlaku,1,-2)
                            end
                        end
                    end
                    if VO67.tlacitka.null and not VO67.tlacitka.nullLast then
                        VO67.obraz = VO67.OBRAZY.START
                        VO67.zadavaniCisla = false
                        VO67.simplex = false
                        VO67.volnyKanal = false
                        Call("VO67_Bila:SetText", "      ", 0)
                        Call("VO67_Modra:SetText", "      ", 0)
                    end
                end
            end
            if not VO67.registrovan then
                if casProcesor - VO67.blinkCounter  > 0.5 then
                    VO67.blinkCounter = casProcesor
                    VO67.blink = not VO67.blink
                end
            end
            if VO67.registrovan or VO67.blink or VO67.obraz == VO67.OBRAZY.VLAK then
                VO67.cisloVlakuOut = VO67.cisloVlaku
            else
                VO67.cisloVlakuOut = "      "
            end
            while string.len(VO67.cisloVlakuOut) < 6 do
                if VO67.obraz == VO67.OBRAZY.VLAK and not VO67.zadavaniCisla then
                    VO67.cisloVlakuOut = "0"..VO67.cisloVlakuOut
                else
                    VO67.cisloVlakuOut = " "..VO67.cisloVlakuOut
                end
            end
            if VO67.obraz ~= VO67.OBRAZY.VYP and VO67.obraz ~= VO67.OBRAZY.START then
                if VO67.zadavaniCisla then
                    Call("VO67_Modra:SetText", VO67.cisloVlakuOut, 0)
                    Call("VO67_Bila:SetText", "      ", 0)
                else
                    Call("VO67_Bila:SetText", VO67.cisloVlakuOut, 0)
                    Call("VO67_Modra:SetText", "      ", 0)
                end
            else
                Call("VO67_Bila:SetText", "      ", 0)
                Call("VO67_Modra:SetText", "      ", 0)
            end

            --zvuky
                if VO67.vysZvukCas < casProcesor then
                    if Call("GetIsInTunnel") ~= 1 and VO67.simplex then
                        VO67.vysZvuk = 1 - VO67.vysZvuk
                        Call("SoundCab:SetParameter", "VysZvuk", VO67.vysZvuk)
                    end
                    VO67.vysZvukCas = casProcesor + math.random(10,30)
                end

                if VO67.vysSumCas < casProcesor then
                    if VO67.simplex then
                        Call("SoundCab:SetParameter", "VysSum", 1)
                    end
                    VO67.vysSumCas = casProcesor + math.random(2,12)
                else
                    if Call("GetIsInTunnel") == 1 and VO67.simplex then
                        Call("SoundCab:SetParameter", "VysSum", 1)
                    else
                        Call("SoundCab:SetParameter", "VysSum", 0)
                    end
                end
        else
            VO67.soupatko = false
            VO67.obraz = VO67.OBRAZY.VYP
            VO67.casStartu = casProcesor
            VO67.zadavaniCisla = false
            VO67.registrovanCas = -100
            VO67.registrovan = false
            VO67.simplex = false
            VO67.volnyKanal = false
            Call("VO67_Bila:SetText", "      ", 0)
            Call("VO67_Modra:SetText", "      ", 0)
        end
        Call("SetControlValue", "VysilackaDispleje", 0, VO67.obraz)
        Call("SetControlValue", "Simplex", 0, toInt(VO67.simplex))
        Call("SetControlValue", "VolnyKanal", 0, toInt(VO67.volnyKanal))
        Call("SetControlValue", "Registrovan", 0, toInt(casProcesor-VO67.registrovanCas < 10 and VO67.registrovan))
        Call("SetControlValue", "KursorCislo", 0, toInt(VO67.zadavaniCisla))
    end
};

function toInt(val)
    if val then
        return(1)
    end
    return(0)
end
function divMod(x,y)
    return math.floor(x / y), x - math.floor(x/y)*y
end
function divRest(x,y)
    return x - math.floor(x/y)*y
end
function round(x)
    a, b = divMod(x,1) 
    if b ~= 0 then
        if b > 0.5 then
            z = a + 1
        else 
            z = a
        end
    else
        z = a
    end
    return z
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
function CountIDs(cislo)
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
function tableContains(tableName, value)
	for k,v in pairs(tableName) do
		if v == value then
			return true
		end
	end
	return false
end
function ZpracujZpravuSID(zprava,argument,smer,nazevCV)
    if Call("GetIsPlayer") == 1 then
        if obsazena then
            val = string.sub(argument,0,string.find(argument,":")-1)
            IDzpravy = tonumber(string.sub(argument,string.find(argument,":")+1))
            hodnotaZpravy = 2^(IDzpravy-1)
            hodnotaCV = Call("GetControlValue",nazevCV,0)
            IDmasinAktiv = GetIDs(hodnotaCV)
            if val == "1" and IDmasinAktiv[IDzpravy] == nil then
                Call("SetControlValue",nazevCV,0,tonumber(hodnotaCV+hodnotaZpravy))
            elseif val == "0" then
                hodnotaCV = hodnotaCV - 2^(IDzpravy-1)
                Call("SetControlValue",nazevCV,0,hodnotaCV)--vrat misto hodnotaCV
            end
        else
            Call("SendConsistMessage",zprava,argument,smer)
        end
    end
end
function NastavHodnotuSID(nazevCV,hodnota,cisloZpravy)
    if Call("GetIsPlayer") == 1 then
        if hodnota == 1 then
            hodnotaCV = Call("GetControlValue",nazevCV,0)
            IDmasinAktiv = GetIDs(hodnotaCV)
            if IDmasinAktiv[ID] == nil then
                if obsazena then
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
                if obsazena then
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
end
function ZpravaDebug(zprava)
    if DEBUG then
        printID = ID
        if printID == nil then
            printID = Call("GetRVNumber")
        end
        local casPrintOut = os.clock()
        Print(casPrintOut..":ZSSKC131 - ID"..printID)
        Print(casPrintOut..":Rizena: "..tostring((obsazena)))
        Print(casPrintOut..":Zprava: "..zprava.."\n")
        f = assert(io.open("131.log", "a"))
        f:write(casPrintOut..":ZSSKC131 - ID: "..printID.." :: Rizena: "..tostring((obsazena)).." :: Zprava: "..zprava.."\n")
        f:close()
    end
end
function compare(t1,t2)
    ZpravaDebug(table.getn(t1)..":"..table.getn(t2))
    if table.getn(t1) > table.getn(t2) then
        for i,k in pairs(t1) do
            ZpravaDebug("test: "..tostring(k)..":"..tostring(t2[i]))
            if k ~= t2[i] then
                return false
            end
        end
    else
        for i,k in pairs(t2) do
            ZpravaDebug("test: "..tostring(t1[i])..":"..tostring(k))
            if t1[i] ~= k then
                return false
            end
        end
    end
    return true
end
function clone(org)
    new = {}
    for i,k in pairs(org) do
        new[i] = k
    end
    return new
end
function getIdentifierForHKNotch(notchNum, edbChod)
    local notchString = "  "
    if notchNum < 0 and edbChod then
        notchString = "EB"
    elseif notchNum < 0 then
        notchString = "-1"
    elseif notchNum == 0 then
        notchString = " 0"
    elseif notchNum == 1 then
        notchString = " X"
    elseif notchNum < 26 then
        notchString = tostring(notchNum-1)
    elseif notchNum == 26 then
        notchString = "Se"
    elseif notchNum == 27 then
        notchString = " A"
    elseif notchNum == 28 then
        notchString = " B"
    elseif notchNum < 40 then
        notchString = tostring(notchNum-3)
    elseif notchNum == 40 then
        notchString = "Pa"
    elseif notchNum == 41 then
        notchString = "P1"
    elseif notchNum == 42 then
        notchString = "P2"
    elseif notchNum == 43 then
        notchString = "P3"
    elseif notchNum == 44 then
        notchString = "P4"
    elseif notchNum == 45 then
        notchString = "P5"
    end
    if string.len(notchString) < 2 then
        notchString = " "..notchString
    end
    return notchString
end
function table.len(t)
    local c = 0
    for k,v in pairs(t) do
        c = c+1
    end
    return c
end
function vypoctiKontrolku(cisloLoko)
    cisloLokoString = tostring(cisloLoko)
    cisloLokoTabulka = {}
    while string.len(cisloLokoString) < 3 do
        cisloLokoString = "0"..cisloLokoString
    end
    cisloLokoCele = "131"..cisloLokoString
    string.gsub(cisloLokoCele,".",function(c) table.insert(cisloLokoTabulka,c) end)
    kontrolniCislice = 0
    for k,v in pairs(cisloLokoTabulka) do
        cislice = v
        if divRest(k,2) == 0 then
            cislice = cislice * 2
            if cislice >= 10 then
                cislice = 1 + divRest(cislice,10)
            end
        end
        kontrolniCislice = kontrolniCislice + cislice
    end
    kontrolniCislice = 10 - divRest(kontrolniCislice,10)
    return kontrolniCislice
end

function VratStupenHK(hlavniKontroler)
	local cele = 0
    local zbytek = 0
    local stupenTrCh = 0
	if hlavniKontroler > 0 then
		stupenTrCh = hlavniKontroler/0.022
        stupenTrCh = round(stupenTrCh)
    elseif hlavniKontroler < 0 then
        stupenTrCh = -1
    end
    return stupenTrCh
end
function VratTCh(hlavniKontroler,wheelSpeed)
	local shunt = round(math.max((hlavniKontroler - 0.88)/0.022,0))
	local vratRegulator = 0
	local vypoctenaTrCh = 0
    local speed = math.abs(wheelSpeed)
    local stupenTrCh = math.min(VratStupenHK(hlavniKontroler),40)
	if stupenTrCh > 0 and shunt <= 0 then
		vypoctenaTrCh = max_kN[stupenTrCh]*(math.exp(koeficient[stupenTrCh]*speed))
		if vratRegulator > 1 then
			vratRegulator = 1
        end
    elseif shunt > 0 then
        local speedKMH = math.max(speed*3.6,shuntMin[shunt])
        vypoctenaTrCh = 1/(shuntA[shunt]*speedKMH^2+shuntB[shunt]*speedKMH-shuntC[shunt])
	end
    vratRegulator = vypoctenaTrCh/absolutniMax_kN
	return(vratRegulator)
end
function VratProudy(kN_TM1, kN_TM2,hlavniKontroler,wheelSpeed1,wheelSpeed2)
    local shunt = round(math.max((hlavniKontroler - 0.88)/0.022,0))
    local stupenHK = VratStupenHK(hlavniKontroler)
    local smer = Call("GetControlValue","Reverser",0)
    local vratProud1 = (math.abs(kN_TM1)^(1/1.46))*20.6
    local vratProud2 = (math.abs(kN_TM2)^(1/1.46))*20.6
	if shunt > 0 and shunt < 1.5 then
		vratProud1 = vratProud1/0.91
		vratProud2 = vratProud2/0.91
	elseif shunt > 1.5 and shunt < 2.5 then
		vratProud1 = vratProud1/0.835
		vratProud2 = vratProud2/0.835
	elseif shunt > 2.5 and shunt < 3.5 then
		vratProud1 = vratProud1/0.78
		vratProud2 = vratProud2/0.78
	elseif shunt > 3.5 and shunt < 4.5 then
        vratProud1 = vratProud1/0.735
        vratProud2 = vratProud2/0.735
    elseif shunt > 4.5 then
        vratProud1 = vratProud1/0.7
        vratProud2 = vratProud2/0.7
    end
	if smer > 0 and Call("GetSpeed") < 0 and obsazena then
        vratProud1 = vratProud1 * math.max((math.abs(wheelSpeed1)/1.5),1)
	elseif smer < 0 and Call("GetSpeed") > 0 and obsazena then
		vratProud1 = vratProud1 * math.max((math.abs(wheelSpeed1)/1.5),1)
    end
	if smer > 0 and Call("GetSpeed") < 0 and obsazena then
        vratProud2 = vratProud2 * math.max((math.abs(wheelSpeed2)/1.5),1)
	elseif smer < 0 and Call("GetSpeed") > 0 and obsazena then
        vratProud2 = vratProud2 * math.max((math.abs(wheelSpeed2)/1.5),1)
    end
    -- if hlavniKontroler < 0.594 then
    --     vratProud1 = (vratProud1+vratProud2)
    --     vratProud2 = vratProud1
    -- end
	return vratProud1, vratProud2
end

function Initialise()
    Call("BeginUpdate")
    ZpravaDebug("********************START SCRIPT********************")
	predMasinou = Call("SendConsistMessage",131999,"DUMMY",0)
	zaMasinou = Call("SendConsistMessage",131999,"DUMMY",1)
end

--zpravy
    --131001 - S101
    --131002 - prenos pozadovane hodnoty HK
    --131003 - X202
    --131004 - X204
    --131005 - prenos stupne HK
    --131006 - stavy MIRER
    --131007 - prevodnik
    --131008 - poruchy MIRER
    --131009 - trvaly minus
    --131010 - prenos baterii
    --131011 - prenos HV
    --131012 - EDB chod
    --131013 - EDB LSO
    --131014 - delta napeti
    --131015 - tvrdost napeti
    --131016 - klicek na sousedni
    --131017 - postrk
    --131018 - prenos napeti z nav
    --131019 - RM F156
    --131020 - napeti RM
    --131021 - napeti MIRER
    --131988 - hk prenos do pk
    --131989 - obsazena sousedni loko
    --131990 - vykon v souprave
    --131991 - ID na vlaku
    --131992 - kompresory na vlaku
    --131993 - zaklopky potrubi
    --131994 - X souradnice sousedni loko
    --131995 - Y souradnice sousedni loko
    --131996 - obsazeni druheho stanoviste
    --131997 - nabalovani ID
	--131998 - zadost o ID
    --998100 - MIREL prenasene ovladace
    --998101 - MIREL
    --998102 - MIREL
    --998103 - MIREL zobraz
    --998104 - MIREL zprava navestidla
    --998105 - MIREL ping
    --998106 - MIREL pong
    --998107 - MIREL bdelost
    --998108 - MIREL prehraj zvuk
    --998109 - MIREL text
    --998110 - MIREL ztrata kodu
    --998111 - MIREL zobrazena rychlost
    --998112 - MIREL napajeni
    --999100 - vysilacka prevzeti rizeni
    --999101 - vysilacka prenos cisla
    --999102 - vysilacka napeti
function OnConsistMessage(zprava,argument,smer)
    if zprava ~= 131990 then
        ZpravaDebug("Prisla zprava cislo: "..zprava.." s argumentem: "..argument)
    end
    if (zprava < 131001 or zprava > 131013) and (zprava < 131016 or zprava > 131021) and (zprava < 131989 or zprava > 131995) and (zprava < 131997 or zprava > 131998) and (zprava < 998100 or zprava > 998112) and (zprava < 999100 or zprava > 999102) then
        stavPoslane = Call("SendConsistMessage",zprava,argument,smer)
    end
    if zprava == 131001 then
        S101koncova = tonumber(argument)
    elseif zprava == 131002 then
        hlavniKontrolerPozadovany = tonumber(argument)
    elseif zprava == 131003 then
        X202cizi[X202spojeni[1]] = string.sub(argument,1,1) == "1"
        X202cizi[X202spojeni[2]] = string.sub(argument,2,2) == "1"
        X202cizi[X202spojeni[3]] = string.sub(argument,3,3) == "1"
        X202cizi[X202spojeni[4]] = string.sub(argument,4,4) == "1"
        X202cizi[X202spojeni[5]] = string.sub(argument,5,5) == "1"
        X202cizi[X202spojeni[6]] = string.sub(argument,6,6) == "1"
        X202cizi[X202spojeni[7]] = string.sub(argument,7,7) == "1"
        X202cizi[X202spojeni[8]] = string.sub(argument,8,8) == "1"
        X202cizi[X202spojeni[9]] = string.sub(argument,9,9) == "1"
        X202cizi[X202spojeni[10]] = string.sub(argument,10,10) == "1"
        X202cizi[X202spojeni[11]] = string.sub(argument,11,11) == "1"
        X202cizi[X202spojeni[12]] = string.sub(argument,12,12) == "1"
        X202cizi[X202spojeni[13]] = string.sub(argument,13,13) == "1"
        X202cizi[X202spojeni[14]] = string.sub(argument,14,14) == "1"
        X202cizi[X202spojeni[15]] = string.sub(argument,15,15) == "1"
        X202cizi[X202spojeni[16]] = string.sub(argument,16,16) == "1"
        X202cizi[X202spojeni[17]] = string.sub(argument,17,17) == "1"
        X202cizi[X202spojeni[18]] = string.sub(argument,18,18) == "1"
        X202cizi[X202spojeni[21]] = string.sub(argument,19,19) == "1"
        X202cizi[X202spojeni[22]] = string.sub(argument,20,20) == "1"
        X202cizi[X202spojeni[23]] = string.sub(argument,21,21) == "1"
        X202cizi[X202spojeni[24]] = string.sub(argument,22,22) == "1"
        X202cizi[X202spojeni[36]] = string.sub(argument,23,23) == "1"
        X202cizi[X202spojeni[37]] = string.sub(argument,24,24) == "1"
        X202cizi[X202spojeni[41]] = string.sub(argument,25,25) == "1"
        X202cizi[X202spojeni[42]] = string.sub(argument,26,26) == "1"
        X202cizi[X202spojeni[43]] = string.sub(argument,27,27) == "1"
        X202cizi[X202spojeni[44]] = string.sub(argument,28,28) == "1"
        X202cizi[X202spojeni[45]] = string.sub(argument,29,29) == "1"
        X202cizi[X202spojeni[46]] = string.sub(argument,30,30) == "1"
        X202cizi[X202spojeni[47]] = string.sub(argument,31,31) == "1"
    elseif zprava == 131004 then
        X204cizi[X204spojeni[1]] = string.sub(argument,1,1) == "1"
        X204cizi[X204spojeni[2]] = string.sub(argument,2,2) == "1"
        X204cizi[X204spojeni[3]] = string.sub(argument,3,3) == "1"
        X204cizi[X204spojeni[4]] = string.sub(argument,4,4) == "1"
        X204cizi[X204spojeni[5]] = string.sub(argument,5,5) == "1"
        X204cizi[X204spojeni[6]] = string.sub(argument,6,6) == "1"
        X204cizi[X204spojeni[7]] = string.sub(argument,7,7) == "1"
        X204cizi[X204spojeni[8]] = string.sub(argument,8,8) == "1"
        X204cizi[X204spojeni[9]] = string.sub(argument,9,9) == "1"
        X204cizi[X204spojeni[10]] = string.sub(argument,10,10) == "1"
        X204cizi[X204spojeni[11]] = string.sub(argument,11,11) == "1"
        X204cizi[X204spojeni[12]] = string.sub(argument,12,12) == "1"
        X204cizi[X204spojeni[13]] = string.sub(argument,13,13) == "1"
        X204cizi[X204spojeni[14]] = string.sub(argument,14,14) == "1"
        X204cizi[X204spojeni[15]] = string.sub(argument,15,15) == "1"
    elseif zprava == 131005 then
        stupenHKKoncova = tonumber(argument)
    elseif zprava == 131006 then
        id = string.sub(argument,0,string.find(argument,":")-1)
        hodnota = string.sub(argument,string.find(argument,":")+1)
        if not MIRER:stavyContains(id) then
            MIRER.stavy[id] = {}
        end
        if hodnota == "false" then
            MIRER.stavy[id].koncova = false
        else
            MIRER.stavy[id].koncova = true
        end
    elseif zprava == 131007 then
        edbPrevodnikKoncova = tonumber(argument)
    elseif zprava == 131008 then
        id = string.sub(argument,0,string.find(argument,":")-1)
        hodnota = string.sub(argument,string.find(argument,":")+1)
        if not MIRER:poruchyContains(id) then
            MIRER.poruchy[id] = {}
        end
        if hodnota == "false" then
            MIRER.poruchy[id] = false
        else
            MIRER.poruchy[id] = true
        end
    elseif zprava == 131009 then
        trvalyMinusKoncova = tonumber(argument) > 0.5
    elseif zprava == 131010 then
        baterieKoncova = (argument == "1")
    elseif zprava == 131011 then
        Q01koncova = (argument == "1")
    elseif zprava == 131012 then
        EDB_CHODkoncova = (argument == "1")
    elseif zprava == 131013 then
        EDB_LSOkoncova = (argument == "1")
    elseif zprava == 131014 then
        speed = string.sub(argument,0,string.find(argument,":")-1)
        target = string.sub(argument,string.find(argument,":")+1)
        napetiDeltaSpeed = tonumber(speed)
        napetiTargetDelta = tonumber(target)
    elseif zprava == 131015 then
        tvrdostNapetiTarget = tonumber(argument)
    elseif zprava == 131016 then
        isKlicekNaSousedni = argument == "1"
    elseif zprava == 131017 then
        aktivniPostrk = argument == "1"
    elseif zprava == 131018 then
        found = false
        delimpos = string.find(argument, ":")
        delim2pos = string.find(argument, ";")
        ujeteMetry = -(tonumber(string.sub(argument, 1, delimpos-1))-2*8.64)
        noveNapeti = tonumber(string.sub(argument, delimpos+1, delim2pos-1))
        stareNapeti = tonumber(string.sub(argument, delim2pos+1))
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 10 and v[2] == noveNapeti then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, stareNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, stareNapeti}
        end
    elseif zprava == 131019 then
        F156koncova = (argument == "1")
    elseif zprava == 131020 then
        napetiRMkoncova = (argument == "1")
    elseif zprava == 131021 then
        napetiMIRERkoncova = (argument == "1")
    elseif zprava == 131988 then
        hlavniKontrolerPK = tonumber(argument)
    elseif zprava == 131989 then
        obsazenaSousedni = obsazena
    elseif zprava == 131990 then
        lokoID = string.sub(argument,0,string.find( argument,":")-1)
        hodnota = tonumber(string.sub(argument,string.find(argument,":")+1))
        tabulkaVykonu[lokoID] = hodnota
    elseif zprava == 131991 then
        ZpracujZpravuSID(zprava, argument, smer, "IDnaVlaku")
    elseif zprava == 131992 then
        ZpracujZpravuSID(zprava,argument,smer,"kompresoryNaVlaku")
    elseif zprava == 131993 then
        ZpracujZpravuSID(zprava,argument,smer,"zaklopkyPotrubi")
    elseif zprava == 131994 then
        if prijataPoloha[smer+1] == nil then
            prijataPoloha[smer+1] = {}
        end
        if prijataPoloha[smer+1]["y"] ~= nil then
            local xZS = argument
            x, _, y = Call("PozCervenaPravaZadni:getNearPosition")
            ZpravaDebug("x: "..x.." y: "..y)
            local vzdalenost = math.sqrt((xZS-x)^2 + (prijataPoloha[smer+1]["y"]-y)^2)
            prijataPoloha[smer+1] = nil
            ZpravaDebug("Prislo Y: "..argument..", vzdalenost: "..tostring(vzdalenost)..", smer: "..tostring(smer))
            if vzdalenost < maxVzdalenost then
                if smer == 1 then
                    predMasinouDvojicka = true
                    predMasinouDvojickaCas = nil
                else
                    zaMasinouDvojicka = true
                    zaMasinouDvojickaCas = nil
                end
            else
                if smer == 1 then
                    predMasinouDvojicka = false
                    predMasinouDvojickaCas = nil
                else
                    zaMasinouDvojicka = false
                    zaMasinouDvojickaCas = nil
                end
            end
        else
            prijataPoloha[smer+1]["x"] = argument
        end
    elseif zprava == 131995 then
        if prijataPoloha[smer+1] == nil then
            prijataPoloha[smer+1] = {}
        end
        if prijataPoloha[smer+1]["x"] ~= nil then
            local yZS = argument
            x, _, y = Call("PozCervenaPravaZadni:getNearPosition")
            ZpravaDebug("x: "..x.." y: "..y)
            local vzdalenost = math.sqrt((prijataPoloha[smer+1]["x"]-x)^2 + (yZS-y)^2)
            prijataPoloha[smer+1] = nil
            ZpravaDebug("Prislo X: "..argument..", vzdalenost: "..tostring(vzdalenost)..", smer: "..tostring(smer))
            if vzdalenost < maxVzdalenost then
                if smer == 1 then
                    predMasinouDvojicka = true
                    predMasinouDvojickaCas = nil
                else
                    zaMasinouDvojicka = true
                    zaMasinouDvojickaCas = nil
                end
            else
                if smer == 1 then
                    predMasinouDvojicka = false
                    predMasinouDvojickaCas = nil
                else
                    zaMasinouDvojicka = false
                    zaMasinouDvojickaCas = nil
                end
            end
        else
            prijataPoloha[smer+1]["y"] = argument
        end
    elseif zprava == 131996 then
        if absolutniRychlost > 0.5 and driverHere then
            dvereStrojovna = true
        end
        driverHere = false
    elseif zprava == 131997 then
        idParam = string.sub(argument,0,string.find( argument,":")-1)
        if cisloLokoKoncova == 0 then
            cisloLokoKoncova = tonumber(string.sub(argument,string.find(argument,":")+1))
        end
		ID = GetFreeID(GetIDs(tonumber(idParam)))
		i = 2^(ID-1)
		Call("SendConsistMessage",131997,tostring(tonumber(idParam)+i)..":"..tostring(cisloLoko),smer)
		Call("SetControlValue","ID",0,ID)
	elseif zprava == 131998 then
        cisloLokoKoncova = tonumber(argument)
		-- if (smer == 0 and not predMasinouDvojicka) or (smer == 1 and not zaMasinouDvojicka) then
		-- 	Call("SendConsistMessage",131997,"1:"..tostring(cisloLoko),1-smer)
		-- 	ID = 1
        --     Call("SetControlValue","ID",0,ID)
        --     if argument == "0" then
        --         Call("SendConsistMessage",131998,tostring(cisloLoko),smer)
        --     else
        --         Call("SendConsistMessage",131998,"0",smer)
        --     end
        -- else
        if (smer == 0 and predMasinou == 1) or (smer == 1 and zaMasinou == 1) then
            if idSynchroDelay == nil then
                idSynchroDelay = os.clock()
                if argument == "0" then
                    Call("SendConsistMessage",131998,tostring(cisloLoko),smer)
                else
                    Call("SendConsistMessage",131998,"0",smer)
                end
            end
        else
            ID = 1
            Call("SetControlValue","ID",0,ID)
            ZpravaDebug("Koncova loko, prirazuji si ID=1")
            ZpravaDebug("Ted jsem odeslal zpravu zpatky na zacatek")
            Call("SendConsistMessage",131997,"1:"..tostring(cisloLoko),1-smer)
            ZpravaDebug("Ted pokracuju v kodu na koncove loko")
        end
		-- end
	elseif zprava >= 998100 and zprava <= 998111 then --MIREL
        MIREL:SynchronizaceRidiciJednotky(zprava,argument)
    elseif zprava == 998112 then
        napetiMIRELkoncova = (argument == "1")
    elseif zprava == 999100 then --vysilacka
        if argument == "0" then
            if VO67.obraz ~= VO67.OBRAZY.START and VO67.obraz ~= VO67.OBRAZY.VYP then
                if VO67.registrovan then
                    Call("SendConsistMessage",999100,"-2",1)
                else
                    Call("SendConsistMessage",999100,"-1",1)
                end
            end
            VO67.obraz = VO67.OBRAZY.VYP
        elseif argument == "-1" then
            VO67.casStartu = casProcesor - 36
            VO67.registrovan = false
        elseif argument == "-2" then
            VO67.casStartu = casProcesor - 36
            VO67.registrovan = true
        end
    elseif zprava == 999101 then
        VO67.cisloVlaku = tonumber(argument)
    elseif zprava == 999102 then
        napetiVO67koncova = (argument == "1")
    end
end

function prujezdNS(noveNapeti)
    found = false
    if Call("GetSpeed") > 0 then
        if predMasinou == 0 then
            ujeteMetry = -8.64
        else
            ujeteMetry = -delkaVlaku+3*8.64
        end
        ZpravaDebug("Vzdalenost k "..tostring(noveNapeti).." napeti "..tostring(ujeteMetry))
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 10 and v[2] == noveNapeti then
                tabulkaNapeti[k] = {ujeteMetry, noveNapeti, idealniNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, noveNapeti, idealniNapeti}
        end
        Call("SendConsistMessage",131018,ujeteMetry..":"..idealniNapeti..";"..noveNapeti,1)
    else
        if predMasinou == 0 then
            ujeteMetry = delkaVlaku-8.64
        else
            ujeteMetry = 3*8.64
        end
        ZpravaDebug("Vzdalenost k "..tostring(noveNapeti).." napeti "..tostring(ujeteMetry))
        for k, v in tabulkaNapeti do
            if math.abs(ujeteMetry-v[1]) < 10 and v[3] == noveNapeti then
                tabulkaNapeti[k] = {ujeteMetry, idealniNapeti, noveNapeti}
                found = true
            end
        end
        if not found then
            tabulkaNapeti[table.getn(tabulkaNapeti)+1] = {ujeteMetry, idealniNapeti, noveNapeti}
        end
        Call("SendConsistMessage",131018,ujeteMetry..":"..noveNapeti..";"..idealniNapeti,1)
    end
end

function OnCustomSignalMessage ( parameter )
    -- if Call("GetControlValue","OsvetleniPristroje",0) < 0.5 then
        -- SysCall("ScenarioManager:ShowAlertMessageExt", "Prijate z nav", parameter, 2, 0)
    -- end
    --ZpravaDebug(parameter)
    if parameter == "3000V" or parameter == "3000" then
        prujezdNS(3000)
	elseif parameter == "15000V" or parameter == "15000" or parameter == "vR_EL5" or parameter == "vR_EL2" then
        prujezdNS(15000)
	elseif parameter == "25000V" or parameter == "25000" then
        prujezdNS(25000)
    elseif parameter == "0V" or parameter == "vR_EL1" or parameter == "vR_EL4" then
        prujezdNS(0)
    elseif parameter == "intrare_neutra" then
    elseif parameter == "iesire_neutra" then
	else
		MIREL:ZpravyNavestidel(parameter)
	end
end
function OnCameraEnter(cabEndWithCamera, carriageCamera)
    --SysCall("ScenarioManager:ShowMessage", "Opusteni kamery", "tada", 1)
    if not driverHere then
        Call("SendConsistMessage", 131996, "", 0)
        Call("SendConsistMessage", 131996, "", 1)
        if absolutniRychlost > 0.5 then
            dvereStrojovna = true
            if not Q05 and not Q08 then
                SysCall("ScenarioManager:ShowMessage", "TYTYTY", "Prosel jsi odzemnenou strojovnou! Davej si pozor!", 1)
            end
        end
    end
    driverHere = true
	if cabEndWithCamera ~= 0 then
		venku = false
	elseif cabEndWithCamera == 0 then
		venku = true
	elseif carriageCamera == 1 then
		venku = true
	end
end
function OnCameraLeave()
	venku = true
end

function Update(casHry)
    if startDelay < 5 then --cas na synchro animaci
        startDelay = startDelay + 1
    else --Update
        casMinuly = casProcesor
        casProcesor = os.clock()
        cas = math.abs(casMinuly - casProcesor)
        if math.abs(cas - casHry) > 0.005 then
            cas = casHry
        end
        if Call("GetIsNearCamera") > 0.5 then
            delkaVlaku = Call("GetConsistLength")
            hh, necojakomm = divMod(SysCall("ScenarioManager:GetTimeOfDay"),3600)
            isDed = (Call("GetIsDeadEngine") > 0.5)
            mm, ss = divMod(necojakomm,60)
            ss=math.floor(ss)
            if hh < 10 then hh = "0"..tostring(hh) end
            if mm < 10 then mm = "0"..tostring(mm) end
            if ss < 10 then ss = "0"..tostring(ss) end
            dennicas = tonumber(hh..mm..ss)
            -- hh = tonumber(hh)
            -- mm = tonumber(mm)
            -- ss = tonumber(ss)
            rychlost = Call("GetSpeed")
            hmotnostVlaku = Call("GetConsistTotalMass")
            absolutniRychlost = math.abs(rychlost)
            rychlostKMH = rychlost*3.6
            absolutniRychlostKMH = absolutniRychlost*3.6
            Call("ActivateNode","pozickaZadni",1-zaMasinou)
            Call("PozCervenaLevaZadni:Activate",1-zaMasinou)
            Call("PozCervenaPravaZadni:Activate",1-zaMasinou)
            if ventilatoryOdporOtackyTarget < 0.5 and ventilatoryOdporOtacky < 2 then
                ventilatoryNabehStart = casProcesor
                Call("SoundEngine:SetParameter","VentilatoryNabehEX",0)
                Call("SoundEngine:SetParameter","VentilatoryBehEX",0)
                Call("SoundEngine:SetParameter","VentilatoryNabehIN",0)
                Call("SoundEngine:SetParameter","VentilatoryBehIN",0)
            else
                if casProcesor - ventilatoryNabehStart > 8 then
                    Call("SoundEngine:SetParameter","VentilatoryBehEX",1)
                    Call("SoundEngine:SetParameter","VentilatoryNabehEX",0)
                else
                    Call("SoundEngine:SetParameter","VentilatoryBehEX",0)
                    Call("SoundEngine:SetParameter","VentilatoryNabehEX",1)
                end
                if casProcesor - ventilatoryNabehStart > 12 then
                    Call("SoundEngine:SetParameter","VentilatoryBehIN",1)
                    Call("SoundEngine:SetParameter","VentilatoryNabehIN",0)
                else
                    Call("SoundEngine:SetParameter","VentilatoryBehIN",0)
                    Call("SoundEngine:SetParameter","VentilatoryNabehIN",1)
                end
            end
            if ventilatoryOdporOtacky < 2 and ventilatoryOdporOtackyTarget < 2 then
                Call("SoundEngine:SetParameter","VentilatoryDobeh",1)
            else
                Call("SoundEngine:SetParameter","VentilatoryDobeh",0)
            end
            casOdPoslednihoKroku = casProcesor - krokCas
            if (Call("GetIsPlayer") == 1 or wasUserControlled) and not isDed then --hrac
                obsazenaLast = obsazena
                obsazena = Call("GetIsEngineWithKey") > 0.5
                if absolutniRychlost < 0.5 then
                    obsazenaVeHre = obsazena
                end
                if obsazenaVeHre ~= obsazenaLast then
                    if zaMasinou == 1 then
                        Call("SendConsistMessage", 131989, tostring(toInt(obsazenaVeHre)), 1)
                    end
                end
                if delkaVlakuLast ~= delkaVlaku then
                    predMasinou = Call("SendConsistMessage",131999,"DUMMY",0)
                    zaMasinou = Call("SendConsistMessage",131999,"DUMMY",1)
                    if zaMasinou == 0 or not ID or zaMasinouLast ~= zaMasinou then
                        Call("SetControlValue", "LocoNumber", 0, 999)
                        cisloLoko = Call("GetControlValue", "LocoNumber", 0)
                        jeSuda = divRest(cisloLoko,2) == 0
                        jeLicha = not jeSuda
                        if jeLicha then
                            ZpravaDebug("Mam MIRELA")
                            MIREL.isHere = true
                        else
                            ZpravaDebug("Nemam MIRKA")
                            MIREL.isHere = false
                        end
                        MIREL.ZmenaDelkyVlaku()
                        --reset pridelenych ID
                            ID = nil
                            cisloLokoKoncova = 0
                            Call("SetControlValue","IsMaster131InConsist",0,0)
                        --nulovani ovladacu obsahujicich sumu ID
                            S101koncova = -1
                            baterieKoncova = false
                            napetiMIRELkoncova = false
                            napetiRMkoncova = false
                            napetiMIRERkoncova = false
                            F156koncova = false
                            napetiVO67koncova = false
                            Q01koncova = false
                            EDB_CHODkoncova = false
                            EDB_LSOkoncova = false
                            povelSberaceLast = -2
                            povelSberaceZVedouci = 0
                            X202vlastni = {
                                [1] = false,
                                [2] = false,
                                [3] = false,
                                [4] = false,
                                [5] = false,
                                [6] = false,
                                [7] = false,
                                [8] = false,
                                [9] = false,
                                [10] = false,
                                [11] = false,
                                [12] = false,
                                [13] = false,
                                [14] = false,
                                [15] = false,
                                [16] = false,
                                [17] = false,
                                [18] = false,
                                [21] = false,
                                [22] = false,
                                [23] = false,
                                [24] = false,
                                [36] = false,
                                [37] = false,
                                [41] = false,
                                [42] = false,
                                [43] = false,
                                [44] = false,
                                [45] = false,
                                [46] = false,
                                [47] = false
                            }
                            X202cizi = {}
                            X204vlastni = {
                                [1] = false,
                                [2] = false,
                                [3] = false,
                                [4] = false,
                                [5] = false,
                                [6] = false,
                                [7] = false,
                                [8] = false,
                                [9] = false,
                                [10] = false,
                                [11] = false,
                                [12] = false,
                                [13] = false,
                                [14] = false,
                                [15] = false
                            }
                            X204cizi = {}
                            trvalyMinusKoncova = false
                            stupenHKKoncova = 0
                            MIRER.stavy = {
                                ["tlak prevodnik"] = {},
                                ["tlak brz.valce"] = {},
                                ["rucna brzda"] = {},
                                ["Porucha st.nab."] = {},
                                ["EDB vypnuta"] = {}
                            }
                            MIRER.poruchy = {
                                ["V-dif.ochr.HO"] = false,
                                ["K-dif.ochr.HO"] = false,
                                ["V-dif.ochr.PO"] = false,
                                ["K-dif.ochr.PO"] = false,
                                ["V-strata vent."] = false,
                                ["K-strata vent."] = false,
                                ["V-nadp.vl.kur."] = false,
                                ["K-nadp.vl.kur."] = false,
                                ["V-strata nap."] = false,
                                ["K-strata nap."] = false,
                                ["Zberace P+Z"] = false,
                                ["V-LTS-410 A"] = false,
                                ["K-LTS-410 A"] = false,
                                ["LTS-410 A"] = false,
                                ["V-LTS-510 A"] = false,
                                ["K-LTS-510 A"] = false,
                                ["LTS-510 A"] = false,
                                ["Draha"] = false,
                                ["Prestav S101"] = false,
                                ["Prenos V+K"] = false,
                                ["Prekr.rychl."] = false
                            }
                            edbPrevodnikKoncova = 0
                            isKlicekNaSousedni = false
                            obsazenaSousedni = false
                            aktivniPostrk = false
                        predMasinouDvojicka = nil
                        zaMasinouDvojicka = nil
                        predMasinouDvojickaCas = os.clock()
                        zaMasinouDvojickaCas = os.clock()
                        consistCheckDelay = 1
                        zaMasinouLast = zaMasinou
                    end
                    if obsazena then
                        SysCall("ScenarioManager:ShowMessage", "Hmotnost vlaku", Call("GetConsistTotalMass").."t", 1)
                        SysCall("ScenarioManager:ShowMessage", "Delka vlaku", delkaVlaku.."m", 1)
                    end
                    Call("SetControlValue","kompresoryNaVlaku",0,0)
                    Call("SetControlValue","zaklopkaPotrubi",0,0)
                    Call("SetControlValue","IDnaVlaku",0,0)
                    --vypusteni potrubi - simulace nove pripojenych vozu
                        if delkaVlaku > delkaVlakuLast then
                            ZpravaDebug("Spojily se vlacky!")
                            cilovy_tlak_HP_po_zmene = (delkaVlakuLast^2/delkaVlaku^2)*5
                        end
                    --nulovani tabulky kontroleru
                        tabulkaVykonu = {}
                    delkaVlakuLast = delkaVlaku
                end
                if consistCheckDelay > 0 then
                    consistCheckDelay = consistCheckDelay - 1
                elseif consistCheckDelay > -1 then
                    x, _, y = Call("PozCervenaLevaZadni:getNearPosition")
                    Call("SendConsistMessage",131994,string.sub(x, 1, 10),0)
                    predMasinou = Call("SendConsistMessage",131995,string.sub(y, 1, 10),0)
                    if predMasinou == 0 then
                        predMasinouDvojicka = false
                    end
                    Call("SendConsistMessage",131994,string.sub(x, 1, 10),1)
                    zaMasinou = Call("SendConsistMessage",131995,string.sub(y, 1, 10),1)
                    if zaMasinou == 0 then
                        zaMasinouDvojicka = false
                    end
                    X202vlastniLast = {}
                    stringX202 = ""
                    i = 1
                    c = 0
                    while c < table.len(X202spojeni) do
                        if X202vlastni[i] ~= nil then
                            stringX202 = stringX202..toInt(X202vlastni[i])
                            X202vlastniLast[i] = X202vlastni[i]
                            c = c + 1
                        elseif X202spojeni[i] ~= nil then
                            stringX202 = stringX202.."0"
                            X202vlastniLast[i] = X202vlastni[i]
                            c = c + 1
                        end
                        i = i + 1
                    end
                    -- for i,k in pairs(X202spojeni) do
                    --     if X202vlastni[i] ~= nil then
                    --         stringX202 = stringX202..toInt(X202vlastni[i])
                    --         X202vlastniLast[i] = X202vlastni[i]
                    --     else
                    --         stringX202 = stringX202.."0"
                    --         X202vlastniLast[i] = X202vlastni[i]
                    --     end
                    -- end
                    if zaMasinouDvojicka then
                        Call("SendConsistMessage", 131003, stringX202, 1)
                    end
                    X204vlastniLast = {}
                    stringX204 = ""
                    i = 1
                    c = 0
                    while c < table.len(X204spojeni) do
                        if X204vlastni[i] ~= nil then
                            stringX204 = stringX204..toInt(X204vlastni[i])
                            X204vlastniLast[i] = X204vlastni[i]
                            c = c + 1
                        elseif X202spojeni[i] ~= nil then
                            stringX204 = stringX204.."0"
                            X204vlastniLast[i] = X204vlastni[i]
                            c = c + 1
                        end
                        i = i + 1
                    end
                    -- for i,k in pairs(X204spojeni) do
                    --     if X204vlastni[i] ~= nil then
                    --         stringX204 = stringX204..toInt(X204vlastni[i])
                    --         X204vlastniLast[i] = X204vlastni[i]
                    --     else
                    --         stringX204 = stringX204.."0"
                    --         X204vlastniLast[i] = X204vlastni[i]
                    --     end
                    -- end
                    if zaMasinou == 1 then
                        Call("SendConsistMessage",131004,stringX204,1)
                        Call("SendConsistMessage",131001,S101vlastni,1)
                        Call("SendConsistMessage",131010,toInt(baterie),1)
                        Call("SendConsistMessage",131011,toInt(Q01),1)
                        Call("SendConsistMessage",131012,toInt(EDB_CHOD),1)
                        Call("SendConsistMessage",131013,toInt(EDB_LSO),1)
                        Call("SendConsistMessage",131014,napetiDeltaSpeed..":"..napetiTargetDelta,1)
                        Call("SendConsistMessage",131015,tvrdostNapetiTarget,1)
                        Call("SendConsistMessage",131005,stupenHK,1)
                        Call("SendConsistMessage",131009,toInt(trvalyMinus),1)
                        Call("SendConsistMessage",131016,toInt(isKlicek),1)
                        Call("SendConsistMessage",131017,toInt(aktivniPostrk),1)
                        Call("SendConsistMessage",131019,toInt(F156),1)
                        Call("SendConsistMessage",131020,toInt(napetiRM),1)
                        Call("SendConsistMessage",131021,toInt(napetiMIRER),1)
                        Call("SendConsistMessage",131989,toInt(obsazena),1)
                        Call("SendConsistMessage",998112,toInt(baterie and Call("GetControlValue", "F191", 0) > 0.9 and (vMetrBaterie > 30 or math.random() > 0.001)),1)
                        Call("SendConsistMessage",999102,toInt(napetiVO67),1)
                    end
                    consistCheckDelay = -1
                end
                if idSynchroDelay and not ID then
                    if casProcesor - idSynchroDelay > 10*cas then
                        Call("SendConsistMessage",131997,"1:"..tostring(cisloLoko),1)
                        ID = 1
                        ZpravaDebug("Asi za mnou neni maschünka :(")
                    end
                end
                if predMasinouDvojickaCas ~= nil then
                    if predMasinouDvojickaCas + (cas*5) < os.clock() then
                        ZpravaDebug("Pred masinou nic neprislo! Nuluji!")
                        predMasinouDvojicka = false
                        predMasinouDvojickaCas = nil
                    end
                end
                if zaMasinouDvojickaCas ~= nil then
                    if zaMasinouDvojickaCas + (cas*5) < os.clock() then
                        ZpravaDebug("Za masinou nic neprislo! Nuluji!")
                        zaMasinouDvojicka = false
                        zaMasinouDvojickaCas = nil
                    end
                end
                if table.getn(prijataPoloha) > 0 then
                    for i in prijataPoloha do
                        if prijataPoloha[i]["x"] ~= nil and prijataPoloha[i]["y"] ~= nil then
                            local xZS, yZS = prijataPoloha[i]["x"], prijataPoloha[i]["y"]
                            prijataPoloha[i] = nil
                            x, _, y = Call("PozCervenaLevaZadni:getNearPosition")
                            local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
                            if vzdalenost < maxVzdalenost then
                                if i == 2 then
                                    predMasinouDvojicka = true
                                    predMasinouDvojickaCas = nil
                                else
                                    zaMasinouDvojicka = true
                                    zaMasinouDvojickaCas = nil
                                end
                            else
                                if i == 2 then
                                    predMasinouDvojicka = false
                                    predMasinouDvojickaCas = nil
                                else
                                    zaMasinouDvojicka = false
                                    zaMasinouDvojickaCas = nil
                                end
                            end
                        end
                    end
                end
                if predMasinouDvojicka ~= nil and zaMasinouDvojicka ~= nil then
                    if Call("GetControlValue","IsMaster131InConsist",0) < 0.5 and obsazena then
                        Call("SetControlValue","IsMaster131InConsist",0,1)
                        ZpravaDebug("Ted jsem odeslal zpravu na konec vlaku")
                        if zaMasinou ~= 0 then
                            Call("SendConsistMessage",131998,tostring(cisloLoko),1)
                        elseif predMasinou ~= 0 then
                            Call("SendConsistMessage",131998,tostring(cisloLoko),0)
                        else
                            ID = 1
                            Call("SetControlValue","ID",0,ID)
                        end
                        ZpravaDebug("Ted pokracuju v kodu na predni loko")
                    elseif Call("GetControlValue","IsMaster131InConsist",0) < 0.5 then
                        Call("SetControlValue","IsMaster131InConsist",0,1)
                        if zaMasinou ~= 0 then
                            Call("SendConsistMessage",131998,tostring(cisloLoko),1)
                        elseif predMasinou ~= 0 then
                            Call("SendConsistMessage",131998,tostring(cisloLoko),0)
                        else
                            ID = 1
                            Call("SetControlValue","ID",0,ID)
                        end
                    end
                    if ID ~= nil and ID > 0 then --UPDATE
                        --CTENI OVLADACU
                            jeKoncovaSuda = divRest(cisloLokoKoncova,2) == 0
                            jeKoncovaLicha = not jeKoncovaSuda
                            baterieLast = baterie
                            baterie = (Call("GetControlValue", "Baterie", 0) > 0.75 and napetiBaterie > 24)
                            if baterie ~= baterieLast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131010,toInt(baterie),1)
                                end
                                baterieLast = baterie
                            end
                            if Q01 ~= Q01Last then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131011,toInt(Q01),1)
                                end
                                Q01Last = Q01
                            end
                            if EDB_CHOD ~= EDB_CHODlast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131012,toInt(EDB_CHOD),1)
                                end
                                EDB_CHODlast = EDB_CHOD
                            end
                            if EDB_LSO ~= EDB_LSOlast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131013,toInt(EDB_LSO),1)
                                end
                                EDB_LSOlast = EDB_LSO
                            end
                            S101 = Call("GetControlValue", "S101", 0)
                            ovladacSberace = Call("GetControlValue", "sberace", 0)
                            if not wasUserControlled then
                                sberac01Time = 0
                                sberac02Time = 0
                                zaluzieTime = 0
                                wasUserControlled = true
                                S101 = 0.6
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                Call("SetControlValue", "S101", 0, 0.6)
                                Call("SetControlValue", "rozkladJazdy", 0, toInt(math.random()>0.5))
                            end
                            NastavHodnotuSID("IDnaVlaku", 1, 131991)
                            IDnaVlaku = Call("GetControlValue", "IDnaVlaku", 0)
                            if IDnaVlaku ~= IDnaVlakuLast then
                                pocetLoko = CountIDs(IDnaVlaku)
                                IDnaVlakuLast = IDnaVlaku
                            end
                            if hmotnostVlaku < 800 then
                                rezimBrzdeniLokoG = false
                                rezimBrzdeniLokoP = true
                                rezimBrzdeniVlakG = false
                                rezimBrzdeniVlakP = true
                            elseif hmotnostVlaku < 3200 then
                                rezimBrzdeniLokoG = false
                                rezimBrzdeniLokoP = true
                                rezimBrzdeniVlakG = false
                                rezimBrzdeniVlakP = true
                            elseif hmotnostVlaku > 3200 then
                                rezimBrzdeniLokoG = false
                                rezimBrzdeniLokoP = true
                                rezimBrzdeniVlakG = true
                                rezimBrzdeniVlakP = false
                            end
                            rezimBrzdeni = tostring(toInt(rezimBrzdeniLokoG))..tostring(toInt(rezimBrzdeniLokoP))..tostring(toInt(rezimBrzdeniVlakG))..tostring(toInt(rezimBrzdeniVlakP))
                            if rezimBrzdeni ~= rezimBrzdeniLast then
                                if obsazena then
                                    str = "Lokomotiva je brzdena v rezimu "
                                    if rezimBrzdeniLokoG then
                                        str = str.."G"
                                    else
                                        str = str.."P"
                                    end
                                    str = str..", vozy jsou brzdeny v rezimu "
                                    if rezimBrzdeniVlakG then
                                        str = str.."G."
                                    else
                                        str = str.."P."
                                    end
                                    SysCall("ScenarioManager:ShowMessage", "Rezim brzdeni", str, 1)
                                end
                                rezimBrzdeniLast = rezimBrzdeni
                            end
                            if Call("GetControlValue", "VirtualSander", 0) > 0.5 and DEBUG then
                                Call("SetControlValue","VirtualBrakePipePressureBAR",0,5)
                                Call("SetControlValue","VirtualTrainBrakePipePressureBAR",0,5)
                                Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,5)
                                Call("SetControlValue","VirtualBrakeSwitchingValvePressureBAR",0,5)
                                Call("SetControlValue","VirtualBrakeDelayReservoirPressureBAR",0,0)
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,10)
                                Call("SetControlValue","VirtualLocoDistributorReservoirPressureBAR",0,5)
                                Call("SetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0,5)
                                Call("SetControlValue","VirtualTrainDistributorReservoirPressureBAR",0,5)
                                Call("SetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0,5)
                                VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 = 5
                                Call("SetControlValue", "F101", 0, 1)
                                Call("SetControlValue", "F102", 0, 1)
                                Call("SetControlValue", "F103", 0, 1)
                                Call("SetControlValue", "F104", 0, 1)
                                Call("SetControlValue", "F105", 0, 1)
                                Call("SetControlValue", "F107", 0, 1)
                                Call("SetControlValue", "F109", 0, 1)
                                Call("SetControlValue", "F111", 0, 1)
                                Call("SetControlValue", "F112", 0, 1)
                                Call("SetControlValue", "F113", 0, 1)
                                Call("SetControlValue", "F114", 0, 1)
                                Call("SetControlValue", "F115", 0, 1)
                                Call("SetControlValue", "F121", 0, 1)
                                Call("SetControlValue", "F122", 0, 1)
                                Call("SetControlValue", "F123", 0, 1)
                                Call("SetControlValue", "F125", 0, 1)
                                Call("SetControlValue", "F127", 0, 1)
                                Call("SetControlValue", "F128", 0, 1)
                                Call("SetControlValue", "F129", 0, 1)
                                Call("SetControlValue", "F130", 0, 1)
                                Call("SetControlValue", "F131", 0, 1)
                                Call("SetControlValue", "F132", 0, 1)
                                Call("SetControlValue", "F134", 0, 1)
                                Call("SetControlValue", "F150", 0, 1)
                                Call("SetControlValue", "F153", 0, 1)
                                Call("SetControlValue", "F154", 0, 1)
                                Call("SetControlValue", "F155", 0, 1)
                                Call("SetControlValue", "F156", 0, 1)
                                Call("SetControlValue", "F191", 0, 1)
                                Call("SetControlValue", "F192", 0, 1)
                            end
                            jimkaPK = Call("GetControlValue","JimkaPK",0)
                            hlavniKontrolerLast = hlavniKontroler
                            hlavniKontroler = Call("GetControlValue", "HlavniKontroler", 0)
                            stupenHKLast = stupenHK
                            stupenHK = VratStupenHK(hlavniKontroler)
                            if stupenHK ~= stupenHKLast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage", 131005, stupenHK, 1)
                                end
                            end
                            
                            if Call("GetControlValue", "Postrk", 0) > 0.5 and not postrkKeyLast then
                                aktivniPostrk = not aktivniPostrk
                                Call("SendConsistMessage", 131017, tostring(toInt(aktivniPostrk)), 1)
                                if obsazena then
                                    if aktivniPostrk then
                                        SysCall("ScenarioManager:ShowMessage", "ZSCS131 rika:", "Postrk aktivovany!", 1)
                                    else
                                        SysCall("ScenarioManager:ShowMessage", "ZSCS131 rika:", "Postrk deaktivovany!", 1)
                                    end
                                end
                                postrkKeyLast = true
                            elseif Call("GetControlValue", "Postrk", 0) < 0.5 then
                                postrkKeyLast = false
                            end

                            cisloLokoString = cisloLoko
                            while string.len(cisloLokoString) < 2 do
                                cisloLokoString = "0"..cisloLokoString
                            end
                            cisloLokoStringOut = cisloLokoString.."-"..tostring(vypoctiKontrolku(cisloLoko))
                            Call("CisloLokoVelke:SetText", cisloLokoStringOut)
                            Call("CisloLokoVedouci:SetText", cisloLokoStringOut)

                            cisloLokoKoncovaString = cisloLokoKoncova
                            while string.len(cisloLokoKoncovaString) < 2 do
                                cisloLokoKoncovaString = "0"..cisloLokoKoncovaString
                            end
                            Call("CisloLokoKoncova:SetText", cisloLokoKoncovaString.."-"..tostring(vypoctiKontrolku(cisloLokoKoncova)))

                        --PREPINAC S101
                            if S101 > 0.9 then --Jednotliva loko
                                rizeniZap = true
                                koncova = false
                                vedouci = false
                                poruchaVedouci = false
                                poruchaKoncova = false
                                jednotlive = true
                                S101vlastni = S101_JEDNOTLIVA
                            elseif S101 > 0.7 then --Koncova
                                rizeniZap = true
                                koncova = true
                                vedouci = false
                                poruchaVedouci = false
                                poruchaKoncova = false
                                jednotlive = false
                                S101vlastni = S101_KONCOVA
                            elseif S101 > 0.5 then --0 (vypnuto)
                                rizeniZap = false
                                koncova = false
                                vedouci = false
                                poruchaVedouci = false
                                poruchaKoncova = false
                                jednotlive = false
                                S101vlastni = S101_VYPNUTO
                            elseif S101 > 0.3 then --Vedouci
                                rizeniZap = true
                                koncova = false
                                vedouci = true
                                poruchaVedouci = false
                                poruchaKoncova = false
                                jednotlive = false
                                S101vlastni = S101_VEDOUCI
                            elseif S101 > 0.1 then --Porucha vedouci
                                rizeniZap = true
                                koncova = false
                                vedouci = true
                                poruchaVedouci = true
                                poruchaKoncova = false
                                jednotlive = false
                                S101vlastni = S101_PORUCHA_VEDOUCI
                            else --Porucha koncove
                                rizeniZap = true
                                koncova = false
                                vedouci = true
                                poruchaVedouci = false
                                poruchaKoncova = true
                                jednotlive = false
                                S101vlastni = S101_PORUCHA_KONCOVA
                            end
                            if S101vlastni ~= S101vlastniLast then
                                --Call("SendConsistMessage",131001,S101vlastni,0)
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131001,S101vlastni,1)
                                end
                                S101vlastniLast = S101vlastni
                            end
                        --PRENOS X202 a X204
                            if (X202vlastni[1] ~= X202vlastniLast[1] or X202vlastni[2] ~= X202vlastniLast[2] or X202vlastni[3] ~= X202vlastniLast[3] or X202vlastni[4] ~= X202vlastniLast[4]
                            or X202vlastni[5] ~= X202vlastniLast[5] or X202vlastni[6] ~= X202vlastniLast[6] or X202vlastni[7] ~= X202vlastniLast[7] or X202vlastni[8] ~= X202vlastniLast[8]
                            or X202vlastni[9] ~= X202vlastniLast[9] or X202vlastni[10] ~= X202vlastniLast[10] or X202vlastni[11] ~= X202vlastniLast[11] or X202vlastni[12] ~= X202vlastniLast[12]
                            or X202vlastni[13] ~= X202vlastniLast[13] or X202vlastni[14] ~= X202vlastniLast[14] or X202vlastni[15] ~= X202vlastniLast[15] or X202vlastni[16] ~= X202vlastniLast[16]
                            or X202vlastni[17] ~= X202vlastniLast[17] or X202vlastni[18] ~= X202vlastniLast[18] or X202vlastni[21] ~= X202vlastniLast[21] or X202vlastni[23] ~= X202vlastniLast[23]
                            or X202vlastni[36] ~= X202vlastniLast[36] or X202vlastni[37] ~= X202vlastniLast[37] or X202vlastni[41] ~= X202vlastniLast[41] or X202vlastni[43] ~= X202vlastniLast[43]
                            or X202vlastni[45] ~= X202vlastniLast[45] or X202vlastni[47] ~= X202vlastniLast[47]) and zaMasinouDvojicka then
                                stringX202 = ""
                                i = 1
                                c = 0
                                while c < table.len(X202spojeni) do
                                    if X202vlastni[i] ~= nil then
                                        stringX202 = stringX202..toInt(X202vlastni[i])
                                        X202vlastniLast[i] = X202vlastni[i]
                                        c = c + 1
                                    elseif X202spojeni[i] ~= nil then
                                        stringX202 = stringX202.."0"
                                        X202vlastniLast[i] = X202vlastni[i]
                                        c = c + 1
                                    end
                                    i = i + 1
                                end
                                -- for i,k in pairs(X202spojeni) do
                                --     if X202vlastni[i] ~= nil then
                                --         stringX202 = stringX202..toInt(X202vlastni[i])
                                --         X202vlastniLast[i] = X202vlastni[i]
                                --     else
                                --         stringX202 = stringX202.."0"
                                --         X202vlastniLast[i] = X202vlastni[i]
                                --     end
                                -- end
                                Call("SendConsistMessage", 131003, stringX202, 1)
                            end
                            if (X204vlastni[1] ~= X204vlastniLast[1] or X204vlastni[2] ~= X204vlastniLast[2] or X204vlastni[3] ~= X204vlastniLast[3] or X204vlastni[4] ~= X204vlastniLast[4]
                            or X204vlastni[5] ~= X204vlastniLast[5] or X204vlastni[6] ~= X204vlastniLast[6] or X204vlastni[7] ~= X204vlastniLast[7] or X204vlastni[11] ~= X204vlastniLast[11]
                            or X204vlastni[12] ~= X204vlastniLast[12] or X204vlastni[13] ~= X204vlastniLast[13] or X204vlastni[14] ~= X204vlastniLast[14] or X204vlastni[15] ~= X204vlastniLast[15]) and zaMasinouDvojicka then
                                stringX204 = ""
                                i = 1
                                c = 0
                                while c < table.len(X204spojeni) do
                                    if X204vlastni[i] ~= nil then
                                        stringX204 = stringX204..toInt(X204vlastni[i])
                                        X204vlastniLast[i] = X204vlastni[i]
                                        c = c + 1
                                    elseif X202spojeni[i] ~= nil then
                                        stringX204 = stringX204.."0"
                                        X204vlastniLast[i] = X204vlastni[i]
                                        c = c + 1
                                    end
                                    i = i + 1
                                end
                                -- for i,k in pairs(X204spojeni) do
                                --     if X204vlastni[i] ~= nil then
                                --         stringX204 = stringX204..toInt(X204vlastni[i])
                                --         X204vlastniLast[i] = X204vlastni[i]
                                --     else
                                --         stringX204 = stringX204.."0"
                                --         X204vlastniLast[i] = X204vlastni[i]
                                --     end
                                -- end
                                Call("SendConsistMessage", 131004, stringX204, 1)
                            end
                        --HLAVNI VYPINAC
                            F104 = Call("GetControlValue", "F104", 0) > 0.9
                            HK0 = (stupenHK <= 0) --HK v 0
                            HK0X1 = (stupenHK <= 2) --HK v 0, X, nebo 1.°
                            S123 = (Call("GetControlValue", "HVvyp", 0) > 0.5)
                            S125 = (Call("GetControlValue", "HVzap", 0) > 0.5)
                            S221 = false --prevadzka bez ventilace TM
                            --K111 = false --klapkovnik
                            F115 = Call("GetControlValue", "F115", 0) > 0.9
                            K156 = true --zpozdovaci rele
                            K03 = false --diferencialni rele
                            K09 = false --nadproud topeni vlaku
                            K11 = false --dopm
                            if K81 then
                                K15delay = casProcesor
                                K15 = false
                            elseif casProcesor - K15delay > 5 then
                                K15 = true
                            end

                            K152 = baterie and F104 and (not S121 or K152) and not dvereStrojovna
                            K151 = K152
                            dvereStrojovna = false
                            diag11 = (X202cizi[13] or (((baterie and F104 and rizeniZap and not koncova and (S121 or HK0)) or (X202cizi[14] and not S123)) and (jednotlive or koncova))or (X202cizi[15] and (S101vlastni == S101_VEDOUCI or poruchaVedouci) and S125 and not S123))
                            diag12 = (diag11 and K152)
                            K155 = diag12
                            diag13 = (((diag11 and rizeniZap and not koncova and not S123 and S125) or (X202cizi[15] and (koncova or (vedouci and not poruchaKoncova)))) and not poruchaVedouci and not K111)
                            diag14 = (diag13 and K152 and HK0)
                            K153 = diag14
                            diag15 = ((baterie and F115 and K153) or (diag20 and Q01))
                            if diag15 and proudTM1+proudTM2 < 1400 then
                                Q01P = math.min(Q01P+cas,0.2)
                                Call("SetControlValue", "HlavniVypinac", 0, 1)
                            else
                                Q01P = math.max(Q01P-cas,0)
                                Call("SetControlValue", "HlavniVypinac", 0, 0)
                            end
                            Q01 = (Q01P >= 0.2)
                            vodic310 = ((baterie and F104) or (((diag11 and (jednotlive or koncova)) or (X202cizi[14] and not S123)) and (S121 or HK0) and vedouci or jednotlive))
                            diag16 = (vodic310 and ((vedouci and not poruchaVedouci) or koncova or jednotlive) and true)
                            diag17 = (vodic310 and (((vedouci and not poruchaVedouci) or koncova or jednotlive) and K156 and not K03 and not K11 and not K09))
                            diag18 = (diag17 and (not K116 or HK0X1 or S221 or not K15) and (K160 or koncoveDotekyZaluzie))
                            -- if X202cizi[18] and not HK0 and math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) > 0 and K154delay > 0 and not poruchaVedouci and not poruchaKoncova and not jednotlive then
                            --     K154delay = K154delay - cas
                            -- elseif not X202cizi[18] or HK0 then
                                K154delay = 1
                            -- end
                            K154 = (baterie and F104 and K02 and not K21 and not K22) and (K154delay > 0)
                            diag19 = (diag18 and ((K154 and S511) or HK0))
                            diag20 = (diag19 and not S123 and K155 and K152)
                            X202vlastni[13] = ((((baterie and F104 and rizeniZap and not koncova and (S121 or HK0)) or (X202cizi[14] and not S123)) and (jednotlive or koncova)) or (X202cizi[15] and (S101vlastni == S101_VEDOUCI or poruchaVedouci) and S125 and not S123))
                            X202vlastni[14] = (((X202cizi[13] or ((baterie and F104 and rizeniZap and not koncova and (S121 or HK0)) and (jednotlive or koncova)) or (X202cizi[15] and (S101vlastni == S101_VEDOUCI or poruchaVedouci) and S125 and not S123)) and (jednotlive or koncova)) or (baterie and F104 and rizeniZap and not koncova and (S121 or HK0))) and not S123
                            X202vlastni[15] = ((X202cizi[13] or ((baterie and F104 and jednotlive and (S121 or HK0)) or X202cizi[14])) and not S123 and S125 and vedouci and not poruchaKoncova)
                            X202vlastni[16] = baterie and F104 and Q01 and koncova
                            X202vlastni[17] = baterie and F104 and not Q01 and koncova
                            X202vlastni[18] = (S101vlastni == S101_VEDOUCI or koncova) and HK0 --invertovana - true = prizemneno!
                            
                            if K116 and K15 and stupenHK >= 3 then
                                strataVentilacie = true
                            else
                                strataVentilacie = false
                            end

                            proudBaterie = proudBaterie + toInt(baterie and F115 and K153)*10 + toInt(diag20 and Q01)

                            --zapis hodnot
                                Call("SetControlValue", "diag11", 0, toInt(diag11))
                                Call("SetControlValue", "diag12", 0, toInt(diag12))
                                Call("SetControlValue", "diag13", 0, toInt(diag13))
                                Call("SetControlValue", "diag14", 0, toInt(diag14))
                                Call("SetControlValue", "diag15", 0, toInt(diag15))
                                Call("SetControlValue", "diag16", 0, toInt(diag16))
                                Call("SetControlValue", "diag17", 0, toInt(diag17))
                                Call("SetControlValue", "diag18", 0, toInt(diag18))
                                Call("SetControlValue", "diag19", 0, toInt(diag19))
                                Call("SetControlValue", "diag20", 0, toInt(diag20))
                        --SBERACE, TOPENI, ZALUZIE, ODPOJOVACE
                            --vacky prepinace sberacu
                                if ovladacSberace > 1.75 then
                                    S121 = true
                                    S121_12 = true
                                    S121_56 = true
                                elseif ovladacSberace > 1.25 then
                                    S121 = true
                                    S121_12 = false
                                    S121_56 = true
                                elseif ovladacSberace > 0.75 then
                                    S121 = false
                                    S121_12 = false
                                    S121_56 = false
                                elseif ovladacSberace > 0.25 then
                                    S121 = true
                                    S121_12 = true
                                    S121_56 = false
                                elseif ovladacSberace > -0.25 then
                                    S121 = true
                                    S121_12 = true
                                    S121_56 = true
                                elseif ovladacSberace > -0.75 then
                                    S121 = true
                                    S121_12 = false
                                    S121_56 = true
                                elseif ovladacSberace > -1.25 then
                                    S121 = false
                                    S121_12 = false
                                    S121_56 = false
                                elseif ovladacSberace > -1.75 then
                                    S121 = true
                                    S121_12 = true
                                    S121_56 = false
                                else
                                    S121 = true
                                    S121_12 = true
                                    S121_56 = true
                                end

                            F112 = Call("GetControlValue", "F112", 0) > 0.9
                            F113 = Call("GetControlValue", "F113", 0) > 0.9
                            S187 = Call("GetControlValue","odpojovac1",0) < 0.5
                            S188 = Call("GetControlValue","odpojovac2",0) < 0.5
                            S119 = Call("GetControlValue","KlickaTopeni",0) > 0.5 --prepinac topeni
                            HK0X2537 = (stupenHK <= 1) or (stupenHK == 26) or (stupenHK >= 40)
                            HKodpor = (stupenHK > 1 and stupenHK < 26) or (stupenHK > 26 and stupenHK < 40)
                            HKnot025 = (stupenHK ~= 0 and stupenHK ~= 26)
                            vodic211 = baterie and F112
                            --topeni
                                K85 = (vodic211 and S119 and K151 and (jednotlive or poruchaKoncova)) or (X202cizi[10] and K151)
                                S207 = (X202cizi[12] and S119) or (K85 and jednotlive or poruchaKoncova)
                                X202vlastni[9] = vodic211 and S119 and K151 and vedouci and not poruchaKoncova
                                X202vlastni[11] = K85
                                X202vlastni[12] = K85 and (poruchaKoncova or jednotlive) and S119
                            --odpojovace rizeni
                                K157 = ((X202cizi[4] and (S101vlastni == S101_VEDOUCI or Q03) and (S101vlastni == S101_VEDOUCI or koncova)) or (((X202cizi[3] and ((vedouci and not poruchaKoncova) or koncova)) or (S187 and (vedouci or jednotlive))) and (poruchaKoncova or jednotlive or koncova))) and K151
                                diag2 = K157
                                K158 = ((X202cizi[6] and (S101vlastni == S101_VEDOUCI or Q04) and (S101vlastni == S101_VEDOUCI or koncova)) or (((X202cizi[5] and ((vedouci and not poruchaKoncova) or koncova)) or (S188 and (vedouci or jednotlive))) and (poruchaKoncova or jednotlive or koncova))) and K151
                                diag3 = K158
                                X202vlastni[3] = ((X202cizi[4] and (S101vlastni == S101_VEDOUCI or Q03) and (S101vlastni == S101_VEDOUCI or koncova) and (poruchaKoncova or jednotlive or koncova)) or (S187 and (vedouci or jednotlive))) and ((vedouci and not poruchaKoncova) or koncova)
                                X202vlastni[4] = ((X202cizi[3] and ((vedouci and not poruchaKoncova) or koncova)) or (S187 and (vedouci or jednotlive))) and (poruchaKoncova or jednotlive or koncova) and (S101vlastni == S101_VEDOUCI or Q03) and (S101vlastni == S101_VEDOUCI or koncova)
                                X202vlastni[5] = ((X202cizi[6] and (S101vlastni == S101_VEDOUCI or Q04) and (S101vlastni == S101_VEDOUCI or koncova) and (poruchaKoncova or jednotlive or koncova)) or (S188 and (vedouci or jednotlive))) and ((vedouci and not poruchaKoncova) or koncova)
                                X202vlastni[6] = ((X202cizi[5] and ((vedouci and not poruchaKoncova) or koncova)) or (S188 and (vedouci or jednotlive))) and (poruchaKoncova or jednotlive or koncova) and (S101vlastni == S101_VEDOUCI or Q04) and (S101vlastni == S101_VEDOUCI or koncova)
                            --odpojovace
                                vodic237 = baterie and F113
                                vodic260 = (vodic237 and not K151) or (vodic237 and rizeniZap and not K02)
                                diag1 = vodic260
                                Q03A = vodic260 and K157 and not Q05 and not Q08
                                diag9 = Q03A
                                Q03B = vodic260 and not K157
                                diag5 = Q03B
                                Q04A = vodic260 and K158 and not Q05 and not Q08
                                diag8 = Q04A
                                Q04B = vodic260 and not K158
                                diag4 = Q04B
                                Q05A = vodic260 and not K157 and not K158 and not Q03 and not Q04
                                Q08A = Q05A
                                diag6 = Q05A
                                Q05B = vodic260 and (K157 or K158)
                                Q08B = Q05B and (not K10 or not K151)
                                diag7 = Q08B

                                if jimkaPK > 2 then
                                    if Q03A then
                                        Q03P = math.min(Q03P + cas,1)
                                        Call("SetControlValue", "Q03", 0, 1)
                                    elseif Q03B then
                                        Q03P = math.max(Q03P - cas,0)
                                        Call("SetControlValue", "Q03", 0, 0)
                                    end
                                    if Q04A then
                                        Q04P = math.min(Q04P + cas,1)
                                        Call("SetControlValue", "Q04", 0, 1)
                                    elseif Q03B then
                                        Q04P = math.max(Q04P - cas,0)
                                        Call("SetControlValue", "Q04", 0, 0)
                                    end
                                    if Q05A then
                                        Q05P = math.min(Q05P + cas,1)
                                        Call("SetControlValue", "Q05", 0, 1)
                                    elseif Q05B then
                                        Q05P = math.max(Q05P - cas,0)
                                        Call("SetControlValue", "Q05", 0, 0)
                                    end
                                    if Q08A then
                                        Q08P = math.min(Q08P + cas,1)
                                        Call("SetControlValue", "Q08", 0, 1)
                                    elseif Q08B then
                                        Q08P = math.max(Q08P - cas,0)
                                        Call("SetControlValue", "Q08", 0, 0)
                                    end
                                end
                                Q03 = (Q03P >= 0.98 and not zkratSberace)
                                Q04 = (Q04P >= 0.91 and not zkratSberace)
                                Q05 = (Q05P >= 0.95)
                                Q08 = (Q08P >= 0.81)
                            --sberace
                                Y121 = ((vodic211 and S121_12 and (vedouci or jednotlive)) or (X202cizi[1] and koncova)) and rizeniZap and not poruchaVedouci and K151 and Q01 and Q03
                                Y122 = ((vodic211 and S121_56 and (vedouci or jednotlive)) or (X202cizi[2] and koncova)) and rizeniZap and not poruchaVedouci and K151 and Q01 and Q04
                                diag10 = Y121 or Y122
                                X202vlastni[1] = vodic211 and S121_12 and vedouci
                                X202vlastni[2] = vodic211 and S121_56 and vedouci
                            --zaluzie
                                vodic282 = vodic237 and rizeniZap
                                K159 = (vodic282 and not poruchaVedouci and HK0X2537)
                                if not K159 and K159delay >= 0 then
                                    K159delay = K159delay - cas
                                elseif K159 then
                                    K159delay = 3
                                end
                                K160 = vodic282 and K159delay > 0
                                H3 = ((vodic282 and not koncoveDotekyZaluzie and not poruchaVedouci) or (X202cizi[7] and ((vedouci and not poruchaKoncova) or koncova) and HKnot025)) and not K160
                                vodic295 = (vedouci or jednotlive) and Call("GetControlValue", "zaluzie", 0) > 0.5
                                if vodic282 and (HKodpor or EDB_LSO) then
                                    Y138cas = casProcesor
                                elseif not vodic282 then
                                    Y138cas = -300
                                end
                                Y138 = ((vodic282 and (HKodpor or EDB_LSO)) or vodic295 or X202cizi[8])-- and math.abs(Call("GetControlValue", "zaluzie", 0)) > 0.5
                                Y139 = Y138
                                X202vlastni[7] = (S101vlastni == S101_VEDOUCI or koncova) and not koncoveDotekyZaluzie and HKnot025
                                X202vlastni[8] = vodic295
                                
                                if jimkaPK > 2 then
                                    if Y138 or Y139 or (casProcesor - Y138cas < 300 and casProcesor ~= Y138cas) then
                                        zaluzieTime = math.min(zaluzieTime+cas,1)
                                    else
                                        zaluzieTime = math.max(zaluzieTime-cas,0)
                                    end
                                end
                                if zaluzieTime > 0.9 then
                                    koncoveDotekyZaluzie = true
                                else
                                    koncoveDotekyZaluzie = false
                                end
                                Call("SetTime", "Zaluzie", zaluzieTime)

                            --animace sberacu
                                if ovladacSberace > 1.5 then
                                    Call("SetControlValue", "sberace", 0, ovladacSberace-2)
                                end
                                if ovladacSberace < -1.5 then
                                    Call("SetControlValue", "sberace", 0, ovladacSberace+2)
                                end
                                
                                if Y121 and jimkaPK > 0.87393202250021 and not zkratSberace then
                                    sberac01pressureDelayCoef = math.min(sberac01pressureDelayCoef + cas*2,1)
                                elseif sberac01Time > 0 then
                                    sberac01pressureDelayCoef = math.max(sberac01pressureDelayCoef - cas,-1)
                                end

                                if sberac01pressureDelayCoef > 0 then -- predni zberac
                                    if sberac01Time < 1 then
                                        sberac01Time = sberac01Time + math.min((((jimkaPK/10)-0.087393202250021)^2),math.abs(math.sin(math.pi*sberac01Time*3))*0.03+0.015)*cas*10*math.max(sberac01pressureDelayCoef,0)
                                        jimkaPK = jimkaPK - cas*jimkaPK/20
                                    elseif sberac01Time == 3.75 then
                                        sberac01Delay = math.min(sberac01Delay + cas*2,SBERAC01_MAX_DELAY)
                                    end
                                elseif sberac01pressureDelayCoef < 0 then
                                    if sberac01Time > 0 then
                                        if sberac01Delay > 0 then
                                            sberac01Delay = sberac01Delay - cas
                                        else
                                            sberac01Time = sberac01Time + math.min(0.075, math.abs(math.cos(math.pi*sberac01Time*3))*0.055+0.027)*cas*6*math.min(sberac01pressureDelayCoef,0)
                                        end
                                    else
                                        sberac01pressureDelayCoef = 0
                                    end
                                end
                                
                                if Y122 and jimkaPK > 0.87393202250021 and not zkratSberace then
                                    sberac02pressureDelayCoef = math.min(sberac02pressureDelayCoef + cas*2,1)
                                elseif sberac02Time > 0 then
                                    sberac02pressureDelayCoef = math.max(sberac02pressureDelayCoef - cas,-1)
                                end

                                if sberac02pressureDelayCoef > 0 then -- predni zberac
                                    if sberac02Time < 1 then
                                        sberac02Time = sberac02Time + math.min((((jimkaPK/10)-0.087393202250021)^2),math.abs(math.sin(math.pi*sberac02Time*3))*0.03+0.015)*cas*10*math.max(sberac02pressureDelayCoef,0)
                                        jimkaPK = jimkaPK - cas*jimkaPK/20
                                    elseif sberac02Time == 3.75 then
                                        sberac02Delay = math.min(sberac02Delay + cas*2,SBERAC02_MAX_DELAY)
                                    end
                                elseif sberac02pressureDelayCoef < 0 then
                                    if sberac02Time > 0 then
                                        if sberac02Delay > 0 then
                                            sberac02Delay = sberac02Delay - cas
                                        else
                                            sberac02Time = sberac02Time + math.min(0.075, math.abs(math.cos(math.pi*sberac02Time*3))*0.055+0.027)*cas*6*math.min(sberac02pressureDelayCoef,0)
                                        end
                                    else
                                        sberac02pressureDelayCoef = 0
                                    end
                                end

                                Call("SetTime", "Panto01", sberac01Time)
                                Call("SetTime", "Panto02", sberac02Time)

                                if ((sberac01Time >= 1 and Q03) or (sberac02Time >= 1 and Q04)) and Q01 and napeti > 2200 then
                                    K02 = true
                                else
                                    K02 = false
                                end
                            --zapis hodnot
                                Call("SetControlValue", "diag1", 0, toInt(diag1))
                                Call("SetControlValue", "diag2", 0, toInt(diag2))
                                Call("SetControlValue", "diag3", 0, toInt(diag3))
                                Call("SetControlValue", "diag4", 0, toInt(diag4))
                                Call("SetControlValue", "diag5", 0, toInt(diag5))
                                Call("SetControlValue", "diag6", 0, toInt(diag6))
                                Call("SetControlValue", "diag7", 0, toInt(diag7))
                                Call("SetControlValue", "diag8", 0, toInt(diag8))
                                Call("SetControlValue", "diag9", 0, toInt(diag9))
                                Call("SetControlValue", "diag10", 0, toInt(diag10))
                                Call("SetControlValue", "TopeniVlaku", 0, toInt(K85 and K02 and Q01))
                        --NAVESTNI SVETLA
                            --reflektory
                                F150 = Call("GetControlValue", "F150", 0) > 0.9 --jistic dalkoveho reflektoru
                                S141 = Call("GetControlValue", "reflektor", 0)
                                E101A = baterie and F150 and ((S141 > 0.75) or (S141 < -0.25 and S141 > -0.75))
                                E101A_TL = baterie and F150 and (S141 > 0.25 and S141 < 0.75)
                                E101B = baterie and F150 and ((S141 > 0.75) or (S141 < -0.75))
                                E101B_TL = baterie and F150 and (S141 > 0.25 and S141 < 0.75)
                                Call("ActivateNode","reflektorPPL",toInt(E101A))
                                Call("ActivateNode","reflektorPTL",toInt(E101A_TL))
                                Call("ActivateNode","reflektorLPL",toInt(E101B))
                                Call("ActivateNode","reflektorLTL",toInt(E101B_TL))
                                Call("ReflektorLevyTlumeny:Activate",toInt(E101B_TL))
                                Call("ReflektorPravyTlumeny:Activate",toInt(E101A_TL))
                                Call("ReflektorLevyPlny:Activate",toInt(E101B))
                                Call("ReflektorPravyPlny:Activate",toInt(E101A))

                                proudBaterie = proudBaterie + toInt(E101A)*5 + toInt(E101B)*5 + toInt(E101A_TL)*2 + toInt(E101B_TL)*2
                            --pozicni svetla
                                F155 = Call("GetControlValue", "F155", 0) > 0.9 --jistic pozicek
                                S143 = Call("GetControlValue", "pozPP", 0)
                                S145 = Call("GetControlValue", "pozPL", 0)
                                S147 = Call("GetControlValue", "pozZP", 0)
                                S149 = Call("GetControlValue", "pozZL", 0)
                                vodic817 = (baterie and F155 and not koncova) or (X202cizi[22] and not Q01)
                                E103B = (vodic817 and S143 > 0.5) or X202cizi[46]
                                E103C = (vodic817 and S143 < -0.5) or X202cizi[44]
                                E105B = (vodic817 and S145 > 0.5) or X202cizi[42]
                                E105C = (vodic817 and S145 < -0.5) or X202cizi[24]
                                X202vlastni[45] = vodic817 and S147 > 0.5
                                X202vlastni[43] = vodic817 and S147 < -0.5
                                X202vlastni[41] = vodic817 and S149 > 0.5
                                X202vlastni[23] = vodic817 and S149 < -0.5
                                X202vlastni[21] = baterie and F155 and (not rizeniZap or koncova)
                                Call("ActivateNode","pozickaLCr",toInt(E105C))
                                Call("ActivateNode","pozickaLZl",toInt(E105B))
                                Call("ActivateNode","pozickaPCr",toInt(E103C))
                                Call("ActivateNode","pozickaPZl",toInt(E103B))
                                Call("PozBilaLeva:Activate",toInt(E105B))
                                Call("PozBilaPrava:Activate",toInt(E103B))
                                Call("PozCervenaLevaPredni:Activate",toInt(E105C))
                                Call("PozCervenaPravaPredni:Activate",toInt(E103C))

                                proudBaterie = proudBaterie + toInt(E103B) + toInt(E103C) + toInt(E105B) + toInt(E105C)

                                --CV headlights
                                    if obsazena then
                                        if E103B and E105B then
                                            Call("SetControlValue", "Headlights", 0, 1)
                                        elseif E103C and E105C then
                                            Call("SetControlValue", "Headlights", 0, 2)
                                        else
                                            Call("SetControlValue", "Headlights", 0, 0)
                                        end
                                    end
                            --houkacka
                                F154 = Call("GetControlValue", "F154", 0) > 0.9
                                S131 = false--Call("GetControlValue", "VirtualHorn", 0)
                                S133 = Call("GetControlValue", "VirtualHorn", 0) > 0.5
                                Y127 = baterie and F154 and (S131 or S133)
                                Call("SetControlValue", "Horn", 0, toInt(Y127))
                            --pistala
                                F153 = Call("GetControlValue", "F153", 0) > 0.9
                                S129 = Call("GetControlValue", "VirtualBell", 0) > 0.5
                                Y129 = baterie and F153 and S129
                                Call("SetControlValue", "Bell", 0, toInt(Y129))
                            --osvetleni stanoviste
                                F131 = Call("GetControlValue", "F131", 0) > 0.9
                                S139 = Call("GetControlValue", "osvetleniPristroje", 0)
                                S151 = Call("GetControlValue", "osvetleniStanoviste", 0)

                                if baterie and F131 then
                                    if S151 > 0.5 then
                                        zarovkaIntensityTarget = 0
                                        if zarivka1CasStart == nil then
                                            zarivka1Cas = 0
                                            zarivka1CasStart = math.random()*(15-vMetrBaterie/3.7)
                                            zarivka1 = false
                                            zarivka1Blik = nil
                                        end

                                        if zarivka1Cas < zarivka1CasStart then
                                            zarivka1Cas = zarivka1Cas + cas
                                            if zarivka1Blik == nil or zarivka1Blik < zarivka1BlikCas then
                                                zarivka1BlikCas = 0
                                                zarivka1 = not zarivka1
                                                if zarivka1 then
                                                    zarivka1Blik = math.random()*0.2
                                                else
                                                    zarivka1Blik = math.random()*1
                                                end
                                            else
                                                zarivka1BlikCas = zarivka1BlikCas + cas
                                            end
                                        else
                                            zarivka1Blik = nil
                                            zarivka1 = true
                                        end

                                        if zarivka1 then
                                            zarivka1IntensityTarget = 1
                                        else
                                            zarivka1IntensityTarget = 0
                                        end

                                        if zarivka2CasStart == nil then
                                            zarivka2Cas = 0
                                            zarivka2CasStart = math.random()*(15-vMetrBaterie/3.7)
                                            zarivka2 = false
                                            zarivka2Blik = nil
                                        end

                                        if zarivka2Cas < zarivka2CasStart then
                                            zarivka2Cas = zarivka2Cas + cas
                                            if zarivka2Blik == nil or zarivka2Blik < zarivka2BlikCas then
                                                zarivka2BlikCas = 0
                                                zarivka2 = not zarivka2
                                                if zarivka2 then
                                                    zarivka2Blik = math.random()*0.2
                                                else
                                                    zarivka2Blik = math.random()*1
                                                end
                                            else
                                                zarivka2BlikCas = zarivka2BlikCas + cas
                                            end
                                        else
                                            zarivka2Blik = nil
                                            zarivka2 = true
                                        end

                                        if zarivka2 then
                                            zarivka2IntensityTarget = 1
                                        else
                                            zarivka2IntensityTarget = 0
                                        end

                                        Call("SetControlValue", "zarivkaStanoviste", 0, toInt(zarivka1 or zarivka2)*2)
                                        proudBaterie = proudBaterie + 7
                                    elseif S151 < -0.5 then
                                        zarovkaIntensityTarget = (vMetrBaterie/58)^2
                                        zarivka1IntensityTarget = 0
                                        zarivka2IntensityTarget = 0
                                        zarivka1CasStart = nil
                                        zarivka2CasStart = nil
                                        Call("SetControlValue", "zarivkaStanoviste", 0, 1)
                                        proudBaterie = proudBaterie + 3
                                    else
                                        zarovkaIntensityTarget = 0
                                        zarivka1IntensityTarget = 0
                                        zarivka2IntensityTarget = 0
                                        zarivka1CasStart = nil
                                        zarivka2CasStart = nil
                                        Call("SetControlValue", "zarivkaStanoviste", 0, 0)
                                    end
                                    lampickaFull = {0.867,0.942,1}
                                    lampickaIntensity = ((vMetrBaterie/58)^2)
                                    if Call("GetControlValue", "LampickaLeva", 0) > 0.5 then
                                        Call("LampickaLeva:SetColour",lampickaFull[1]*lampickaIntensity,lampickaFull[2]*lampickaIntensity,lampickaFull[3]*lampickaIntensity)
                                        Call("LampickaLeva:Activate",1)
                                    else
                                        Call("LampickaLeva:Activate",0)
                                    end
                                    if Call("GetControlValue", "LampickaPrava", 0) > 0.5 then
                                        Call("LampickaPrava:SetColour",lampickaFull[1]*lampickaIntensity,lampickaFull[2]*lampickaIntensity,lampickaFull[3]*lampickaIntensity)
                                        Call("LampickaPrava:Activate",1)
                                    else
                                        Call("LampickaPrava:Activate",0)
                                    end
                                    if S139 > 0.5 then
                                        manometrFull = {0.8,0.7,0.1}
                                        vMetrFull = {1,0.6,0.4}
                                        rychlomerFull = {2.64,2.787,3}
                                        budikIntensity = ((vMetrBaterie/58)^2)*3
                                        Call("SvetloKab01:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab02:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab03:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab04:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab05:SetColour",manometrFull[1]*budikIntensity,manometrFull[2]*budikIntensity,manometrFull[3]*budikIntensity)
                                        Call("SvetloKab06:SetColour",manometrFull[1]*budikIntensity,manometrFull[2]*budikIntensity,manometrFull[3]*budikIntensity)
                                        Call("SvetloRychlomer:SetColour",rychlomerFull[1]*budikIntensity,rychlomerFull[2]*budikIntensity,rychlomerFull[3]*budikIntensity)
                                        Call("SvetloKab01:Activate",1)
                                        Call("SvetloKab02:Activate",1)
                                        Call("SvetloKab03:Activate",1)
                                        Call("SvetloKab04:Activate",1)
                                        Call("SvetloKab05:Activate",1)
                                        Call("SvetloKab06:Activate",1)
                                        Call("SvetloRychlomer:Activate",1)
                                        Call("SetControlValue", "RM1_RUC", 0, 1)
                                    elseif S139 < -0.5 then
                                        manometrFull = {0.4,0.35,0.05}
                                        vMetrFull = {0.5,0.3,0.2}
                                        rychlomerFull = {2.64,2.787,3}
                                        lampickaFull = {0.867,0.942,1}
                                        budikIntensity = ((vMetrBaterie/58)^2)*2
                                        Call("SvetloKab01:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab02:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab03:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab04:SetColour",vMetrFull[1]*budikIntensity,vMetrFull[2]*budikIntensity,vMetrFull[3]*budikIntensity)
                                        Call("SvetloKab05:SetColour",manometrFull[1]*budikIntensity,manometrFull[2]*budikIntensity,manometrFull[3]*budikIntensity)
                                        Call("SvetloKab06:SetColour",manometrFull[1]*budikIntensity,manometrFull[2]*budikIntensity,manometrFull[3]*budikIntensity)
                                        Call("SvetloRychlomer:SetColour",rychlomerFull[1]*budikIntensity,rychlomerFull[2]*budikIntensity,rychlomerFull[3]*budikIntensity)
                                        Call("SvetloKab01:Activate",1)
                                        Call("SvetloKab02:Activate",1)
                                        Call("SvetloKab03:Activate",1)
                                        Call("SvetloKab04:Activate",1)
                                        Call("SvetloKab05:Activate",1)
                                        Call("SvetloKab06:Activate",1)
                                        Call("SvetloRychlomer:Activate",1)
                                        Call("SetControlValue", "RM1_RUC", 0, 1)
                                    else
                                        Call("SvetloKab01:Activate",0)
                                        Call("SvetloKab02:Activate",0)
                                        Call("SvetloKab03:Activate",0)
                                        Call("SvetloKab04:Activate",0)
                                        Call("SvetloKab05:Activate",0)
                                        Call("SvetloKab06:Activate",0)
                                        Call("SvetloRychlomer:Activate",0)
                                        Call("SetControlValue", "RM1_RUC", 0, 0)
                                    end
                                else
                                    zarovkaIntensityTarget = 0
                                    zarivka1IntensityTarget = 0
                                    zarivka2IntensityTarget = 0
                                    zarivka1CasStart = nil
                                    zarivka2CasStart = nil
                                    Call("SetControlValue", "zarivkaStanoviste", 0, 0)
                                    Call("SvetloKab01:Activate",0)
                                    Call("SvetloKab02:Activate",0)
                                    Call("SvetloKab03:Activate",0)
                                    Call("SvetloKab04:Activate",0)
                                    Call("SvetloKab05:Activate",0)
                                    Call("SvetloKab06:Activate",0)
                                    Call("SvetloRychlomer:Activate",0)
                                    Call("SetControlValue", "RM1_RUC", 0, 0)
                                    Call("LampickaLeva:Activate",0)
                                    Call("LampickaPrava:Activate",0)
                                end

                                if zarovkaIntensityTarget > zarovkaIntensity+cas*100 then
                                    zarovkaIntensity = zarovkaIntensity + math.sqrt(zarovkaIntensityTarget-zarovkaIntensity)*cas*50
                                elseif zarovkaIntensity > zarovkaIntensityTarget+cas*100 then
                                    zarovkaIntensity = zarovkaIntensity - math.sqrt(zarovkaIntensity-zarovkaIntensityTarget)*cas*50
                                else
                                    zarovkaIntensity = zarovkaIntensityTarget
                                end
                                zarovkaColorFull = {0.975,0.85,0.6}
                                if zarovkaIntensity > 0 then
                                    Call("Zarivka01a:SetColour",zarovkaColorFull[1]*zarovkaIntensity,zarovkaColorFull[2]*zarovkaIntensity,zarovkaColorFull[3]*zarovkaIntensity)
                                    Call("Zarivka01b:SetColour",zarovkaColorFull[1]*zarovkaIntensity,zarovkaColorFull[2]*zarovkaIntensity,zarovkaColorFull[3]*zarovkaIntensity)
                                    Call("Zarivka01a:Activate",1)
                                    Call("Zarivka01b:Activate",1)
                                else
                                    Call("Zarivka01a:Activate",0)
                                    Call("Zarivka01b:Activate",0)
                                end

                                zarivkaColorFull = {1.950,1.8,1.4}
                                
                                if zarivka1IntensityTarget > zarivka1Intensity+cas/5 then
                                    zarivka1Intensity = math.max(zarivka1Intensity + math.sqrt(zarivka1IntensityTarget-zarivka1Intensity)*cas/10,0.7)
                                elseif zarivka1Intensity > zarivka1IntensityTarget+cas*40 then
                                    zarivka1Intensity = zarivka1Intensity - math.sqrt(zarivka1Intensity-zarivka1IntensityTarget)*cas*20
                                else
                                    zarivka1Intensity = zarivka1IntensityTarget
                                end
                                if zarivka1Intensity > 0 then
                                    Call("Zarivka02a:SetColour",zarivkaColorFull[1]*zarivka1Intensity,zarivkaColorFull[2]*zarivka1Intensity,zarivkaColorFull[3]*zarivka1Intensity)
                                    Call("Zarivka02a:Activate",1)
                                else
                                    Call("Zarivka02a:Activate",0)
                                end

                                if zarivka2IntensityTarget > zarivka2Intensity+cas/5 then
                                    zarivka2Intensity = math.max(zarivka2Intensity + math.sqrt(zarivka2IntensityTarget-zarivka2Intensity)*cas/10,0.7)
                                elseif zarivka2Intensity > zarivka2IntensityTarget+cas*40 then
                                    zarivka2Intensity = zarivka2Intensity - math.sqrt(zarivka2Intensity-zarivka2IntensityTarget)*cas*20
                                else
                                    zarivka2Intensity = zarivka2IntensityTarget
                                end
                                if zarivka2Intensity > 0 then
                                    Call("Zarivka02b:SetColour",zarivkaColorFull[1]*zarivka2Intensity,zarivkaColorFull[2]*zarivka2Intensity,zarivkaColorFull[3]*zarivka2Intensity)
                                    Call("Zarivka02b:Activate",1)
                                else
                                    Call("Zarivka02b:Activate",0)
                                end

                            --osvetleni strojovny a podvozku
                                F130 = Call("GetControlValue", "F130", 0) > 0.9

                                if baterie and F130 and math.abs(Call("GetControlValue", "OsvetleniPodvozku", 0)) > 0.5 then
                                    Call("ActivateNode","osvetleniPodvozkuSvitici",1)
                                    Call("ActivateNode","osvetleniPodvozku",0)
                                    Call("SvetloPodvozek1:Activate",1)
                                    Call("SvetloPodvozek2:Activate",1)
                                    Call("SvetloPodvozek3:Activate",1)
                                    Call("SvetloPodvozek4:Activate",1)
                                    Call("SvetloPodvozek5:Activate",1)
                                    Call("SvetloPodvozek6:Activate",1)
                                    Call("SvetloPodvozek7:Activate",1)
                                    Call("SvetloPodvozek8:Activate",1)
                                else
                                    Call("ActivateNode","osvetleniPodvozkuSvitici",0)
                                    Call("ActivateNode","osvetleniPodvozku",1)
                                    Call("SvetloPodvozek1:Activate",0)
                                    Call("SvetloPodvozek2:Activate",0)
                                    Call("SvetloPodvozek3:Activate",0)
                                    Call("SvetloPodvozek4:Activate",0)
                                    Call("SvetloPodvozek5:Activate",0)
                                    Call("SvetloPodvozek6:Activate",0)
                                    Call("SvetloPodvozek7:Activate",0)
                                    Call("SvetloPodvozek8:Activate",0)
                                end

                                if baterie and F130 and (math.abs(Call("GetControlValue", "OsvetleniStrojovny", 0)) > 0.5 or math.abs(Call("GetControlValue", "OsvetleniUlicky", 0)) > 0.5) then
                                    Call("SvetloStrojovna1:Activate",1)
                                    Call("SvetloStrojovna2:Activate",1)
                                    Call("SvetloStrojovna3:Activate",1)
                                    Call("SvetloStrojovna4:Activate",1)
                                    Call("SvetloStrojovna5:Activate",1)
                                    Call("SvetloStrojovna6:Activate",1)
                                    Call("SvetloStrojovna7:Activate",1)
                                    Call("SvetloStrojovna8:Activate",1)
                                    Call("SvetloStrojovna9:Activate",1)
                                    Call("SvetloStrojovna10:Activate",1)
                                else
                                    Call("SvetloStrojovna1:Activate",0)
                                    Call("SvetloStrojovna2:Activate",0)
                                    Call("SvetloStrojovna3:Activate",0)
                                    Call("SvetloStrojovna4:Activate",0)
                                    Call("SvetloStrojovna5:Activate",0)
                                    Call("SvetloStrojovna6:Activate",0)
                                    Call("SvetloStrojovna7:Activate",0)
                                    Call("SvetloStrojovna8:Activate",0)
                                    Call("SvetloStrojovna9:Activate",0)
                                    Call("SvetloStrojovna10:Activate",0)
                                end

                        --POMOCNE POHONY
                            F105 = Call("GetControlValue", "F105", 0) > 0.9
                            K116 = baterie and F105 and K02 and Q01 and (S121 or koncova) --blokovaci rele PP
                            diag21 = K116
                            HKnot0X = (stupenHK > 1)
                            --kompresory
                                S115 = Call("GetControlValue", "kompresor", 0)
                                S117 = Call("GetControlValue", "kompresorCizi", 0)
                                if S115 > 0.75 then
                                    S115_A = false
                                    S115_T = true
                                elseif S115 > 0.25 then
                                    S115_A = true
                                    S115_T = false
                                else
                                    S115_A = false
                                    S115_T = false
                                end
                                if S117 > 0.75 then
                                    S117_A = false
                                    S117_PK = false
                                    S117_T = true
                                elseif S117 > 0.25 then
                                    S117_A = true
                                    S117_PK = false
                                    S117_T = false
                                elseif S117 < -0.25 then
                                    S117_A = false
                                    S117_PK = true
                                    S117_T = false
                                else
                                    S117_A = false
                                    S117_PK = false
                                    S117_T = false
                                end
                                vodic393 = (baterie and F105 and (vedouci or jednotlive) and (S115_T or (not S501 and S115_A))) or (X204cizi[5] and (koncova or (S117_A and (S115_A or (not S501 and S115_T))) or (S117_T and S115_T)))
                                diag25 = vodic393
                                vodic394 = vodic393 and K116
                                K83 = vodic394 and not K13
                                diag26 = K83
                                if K83 and S503delay <= 1.5 then
                                    S503delay = S503delay+cas
                                elseif not K83 then
                                    S503delay = 0
                                end
                                S503 = S503delay >= 1.5
                                if K83 and K126delay < 1 then
                                    K126delay = K126delay+cas
                                elseif not K83 then
                                    K126delay = 0
                                end
                                K126 = K126delay >= 0.91
                                K84 = vodic394 and not K13 and K126
                                diag27 = K84
                                NastavHodnotuSID("kompresoryNaVlaku", toInt(K83), 131992)
                            --ventilatory
                                S113 = Call("GetControlValue", "ventilator", 0)
                                if S113 < 0.25 then
                                    S113_A = false
                                    S113_T = true
                                elseif S113 < 0.75 then
                                    S113_A = true
                                    S113_T = false
                                else
                                    S113_A = false
                                    S113_T = false
                                end
                                vodic403 = (baterie and F105 and (vedouci or jednotlive) and (S113_T or ((S113_A and (HKnot0X or K81)) or rychlostKolaKMHPodvozek1 > 20))) or (X204cizi[6] or (X204cizi[7] and (HKnot0X or K81 or rychlostKolaKMHPodvozek1 > 20)))
                                diag22 = vodic403
                                vodic407 = vodic403 and K116 and not K12
                                K81 = vodic407 and (K81 or not K82)
                                diag23 = K81
                                if vodic407 and K117delay < 1 then
                                    K117delay = K117delay+cas
                                elseif not vodic407 then
                                    K117delay = 0
                                end
                                K117 = K117delay >= 1
                                K82 = vodic407 and K117
                                diag24 = K82
                            --pomocny kompresor
                                F121 = Call("GetControlValue", "F121", 0) > 0.9
                                K131 = baterie and F121 and jednotlive and S117_PK and not S502
                                Call("SetControlValue", "pomocnyKompresor", 0, toInt(K131))

                                proudBaterie = proudBaterie + toInt(K131)*100*(jimkaPK/4)

                            H9 = baterie and F105 and K83 and not S503
                            H10 = X204cizi[3] and X204cizi[4]
                            X204vlastni[1] = baterie and F105 and K83
                            X204vlastni[2] = not S503 --invertovana - true = prizemneno!
                            X204vlastni[5] = baterie and F105 and (vedouci or jednotlive) and ((not S501 and S117_A) or S117_T)
                            X204vlastni[6] = (baterie and F105 and (vedouci or jednotlive) and S113_T) or (((baterie and F105 and (vedouci or jednotlive) and (S113_A or rychlostKolaKMHPodvozek1 > 20)) or X204cizi[7]) and (HKnot0X or K81 or rychlostKolaKMHPodvozek1 > 20))
                            X204vlastni[7] = (baterie and F105 and (vedouci or jednotlive) and (S113_A or rychlostKolaKMHPodvozek1 > 20)) --or (X204cizi[6] and (HKnot0X or K81))
                            Call("SetControlValue", "diag21", 0, toInt(diag21))
                            Call("SetControlValue", "diag22", 0, toInt(diag22))
                            Call("SetControlValue", "diag23", 0, toInt(diag23))
                            Call("SetControlValue", "diag24", 0, toInt(diag24))
                            Call("SetControlValue", "diag25", 0, toInt(diag25))
                            Call("SetControlValue", "diag26", 0, toInt(diag26))
                            Call("SetControlValue", "diag27", 0, toInt(diag27))
                        --PISKOVANI, ODVODNOVANI, ODBRZDOVANI, ROZMRAZOVACE
                                F123 = Call("GetControlValue", "F123", 0) > 0.9
                                F125 = Call("GetControlValue", "F125", 0) > 0.9
                                F127 = Call("GetControlValue", "F127", 0) > 0.9

                                OL2 = (baterie and F127 and (vedouci or jednotlive) and Call("GetControlValue", "OL2", 0) > 0.5) or X204cizi[11]
                                Call("SoundEngine:SetParameter","OdbrzdovacZvuk",toInt(OL2))
                                X204vlastni[11] = baterie and F127 and (vedouci or jednotlive) and Call("GetControlValue", "OL2", 0) > 0.5

                                if baterie and F127 and (vedouci or jednotlive) and Call("GetControlValue", "VirtualSander", 0) > 0.1 then
                                    Call("SetControlValue", "Sander", 0, 1)
                                else
                                    Call("SetControlValue", "Sander", 0, 0)
                                end
                        --VZDUCHOTECHNIKA
                            OBElast = OBE
                            dummyVirtualBrakeLast = OBE
                            OBE = Call("GetControlValue","dummyVirtualBrake",0)
                            soupatkoVZ = not MIREL.odpadleSoupatkoVZ
                            ----------------------------------------Ventily povesene na brzdove potrubi---------------
                                VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
                                if not soupatkoVZ or OBE > 0.86 or not VO67.soupatko then
                                    NastavHodnotuSID("zaklopkyPotrubi", 1, 131993)
                                    BSE_RB = true
                                    -- Call("SoundBrzdice:SetParameter", "EmergencyValve", 1)
                                else
                                    NastavHodnotuSID("zaklopkyPotrubi", 0, 131993)
                                    BSE_RB = false
                                    -- Call("SoundBrzdice:SetParameter", "EmergencyValve", 0)
                                    -- Call("SoundBrzdice:SetParameter", "EmergencyFilling", 0)
                                end
                                zaklopkaPotrubi = Call("GetControlValue", "zaklopkyPotrubi", 0)
                                -- if zaklopkaPotrubi > 0 then
                                --     if not BSE_YZ and not soupatkoVZ then
                                --         VirtualMainReservoirPressureBAR = VirtualMainReservoirPressureBAR - (math.sqrt(VirtualMainReservoirPressureBAR)/7)*cas
                                --         Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                --         --Call("SoundBrzdice:SetParameter", "EmergencyFilling", 1)
                                --     else
                                --         --Call("SoundBrzdice:SetParameter", "EmergencyFilling", 0)
                                --     end
                                -- end
                            ----------------------------------------DAKO BSE------------------------------------------
                                BSE_tlakHP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                BSE_ridiciTlak = Call("GetControlValue","VirtualBrakeControlSystemPressureBAR",0)
                                BSE_prepojovaciTlak = Call("GetControlValue","VirtualBrakeSwitchingValvePressureBAR",0)
                                BSE_casovaciVzduchojem = Call("GetControlValue","VirtualBrakeDelayReservoirPressureBAR",0)
                                plynuleValce_primocinne = Call("GetControlValue","VirtualLocoBrakeCylinderPressureBAR",0)
                                F109 = Call("GetControlValue", "F109", 0) > 0.9

                                S511 = (S511 and BSE_tlakHP > 2.5) or BSE_tlakHP > 4.5

                                if not F109 and not BSE_nouzove then
                                    SysCall("ScenarioManager:ShowMessage", "REZIM BSE", "NOUZOVE", 1)
                                    BSE_nouzove = true
                                elseif F109 and BSE_nouzove then
                                    SysCall("ScenarioManager:ShowMessage", "REZIM BSE", "NORMALNE", 1)
                                    BSE_nouzove = false
                                end

                                --netesnost brzdice
                                    BSE_ridiciTlak = BSE_ridiciTlak-(((BSE_ridiciTlak/500)^2)*3*cas)

                                --netesnost potrubi
                                    BSE_tlakHP = BSE_tlakHP-(((BSE_tlakHP/500)^2)*3*cas)
                                    --Call("SetControlValue","VirtualBrakePipePressureBAR",0,BSE_tlakHP)
                                
                                --odvetravani regulacniho clenu pri prebiti
                                    BSE_casovaciVzduchojem = math.max(BSE_casovaciVzduchojem-0.00333*cas,0)

                                --EP ventily BSE
                                    if not BSE_nouzove and baterie and F109 and rizeniZap then
                                        if soupatkoVZ and (vedouci or jednotlive) then --pritazene soupatko
                                            if OBE < 0.066 then --S
                                                BSE_YO = true
                                                BSE_YB = true
                                                BSE_YS = true
                                                BSE_YZ = false
                                                BSE_YP = true
                                            elseif OBE < 0.208 then --P
                                                BSE_YO = true
                                                BSE_YB = true
                                                BSE_YS = false
                                                BSE_YZ = false
                                                BSE_YP = true
                                            elseif OBE < 0.364 then --Z
                                                BSE_YO = false
                                                BSE_YB = true
                                                BSE_YS = false
                                                BSE_YZ = true
                                                BSE_YP = false
                                            elseif OBE < 0.507 then --O
                                                BSE_YO = true
                                                BSE_YB = true
                                                BSE_YS = false
                                                BSE_YZ = false
                                                BSE_YP = false
                                            elseif OBE < 0.65 then --J
                                                BSE_YO = false
                                                BSE_YB = true
                                                BSE_YS = false
                                                BSE_YZ = false
                                                BSE_YP = false
                                            elseif OBE < 0.86 then --B
                                                BSE_YO = false
                                                BSE_YB = false
                                                BSE_YS = false
                                                BSE_YZ = false
                                                BSE_YP = false
                                            else --R
                                                BSE_YO = false
                                                BSE_YB = false
                                                BSE_YS = false
                                                BSE_YZ = true
                                                BSE_YP = false
                                            end
                                        else --zaver pri zasahu VZ
                                            BSE_YO = false
                                            BSE_YB = true
                                            BSE_YS = false
                                            BSE_YZ = true
                                            BSE_YP = false
                                        end
                                    else --odpadnute veskere ventily pri nouzovem provozu, vypnutych bateriich, nebo shozenem jistici BSE
                                        BSE_YO = false
                                        BSE_YB = false
                                        BSE_YS = false
                                        BSE_YZ = false
                                        BSE_YP = false
                                    end
                                
                                --tlak ridiciho ustroji brzdice
                                    if VirtualMainReservoirPressureBAR > 5 then
                                        if (BSE_YB and not MIRER.EPV) and BSE_ridiciTlak > 4.7 and BSE_ridiciTlak < 5 then --dorovnani tlaku na 5BAR pri 4.7-5
                                            BSE_ridiciTlak = math.min(BSE_ridiciTlak + math.sqrt(5-BSE_ridiciTlak)*cas*0.05, 5)
                                        end
                                        if not BSE_nouzove then
                                            if BSE_YO then
                                                if BSE_ridiciTlak < 5 then
                                                    BSE_ridiciTlak = math.min(BSE_ridiciTlak + math.sqrt(5-BSE_ridiciTlak)*cas*0.2, 5)
                                                    Call("SoundBrzdice:SetParameter", "BSE_YO", 1)
                                                else
                                                    Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                                end
                                            else
                                                Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                            end
                                            if not BSE_YB or MIRER.EPV then
                                                if BSE_ridiciTlak > 0 then
                                                    BSE_ridiciTlak = math.max(BSE_ridiciTlak - math.sqrt(BSE_ridiciTlak)*cas*0.2, 0)
                                                    Call("SoundBrzdice:SetParameter", "BSE_YB", 1)
                                                else
                                                    Call("SoundBrzdice:SetParameter", "BSE_YB", 0)
                                                end
                                            else
                                                Call("SoundBrzdice:SetParameter", "BSE_YB", 0)
                                            end
                                        else
                                            Call("SoundBrzdice:SetParameter", "BSE_YB", 0)
                                            Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                            BSE_ridiciTlak = 5-(plynuleValce_primocinne/tlakValceMAX)*1.5
                                        end
                                        if BSE_YS then
                                            if BSE_prepojovaciTlak < VirtualMainReservoirPressureBAR then
                                                BSE_prepojovaciTlak = math.min(BSE_prepojovaciTlak + cas*5, VirtualMainReservoirPressureBAR)
                                            else
                                                BSE_prepojovaciTlak = math.max(BSE_prepojovaciTlak - cas*5, VirtualMainReservoirPressureBAR)
                                            end
                                        else
                                            if BSE_prepojovaciTlak < BSE_ridiciTlak then
                                                BSE_prepojovaciTlak = math.min(BSE_prepojovaciTlak + cas*5, BSE_ridiciTlak)
                                            else
                                                BSE_prepojovaciTlak = math.max(BSE_prepojovaciTlak - cas*5, BSE_ridiciTlak)
                                            end
                                        end
                                        if BSE_YP then
                                            if BSE_casovaciVzduchojem < BSE_tlakHP then
                                                BSE_casovaciVzduchojem = math.min(BSE_casovaciVzduchojem + cas*0.1, BSE_tlakHP)
                                            else
                                                BSE_casovaciVzduchojem = math.max(BSE_casovaciVzduchojem - cas*0.1, BSE_tlakHP)
                                            end
                                        end
                                    else
                                        if BSE_YB and not MIRER.EPV and BSE_ridiciTlak > 4.7 and BSE_ridiciTlak < VirtualMainReservoirPressureBAR then
                                            BSE_ridiciTlak = math.min(BSE_ridiciTlak + math.sqrt(VirtualMainReservoirPressureBAR-BSE_ridiciTlak)*cas*0.05, VirtualMainReservoirPressureBAR)
                                        elseif BSE_ridiciTlak > VirtualMainReservoirPressureBAR then
                                            BSE_ridiciTlak = math.max(BSE_ridiciTlak - math.sqrt(BSE_ridiciTlak-VirtualMainReservoirPressureBAR)*cas*0.2, VirtualMainReservoirPressureBAR)
                                        end
                                        if not BSE_nouzove then
                                            if BSE_YO then
                                                if BSE_ridiciTlak < 5 then
                                                    if BSE_ridiciTlak < VirtualMainReservoirPressureBAR then
                                                        BSE_ridiciTlak = math.min(BSE_ridiciTlak + math.sqrt(VirtualMainReservoirPressureBAR-BSE_ridiciTlak)*cas*0.2, VirtualMainReservoirPressureBAR)
                                                        Call("SoundBrzdice:SetParameter", "BSE_YO", 1)
                                                    else
                                                        BSE_ridiciTlak = math.max(BSE_ridiciTlak - math.sqrt(BSE_ridiciTlak-VirtualMainReservoirPressureBAR)*cas*0.2, 0)
                                                        Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                                    end
                                                else
                                                    Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                                end
                                            else
                                                Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                            end
                                            if not BSE_YB or MIRER.EPV then
                                                if BSE_ridiciTlak > 0 then
                                                    BSE_ridiciTlak = math.max(BSE_ridiciTlak - math.sqrt(BSE_ridiciTlak)*cas*0.2, 0)
                                                    Call("SoundBrzdice:SetParameter", "BSE_YB", 1)
                                                else
                                                    Call("SoundBrzdice:SetParameter", "BSE_YB", 0)
                                                end
                                            else
                                                Call("SoundBrzdice:SetParameter", "BSE_YB", 0)
                                            end
                                        else
                                            Call("SoundBrzdice:SetParameter", "BSE_YO", 0)
                                            Call("SoundBrzdice:SetParameter", "BSE_YB", 0)
                                            BSE_ridiciTlak = math.min(5-(plynuleValce_primocinne/tlakValceMAX)*1.5,VirtualMainReservoirPressureBAR)
                                        end
                                        if BSE_YS then
                                            if BSE_prepojovaciTlak < VirtualMainReservoirPressureBAR then
                                                BSE_prepojovaciTlak = math.min(BSE_prepojovaciTlak + cas*5, VirtualMainReservoirPressureBAR)
                                            else
                                                BSE_prepojovaciTlak = math.max(BSE_prepojovaciTlak - cas*5, VirtualMainReservoirPressureBAR)
                                            end
                                        else
                                            if BSE_prepojovaciTlak < BSE_ridiciTlak then
                                                BSE_prepojovaciTlak = math.min(BSE_prepojovaciTlak + cas*5, BSE_ridiciTlak)
                                            else
                                                BSE_prepojovaciTlak = math.max(BSE_prepojovaciTlak - cas*5, BSE_ridiciTlak)
                                            end
                                        end
                                        if BSE_YP then
                                            if BSE_casovaciVzduchojem < BSE_tlakHP then
                                                BSE_casovaciVzduchojem = math.min(BSE_casovaciVzduchojem + cas, BSE_tlakHP)
                                            else
                                                BSE_casovaciVzduchojem = math.max(BSE_casovaciVzduchojem - cas, BSE_tlakHP)
                                            end
                                        end
                                    end

                                --rizeni membrany regulatoru hlavniho potrubi
                                    BSE_rozvodovyVentilTarget = math.max(math.min(((BSE_prepojovaciTlak+BSE_casovaciVzduchojem/11)-BSE_tlakHP)*math.max(VirtualMainReservoirPressureBAR-BSE_tlakHP,1),1),-1)

                                    if math.abs(BSE_rozvodovyVentil) < 0.01 and math.abs(BSE_rozvodovyVentilTarget - BSE_rozvodovyVentil) < 0.01 then
                                        BSE_rozvodovyVentilHystereze = math.min(BSE_rozvodovyVentilHystereze + cas*0.01, 0.25)
                                        if math.abs(BSE_tlakHP-(BSE_prepojovaciTlak+BSE_casovaciVzduchojem/11)) < 0.01 and cilovy_tlak_HP_po_zmene <= 0 then
                                            BSE_tlakHP = BSE_prepojovaciTlak+BSE_casovaciVzduchojem/11
                                        end
                                    elseif math.abs(BSE_rozvodovyVentilTarget - BSE_rozvodovyVentil) > 0.01 then
                                        BSE_rozvodovyVentilHystereze = math.max(BSE_rozvodovyVentilHystereze - cas*math.sqrt(math.abs(BSE_rozvodovyVentilTarget-BSE_rozvodovyVentil))/10,0)
                                    end
                                    
                                    -- if BSE_tlakHP > 5 then
                                    --     BSE_rozvodovyVentilHystereze = 0
                                    -- end
                                    
                                    if math.abs(BSE_rozvodovyVentil) < 0.01 and math.abs(BSE_rozvodovyVentilTarget) < 0.01 then
                                        BSE_rozvodovyVentil = 0
                                    elseif BSE_rozvodovyVentil < BSE_rozvodovyVentilTarget-BSE_rozvodovyVentilHystereze then
                                        BSE_rozvodovyVentil = math.min(BSE_rozvodovyVentil + math.sqrt(math.abs(BSE_rozvodovyVentilTarget-BSE_rozvodovyVentil))*cas,1)
                                    elseif BSE_rozvodovyVentil > BSE_rozvodovyVentilTarget+BSE_rozvodovyVentilHystereze then
                                        BSE_rozvodovyVentil = math.max(BSE_rozvodovyVentil - math.sqrt(math.abs(BSE_rozvodovyVentilTarget-BSE_rozvodovyVentil))*cas,-1)
                                    end

                                    -- if obsazena and math.abs(Call("GetSpeed")) > 10 then
                                    --     ZpravaDebug("BSE_rozvodovyVentilTarget: "..BSE_rozvodovyVentilTarget..", BSE_rozvodovyVentil: "..BSE_rozvodovyVentil..", BSE_rozvodovyVentilHystereze: "..BSE_rozvodovyVentilHystereze)
                                    --     casTest = os.clock()
                                    --     while casTest - casProcesor < 0.1 do
                                    --         casTest = os.clock()
                                    --     end
                                    -- end

                                --rozvodovy ventil hlavniho potrubi - napousteni a vypousteni
                                    if zaklopkaPotrubi == 0 then
                                        if not BSE_YZ then
                                            -- if BSE_tlakHP > BSE_rozvodovyVentil then
                                            --     Call("SoundBrzdice:SetParameter", "MainPipeReleasing", 0)
                                            -- else
                                            --     Call("SoundBrzdice:SetParameter", "MainPipeReleasing", math.max(math.min(BSE_rozvodovyVentil, BSE_tlakHP),-1))
                                            -- end
                                            --Call("SoundBrzdice:SetParameter", "MainPipeFilling", math.max(math.min(BSE_rozvodovyVentil, math.abs(BSE_tlakHP - VirtualMainReservoirPressureBAR)),0))
                                            if cilovy_tlak_HP_po_zmene <= 0 then
                                                if BSE_rozvodovyVentil > 0 and BSE_tlakHP < VirtualMainReservoirPressureBAR then
                                                    BSE_tlakHP = BSE_tlakHP + math.abs(BSE_rozvodovyVentil*cas*math.max(BSE_tlakHP-VirtualMainReservoirPressureBAR,1)/(math.max(delkaVlaku, 150)/100))
                                                elseif BSE_rozvodovyVentil < 0 then
                                                    BSE_tlakHP = math.max(BSE_tlakHP - math.abs(BSE_rozvodovyVentil*cas/(math.max(delkaVlaku, 150)/100)),0)
                                                end
                                            end
                                        else
                                            --Call("SoundBrzdice:SetParameter", "MainPipeReleasing", 0)
                                            --Call("SoundBrzdice:SetParameter", "MainPipeFilling", 0)
                                        end
                                        Call("SoundBrzdice:SetParameter", "RB", 0)
                                    elseif zaklopkaPotrubi > 0 then
                                        --Call("SoundBrzdice:SetParameter", "MainPipeReleasing", 0)
                                        if not BSE_YZ then
                                            local prirustek_brzdeni = math.sqrt(math.abs(BSE_tlakHP-math.min(BSE_prepojovaciTlak/2.5, VirtualMainReservoirPressureBAR/5)))/(math.max(delkaVlaku*10, 150)/50)
                                            if BSE_tlakHP > math.min(BSE_prepojovaciTlak/2.5, VirtualMainReservoirPressureBAR/5) then
                                                BSE_tlakHP = BSE_tlakHP - prirustek_brzdeni * 15 * cas
                                            else
                                                BSE_tlakHP = BSE_tlakHP + prirustek_brzdeni * 15 * cas
                                            end
                                            if BSE_tlakHP > 0 then
                                                Call("SoundBrzdice:SetParameter", "RB", 1)
                                            else
                                                Call("SoundBrzdice:SetParameter", "RB", 0)
                                            end
                                            VirtualMainReservoirPressureBAR = VirtualMainReservoirPressureBAR - (BSE_rozvodovyVentilTarget/3)*cas
                                            Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                        else
                                            local prirustek_brzdeni = math.sqrt(BSE_tlakHP)/(math.max(delkaVlaku*10, 150)/50)
                                            if BSE_tlakHP > 0 then
                                                BSE_tlakHP = BSE_tlakHP - prirustek_brzdeni * 15 * cas
                                                Call("SoundBrzdice:SetParameter", "RB", 1)
                                            else
                                                BSE_tlakHP = 0
                                                Call("SoundBrzdice:SetParameter", "RB", 0)
                                            end
                                        end
                                        -- if not BSE_YZ then
                                        --     Call("SoundBrzdice:SetParameter", "MainPipeFilling", math.max(math.min(BSE_rozvodovyVentil, math.abs(BSE_tlakHP - VirtualMainReservoirPressureBAR)),0))
                                        -- else
                                        --     Call("SoundBrzdice:SetParameter", "MainPipeFilling", 0)
                                        -- end
                                    end

                                --ubytek v potrubi pri pripojeni vozu
                                    if BSE_tlakHP > cilovy_tlak_HP_po_zmene and cilovy_tlak_HP_po_zmene > 0 and BSE_tlakHP - cilovy_tlak_HP_po_zmene > math.sqrt(BSE_tlakHP-cilovy_tlak_HP_po_zmene)*cas*3 then
                                        BSE_tlakHP = BSE_tlakHP - math.sqrt(BSE_tlakHP-cilovy_tlak_HP_po_zmene)*cas*3
                                    else
                                        cilovy_tlak_HP_po_zmene = -1
                                    end
                                    
                                --zapis hodnot
                                    Call("SetControlValue","DEBUG_rozvodovyVentilTarget",0,BSE_rozvodovyVentilTarget)
                                    Call("SetControlValue","DEBUG_rozvodovyVentil",0,BSE_rozvodovyVentil)
                                    Call("SetControlValue","DEBUG_rozvodovyVentilHystereze",0,BSE_rozvodovyVentilHystereze)
                                    Call("SetControlValue","DEBUG_cilovyTlakPoZmene",0,cilovy_tlak_HP_po_zmene)
                                    Call("SetControlValue","VirtualBrakeControlSystemPressureBAR",0,BSE_ridiciTlak)
                                    Call("SetControlValue","VirtualBrakeSwitchingValvePressureBAR",0,BSE_prepojovaciTlak)
                                    Call("SetControlValue","VirtualBrakePipePressureBAR",0,BSE_tlakHP)
                                    Call("SetControlValue","VirtualBrakeDelayReservoirPressureBAR",0,BSE_casovaciVzduchojem)
                            ----------------------------------------DAKO BP-------------------------------------------
                                valcePrimocinneLast = valcePrimocinne
                                valcePrimocinne = math.min(Call("GetControlValue","VirtualEngineBrakeControl",0)*tlakValceMAX,VirtualMainReservoirPressureBAR)
                                if valcePrimocinne > valcePrimocinneLast+0.05 then
                                    Call("SoundBrzdice:SetParameter", "BP", 1)
                                else
                                    Call("SoundBrzdice:SetParameter", "BP", 0)
                                end
                            ----------------------------------------DAKO ROZVADEC-------------------------------------
                                VirtualLocoDistributorReservoirPressureBAR = Call("GetControlValue","VirtualLocoDistributorReservoirPressureBAR",0)
                                VirtualLocoDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0)
                                VirtualTrainDistributorReservoirPressureBAR = Call("GetControlValue","VirtualTrainDistributorReservoirPressureBAR",0)
                                VirtualTrainDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0)
                                tlakHP_vlak = Call("GetControlValue","VirtualTrainBrakePipePressureBAR",0)

                                VirtualLocoDistributorReservoirPressureBAR = VirtualLocoDistributorReservoirPressureBAR-(((VirtualLocoDistributorReservoirPressureBAR/500)^2)*5*cas)
                                VirtualTrainDistributorReservoirPressureBAR = VirtualTrainDistributorReservoirPressureBAR-(((VirtualTrainDistributorReservoirPressureBAR/500)^2)*5*cas)
                                if BSE_tlakHP < 3 then
                                    VirtualLocoDistributorControlReservoirPressureBAR = VirtualLocoDistributorControlReservoirPressureBAR-(((VirtualLocoDistributorControlReservoirPressureBAR/200)^2)*5*cas)
                                    VirtualTrainDistributorControlReservoirPressureBAR = VirtualTrainDistributorControlReservoirPressureBAR-(((VirtualTrainDistributorControlReservoirPressureBAR/200)^2)*5*cas)
                                end

                                --ROZVADEC LOKO - oddelene kvuli OL2
                                    --plneni zasobni jimky rozvadece
                                        if VirtualLocoDistributorReservoirPressureBAR < BSE_tlakHP then
                                            Call("SetControlValue","VirtualLocoDistributorReservoirPressureBAR",0,VirtualLocoDistributorReservoirPressureBAR+math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorReservoirPressureBAR))/100*15*cas)
                                            -- Call("SetControlValue","VirtualBrakePipePressureBAR",0,BSE_tlakHP-math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorReservoirPressureBAR))/100*15*cas)
                                            VirtualLocoDistributorReservoirPressureBAR = Call("GetControlValue","VirtualLocoDistributorReservoirPressureBAR",0)
                                            -- BSE_tlakHP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                        end

                                    --ridici jimka
                                        if VirtualLocoDistributorControlReservoirPressureBAR < BSE_tlakHP then
                                            if BSE_tlakHP > 5 then
                                                Call("SetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0,VirtualLocoDistributorControlReservoirPressureBAR+math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorControlReservoirPressureBAR))*0.005*cas)
                                            else
                                                Call("SetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0,VirtualLocoDistributorControlReservoirPressureBAR+math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorControlReservoirPressureBAR))*0.03*cas)
                                            end
                                            VirtualLocoDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0)
                                        elseif math.abs(VirtualLocoDistributorControlReservoirPressureBAR - BSE_tlakHP) < 0.05 then
                                            Call("SetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0,VirtualLocoDistributorControlReservoirPressureBAR-0.005*cas)
                                            VirtualLocoDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualLocoDistributorControlReservoirPressureBAR",0)
                                        end
                                    
                                    if math.abs(delkaVlaku - 16.73563*pocetLoko) > 1 then
                                        --plneni valcu
                                            cilovy_tlak_bv = math.min(math.max(VirtualLocoDistributorControlReservoirPressureBAR-BSE_tlakHP,0)*4.35,tlakValceMAX)
                                            rozdil_bv = math.max(math.abs(VirtualLocoDistributorControlReservoirPressureBAR-BSE_tlakHP),1)
                                            if cilovy_tlak_bv > VirtualDistributorLocoBrakeCylinderPressureBAR then
                                                VirtualDistributorLocoBrakeCylinderPressureBAR = math.min(VirtualDistributorLocoBrakeCylinderPressureBAR + 1.4*cas*rozdil_bv*math.min(math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR-VirtualLocoDistributorReservoirPressureBAR)),1),cilovy_tlak_bv)
                                            elseif cilovy_tlak_bv < VirtualDistributorLocoBrakeCylinderPressureBAR then
                                                VirtualDistributorLocoBrakeCylinderPressureBAR = math.max(VirtualDistributorLocoBrakeCylinderPressureBAR - 0.6*cas*rozdil_bv*math.sqrt(VirtualDistributorLocoBrakeCylinderPressureBAR),cilovy_tlak_bv)
                                            else
                                                -- Call("SoundBrzdice:SetParameter", "CylinderReleasing", 0)
                                                -- Call("SoundBrzdice:SetParameter", "CylinderFilling", 0)
                                            end
                                        
                                        --zplynuleni prechodu valcu
                                            if rezimBrzdeniLokoG then
                                                if VirtualDistributorLocoBrakeCylinderPressureBAR > plynuleValce then
                                                    plynuleValce = plynuleValce + math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR-plynuleValce))/20*6*cas
                                                elseif plynuleValce > VirtualDistributorLocoBrakeCylinderPressureBAR then
                                                    plynuleValce = plynuleValce - math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR-plynuleValce))/40*6*cas
                                                end
                                            else
                                                if VirtualDistributorLocoBrakeCylinderPressureBAR > plynuleValce then
                                                    plynuleValce = plynuleValce + math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR-plynuleValce))/20*30*cas
                                                elseif plynuleValce > VirtualDistributorLocoBrakeCylinderPressureBAR then
                                                    plynuleValce = plynuleValce - math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR-plynuleValce))/40*30*cas
                                                end
                                            end
                                    end
                                    
                                    --OL2
                                        --ridici jimka
                                            if not OL2 then
                                                if VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 < BSE_tlakHP then
                                                    if BSE_tlakHP > 5 then
                                                        VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 = VirtualLocoDistributorControlReservoirPressureBAR_zaOL2+math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorControlReservoirPressureBAR_zaOL2))*0.005*cas
                                                    else
                                                        VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 = VirtualLocoDistributorControlReservoirPressureBAR_zaOL2+math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorControlReservoirPressureBAR_zaOL2))*0.03*cas
                                                    end
                                                    -- Call("SetControlValue","VirtualBrakePipePressureBAR",0,BSE_tlakHP-math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorControlReservoirPressureBAR_zaOL2))/500*15*cas)
                                                    -- BSE_tlakHP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                                elseif math.abs(VirtualLocoDistributorControlReservoirPressureBAR - BSE_tlakHP) < 0.05 then
                                                    VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 = VirtualLocoDistributorControlReservoirPressureBAR_zaOL2-0.005*cas
                                                end
                                            elseif VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 > BSE_tlakHP and VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 > 3.5 then
                                                VirtualLocoDistributorControlReservoirPressureBAR_zaOL2 = VirtualLocoDistributorControlReservoirPressureBAR_zaOL2-math.sqrt(math.abs(BSE_tlakHP - VirtualLocoDistributorControlReservoirPressureBAR_zaOL2))*0.5*cas
                                                VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 = 0
                                                Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValce_zaOL2)
                                            end

                                        --plneni valcu za OL2
                                            cilovy_tlak_bv = math.min(math.max(VirtualLocoDistributorControlReservoirPressureBAR_zaOL2-BSE_tlakHP,0)*4.35,tlakValceMAX)
                                            rozdil_bv = math.max(math.abs(VirtualLocoDistributorControlReservoirPressureBAR_zaOL2-BSE_tlakHP),1)
                                            if BSE_tlakHP < 3.5 then
                                                cilovy_tlak_bv = math.min(math.max(VirtualLocoDistributorControlReservoirPressureBAR-BSE_tlakHP,0)*4.35,tlakValceMAX)
                                                rozdil_bv = math.max(math.abs(VirtualLocoDistributorControlReservoirPressureBAR-BSE_tlakHP),1)
                                            end
                                            if cilovy_tlak_bv > VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 then
                                                VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 = math.min(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 + 1.4*cas*rozdil_bv*math.min(math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2-VirtualLocoDistributorReservoirPressureBAR)),1),cilovy_tlak_bv)
                                                Call("SetControlValue","VirtualLocoDistributorReservoirPressureBAR",0,VirtualLocoDistributorReservoirPressureBAR-math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 - VirtualLocoDistributorReservoirPressureBAR))/500*15*cas*rozdil_bv)
                                                VirtualLocoDistributorReservoirPressureBAR = Call("GetControlValue","VirtualLocoDistributorReservoirPressureBAR",0)
                                            elseif cilovy_tlak_bv < VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 then
                                                VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 = math.max(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 - 0.6*cas*rozdil_bv*math.sqrt(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2),cilovy_tlak_bv)
                                            else
                                            end
                                        
                                        --zplynuleni prechodu valcu za OL2
                                            plynuleValce_zaOL2 = Call("GetControlValue","VirtualTrainBrakeCylinderPressureBAR",0)
                                            if (not OL2 or BSE_tlakHP < 3.5) and not EDB_Y109 then
                                                if rezimBrzdeniLokoG then
                                                    if VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 > plynuleValce_zaOL2 then
                                                        plynuleValce_zaOL2 = plynuleValce_zaOL2 + math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2-plynuleValce_zaOL2))/20*6*cas
                                                    elseif plynuleValce_zaOL2 > VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 then
                                                        plynuleValce_zaOL2 = plynuleValce_zaOL2 - math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2-plynuleValce_zaOL2))/40*6*cas
                                                    end
                                                else
                                                    if VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 > plynuleValce_zaOL2 then
                                                        plynuleValce_zaOL2 = plynuleValce_zaOL2 + math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2-plynuleValce_zaOL2))/20*30*cas
                                                    elseif plynuleValce_zaOL2 > VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2 then
                                                        plynuleValce_zaOL2 = plynuleValce_zaOL2 - math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2-plynuleValce_zaOL2))/40*30*cas
                                                    end
                                                end
                                            else
                                                plynuleValce_zaOL2 = plynuleValce_zaOL2 - math.sqrt(math.abs(VirtualDistributorLocoBrakeCylinderPressureBAR_zaOL2-plynuleValce_zaOL2))/40*30*cas
                                            end
                                            Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR",0,plynuleValce_zaOL2)
                                
                                if math.abs(delkaVlaku - 16.73563*pocetLoko) > 1 then --ROZVADEC VOZY - bez vazby do OL2
                                    if BSE_tlakHP > tlakHP_vlak then
                                        tlakHP_vlak = math.min(tlakHP_vlak + math.min(1/math.max((delkaVlaku-100)/10,2),0.5)*cas*math.sqrt(BSE_tlakHP-tlakHP_vlak), BSE_tlakHP)
                                    else
                                        tlakHP_vlak = math.max(tlakHP_vlak - math.min(1/math.max((delkaVlaku-100)/10,2),0.5)*cas*math.sqrt(tlakHP_vlak-BSE_tlakHP), BSE_tlakHP)
                                    end
                                    
                                    --plneni potrubi - ubytek tlaku z hlavni jimky
                                    if (tlakHP_vlak > BSE_tlakHPlast+0.01*cas or tlakHP_vlak+0.05 < BSE_tlakHP) and VirtualMainReservoirPressureBAR > tlakHP_vlak and not BSE_YZ and soupatkoVZ then
                                        ubytek = (tlakHP_vlak - BSE_tlakHPlast)*delkaVlaku/(6*pocetLoko)
                                        if ubytek > 0.005 then
                                            BSE_zvysenyPrutok = true
                                        elseif ubytek < 0.001 then
                                            BSE_zvysenyPrutok = false
                                        end
                                        VirtualMainReservoirPressureBAR = VirtualMainReservoirPressureBAR - ubytek*cas
                                        Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                    else
                                        BSE_zvysenyPrutok = false
                                    end
                                    BSE_tlakHPlast = tlakHP_vlak

                                    --plneni zasobni jimky rozvadece
                                        if VirtualTrainDistributorReservoirPressureBAR < tlakHP_vlak then
                                            Call("SetControlValue","VirtualTrainDistributorReservoirPressureBAR",0,VirtualTrainDistributorReservoirPressureBAR+math.sqrt(math.abs(tlakHP_vlak - VirtualTrainDistributorReservoirPressureBAR))/100*15*cas)
                                            -- Call("SetControlValue","VirtualBrakePipePressureBAR",0,BSE_tlakHP-math.sqrt(math.abs(tlakHP_vlak - VirtualTrainDistributorReservoirPressureBAR))/100*(delkaVlaku/100+10)*cas)
                                            VirtualTrainDistributorReservoirPressureBAR = Call("GetControlValue","VirtualTrainDistributorReservoirPressureBAR",0)
                                            -- BSE_tlakHP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                        end

                                    --ridici jimka
                                        if VirtualTrainDistributorControlReservoirPressureBAR < tlakHP_vlak then
                                            if tlakHP_vlak > 5 then
                                                Call("SetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0,VirtualTrainDistributorControlReservoirPressureBAR+math.sqrt(math.abs(tlakHP_vlak - VirtualTrainDistributorControlReservoirPressureBAR))*0.005*cas)
                                            else
                                                Call("SetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0,VirtualTrainDistributorControlReservoirPressureBAR+math.sqrt(math.abs(tlakHP_vlak - VirtualTrainDistributorControlReservoirPressureBAR))*0.005*cas)
                                            end
                                            -- Call("SetControlValue","VirtualBrakePipePressureBAR",0,BSE_tlakHP-math.sqrt(math.abs(tlakHP_vlak - VirtualTrainDistributorControlReservoirPressureBAR))/500*(delkaVlaku/100+10)*cas)
                                            VirtualTrainDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0)
                                            -- BSE_tlakHP = Call("GetControlValue","VirtualBrakePipePressureBAR",0)
                                        elseif math.abs(VirtualTrainDistributorControlReservoirPressureBAR - tlakHP_vlak) < 0.05 then
                                            Call("SetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0,VirtualTrainDistributorControlReservoirPressureBAR-0.005*cas)
                                            VirtualTrainDistributorControlReservoirPressureBAR = Call("GetControlValue","VirtualTrainDistributorControlReservoirPressureBAR",0)
                                        end

                                    --plneni valcu
                                        cilovy_tlak_bv_vlak = math.min(math.max(VirtualTrainDistributorControlReservoirPressureBAR-tlakHP_vlak,0)*2.53,3.8)
                                        rozdil_bv_vlak = math.max(math.abs(VirtualTrainDistributorControlReservoirPressureBAR-tlakHP_vlak),1)
                                        if cilovy_tlak_bv_vlak > VirtualDistributorTrainBrakeCylinderPressureBAR then
                                            VirtualDistributorTrainBrakeCylinderPressureBAR = math.min(VirtualDistributorTrainBrakeCylinderPressureBAR + 0.7*cas*rozdil_bv_vlak*math.min(math.sqrt(math.abs(VirtualDistributorTrainBrakeCylinderPressureBAR-VirtualTrainDistributorReservoirPressureBAR)),1),cilovy_tlak_bv_vlak)
                                            Call("SetControlValue","VirtualTrainDistributorReservoirPressureBAR",0,VirtualTrainDistributorReservoirPressureBAR-math.sqrt(math.abs(VirtualDistributorTrainBrakeCylinderPressureBAR - VirtualTrainDistributorReservoirPressureBAR))/500*15*cas*rozdil_bv_vlak)
                                            VirtualTrainDistributorReservoirPressureBAR = Call("GetControlValue","VirtualTrainDistributorReservoirPressureBAR",0)
                                            -- Call("SoundBrzdice:SetParameter", "CylinderFilling", rozdil_bv_vlak)
                                            -- Call("SoundBrzdice:SetParameter", "CylinderReleasing", 0)
                                        elseif cilovy_tlak_bv_vlak < VirtualDistributorTrainBrakeCylinderPressureBAR then
                                            VirtualDistributorTrainBrakeCylinderPressureBAR = math.max(VirtualDistributorTrainBrakeCylinderPressureBAR - 0.3*cas*rozdil_bv_vlak*math.sqrt(VirtualDistributorTrainBrakeCylinderPressureBAR),cilovy_tlak_bv_vlak)
                                            -- Call("SoundBrzdice:SetParameter", "CylinderReleasing", rozdil_bv_vlak)
                                            -- Call("SoundBrzdice:SetParameter", "CylinderFilling", 0)
                                        else
                                            -- Call("SoundBrzdice:SetParameter", "CylinderReleasing", 0)
                                            -- Call("SoundBrzdice:SetParameter", "CylinderFilling", 0)
                                        end
                                    
                                    --zplynuleni prechodu valcu
                                        plynuleValce_vlak = Call("GetControlValue","VirtualTrainBrakeCylinderPressureBAR_train",0)
                                        if rezimBrzdeniVlakG then
                                            if VirtualDistributorTrainBrakeCylinderPressureBAR > plynuleValce_vlak then
                                                plynuleValce_vlak = plynuleValce_vlak + math.sqrt(math.abs(VirtualDistributorTrainBrakeCylinderPressureBAR-plynuleValce_vlak))/20*3*cas
                                            elseif plynuleValce_vlak > VirtualDistributorTrainBrakeCylinderPressureBAR then
                                                plynuleValce_vlak = plynuleValce_vlak - math.sqrt(math.abs(VirtualDistributorTrainBrakeCylinderPressureBAR-plynuleValce_vlak))/40*3*cas
                                            end
                                        else
                                            if VirtualDistributorTrainBrakeCylinderPressureBAR > plynuleValce_vlak then
                                                plynuleValce_vlak = plynuleValce_vlak + math.sqrt(math.abs(VirtualDistributorTrainBrakeCylinderPressureBAR-plynuleValce_vlak))/20*15*cas
                                            elseif plynuleValce_vlak > VirtualDistributorTrainBrakeCylinderPressureBAR then
                                                plynuleValce_vlak = plynuleValce_vlak - math.sqrt(math.abs(VirtualDistributorTrainBrakeCylinderPressureBAR-plynuleValce_vlak))/40*15*cas
                                            end
                                        end
                                        Call("SetControlValue","VirtualTrainBrakeCylinderPressureBAR_train",0,plynuleValce_vlak)
                                        Call("SetControlValue","VirtualTrainBrakePipePressureBAR",0,tlakHP_vlak)
                                end

                                --vypocet vracene hodnoty TBC
                                    max_tbc = (-math.log(0.18*absolutniRychlost+20)+4)/2 + (-math.log(0.18*absolutniRychlost+20)+4)/2
                                    if math.abs(delkaVlaku - 16.73563*pocetLoko) < 1 then
                                        cilovaTBC = math.max(max_tbc*math.min(plynuleValce_zaOL2/tlakValceMAX,1),0)
                                    else
                                        cilovaTBC = math.max(max_tbc*math.min(plynuleValce_zaOL2/tlakValceMAX,1),0)*(16.73563*math.min(pocetLoko,2)/delkaVlaku)+math.max(max_tbc*(math.min(plynuleValce_vlak/3.8,1)+math.min(plynuleValce/tlakValceMAX,1))/2,0)*(1-(16.73563*math.min(pocetLoko,2)/delkaVlaku))
                                    end

                                    if cilovaTBC > idealTBC then
                                        idealTBC = idealTBC + math.sqrt(math.abs(cilovaTBC-idealTBC))/20*15*cas
                                    elseif idealTBC > cilovaTBC then
                                        idealTBC = idealTBC - math.sqrt(math.abs(cilovaTBC-idealTBC))/40*15*cas
                                    end
                            ----------------------------------------Brzdove valce primocinne--------------------------
                                if valcePrimocinne > plynuleValce_primocinne then
                                    if valcePrimocinne - plynuleValce_primocinne > 0.1 then
                                        VirtualMainReservoirPressureBAR = VirtualMainReservoirPressureBAR - 0.05*cas
                                    end
                                    plynuleValce_primocinne = plynuleValce_primocinne + math.sqrt(math.abs(valcePrimocinne-plynuleValce_primocinne))/20*15*cas
                                elseif plynuleValce_primocinne > valcePrimocinne then
                                    plynuleValce_primocinne = plynuleValce_primocinne - math.sqrt(math.abs(valcePrimocinne-plynuleValce_primocinne))/40*15*cas
                                end
                                Call("SetControlValue","VirtualLocoBrakeCylinderPressureBAR",0,plynuleValce_primocinne)
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR)
                                rychlostniKoeficientBrzd = math.max(math.min(absolutniRychlost,1)*100,1)
                                Call("SetControlValue", "EngineBrakeControl", 0, plynuleValce_primocinne/tlakValceMAX)
                            ----------------------------------------Rucni brzda---------------------------------------
                                Call("SetControlValue", "HandBrake", 0, math.max(Call("GetControlValue", "VirtualHandBrake", 0)/rychlostniKoeficientBrzd, plynuleValce_primocinne/(rychlostniKoeficientBrzd*tlakValceMAX)))
                            ----------------------------------------Manometry-----------------------------------------
                                manometrHP = Call("GetControlValue", "ManometrHP", 0)
                                if BSE_RB then
                                    local prirustek_brzdeni = math.sqrt(math.abs(manometrHP-math.min(BSE_tlakHP/2.5, VirtualMainReservoirPressureBAR/5)))
                                    if manometrHP > math.min(BSE_tlakHP/2.5, VirtualMainReservoirPressureBAR/5) then
                                        manometrHP = math.min(math.max(manometrHP - prirustek_brzdeni * 15 * cas,math.min(BSE_tlakHP/2.5, VirtualMainReservoirPressureBAR/5)), manometrHP)
                                    else
                                        manometrHP = math.max(math.min(manometrHP + prirustek_brzdeni * 15 * cas,math.min(BSE_tlakHP/2.5, VirtualMainReservoirPressureBAR/5)), manometrHP)
                                    end
                                elseif not BSE_YZ then
                                    --*-*-*-*-*-*-*-NAVOLENY TLAK NEEXISTUJE!!!
                                    if BSE_YS then
                                        manometrPlniciTlak = VirtualMainReservoirPressureBAR
                                    else
                                        manometrPlniciTlak = BSE_prepojovaciTlak+BSE_casovaciVzduchojem/11
                                    end
                                    if (math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)-(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)-math.min(manometrPlniciTlak,VirtualMainReservoirPressureBAR))*0.3 < manometrHP-0.005) then
                                        local prirustek_brzdeni = math.sqrt(math.abs(manometrHP-(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)-(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)-math.min(manometrPlniciTlak,VirtualMainReservoirPressureBAR))*0.3)))
                                        manometrHP = math.max(manometrHP - prirustek_brzdeni * 3 * cas,(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)-(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)-math.min(manometrPlniciTlak,VirtualMainReservoirPressureBAR))*0.3))
                                    elseif (math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)+(math.min(manometrPlniciTlak,VirtualMainReservoirPressureBAR)-math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR))*0.3 > manometrHP+0.005) then
                                        local prirustek_brzdeni = math.sqrt(math.abs(manometrHP-(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)+(math.min(manometrPlniciTlak,VirtualMainReservoirPressureBAR)-math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR))*0.3)))
                                        manometrHP = math.min(manometrHP + prirustek_brzdeni * 3 * cas,(math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR)+(math.min(manometrPlniciTlak,VirtualMainReservoirPressureBAR)-math.min(BSE_tlakHP,VirtualMainReservoirPressureBAR))*0.3))
                                    end
                                else
                                    if (BSE_tlakHP < manometrHP-0.05) then
                                        manometrHP = manometrHP - math.sqrt(manometrHP-BSE_tlakHP) * 3 * cas
                                    elseif (BSE_tlakHP > manometrHP+0.05) then
                                        manometrHP = manometrHP + math.sqrt(BSE_tlakHP-manometrHP) * 3 * cas
                                    end
                                end
                                Call("SetControlValue", "ManometrHP", 0, manometrHP)

                                manometrBV = Call("GetControlValue", "ManometrBV", 0)
                                plynuleValceSoucet = math.max(plynuleValce_zaOL2, plynuleValce_primocinne)
                                if (manometrBV < 0.5 and plynuleValceSoucet > 0.5) then
                                    naskokManometruBV = true
                                elseif (plynuleValceSoucet < 0.5 or manometrBV >= 0.5) then
                                    naskokManometruBV = false
                                end
                                if ((manometrBV < plynuleValceSoucet and manometrBV >= 0.5) or naskokManometruBV) then
                                    if (naskokManometruBV) then
                                        if (manometrBV < 0.5) then
                                            manometrBV = math.min(manometrBV + math.sqrt(0.5-manometrBV)*cas*5,0.5)
                                        end
                                    else
                                        manometrBV = math.min(manometrBV + math.sqrt(plynuleValceSoucet-manometrBV)*cas,plynuleValceSoucet)
                                    end
                                elseif (manometrBV > plynuleValceSoucet) then
                                    manometrBV = math.max(manometrBV - math.sqrt(manometrBV-plynuleValceSoucet)*cas,plynuleValceSoucet)
                                end
                                Call("SetControlValue", "ManometrBV", 0, manometrBV)

                                manometrHJ = Call("GetControlValue", "ManometrHJ", 0)
                                if ((zaklopkaPotrubi > 0 and not (BSE_YZ or soupatkoVZ)) or MIRER.odkalovaniJimek) then
                                    ubytekHJ = true
                                    if (manometrHJ < VirtualMainReservoirPressureBAR-math.abs(BSE_tlakHP-VirtualMainReservoirPressureBAR)/10) then
                                        manometrHJ = math.min(manometrHJ + math.sqrt((VirtualMainReservoirPressureBAR-math.abs(BSE_tlakHP-VirtualMainReservoirPressureBAR)/10)-manometrHJ)*cas*15,VirtualMainReservoirPressureBAR-math.abs(BSE_tlakHP-VirtualMainReservoirPressureBAR)/10)
                                    else
                                        manometrHJ = math.max(manometrHJ - math.sqrt(manometrHJ-(VirtualMainReservoirPressureBAR-math.abs(BSE_tlakHP-VirtualMainReservoirPressureBAR)/10))*cas*15,VirtualMainReservoirPressureBAR-math.abs(BSE_tlakHP-VirtualMainReservoirPressureBAR)/10)
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
                                if K83 then
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
                                Call("SetControlValue","VirtualMainReservoirPressureBAR",0,VirtualMainReservoirPressureBAR-(((VirtualMainReservoirPressureBAR/500)^2)*5*cas))
                                jimkaPK = jimkaPK-(((jimkaPK/790)^2)*10*cas)
                                jimkaPK = math.min(math.max(jimkaPK,VirtualMainReservoirPressureBAR),4.3)

                                if VirtualMainReservoirPressureBAR > horniMezKompresoru then
                                    S501 = true
                                elseif VirtualMainReservoirPressureBAR < dolniMezKompresoru then
                                    S501 = false
                                end
                                if jimkaPK >= 4.3 then
                                    S502 = true
                                elseif jimkaPK < 2.5 then
                                    S502 = false
                                end
                                if K131 then
                                    jimkaPK=jimkaPK+0.1*cas
                                end
                                kompresoryNaVlaku = Call("GetControlValue", "kompresoryNaVlaku", 0)
                                if kompresoryNaVlaku ~= kompresoryNaVlakuLast then
                                    pocetKompresoru = CountIDs(kompresoryNaVlaku)
                                    kompresoryNaVlakuLast = kompresoryNaVlaku
                                end
                                if pocetKompresoru > 0 and not pojistovaciVentilHJ then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)+(0.0725*cas*pocetKompresoru/pocetLoko))
                                end
                                VirtualMainReservoirPressureBAR = Call("GetControlValue","VirtualMainReservoirPressureBAR",0)
                                if VirtualMainReservoirPressureBAR > 10.5 then
                                    pojistovaciVentilHJ = true
                                end
                                if pojistovaciVentilHJ then
                                    if VirtualMainReservoirPressureBAR >= horniMezKompresoru - 0.5 then
                                        Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)-1*cas)
                                    else
                                        pojistovaciVentilHJ = false
                                    end
                                end

                                if MIRER.odkalovaniJimek then
                                    Call("SetControlValue","VirtualMainReservoirPressureBAR",0,Call("GetControlValue","VirtualMainReservoirPressureBAR",0)-0.2*cas)
                                end

                                edbPrevodnikZRozvadece = math.min((VirtualLocoDistributorControlReservoirPressureBAR-BSE_tlakHP)*2.53,3.8,VirtualMainReservoirPressureBAR)
                                S103C = Call("GetControlValue", "VirtualDynamicBrake", 0)
                                if S103C > 0.5 and S103Clast < 0.5 then
                                    if zaMasinouDvojicka then
                                        Call("SendConsistMessage", 131007, 1, 1)
                                    end
                                    S103Clast = S103C
                                elseif S103C < -0.5 and S103Clast > -0.5 then
                                    if zaMasinouDvojicka then
                                        Call("SendConsistMessage", 131007, -1, 1)
                                    end
                                    S103Clast = S103C
                                elseif S103C < 0.5 and S103C > -0.5 and (S103Clast > 0.5 or S103Clast < -0.5) then
                                    if zaMasinouDvojicka then
                                        Call("SendConsistMessage", 131007, 0, 1)
                                    end
                                    S103Clast = S103C
                                end
                                if (S103C < -0.5 or edbPrevodnikKoncova == -1) and edbPrevodnikRucne < 3.8 and edbPrevodnikRucne < VirtualMainReservoirPressureBAR then
                                    edbPrevodnikRucne = edbPrevodnikRucne + math.sqrt(10-edbPrevodnikRucne)*cas*0.3
                                elseif (S103C > 0.5 or edbPrevodnikKoncova == 1) and edbPrevodnikRucne > 0 then
                                    edbPrevodnikRucne = edbPrevodnikRucne - math.sqrt(edbPrevodnikRucne)*cas*0.3
                                end
                                edbPrevodnik = math.max(edbPrevodnikZRozvadece, edbPrevodnikRucne)
                                Call("SetControlValue", "prevodnikEDB", 0, edbPrevodnik)
                                Call("SetControlValue", "ManometrPrevodnik", 0, edbPrevodnik)

                                Call("SetControlValue","JimkaPK",0,jimkaPK)
                        --MIRER
                            F192 = Call("GetControlValue", "F192", 0) > 0.9
                            F101 = Call("GetControlValue", "F101", 0) > 0.9
                            
                            --smer
                                S103A = Call("GetControlValue", "UserVirtualReverser", 0)
                                smer = Call("GetControlValue", "Reverser", 0)
                                if HK0 and (vedouci or jednotlive) and F101 and baterie then
                                    MIRER.blokovaniSmeru = true
                                else
                                    MIRER.blokovaniSmeru = false
                                end
                                K165_bezPrenosu = (baterie and F121 and (vedouci or jednotlive) and not K166 and K165) or ((MIRER.blokovaniSmeru or (X202cizi[47] and (poruchaVedouci or koncova))) and S103A > 0.5 and HK0)
                                K165 = K165_bezPrenosu or X202cizi[36]
                                Y112 = K165
                                diag28 = K165
                                K166_bezPrenosu = (baterie and F121 and (vedouci or jednotlive) and not K165 and K166) or ((MIRER.blokovaniSmeru or (X202cizi[47] and (poruchaVedouci or koncova))) and S103A < -0.5 and HK0)
                                K166 = K166_bezPrenosu or X202cizi[37]
                                Y113 = K166
                                diag29 = K166
                                if EDB_ULS or hlavniKontroler < 0 then
                                    Y112 = K166
                                    diag28 = K166
                                    Y113 = K165
                                    diag29 = K165
                                end
                                Call("SetControlValue", "diag28", 0, toInt(diag28))
                                Call("SetControlValue", "diag29", 0, toInt(diag29))
                                if jimkaPK > 2 then
                                    if Y112 then
                                        Call("SetControlValue", "Reverser", 0, math.min(smer+cas,1))
                                    elseif Y113 then
                                        Call("SetControlValue", "Reverser", 0, math.max(smer-cas,-1))
                                    end
                                end
                                diag30 = math.abs(smer) > 0.9 and F101 and baterie
                                Call("SetControlValue", "diag30", 0, toInt(diag30))

                                X202vlastni[36] = K165_bezPrenosu
                                X202vlastni[37] = K166_bezPrenosu
                                X202vlastni[47] = ((baterie and F121 and (vedouci or jednotlive) and ((not K166 and K165 and S103A > 0.5) or (not K165 and K166 and S103A < -0.5))) or MIRER.blokovaniSmeru) and (poruchaVedouci or koncova)

                            vykonovaPaka = Call("GetControlValue", "dummyVirtualThrottle", 0)*toInt(F101)
                            tlacPlusLast = tlacPlus
                            tlacPlus = Call("GetControlValue", "kontrolerPlus", 0) > 0.5
                            tlacMinusLast = tlacMinus
                            tlacMinus = Call("GetControlValue", "kontrolerMinus", 0) > 0.5

                            EDB_CHOD = false
                            EDB_Y109 = false
                            EDB_ULS = false
                            EDB_LSO = false
                            
                            VpPlus = Call("GetControlValue", "Vpplus", 0) > 0.5
                            VpMinus = Call("GetControlValue", "Vpminus", 0) > 0.5

                            napetiMIRERlast = napetiMIRER
                            napetiMIRER = baterie and F192
                            if napetiMIRER ~= napetiMIRERlast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131021,toInt(napetiMIRER),1)
                                end
                                napetiMIRERlast = napetiMIRER
                            end

                            if napetiMIRER then
                                --HK
                                    casOdSynchronizace = casProcesor - zpozdeniSynchronizaceHKcas
                                    
                                    if K02 then
                                        edbCas = casProcesor
                                    end
                                    if (edbPrevodnik > citlivostEDB or Call("GetControlValue", "DynamicBrake", 0) > 0) and not MIRER.stavy["EDB vypnuta"].vedouci and not MIRER.stavy["EDB vypnuta"].koncova then
                                        trvalyMinus = true
                                        EDB_ULS = ((vedouci and S101koncova == S101_KONCOVA) or (koncova and S101koncova == S101_VEDOUCI)) and Q01 and Q01koncova and hlavniKontroler <= 0 and stupenHKKoncova <= 0 and not MIRER.stavy["EDB vypnuta"].vedouci and not MIRER.stavy["EDB vypnuta"].koncova and napetiMIRERkoncova
                                        hlavniKontrolerPozadovany = -toInt(EDB_ULS)
                                        hlavniKontrolerZadniPozadovany = hlavniKontrolerPozadovany
                                        hlavniKontrolerZadniPozadovanyLast = hlavniKontrolerPozadovany
                                        output_kN_TM1 = 0
                                        output_kN_TM2 = 0
                                        absolutnikN = 0
                                        proudTM1 = 0
                                        proudTM2 = 0
                                        if EDB_ULS and stupenHK == -1 and rychlostKolaKMHPodvozek1 > 34 and rychlostKolaKMHPodvozek2 > 34 and casProcesor - edbCas < 180 and diag30 then
                                            if casProcesor - EDB_LSO_delay > EDB_LSO_trigger then
                                                EDB_LSO = true
                                            else
                                                EDB_LSO = false
                                            end
                                            output_kN_TM1 = -1
                                            output_kN_TM2 = -1
                                            absolutnikN = -1
                                            proudTM1 = rychlostKolaKMHPodvozek1/3+10
                                            proudTM2 = rychlostKolaKMHPodvozek2/3+10
                                        else
                                            EDB_LSO = false
                                            EDB_LSO_delay = casProcesor
                                        end
                                        if EDB_LSO and EDB_LSOkoncova then
                                            output_kN_TM1 = -math.max(0, math.min(edbPrevodnik/3.8*125,(rychlostKolaKMHPodvozek1-20)*150))*math.min(1,(75/rychlostKolaKMHPodvozek1)*0.75+0.16)/2
                                            output_kN_TM2 = -math.max(0, math.min(edbPrevodnik/3.8*125,(rychlostKolaKMHPodvozek2-20)*150))*math.min(1,(75/rychlostKolaKMHPodvozek2)*0.75+0.16)/2
                                            proudTM1 = math.min(edbPrevodnik/3.8*250+200, 3.57*rychlostKolaKMHPodvozek1+182)
                                            proudTM2 = math.min(edbPrevodnik/3.8*250+200, 3.57*rychlostKolaKMHPodvozek2+182)
                                            absolutnikN = -math.max(0, math.min(edbPrevodnik/3.8*125,(absolutniRychlostKMH-20)*150))*math.min(1,(75/absolutniRychlostKMH)*0.75+0.16)/2
                                            if output_kN_TM1 < -1 and output_kN_TM2 < -1 then
                                                EDB_CHOD = true
                                            end
                                            if proudTM1 > 125 then
                                                EDB_Y109 = true
                                            end
                                        end
                                    elseif not obsazenaSousedni and not obsazenaVeHre and aktivniPostrk then
                                        if Q01 and K02 then
                                            hlavniKontrolerPozadovany = hlavniKontrolerPK
                                        else
                                            hlavniKontrolerPozadovany = 0
                                        end
                                        trvalyMinus = false
                                        aktivniPostrkLast = true
                                        if rychlostKMH > 2 and vedouci and not zamcenySmer then
                                            Call("SetControlValue", "UserVirtualReverser", 0, 1)
                                        elseif rychlostKMH < -2 then
                                            Call("SetControlValue", "UserVirtualReverser", 0, -1)
                                        end
                                    else
                                        if aktivniPostrkLast then
                                            hlavniKontrolerPozadovany = 0
                                            aktivniPostrkLast = false
                                        end
                                        hlavniKontrolerPK = hlavniKontrolerPozadovany
                                        if hlavniKontrolerPK ~= hlavniKontrolerPKLast then
                                            if predMasinou == 1 then
                                                Call("SendConsistMessage", 131988, hlavniKontrolerPK, 0)
                                            end
                                            if zaMasinou == 1 then
                                                Call("SendConsistMessage", 131988, hlavniKontrolerPK, 1)
                                            end
                                            hlavniKontrolerPKLast = hlavniKontrolerPK
                                        end
                                        if S101vlastni == S101_VEDOUCI or poruchaVedouci then
                                            trvalyMinus = false
                                            if vykonovaPaka < -0.75 or tlacMinus then -- and not tlacMinusLast)
                                                --if jimkaPK > 2 then --(hlavniKontroler > 0 or poruchaVedouci) and 
                                                    trvalyMinus = true
                                                --end
                                            elseif (vykonovaPaka < -0.25 and vykonovaPakaLast > -0.25) or (MIRER.poruchy["V-LTS-510 A"] and MIRER.poruchy["K-LTS-510 A"]) then
                                                if hlavniKontrolerPozadovany > 0 and not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and math.abs(hlavniKontrolerZadniPozadovany - stupenHKKoncova*0.022) < 0.011 and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.011 and (math.abs(hlavniKontrolerPozadovany - hlavniKontrolerZadniPozadovany) < 0.011 or (math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 1 and hlavniKontrolerPozadovany > 0.572) or (math.min(MIRER.navolenyRezim, MIRER.vynucenyRezim, MIRER.vynucenyRezimKoncova) == 0)) and napetiMIRERkoncova then
                                                    hlavniKontrolerPozadovany = hlavniKontrolerPozadovany - 0.022
                                                    zpozdeniSynchronizaceHKcas = casProcesor
                                                end
                                            elseif smer ~= 0 and vykonovaPaka > 0.75 then
                                                if hlavniKontrolerPozadovany < 0.88 and not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and ((math.abs(hlavniKontrolerZadniPozadovany - stupenHKKoncova*0.022) < 0.011 and stupenHKKoncova >= 0) or (math.abs(hlavniKontrolerZadniPozadovany - stupenHKKoncova) < 0.011 and stupenHKKoncova <= 0) or ((math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 1 and stupenHKKoncova > 26) or math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 0)) and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.011 and (math.abs(hlavniKontrolerPozadovany - hlavniKontrolerZadniPozadovany) < 0.011 or (math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 1 and hlavniKontrolerPozadovany > 0.572) or math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 0) and (MIRER.parael or hlavniKontrolerPozadovany < 0.572) and not (MIRER.poruchy["V-LTS-410 A"] and MIRER.poruchy["K-LTS-410 A"]) and not MIRER.blokovaniVykonu and napetiMIRERkoncova then
                                                    hlavniKontrolerPozadovany = math.max(hlavniKontrolerPozadovany + 0.022,0)
                                                    zpozdeniSynchronizaceHKcas = casProcesor
                                                end
                                            elseif smer ~= 0 and ((vykonovaPaka > 0.25 and vykonovaPakaLast < 0.25) or (tlacPlus and not tlacPlusLast)) then
                                                if hlavniKontrolerPozadovany < 0.99 and not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and ((math.abs(hlavniKontrolerZadniPozadovany - stupenHKKoncova*0.022) < 0.011 and stupenHKKoncova >= 0) or (math.abs(hlavniKontrolerZadniPozadovany - stupenHKKoncova) < 0.011 and stupenHKKoncova <= 0) or ((math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 1 and stupenHKKoncova > 26) or math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 0)) and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.011 and (math.abs(hlavniKontrolerPozadovany - hlavniKontrolerZadniPozadovany) < 0.011 or (math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 1 and hlavniKontrolerPozadovany > 0.572) or math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 0) and not (MIRER.poruchy["V-LTS-410 A"] and MIRER.poruchy["K-LTS-410 A"]) and not MIRER.blokovaniVykonu and napetiMIRERkoncova then
                                                    hlavniKontrolerPozadovany = math.max(hlavniKontrolerPozadovany + 0.022,0)
                                                    zpozdeniSynchronizaceHKcas = casProcesor
                                                end
                                            end

                                            if trvalyMinus ~= trvalyMinusLast then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage",131009,tostring(toInt(trvalyMinus)),1)
                                                end
                                                trvalyMinusLast = trvalyMinus
                                            end
            
                                            casOdSynchronizace = casProcesor - zpozdeniSynchronizaceHKcas
                                            if casOdSynchronizace > zpozdeniSynchronizaceHK or trvalyMinus then
                                                hlavniKontrolerZadniPozadovany = hlavniKontrolerPozadovany
                                            end
                                            if MIRER.vynucenyRezim == 1 then
                                                hlavniKontrolerPozadovany = 0.572
                                            elseif MIRER.vynucenyRezim == 0 then
                                                hlavniKontrolerPozadovany = 0
                                            end
                                            if math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 2 and MIRER.navolenyRezimLast ~= 2 then
                                                hlavniKontrolerZadniPozadovany = hlavniKontrolerPozadovany
                                            elseif math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 1 then
                                                if MIRER.navolenyRezimLast ~= 1 then
                                                    hlavniKontrolerZadniPozadovany = hlavniKontrolerPozadovany
                                                end
                                                hlavniKontrolerZadniPozadovany = math.min(hlavniKontrolerZadniPozadovany,0.572)
                                            elseif math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova) == 0 then
                                                hlavniKontrolerZadniPozadovany = 0
                                            end
                                            MIRER.navolenyRezimLast = math.min(MIRER.navolenyRezim, MIRER.vynucenyRezimKoncova)
                                        elseif poruchaKoncova or jednotlive then
                                            trvalyMinus = false
                                            if smer ~= 0 and vykonovaPaka > 0.75 then
                                                if hlavniKontrolerPozadovany < 0.88 and not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.01 and (MIRER.parael or stupenHK < 26) and napetiMIRERkoncova then
                                                    hlavniKontrolerPozadovany = math.max(hlavniKontrolerPozadovany + 0.022,0)
                                                end
                                            elseif smer ~= 0 and vykonovaPaka > 0.25 and vykonovaPakaLast < 0.25 or (tlacPlus and not tlacPlusLast) then
                                                if hlavniKontrolerPozadovany < 0.99 and not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.01 and napetiMIRERkoncova then
                                                    hlavniKontrolerPozadovany = math.max(hlavniKontrolerPozadovany + 0.022,0)
                                                end
                                            elseif vykonovaPaka < -0.75 or (tlacMinus and not tlacMinusLast) then
                                                if not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.01 and napetiMIRERkoncova then --(poruchaVedouci) and 
                                                    hlavniKontrolerPozadovany = hlavniKontrolerPozadovany - 0.022
                                                end
                                            elseif vykonovaPaka < -0.25 and vykonovaPakaLast > -0.25 then
                                                if hlavniKontroler > 0 and not (prechodoveStupneNahoru or prechodoveStupneDolu) and jimkaPK > 2 and math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.01 and napetiMIRERkoncova then
                                                    hlavniKontrolerPozadovany = hlavniKontrolerPozadovany - 0.022
                                                end
                                            end
                                        else
                                            trvalyMinus = false
                                        end
                                    end
                                    vykonovaPakaLast = vykonovaPaka

                                    if edbPrevodnik < citlivostEDB and Call("GetControlValue", "DynamicBrake", 0) ~= 0 then
                                        output_kN_TM1 = 0
                                        output_kN_TM2 = 0
                                        absolutnikN = 0
                                        proudTM1 = 0
                                        proudTM2 = 0
                                    end

                                    if stupenHK > 28 then
                                        MIRER.parael = true
                                    else
                                        MIRER.parael = false
                                    end

                                    if hlavniKontrolerPozadovany < 0 and (hlavniKontrolerPozadovany > -0.5 or rychlostKolaKMHPodvozek1 < 20) then
                                        hlavniKontrolerPozadovany = 0
                                    elseif hlavniKontrolerPozadovany > 0.99 then
                                        hlavniKontrolerPozadovany = 0.99
                                    elseif hlavniKontrolerPozadovany < -1 then
                                        hlavniKontrolerPozadovany = -1
                                    end

                                    if not prechodoveStupneDolu and not prechodoveStupneNahoru then
                                        if (trvalyMinus) and ((math.abs(hlavniKontrolerPozadovany - hlavniKontroler) < 0.01 and hlavniKontrolerPozadovany > 0) or (math.abs(hlavniKontrolerZadniPozadovany - stupenHKKoncova*0.022) < 0.01 and hlavniKontrolerZadniPozadovany > 0)) then -- 
                                            hlavniKontrolerPozadovany = math.max(hlavniKontrolerPozadovany - 0.022, 0)
                                            hlavniKontrolerZadniPozadovany = math.min(hlavniKontrolerPozadovany,hlavniKontrolerZadniPozadovany)
                                        end
                                        if hlavniKontrolerPozadovany >= 0 or hlavniKontroler > 0 then
                                            if vedouci or jednotlive then
                                                if hlavniKontrolerPozadovany - hlavniKontroler > 0.010 and casOdPoslednihoKroku > zpozdeniPneuventiluHK and diag30 then
                                                    if hlavniKontroler < 0 then
                                                        hlavniKontroler = 0
                                                    else
                                                        hlavniKontroler = hlavniKontroler + 0.022
                                                    end
                                                    kontrolerSnd = not kontrolerSnd
                                                    Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                                    krokCas = casProcesor
                                                elseif hlavniKontrolerPozadovany - hlavniKontroler < -0.010 and casOdPoslednihoKroku > zpozdeniPneuventiluHK then
                                                    hlavniKontroler = hlavniKontroler - 0.022
                                                    kontrolerSnd = not kontrolerSnd
                                                    Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                                    krokCas = casProcesor
                                                end
                                            elseif koncova then
                                                if hlavniKontrolerPozadovany - hlavniKontroler > 0.010 and casOdPoslednihoKroku > zpozdeniPneuventiluHK and diag30 then
                                                    if hlavniKontroler < 0 then
                                                        hlavniKontroler = 0
                                                    else
                                                        hlavniKontroler = hlavniKontroler + 0.022
                                                    end
                                                    kontrolerSnd = not kontrolerSnd
                                                    Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                                    krokCas = casProcesor
                                                elseif hlavniKontrolerPozadovany - hlavniKontroler < -0.010 and casOdPoslednihoKroku > zpozdeniPneuventiluHK then
                                                    hlavniKontroler = hlavniKontroler - 0.022
                                                    kontrolerSnd = not kontrolerSnd
                                                    Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                                    krokCas = casProcesor
                                                end
                                            end
                                        elseif hlavniKontroler <= 0 and casOdPoslednihoKroku > zpozdeniPneuventiluHK and hlavniKontroler > -1 and diag30 then
                                            hlavniKontroler = -1
                                            kontrolerSnd = not kontrolerSnd
                                            Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                            krokCas = casProcesor
                                        end
                                    end

                                    casOdPoslednihoKroku = casProcesor - krokCas
                                    if hlavniKontroler < 0.022/2 and (hlavniKontroler > -0.5 or rychlostKolaKMHPodvozek1 < 20) then
                                        hlavniKontroler = 0
                                    elseif hlavniKontroler < -0.5 then
                                        hlavniKontroler = -1
                                    elseif hlavniKontroler > 0.99 then
                                        hlavniKontroler = 0.99
                                    end
                                    if (stupenHK == 27 or stupenHK == 28) and (prechodoveStupneNahoru or vykonovaPaka > 0.25 or (stupenHK == 27 and not prechodoveStupneDolu)) and edbPrevodnik < citlivostEDB then
                                        prechodoveStupneNahoru = true
                                    else
                                        prechodoveStupneNahoru = false
                                    end
                                    if (stupenHK == 27 or stupenHK == 28) and (prechodoveStupneDolu or vykonovaPaka < -0.25 or (stupenHK == 28 and not prechodoveStupneNahoru)) then
                                        prechodoveStupneDolu = true
                                    else
                                        prechodoveStupneDolu = false
                                    end
                                    if prechodoveStupneNahoru then
                                        hlavniKontrolerPozadovany = 0.638
                                        --hlavniKontrolerZadniPozadovany = 0.638
                                        if casOdPoslednihoKroku > zpozdeniPneuventiluHK and jimkaPK > 2 then
                                            hlavniKontroler = hlavniKontroler+0.022
                                            kontrolerSnd = not kontrolerSnd
                                            Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                            krokCas = casProcesor
                                        end
                                    end
                                    if prechodoveStupneDolu then
                                        hlavniKontrolerPozadovany = 0.572
                                        --hlavniKontrolerZadniPozadovany = 0.572
                                        if casOdPoslednihoKroku > zpozdeniPneuventiluHK and jimkaPK > 2 then
                                            hlavniKontroler = hlavniKontroler-0.022
                                            kontrolerSnd = not kontrolerSnd
                                            Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                                            krokCas = casProcesor
                                        end
                                    end
                                    if vedouci and not poruchaKoncova then
                                        if stupenHKKoncova == 29 then
                                            hlavniKontrolerZadniPozadovanyLast = 0.638
                                        end
                                        if stupenHKKoncova == 26 then
                                            hlavniKontrolerZadniPozadovanyLast = 0.572
                                        end
                                        if math.abs(hlavniKontrolerZadniPozadovany - hlavniKontrolerZadniPozadovanyLast) > 0.011 or (casProcesor - synchronizaceHKcas > 2*zpozdeniPneuventiluHK and stupenHKKoncova*0.022 ~= hlavniKontrolerZadniPozadovany and stupenHKKoncova == stupenHKKoncovaLast and ((stupenHKKoncova >= 0 and hlavniKontrolerZadniPozadovany >= 0) or stupenHKKoncova > 0)) then --and not trvalyMinus
                                            if zaMasinouDvojicka then
                                                Call("SendConsistMessage",131002,tostring(hlavniKontrolerZadniPozadovany),1)
                                            end
                                            synchronizaceHKcas = casProcesor
                                            hlavniKontrolerZadniPozadovanyLast = hlavniKontrolerZadniPozadovany
                                        end
                                        stupenHKKoncovaLast = stupenHKKoncova
                                    end
                                    Call("SetControlValue", "HlavniKontroler", 0, hlavniKontroler)

                                    casOdPoslednihoKroku = casProcesor - krokCas

                                    if hlavniKontroler ~= 0 and Q01 and (K02 or casProcesor - edbCas < 180) then
                                        Call("SetControlValue", "PantographControl", 0, 1)
                                    else
                                        Call("SetControlValue", "PantographControl", 0, 0)
                                    end

                                --displej
                                    Call("SetControlValue", "MIRERdisp", 0, 1)
                                    proudBaterie = proudBaterie + 5
                                    if VpPlus then --and MIRER.pozadovanaRychlost == 0 then
                                        MIRER.rucniSnizeni = 0
                                    -- elseif VpPlus and MIRER.pozadovanaRychlost < 100 then
                                    --     MIRER.pozadovanaRychlost = MIRER.pozadovanaRychlost + 5
                                    end
                                    if VpMinus then--and MIRER.pozadovanaRychlost > 30 then
                                        MIRER.rucniSnizeni = 5
                                    -- elseif VpMinus and MIRER.pozadovanaRychlost == 30 then
                                    --     MIRER.pozadovanaRychlost = 0
                                    end
                                    MIRER.pozadovanaRychlost = math.min(math.max(MIREL.zobrazenaRychlost, 30), 100)-MIRER.rucniSnizeni
                                    if Call("GetControlValue", "K0", 0) > 0.5 then
                                        MIRER.navolenyRezim = 0
                                    elseif Call("GetControlValue", "KS", 0) > 0.5 then
                                        MIRER.navolenyRezim = 1
                                    elseif Call("GetControlValue", "KN", 0) > 0.5 then
                                        MIRER.navolenyRezim = 2
                                    end
                                    vPozString = tostring(MIRER.pozadovanaRychlost)
                                    if string.len(vPozString) < 2 then
                                        vPozString = "0"..vPozString
                                    end
                                    if string.len(vPozString) < 3 then
                                        vPozString = " "..vPozString
                                    end
                                    vPozString = "Vp"..vPozString.."km/h "
                                    vedouciEDBpismeno = " "
                                    koncovaEDBpismeno = " "
                                    if (MIRER.stavy["tlak prevodnik"].vedouci and MIRER.stavy["tlak prevodnik"].koncova) or (EDB_LSO and EDB_LSOkoncova) then
                                        vedouciEDBpismeno = "p"
                                    elseif MIRER.stavy["tlak prevodnik"].vedouci or EDB_LSO then
                                        vedouciEDBpismeno = "v"
                                    elseif MIRER.stavy["tlak prevodnik"].koncova or EDB_LSOkoncova then
                                        vedouciEDBpismeno = "k"
                                    end
                                    if EDB_LSO and EDB_LSOkoncova then
                                        koncovaEDBpismeno = "s"
                                    elseif EDB_LSO then
                                        koncovaEDBpismeno = "v"
                                    elseif EDB_LSOkoncova then
                                        koncovaEDBpismeno = "k"
                                    end
                                    vedouciHKstring = vedouciEDBpismeno.."Ved."..getIdentifierForHKNotch(stupenHK, EDB_CHOD)
                                    while string.len(vedouciHKstring) < 10 do
                                        vedouciHKstring = vedouciHKstring.." "
                                    end
                                    koncovaHKstring = koncovaEDBpismeno.."K-"..MIRER.rezimDict[MIRER.navolenyRezim].."."..getIdentifierForHKNotch(stupenHKKoncova, EDB_CHODkoncova)
                                    while string.len(koncovaHKstring) < 10 do
                                        koncovaHKstring = koncovaHKstring.." "
                                    end
                                    vSkutString = tostring(round(rychlostKolaKMHPodvozek1))
                                    if string.len(vSkutString) < 2 then
                                        vSkutString = "0"..vSkutString
                                    end
                                    if string.len(vSkutString) < 3 then
                                        vSkutString = " "..vSkutString
                                    end
                                    vSkutString = "Vs"..vSkutString.."km/h "
                                    Call("MIRER1r:SetText", vedouciHKstring..vPozString, 0)
                                    Call("MIRER2r:SetText", koncovaHKstring..vSkutString, 0)
                                    
                                    mirerKoncovaInit = napetiMIRERkoncova and not napetiMIRERkoncovaLast
                                    napetiMIRERkoncovaLast = napetiMIRERkoncova

                                    --provozni stavy
                                        if edbPrevodnik > citlivostEDB/5 and not EDB_CHOD then
                                            if not MIRER.stavy["tlak prevodnik"].vedouci or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "tlak prevodnik:true", 1)
                                                end
                                            end
                                            MIRER.stavy["tlak prevodnik"].vedouci = true
                                        else
                                            if MIRER.stavy["tlak prevodnik"].vedouci then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "tlak prevodnik:false", 1)
                                                end
                                            end
                                            MIRER.stavy["tlak prevodnik"].vedouci = false
                                        end
                                        if plynuleValceSoucet > 0.1 then
                                            if not MIRER.stavy["tlak brz.valce"].vedouci or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "tlak brz.valce:true", 1)
                                                end
                                            end
                                            MIRER.stavy["tlak brz.valce"].vedouci = true
                                        else
                                            if MIRER.stavy["tlak brz.valce"].vedouci then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "tlak brz.valce:false", 1)
                                                end
                                            end
                                            MIRER.stavy["tlak brz.valce"].vedouci = false
                                        end
                                        if Call("GetControlValue", "VirtualHandBrake", 0) > 0.1 then
                                            if not MIRER.stavy["rucna brzda"].vedouci or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "rucna brzda:true", 1)
                                                end
                                            end
                                            MIRER.stavy["rucna brzda"].vedouci = true
                                        else
                                            if MIRER.stavy["rucna brzda"].vedouci then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "rucna brzda:false", 1)
                                                end
                                            end
                                            MIRER.stavy["rucna brzda"].vedouci = false
                                        end
                                        poruchaSN = false
                                        if poruchaSN then
                                            if not MIRER.stavy["Porucha st.nab."].vedouci then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "Porucha st.nab.:true", 1)
                                                end
                                            end
                                            MIRER.stavy["Porucha st.nab."].vedouci = true
                                        else
                                            if MIRER.stavy["Porucha st.nab."].vedouci then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "Porucha st.nab.:false", 1)
                                                end
                                            end
                                            MIRER.stavy["Porucha st.nab."].vedouci = false
                                        end
                                        if Call("GetControlValue", "vypinacEDB", 0) < 0.5 then
                                            if not MIRER.stavy["EDB vypnuta"].vedouci or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "EDB vypnuta:true", 1)
                                                end
                                            end
                                            MIRER.stavy["EDB vypnuta"].vedouci = true
                                        else
                                            if MIRER.stavy["EDB vypnuta"].vedouci then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131006, "EDB vypnuta:false", 1)
                                                end
                                            end
                                            MIRER.stavy["EDB vypnuta"].vedouci = false
                                        end
                                        stringProvozniStav = ""
                                        local i = 0
                                        for k,v in pairs(MIRER.stavy) do
                                            if (v.vedouci or v.koncova or v.text ~= nil) and (k ~= "EDB vypnuta" or absolutniRychlostKMH < 1) then
                                                if i == MIRER.stavIndex then
                                                    if v.text ~= nil then
                                                        stringProvozniStav = v.text
                                                    elseif v.vedouci and v.koncova then
                                                        stringProvozniStav = "V+K-"..k
                                                    elseif v.vedouci then
                                                        stringProvozniStav = "V-"..k
                                                    elseif v.koncova then
                                                        stringProvozniStav = "K-"..k
                                                    end
                                                end
                                            elseif i == MIRER.stavIndex then
                                                MIRER.stavIndex = MIRER.stavIndex + 1
                                                if MIRER.stavIndex > table.len(MIRER.stavy)-1 then
                                                    MIRER.stavIndex = 0
                                                end
                                            end
                                            i = i + 1
                                        end
                                        local pocetMezerLeva = math.floor((20 - string.len(stringProvozniStav))/2)
                                        local i = 0
                                        while i < pocetMezerLeva do
                                            stringProvozniStav = " "..stringProvozniStav
                                            i = i + 1
                                        end
                                        while string.len(stringProvozniStav) < 20 do
                                            stringProvozniStav = stringProvozniStav.." "
                                        end
                                        Call("MIRER3r:SetText", stringProvozniStav, 0)

                                    --poruchy
                                        if Call("GetControlValue", "DR", 0) > 0.5 then
                                            MIRER.draha = 0
                                            MIRER.drahaAbs = 0
                                        end

                                        MIRER.drahaAbs = MIRER.drahaAbs + absolutniRychlost * casHry
                                        MIRER.draha = round(MIRER.drahaAbs/20)*20

                                        if klapka1H then
                                            if not MIRER.poruchy["V-dif.ochr.HO"] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-dif.ochr.HO:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-dif.ochr.HO"] = true
                                        else
                                            if MIRER.poruchy["V-dif.ochr.HO"] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-dif.ochr.HO:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-dif.ochr.HO"] = false
                                        end

                                        if klapka2H then
                                            if not MIRER.poruchy["V-dif.ochr.PO"] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-dif.ochr.PO:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-dif.ochr.PO"] = true
                                        else
                                            if MIRER.poruchy["V-dif.ochr.PO"] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-dif.ochr.PO:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-dif.ochr.PO"] = false
                                        end

                                        if klapka5H then
                                            if not MIRER.poruchy["V-strata vent."] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-strata vent.:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-strata vent."] = true
                                        else
                                            if MIRER.poruchy["V-strata vent."] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-strata vent.:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-strata vent."] = false
                                        end

                                        if klapka6H then
                                            if not MIRER.poruchy["V-nadp.vl.kur."] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-nadp.vl.kur.:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-nadp.vl.kur."] = true
                                        else
                                            if MIRER.poruchy["V-nadp.vl.kur."] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-nadp.vl.kur.:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-nadp.vl.kur."] = false
                                        end

                                        if strataNapatia then
                                            if not MIRER.poruchy["V-strata nap."] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-strata nap.:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-strata nap."] = true
                                        else
                                            if MIRER.poruchy["V-strata nap."] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-strata nap.:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-strata nap."] = false
                                        end

                                        if Y121 and Y122 and rychlostKolaKMHPodvozek1 > 5 then
                                            MIRER.poruchy["Zberace P+Z"] = true
                                        else
                                            MIRER.poruchy["Zberace P+Z"] = false
                                        end

                                        F134 = Call("GetControlValue", "F134", 0) > 0.9
                                        shunt = round(math.max((hlavniKontroler - 0.88)/0.022,0))
                                        zeslabeniBuzeni = 1
                                        if shunt > 4.5 then
                                            zeslabeniBuzeni = 0.7
                                        elseif shunt > 3.5 then
                                            zeslabeniBuzeni = 0.735
                                        elseif shunt > 2.5 then
                                            zeslabeniBuzeni = 0.78
                                        elseif shunt > 1.5 then
                                            zeslabeniBuzeni = 0.835
                                        elseif shunt > 0.5 then
                                            zeslabeniBuzeni = 0.91
                                        end
                                        if ((vedouci and S101koncova == S101_KONCOVA) or (koncova and S101koncova == S101_VEDOUCI)) and math.max(proudTM1,proudTM2) > 410/zeslabeniBuzeni and F134 then --LTS410A
                                            if not MIRER.poruchy["V-LTS-410 A"] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-LTS-410 A:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-LTS-410 A"] = true
                                        else
                                            if MIRER.poruchy["V-LTS-410 A"] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-LTS-410 A:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-LTS-410 A"] = false
                                        end

                                        if ((vedouci and S101koncova == S101_KONCOVA) or (koncova and S101koncova == S101_VEDOUCI)) and math.max(proudTM1,proudTM2) > 510/zeslabeniBuzeni and F134 then --LTS510A
                                            if not MIRER.poruchy["V-LTS-510 A"] or mirerKoncovaInit then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-LTS-510 A:true", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-LTS-510 A"] = true
                                        else
                                            if MIRER.poruchy["V-LTS-510 A"] then
                                                if zaMasinouDvojicka then
                                                    Call("SendConsistMessage", 131008, "K-LTS-510 A:false", 1)
                                                end
                                            end
                                            MIRER.poruchy["V-LTS-510 A"] = false
                                        end

                                        if MIRER.poruchy["V-LTS-410 A"] and MIRER.poruchy["K-LTS-410 A"] then
                                            MIRER.poruchy["LTS-410 A"] = true
                                        else
                                            MIRER.poruchy["LTS-410 A"] = false
                                        end

                                        if MIRER.poruchy["V-LTS-510 A"] and MIRER.poruchy["K-LTS-510 A"] then
                                            MIRER.poruchy["LTS-510 A"] = true
                                        else
                                            MIRER.poruchy["LTS-510 A"] = false
                                        end

                                        if MIRER.draha < 720 then
                                            MIRER.poruchy["Draha"] = true
                                        else
                                            MIRER.poruchy["Draha"] = false
                                        end

                                        if rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+1 or (MIRER.poruchy["Prekr.rychl."] and rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost) then
                                            MIRER.poruchy["Prekr.rychl."] = true
                                            MIRER.vynucenyRezimKoncova = math.max(MIRER.navolenyRezim-1,0)
                                            if rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+2 then
                                                MIRER.vynucenyRezimKoncova = 0
                                                MIRER.blokovaniVykonu = true
                                            elseif rychlostKolaKMHPodvozek1 < MIRER.pozadovanaRychlost+1 then
                                                MIRER.blokovaniVykonu = false
                                            elseif MIRER.blokovaniVykonu then
                                                MIRER.vynucenyRezimKoncova = 0
                                            end
                                            if rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+4 or (MIRER.vynucenyRezim == 0 and rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+3) then
                                                MIRER.vynucenyRezim = 0
                                            elseif rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+3 or (MIRER.vynucenyRezim == 1 and rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+2) then
                                                MIRER.vynucenyRezim = 1
                                            else
                                                MIRER.vynucenyRezim = 2
                                            end
                                            if rychlostKolaKMHPodvozek1 > MIRER.pozadovanaRychlost+5 then
                                                if BSE_ridiciTlak > MIRER.cilovyTlak and ((casProcesor - MIRER.casSnizeni > 10 and rychlostKolaKMHPodvozek1 < 72) or (MIRER.drahaUpousteni >= 200 and rychlostKolaKMHPodvozek1 >= 72)) then
                                                    MIRER.EPV = true
                                                elseif BSE_ridiciTlak <= MIRER.cilovyTlak then
                                                    MIRER.EPV = false
                                                    MIRER.casSnizeni = casProcesor
                                                    MIRER.drahaUpousteni = 0
                                                    MIRER.cilovyTlak = MIRER.cilovyTlak-0.4
                                                end
                                                if MIRER.drahaUpousteni <= 200 then
                                                    MIRER.drahaUpousteni = MIRER.drahaUpousteni + rychlostKolaKMHPodvozek1*casHry
                                                end
                                            else
                                                if not MIRER.EPV or BSE_ridiciTlak < MIRER.cilovyTlak then
                                                    MIRER.EPV = false
                                                end
                                                MIRER.cilovyTlak = 4.6
                                                MIRER.casSnizeni = 0
                                                MIRER.drahaUpousteni = 250
                                            end
                                        else
                                            MIRER.cilovyTlak = 4.6
                                            MIRER.casSnizeni = 0
                                            MIRER.drahaUpousteni = 250
                                            MIRER.EPV = false
                                            MIRER.blokovaniVykonu = false
                                            MIRER.vynucenyRezim = 2
                                            MIRER.vynucenyRezimKoncova = 2
                                            MIRER.poruchy["Prekr.rychl."] = false
                                        end

                                        if (vedouci and S101koncova ~= S101_KONCOVA) or (jednotlive and S101koncova ~= -1) or (koncova and (S101_KONCOVA ~= S101_VEDOUCI or S101_KONCOVA ~= S101_PORUCHA_VEDOUCI or S101_KONCOVA ~= S101_PORUCHA_KONCOVA)) or not rizeniZap or not F101 then
                                            MIRER.poruchy["Prestav S101"] = true
                                        else
                                            MIRER.poruchy["Prestav S101"] = false
                                        end

                                        if not napetiMIRERkoncova then
                                            MIRER.poruchy["Prenos V+K"] = true
                                        else
                                            MIRER.poruchy["Prenos V+K"] = false
                                        end

                                        stringPorucha = ""
                                        local i = 0
                                        for k,v in pairs(MIRER.poruchy) do
                                            if v and k ~= "V-strata nap." and k ~= "V-LTS-410 A" and k ~= "K-LTS-410 A" and k ~= "V-LTS-510 A" and k ~= "K-LTS-510 A" then
                                                if i == MIRER.poruchaIndex then
                                                    if k == "Draha" then
                                                        stringDraha = MIRER.draha
                                                        while string.len(stringDraha) < 3 do
                                                            stringDraha = "0"..stringDraha
                                                        end
                                                        stringPorucha = "Draha "..stringDraha.." m"
                                                    else
                                                        stringPorucha = k
                                                    end
                                                end
                                            elseif i == MIRER.poruchaIndex then
                                                MIRER.poruchaIndex = MIRER.poruchaIndex + 1
                                                if MIRER.poruchaIndex > table.len(MIRER.poruchy)-1 then
                                                    MIRER.poruchaIndex = 0
                                                end
                                            end
                                            i = i + 1
                                        end
                                        local pocetMezerLeva = math.floor((15 - string.len(stringPorucha))/2)
                                        local i = 0
                                        while i < pocetMezerLeva do
                                            stringPorucha = " "..stringPorucha
                                            i = i + 1
                                        end
                                        while string.len(stringPorucha) < 15 do
                                            stringPorucha = stringPorucha.." "
                                        end
                                        if dvojteckaMIRER then
                                            --Call("MIRER4r:SetText", "XXXXXXXXXXXXXXXXXXXX", 0)
                                            if MIRER.synchroCas then
                                                Call("MIRER4r:SetText", stringPorucha..hh..":"..mm, 0)
                                            else
                                                Call("MIRER4r:SetText", stringPorucha..hh.."?"..mm, 0)
                                            end
                                        else
                                            Call("MIRER4r:SetText", stringPorucha..hh.." "..mm, 0)
                                        end

                                    if casProcesor - casMIRER >= 0.5 then
                                        dvojteckaMIRER = not dvojteckaMIRER
                                        casMIRER = casProcesor
                                        if dvojteckaMIRER then
                                            MIRER.stavIndex = MIRER.stavIndex + 1
                                            if MIRER.stavIndex > table.len(MIRER.stavy)-1 then
                                                MIRER.stavIndex = 0
                                            end
                                            MIRER.poruchaIndex = MIRER.poruchaIndex + 1
                                            if MIRER.poruchaIndex > table.len(MIRER.poruchy)-1 then
                                                MIRER.poruchaIndex = 0
                                            end
                                        end
                                    end
                                --odkalovani
                                    if casProcesor - MIRER.zpozdeniOdkalovani > 480 then
                                        MIRER.odkalovaniJimek = true
                                        if casProcesor - MIRER.casOdkalovani > 3 then
                                            MIRER.zpozdeniOdkalovani = casProcesor
                                        end
                                    else
                                        MIRER.casOdkalovani = casProcesor
                                        MIRER.odkalovaniJimek = false
                                    end
                            else
                                Call("SetControlValue", "MIRERdisp", 0, 0)
                                MIRER.cilovyTlak = 4.6
                                MIRER.casSnizeni = 0
                                MIRER.drahaUpousteni = 250
                                MIRER.EPV = false
                                MIRER.blokovaniVykonu = false
                                MIRER.vynucenyRezim = 2
                                MIRER.vynucenyRezimKoncova = 2
                                MIRER.stavIndex = 0
                                MIRER.stavy = {
                                    ["tlak prevodnik"] = {},
                                    ["tlak brz.valce"] = {},
                                    ["rucna brzda"] = {},
                                    ["Porucha st.nab."] = {},
                                    ["EDB vypnuta"] = {}
                                }
                                MIRER.poruchaIndex = 0
                                MIRER.poruchy = {
                                    ["V-dif.ochr.HO"] = false,
                                    ["K-dif.ochr.HO"] = false,
                                    ["V-dif.ochr.PO"] = false,
                                    ["K-dif.ochr.PO"] = false,
                                    ["V-strata vent."] = false,
                                    ["K-strata vent."] = false,
                                    ["V-nadp.vl.kur."] = false,
                                    ["K-nadp.vl.kur."] = false,
                                    ["V-strata nap."] = false,
                                    ["K-strata nap."] = false,
                                    ["Zberace P+Z"] = false,
                                    ["V-LTS-410 A"] = false,
                                    ["K-LTS-410 A"] = false,
                                    ["LTS-410 A"] = false,
                                    ["V-LTS-510 A"] = false,
                                    ["K-LTS-510 A"] = false,
                                    ["LTS-510 A"] = false,
                                    ["Draha"] = false,
                                    ["Prestav S101"] = false,
                                    ["Prenos V+K"] = false,
                                    ["Prekr.rychl."] = false
                                }
                                MIRER.drahaAbs = 720
                                MIRER.odkalovaniJimek = false
                                output_kN_TM1 = 0
                                output_kN_TM2 = 0
                                absolutnikN = 0
                                proudTM1 = 0
                                proudTM2 = 0
                                Call("MIRER1r:SetText", "                    ", 0)
                                Call("MIRER2r:SetText", "                    ", 0)
                                Call("MIRER3r:SetText", "                    ", 0)
                                Call("MIRER4r:SetText", "                    ", 0)
                            end
                            Call("SoundEngine:SetParameter","OdkalovaniZvuk",toInt(MIRER.odkalovaniJimek))
                        --RIZENI OVLADACU
                            --ARETACE A VRATNE POLOHY
                                dummy_Brzdit = (Call("GetControlValue", "dummy_Brzdit", 0) > 0.5)
                                dummy_Odbrzdit = (Call("GetControlValue", "dummy_Odbrzdit", 0) > 0.5)
                                dummy_RB = (Call("GetControlValue", "dummy_RB", 0) > 0.5)
                                virtualBrake = Call("GetControlValue", "VirtualBrake", 0)
                                if virtualBrake ~= virtualBrakeLast then
                                    mouseControlledOBE = true
                                elseif dummy_Brzdit or dummy_Odbrzdit or dummy_RB or dummyVirtualBrakeLast ~= OBE then
                                    mouseControlledOBE = false
                                end
                                if not mouseControlledOBE then
                                    if dummy_Brzdit then
                                        if brzdicLastKey == 0 and brzdicKeyPressTimer ~= nil and not dummy_BrzditLast then
                                            if os.clock() - brzdicKeyPressTimer < 0.2 and not brzdicUnlocked then
                                                brzdicUnlocked = true
                                                brzdicWasUnlocked = false
                                            end
                                        end
                                        if brzdicUnlocked then
                                            OBE = math.min(OBE+cas*0.7,1)
                                            Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                        elseif (OBE < 0.75 and OBE >= 0.4) then
                                            OBE = math.min(OBE+cas*0.7,0.75)
                                            Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                        end
                                        brzdicLastKey = 0
                                        brzdicKeyPressTimer = os.clock()
                                    elseif dummy_BrzditLast or (wasOBE_OCVC and OBE_OCVC == OBE) then
                                        if OBE >= 0.86 then
                                            OBE = 1
                                        elseif OBE < 0.066 then
                                            OBE = 0
                                        elseif OBE < 0.213 then
                                            OBE = 0.132
                                        elseif OBE < 0.364 then
                                            OBE = 0.284
                                        else
                                            OBE = 0.58
                                            brzdicUnlocked = false
                                        end
                                        Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                    end
                                    dummy_BrzditLast = dummy_Brzdit
                                    if dummy_Odbrzdit then
                                        if brzdicLastKey == 1 and brzdicKeyPressTimer ~= nil and not dummy_OdbrzditLast then
                                            if os.clock() - brzdicKeyPressTimer < 0.2 and not brzdicUnlocked then
                                                brzdicUnlocked = true
                                                brzdicWasUnlocked = false
                                            end
                                        end
                                        if brzdicUnlocked then
                                            OBE = math.max(OBE-cas*0.7,0)
                                            Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                        elseif (OBE <= 0.75 and OBE > 0.4) then
                                            OBE = math.max(OBE-cas*0.7,0.4)
                                            Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                        end
                                        brzdicLastKey = 1
                                        brzdicKeyPressTimer = os.clock()
                                    elseif dummy_OdbrzditLast or (wasOBE_OCVC and OBE_OCVC == OBE) then
                                        if OBE < 0.066 then
                                            OBE = 0
                                        elseif OBE < 0.213 then
                                            OBE = 0.132
                                        elseif OBE < 0.364 then
                                            OBE = 0.284
                                        elseif OBE > 0.86 then
                                            OBE = 1
                                        else
                                            OBE = 0.58
                                            brzdicUnlocked = false
                                        end
                                        Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                    end
                                    dummy_OdbrzditLast = dummy_Odbrzdit
                                    if not brzdicUnlocked and OBE < 0.4 and (wasOBE_OCVC or OBE_OCVC == OBE) then
                                        OBE = 0.4
                                        Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                    end
                                    if not brzdicUnlocked and OBE > 0.75 and (wasOBE_OCVC or OBE_OCVC == OBE) then
                                        OBE = 0.75
                                        Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                    end
                                    if brzdicWasUnlocked and OBE >= 0.364 and OBE <= 0.86 then
                                        brzdicUnlocked = false
                                        brzdicWasUnlocked = false
                                    elseif OBE > 0.86 or OBE < 0.364 then
                                        brzdicWasUnlocked = true
                                    end
                                    if dummy_RB then
                                        brzdicUnlocked = true
                                        OBE = 1
                                        Call("SetControlTargetValue", "dummyVirtualBrake", 0, 1)
                                    end
                                    if not dummy_Odbrzdit and not dummy_Brzdit and OBE > 0.364 and OBE < 0.86 and not brzdicUnlocked and (wasOBE_OCVC or OBE_OCVC == OBE) then
                                        OBE = 0.58
                                        Call("SetControlTargetValue", "dummyVirtualBrake", 0, OBE)
                                    end
                                    virtualBrakeLast = Call("GetControlValue", "dummyVirtualBrake", 0)
                                    Call("SetControlValue", "VirtualBrake", 0, virtualBrakeLast)
                                else
                                    Call("SetControlValue", "dummyVirtualBrake", 0, virtualBrake)
                                    virtualBrakeLast = virtualBrake
                                    dummyVirtualBrakeLast = OBE
                                end
                                wasOBE_OCVC = false
                            
                                --jizdni kotnroler
                                    virtualThrottle = Call("GetControlValue", "VirtualThrottle", 0)

                                    if vykonovaPaka ~= dummyVirtualThrottleLast then
                                        syncDummyThrottle = true
                                    end
                                    dummyVirtualThrottleLast = vykonovaPaka

                                    if virtualThrottle ~= virtualThrottleLast then
                                        syncDummyThrottle = false
                                    end
                                    virtualThrottleLast = virtualThrottle

                                    if syncDummyThrottle then
                                        Call("SetControlValue", "VirtualThrottle", 0, vykonovaPaka)
                                        virtualThrottle = vykonovaPaka
                                        virtualThrottleLast = vykonovaPaka

                                        if not wasKontrolerOCVC and vykonovaPaka == kontrolerOCVC and Call("GetControlValue", "dummy_A", 0) < 0.5 then
                                            if vykonovaPaka > 0 then --and vykonovaPaka < 0.75
                                                Call("SetControlTargetValue", "dummyVirtualThrottle", 0, 0)
                                                vykonovaPaka = 0
                                            end
                                            if vykonovaPaka < 0 and vykonovaPaka > -0.75 then
                                                Call("SetControlTargetValue", "dummyVirtualThrottle", 0, 0)
                                                vykonovaPaka = 0
                                            end
                                        end
                                    else
                                        Call("SetControlValue", "dummyVirtualThrottle", 0, virtualThrottle)
                                        vykonovaPaka = virtualThrottle
                                        dummyVirtualThrottleLast = virtualThrottle
                                    end
                                    wasKontrolerOCVC = false

                            --MECHANICKE BLOKOVANI
                                --blokovani smeru
                                    klicek = Call("GetControlValue", "ZamekSmeru", 0)

                                    zamcenySmer = klicek < 0.9 and math.abs(S103A) < 0.5
                                    vlozKlicek = Call("GetControlValue", "VlozKlicek", 0) > 0.5 and not isKlicekNaSousedni
                                    isKlicekLast = isKlicek
                                    isKlicek = (isKlicek or vlozKlicek) and not (Call("GetControlValue", "VyndejKlicek", 0) > 0.5 and klicek > -0.9 and klicek < 0.1)

                                    if zamcenySmer then
                                        Call("SetControlValue", "UserVirtualReverser", 0, 0)
                                    end

                                    if not isKlicek or (Call("GetControlValue", "VyndejKlicek", 0) > 0.5 and klicek > -0.9 and klicek < 0.1) then
                                        Call("SetControlValue", "ZamekSmeru", 0, -1)
                                    elseif vlozKlicek then
                                        Call("SetControlValue", "ZamekSmeru", 0, 0)
                                    elseif math.abs(S103A) > 0.5 then
                                        Call("SetControlValue", "ZamekSmeru", 0, 1)
                                    end

                                    if isKlicek and klicek < 0 then
                                        Call("SetControlValue", "ZamekSmeru", 0, 0)
                                    end

                                    if math.abs(vykonovaPaka) > 0.5 and not blokovanySmer then
                                        blokovanySmer = S103A
                                    elseif math.abs(vykonovaPaka) < 0.5 then
                                        blokovanySmer = nil
                                    end

                                    if blokovanySmer then
                                        Call("SetControlValue", "UserVirtualReverser", 0, blokovanySmer)
                                        S103A = blokovanySmer
                                    end

                                    if isKlicek ~= isKlicekLast then
                                        Call("SendConsistMessage", 131016, tostring(toInt(isKlicek)), 1)
                                    end
                                --blokovani JK
                                    if math.abs(S103A) < 0.9 then
                                        Call("SetControlValue", "dummyVirtualThrottle", 0, 0)
                                        Call("SetControlValue", "VirtualThrottle", 0, 0)
                                        vykonovaPaka = 0
                                        virtualThrottle = 0
                                        virtualThrottleLast = 0
                                        dummyVirtualThrottleLast = 0
                                    end

                                --blokovani S101
                                    if Call("GetControlValue", "S101paka", 0) < 0.7 and not blokovanaS101 then
                                        blokovanaS101 = round(S101*5)/5
                                    elseif Call("GetControlValue", "S101paka", 0) > 0.7 then
                                        blokovanaS101 = nil
                                    end

                                    if blokovanaS101 then
                                        Call("SetControlValue", "S101", 0, blokovanaS101)
                                    end
                            --VLOZENI/VYJMUTI KLICKY TOPENI
                                klickaTopeniTriggerLast = klickaTopeniTrigger
                                klickaTopeniTrigger = Call("GetControlValue", "KlickaTopeniTrigger", 0) > 0.5

                                if klickaTopeniTrigger and not klickaTopeniTriggerLast then
                                    if klickaTopeniVisibility and Call("GetControlValue", "KlickaTopeni", 0) < 0.1 then
                                        klickaTopeniVisibility = false
                                    elseif not klickaTopeniVisibility then
                                        klickaTopeniVisibility = true
                                    end
                                end
                                if not klickaTopeniVisibility then
                                    Call("SetControlValue", "KlickaTopeni", 0, 0)
                                end
                                Call("SetControlValue", "KlickaTopeniVisibility", 0, toInt(klickaTopeniVisibility))
                            --PREPINAC TOPENI
                                topeniKabiny = Call("GetControlValue", "TopeniKabiny", 0)
                                if topeniKabiny > 1.75 then
                                    Call("SetControlValue", "TopeniKabiny", 0, topeniKabiny-2)
                                end
                                if topeniKabiny < -1.75 then
                                    Call("SetControlValue", "TopeniKabiny", 0, topeniKabiny+2)
                                end

                        --MIREL
                            napetiMIRELlast = napetiMIREL
                            if jeLicha then
                                napetiMIREL = (baterie and Call("GetControlValue", "F191", 0) > 0.9 and (vMetrBaterie > 30 or math.random() > 0.001))
                                napetiMIRELkoncova = false
                            else
                                napetiMIREL = false
                            end
                            if napetiMIREL ~= napetiMIRELlast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",998112,toInt(napetiMIREL),1)
                                end
                                napetiMIRELlast = napetiMIREL
                            end
                            MIREL:Update(cas,casHry)
                            MIREL_RM1:Update(cas)
                            if round(vykonovaPaka/0.2) ~= round(vykonovaPakaMIRELLast/0.2) or round(OBE/0.08) ~= round(OBElast/0.08) then
                                if MIREL.isHere then
                                    MIREL:VybaveniBdelostiOvladacem()
                                else
                                    if zaMasinouDvojicka then
                                        Call("SendConsistMessage", 998107, "1", 1)
                                    end
                                end
                            end
                            vykonovaPakaMIRELLast = vykonovaPaka

                            bdelostMax = math.max(Call("GetControlValue","TBPravy",0),Call("GetControlValue","TBLevy",0))
                            Call("SetControlValue", "Bdelost", 0, bdelostMax)
                            if bdelostMax > 0.5 and not bdelostLast then
                                if MIREL.isHere then
                                    MIREL:VybaveniBdelosti()
                                else
                                    if zaMasinouDvojicka then
                                        Call("SendConsistMessage", 998107, "0", 1)
                                    end
                                end
                                bdelostLast = true
                            elseif bdelostMax < 0.5 then
                                bdelostLast = false
                            end
                            
                            if (jeLicha and napetiMIREL) or (jeSuda and napetiMIRELkoncova) then
                                MIREL:NastavHodnotuBaterii(true)
                                if jeLicha then
                                    proudBaterie = proudBaterie + 4
                                end
                            else
                                MIREL:NastavHodnotuBaterii(false)
                            end
                            
                            F156last = F156
                            F156 = Call("GetControlValue", "F156", 0) > 0.9
                            if jeSuda and F156 ~= F156last then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131019,toInt(F156),1)
                                end
                                F156last = F156
                            end

                            napetiRMlast = napetiRM
                            if jeLicha then
                                napetiRM = baterie and F156 and F156koncova
                                napetiRMkoncova = false
                            else
                                napetiRM = false
                            end
                            if napetiRM ~= napetiRMlast then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131020,toInt(napetiRM),1)
                                end
                                napetiRMlast = napetiRM
                            end

                            proudBaterie = proudBaterie + 2*toInt(napetiRM)
                            
                            if jeLicha then
                                MIREL:NastavHodnotyRizeni((vedouci or jednotlive) and napetiMIREL, (S101koncova ~= S101_VYPNUTO and S101koncova ~= S101_KONCOVA and S101koncova ~= -1) and napetiMIREL)
                                MIREL:NastavAktualniKabinu(2-toInt(driverHere))
                            else
                                MIREL:NastavHodnotyRizeni((S101koncova ~= S101_VYPNUTO and S101koncova ~= S101_KONCOVA and S101koncova ~= -1) and napetiMIRELkoncova, (vedouci or jednotlive) and napetiMIRELkoncova)
                                MIREL:NastavAktualniKabinu(1+toInt(driverHere))
                            end
                        
                        --VYSILACKA
                            napetiVO67last = napetiVO67
                            if jeLicha then
                                napetiVO67 = baterie and Call("GetControlValue", "F122", 0) > 0.9 and (vMetrBaterie > 30 or math.random() > 0.001)
                                napetiVO67koncova = false
                            else
                                napetiVO67 = false
                            end
                            if napetiVO67 ~= napetiVO67last then
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",999102,toInt(napetiVO67),1)
                                end
                                napetiVO67last = napetiVO67
                            end
                            VO67:Update(cas)
                            VO67.baterie = napetiVO67 or napetiVO67koncova
                            if napetiVO67 then
                                if VO67.obraz ~= VO67.OBRAZY.VYP then
                                    proudBaterie = proudBaterie + 5
                                else
                                    proudBaterie = proudBaterie + 2
                                end
                            end
                        --ADHESE
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
                                elseif SysCall("ScenarioManager:GetSeason") == 2 then --listyyyyyyy
                                    if ADHESE_KOEF_LISTI > ADHESE_KOEF_LISTI_TARGET then
                                        ADHESE_KOEF_LISTI = ADHESE_KOEF_LISTI - ADHESE_KOEF_LISTI_DELTA * rychlost * cas * 0.1
                                    else
                                        ADHESE_KOEF_LISTI = 0.7
                                        ADHESE_KOEF_LISTI_TARGET = math.random()*0.4+0.3
                                        ADHESE_KOEF_LISTI_DELTA = math.random()/3
                                    end
                                end

                                if plynuleValceSoucet > 0.1 and rychlostKolaKMHPodvozek1 > 5 then
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

                                if Call("GetControlValue","Sander",0) > 0.5 then
                                    if sandAdhesionAddition < 0.15 then
                                        sandAdhesionAddition = sandAdhesionAddition + 0.25*cas
                                    else
                                        sandAdhesionAddition = 0.15
                                    end
                                else
                                    if sandAdhesionAddition > 0 then
                                        sandAdhesionAddition = (sandAdhesionAddition - 0.12*cas)
                                    else
                                        sandAdhesionAddition = 0
                                    end
                                end

                                if plynuleValceSoucet > 0.1 and rychlostKolaKMHPodvozek2 > 5 then
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

                                decisiveAdhesionPodvozek1 = ambientAdhesion + brakeAdhesionAdditionPodvozek1 + randomDifferAdhesionPodvozek1 + math.max(math.min(sandAdhesionAddition, (5/rychlost)-0.15), 0)
                                decisiveAdhesionPodvozek2 = ambientAdhesion + brakeAdhesionAdditionPodvozek2 + randomDifferAdhesionPodvozek2 + math.max(math.min(sandAdhesionAddition, (5/rychlost)-0.15), 0)

                                if rychlost > 0 and predMasinou == 0 then
                                    decisiveAdhesionPodvozek1 = decisiveAdhesionPodvozek1 - firstAxleLossPodvozek1
                                elseif rychlost < 0 and zaMasinou == 0 then
                                    decisiveAdhesionPodvozek1 = decisiveAdhesionPodvozek1 - firstAxleLossPodvozek2
                                end

                                if adheseRandomCtdnPodvozek1 > 0 then
                                    if absolutniRychlost > 0.1 and absolutniRychlost < 15 and intenzitaSrazek ~= 0 then
                                        adheseRandomCtdnPodvozek1 = adheseRandomCtdnPodvozek1 - cas
                                    end
                                    adheseRandomPodvozek1 = math.random()/2+0.3
                                    adheseRandomLenCtuPodvozek1 = 0
                                elseif adheseRandomLenCtuPodvozek1 < 1 then
                                    decisiveAdhesionPodvozek1 = decisiveAdhesionPodvozek1 * adheseRandomPodvozek1
                                    adheseRandomLenCtuPodvozek1 = adheseRandomLenCtuPodvozek1 + cas
                                else
                                    adheseRandomCtdnPodvozek1 = math.random(40,200)
                                end
                                
                                if adheseRandomCtdnPodvozek2 > 0 then
                                    if absolutniRychlost > 0.1 and absolutniRychlost < 15 and intenzitaSrazek ~= 0 then
                                        adheseRandomCtdnPodvozek2 = adheseRandomCtdnPodvozek2 - cas
                                    end
                                    adheseRandomPodvozek2 = math.random()/2+0.3
                                    adheseRandomLenCtuPodvozek2 = 0
                                elseif adheseRandomLenCtuPodvozek2 < 1 then
                                    decisiveAdhesionPodvozek2 = decisiveAdhesionPodvozek2 * adheseRandomPodvozek2
                                    adheseRandomLenCtuPodvozek2 = adheseRandomLenCtuPodvozek2 + cas
                                else
                                    adheseRandomCtdnPodvozek2 = math.random(40,200)
                                end

                            --------------Adheze a skluz--------
                                if hlavniKontroler >= 0 then
                                    output_kN_TM1 = VratTCh(hlavniKontroler,absolutniRychlostKolaPodvozek1)*absolutniMax_kN/2
                                    output_kN_TM2 = VratTCh(hlavniKontroler,rychlostKolaPodvozek2)*absolutniMax_kN/2
                                    absolutnikN = VratTCh(hlavniKontroler,absolutniRychlost)*absolutniMax_kN/2
                                end
                                if hlavniKontroler > 0 and Q01 and K02 then
                                    positiveTractiveEffortForWheelslip_TM1 = math.max(absolutnikN,0)
                                    positiveTractiveEffortForWheelslip_TM2 = math.max(absolutnikN,0)
                                else
                                    positiveTractiveEffortForWheelslip_TM1 = 0
                                    positiveTractiveEffortForWheelslip_TM2 = 0
                                end
                                negativeTractiveEffortForWheelslip = math.abs(math.min(2*absolutnikN,0))+math.max(plynuleValce_zaOL2,plynuleValce_primocinne,Call("GetControlValue", "VirtualHandBrake", 0)*tlakValceMAX)/tlakValceMAX*200*max_tbc
                                tractiveEffortForWheelslip_TM1 = math.abs(positiveTractiveEffortForWheelslip_TM1-(negativeTractiveEffortForWheelslip/2))
                                tractiveEffortForWheelslip_TM2 = math.abs(positiveTractiveEffortForWheelslip_TM2-(negativeTractiveEffortForWheelslip/2))
                                
                                adhesiveTractiveForcePodvozek1 = ((((7500)/(absolutniRychlostKMH+44)+161)*0.001*9.81*decisiveAdhesionPodvozek1*84.5)/1.9)

                                if positiveTractiveEffortForWheelslip_TM1 > negativeTractiveEffortForWheelslip then
                                    if rychlost > 0 then
                                        cilovaRychlostKolaPodvozek1 = math.min(rychlost+math.max(0,tractiveEffortForWheelslip_TM1-adhesiveTractiveForcePodvozek1)/5,200)
                                    else
                                        cilovaRychlostKolaPodvozek1 = math.max(rychlost-math.max(0,tractiveEffortForWheelslip_TM1-adhesiveTractiveForcePodvozek1)/5,-200)
                                    end
                                else
                                    if rychlost > 0 then
                                        cilovaRychlostKolaPodvozek1 = math.max(rychlost-(math.max(0,(tractiveEffortForWheelslip_TM1-adhesiveTractiveForcePodvozek1)/10)^2),0)
                                    else
                                        cilovaRychlostKolaPodvozek1 = math.min(rychlost+(math.max(0,(tractiveEffortForWheelslip_TM1-adhesiveTractiveForcePodvozek1)/10)^2),0)
                                    end
                                end

                                if tractiveEffortForWheelslip_TM1 > adhesiveTractiveForcePodvozek1 then
                                    koefSpeedChange = 2
                                else
                                    koefSpeedChange = 15*math.max(1,plynuleValce_zaOL2)
                                end

                                if cilovaRychlostKolaPodvozek1 > rychlostKolaPodvozek1 then
                                    rychlostKolaPodvozek1 = math.min(rychlostKolaPodvozek1 + math.sqrt(cilovaRychlostKolaPodvozek1-rychlostKolaPodvozek1)*cas*koefSpeedChange, cilovaRychlostKolaPodvozek1)
                                elseif cilovaRychlostKolaPodvozek1 < rychlostKolaPodvozek1 then
                                    rychlostKolaPodvozek1 = math.max(rychlostKolaPodvozek1 - cas*koefSpeedChange, cilovaRychlostKolaPodvozek1)
                                end
                                if math.abs(rychlostKolaPodvozek1 - cilovaRychlostKolaPodvozek1) < 0.5 then
                                    rychlostKolaPodvozek1 = cilovaRychlostKolaPodvozek1
                                end
                                absolutniRychlostKolaPodvozek1 = math.abs(rychlostKolaPodvozek1)
                                rychlostKolaKMHPodvozek1 = absolutniRychlostKolaPodvozek1*3.6

                                outputTBC = idealTBC*((delkaVlaku-16.73563*math.min(pocetLoko,2))/delkaVlaku)
                                if math.max(0,tractiveEffortForWheelslip_TM1-adhesiveTractiveForcePodvozek1) < 5 then
                                    outputTBC = outputTBC + idealTBC*(8.367815*math.min(pocetLoko,2)/delkaVlaku)
                                else
                                    if positiveTractiveEffortForWheelslip_TM1 < negativeTractiveEffortForWheelslip then
                                        --output_kN_TM1 = output_kN_TM1*0.63245553203367586639977870888654
                                    outputTBC = outputTBC + idealTBC*(8.367815*math.min(pocetLoko,2)/delkaVlaku)*0.63245553203367586639977870888654
                                    else
                                        --output_kN_TM1 = output_kN_TM1*0.22360679774997896964091736687313
                                    end
                                end
                                
                                adhesiveTractiveForcePodvozek2 = ((((7500)/(absolutniRychlostKMH+44)+161)*0.001*9.81*decisiveAdhesionPodvozek2*84.5)/1.9)

                                if positiveTractiveEffortForWheelslip_TM2 > negativeTractiveEffortForWheelslip then
                                    if rychlost > 0 then
                                        cilovaRychlostKolaPodvozek2 = math.min(rychlost+math.max(0,tractiveEffortForWheelslip_TM2-adhesiveTractiveForcePodvozek2)/5,200)
                                    else
                                        cilovaRychlostKolaPodvozek2 = math.max(rychlost-math.max(0,tractiveEffortForWheelslip_TM2-adhesiveTractiveForcePodvozek2)/5,-200)
                                    end
                                else
                                    if rychlost > 0 then
                                        cilovaRychlostKolaPodvozek2 = math.max(rychlost-(math.max(0,(tractiveEffortForWheelslip_TM2-adhesiveTractiveForcePodvozek2)/10)^2),0)
                                    else
                                        cilovaRychlostKolaPodvozek2 = math.min(rychlost+(math.max(0,(tractiveEffortForWheelslip_TM2-adhesiveTractiveForcePodvozek2)/10)^2),0)
                                    end
                                end

                                if tractiveEffortForWheelslip_TM2 > adhesiveTractiveForcePodvozek2 then
                                    koefSpeedChange = 2
                                else
                                    koefSpeedChange = 15*math.max(1,plynuleValce_zaOL2)
                                end

                                if cilovaRychlostKolaPodvozek2 > rychlostKolaPodvozek2 then
                                    rychlostKolaPodvozek2 = math.min(rychlostKolaPodvozek2 + math.sqrt(cilovaRychlostKolaPodvozek2-rychlostKolaPodvozek2)*cas*koefSpeedChange,cilovaRychlostKolaPodvozek2)
                                elseif cilovaRychlostKolaPodvozek2 < rychlostKolaPodvozek2 then
                                    rychlostKolaPodvozek2 = math.max(rychlostKolaPodvozek2 - cas*koefSpeedChange,cilovaRychlostKolaPodvozek2)
                                end
                                if math.abs(rychlostKolaPodvozek2 - cilovaRychlostKolaPodvozek2) < 0.5 then
                                    rychlostKolaPodvozek2 = cilovaRychlostKolaPodvozek2
                                end
                                absolutniRychlostKolaPodvozek2 = math.abs(rychlostKolaPodvozek2)
                                rychlostKolaKMHPodvozek2 = absolutniRychlostKolaPodvozek2*3.6

                                if math.max(0,tractiveEffortForWheelslip_TM2-adhesiveTractiveForcePodvozek2) < 5 then
                                    outputTBC = outputTBC + idealTBC*(8.367815*math.min(pocetLoko,2)/delkaVlaku)
                                else
                                    if positiveTractiveEffortForWheelslip_TM2 < negativeTractiveEffortForWheelslip then
                                        --output_kN_TM2 = output_kN_TM2*0.63245553203367586639977870888654
                                        outputTBC = outputTBC + idealTBC*(8.367815*math.min(pocetLoko,2)/delkaVlaku)*0.63245553203367586639977870888654
                                    else
                                        --output_kN_TM2 = output_kN_TM2*0.22360679774997896964091736687313
                                    end
                                end

                                curvature = Call("GetCurvatureAhead", 0)*1000
                                curvature_round = round(curvature)

                                if absolutniRychlostKolaPodvozek1 < 1 and tractiveEffortForWheelslip_TM1 > adhesiveTractiveForcePodvozek1 and absolutniRychlost > 0.1 then
                                    --output_kN_TM1 = 0
                                    --outputTBC = outputTBC*0.4
                                    if tabulkaObuti[curvature_round] then
                                        tabulkaObuti[curvature_round] = math.min(tabulkaObuti[curvature_round] + cas*math.abs(rychlostKolaKMHPodvozek1-absolutniRychlostKMH)/200,1)
                                    else
                                        tabulkaObuti[curvature_round] = math.min(cas*math.abs(rychlostKolaKMHPodvozek1-absolutniRychlostKMH)/200,1)
                                    end
                                end
                                if absolutniRychlostKolaPodvozek2 < 1 and tractiveEffortForWheelslip_TM2 > adhesiveTractiveForcePodvozek2 and absolutniRychlost > 0.1 then
                                    --output_kN_TM2 = 0
                                    --outputTBC = outputTBC*0.4
                                    if tabulkaObuti[curvature_round] then
                                        tabulkaObuti[curvature_round] = math.min(tabulkaObuti[curvature_round] + cas*math.abs(rychlostKolaKMHPodvozek1-absolutniRychlostKMH)/200,1)
                                    else
                                        tabulkaObuti[curvature_round] = math.min(cas*math.abs(rychlostKolaKMHPodvozek1-absolutniRychlostKMH)/200,1)
                                    end
                                end

                                if (plynuleValce_zaOL2 > 0.1 and tractiveEffortForWheelslip_TM1 < adhesiveTractiveForcePodvozek1) or rychlostKolaKMHPodvozek1+5 > absolutniRychlostKMH then
                                    if tabulkaObuti[curvature_round] then
                                        tabulkaObuti[curvature_round] = math.max(tabulkaObuti[curvature_round] - cas*plynuleValce/1000,0)
                                    end
                                end
                                if (plynuleValce_zaOL2 > 0.1 and tractiveEffortForWheelslip_TM2 < adhesiveTractiveForcePodvozek2) or rychlostKolaKMHPodvozek2+5 > absolutniRychlostKMH then
                                    if tabulkaObuti[curvature_round] then
                                        tabulkaObuti[curvature_round] = math.max(tabulkaObuti[curvature_round] - cas*plynuleValce/1000,0)
                                    end
                                end

                                obutiVolume = 0
                                for k,v in pairs(tabulkaObuti) do
                                    if k ~= curvature then
                                        obutiVolume = math.max(obutiVolume, math.max(math.min(math.abs(1/(curvature-k)),2)-1,0)*v)
                                    else
                                        obutiVolume = math.max(obutiVolume, v)
                                    end
                                end

                                Call("SoundEngine:SetParameter", "obutiVolume", math.min(obutiVolume, math.max(0.6, 1-((absolutniRychlostKMH-60)/100)))) --math.min(obutiVolume, math.max(0.3, 1-((rychlostKMH-40)/60)))

                                if obutiDistance > 0 then
                                    if rychlostKolaKMHPodvozek1 > 0.2 then
                                        obutiDistance = obutiDistance - cas*absolutniRychlostKolaPodvozek1
                                    end
                                else
                                    obutiDistance = 2*math.pi*0.608905+obutiDistance
                                    obuti = 1-obuti
                                end
                                Call("SoundEngine:SetParameter", "obuti", obuti)
                                
                                Call("SetControlValue","TrainBrakeControl",0,outputTBC)
                                --Call("*:SetParameter", "WheelAbsoluteSpeed", absolutniRychlostKolaPodvozek1)
                                -- Call("SoundTMpredni:SetParameter", "WheelAbsoluteSpeed", rychlostKolaKMHPodvozek1)
                                -- Call("SoundTMzadni:SetParameter", "WheelAbsoluteSpeed", rychlostKolaKMHPodvozek2)
                                -- Call("SoundZdrze:SetParameter", "WheelAbsoluteSpeed", absolutniRychlostKolaPodvozek1)
                                -- Call("SoundLoziska:SetParameter", "WheelAbsoluteSpeed", absolutniRychlostKolaPodvozek1)
                                -- Call("EngineSound:SetParameter", "WheelAbsoluteSpeed", absolutniRychlostKolaPodvozek1)

                                koloPredniAnim = divRest(koloPredniAnim - (rychlostKolaPodvozek1*casHry)/(2*math.pi*0.608905),1)
                                koloZadniAnim = divRest(koloZadniAnim - (rychlostKolaPodvozek2*casHry)/(2*math.pi*0.608905),1)

                                Call("SetTime", "KolaPredni", koloPredniAnim)
                                Call("SetTime", "KolaZadni", koloZadniAnim)

                        --VYKON V SOUPRAVE
                            vykonJednotlive = (output_kN_TM1+output_kN_TM2)/absolutniMax_kN
                            if math.abs(vykonJednotlive-vykonJednotliveLast) > 0.00076923 or (vykonJednotlive == 0 and vykonVlastniLast ~= 0) then
                                --Call("SendConsistMessage",131990,ID..":"..vykonJednotlive,0)
                                if zaMasinouDvojicka then
                                    Call("SendConsistMessage",131990,ID..":"..vykonJednotlive,1)
                                end
                                tabulkaVykonu[ID] = vykonJednotlive
                                vykonJednotliveLast = vykonJednotlive
                            end

                            vykonSoucet = 0
                            lokoVTahu = 0
                            for k,v in tabulkaVykonu do
                                if v ~= 0 then
                                    vykonSoucet = vykonSoucet + v
                                    lokoVTahu = lokoVTahu + 1
                                end
                            end
                            if lokoVTahu ~= 0 then
                                --if throttleAndBrakeFiktivni > 0 then
                                vykonSoucet = vykonSoucet/lokoVTahu
                                --end
                            end
                            if vykonSoucet > 0 then
                                Call("SetControlValue","Regulator",0,vykonSoucet)
                            elseif vykonSoucet < 0 then
                                Call("SetControlValue","DynamicBrake",0,-vykonSoucet)
                            else
                                Call("SetControlValue","Regulator",0,0)
                                Call("SetControlValue","DynamicBrake",0,0)
                            end
                        --AMPERMETRY
                            if hlavniKontroler > 0.033 then
                                proudTM1, proudTM2 = VratProudy(output_kN_TM1, output_kN_TM2, hlavniKontroler, absolutniRychlostKolaPodvozek1, absolutniRychlostKolaPodvozek2)
                            elseif hlavniKontroler < -0.5 then
                            else
                                proudTM1 = 0
                                proudTM2 = 0
                            end
                            if (not K02 and hlavniKontroler >= 0) or not Q01 then
                                proudTM1 = 0
                                proudTM2 = 0
                            end
                            if hlavniKontroler < 0.594 and hlavniKontroler >= 0 then
                                proudTM1 = 0
                            end
                            proudTM1 = math.max(proudTM1,0)
                            proudTM2 = math.max(proudTM2,0)
                            if proudTM1 > proudTM1plynule then
                                proudTM1plynule = math.min(proudTM1plynule + math.sqrt(proudTM1-proudTM1plynule)*cas*100, proudTM1)
                            elseif proudTM1plynule > proudTM1 then
                                proudTM1plynule = math.max(proudTM1plynule - math.sqrt(proudTM1plynule-proudTM1)*cas*100, proudTM1)
                            end
                            if proudTM2 > proudTM2plynule then
                                proudTM2plynule = math.min(proudTM2plynule + math.sqrt(proudTM2-proudTM2plynule)*cas*100, proudTM2)
                            elseif proudTM2plynule > proudTM2 then
                                proudTM2plynule = math.max(proudTM2plynule - math.sqrt(proudTM2plynule-proudTM2)*cas*100, proudTM2)
                            end
                            Call("SetControlValue", "proudTM1", 0, proudTM1plynule)
                            Call("SetControlValue", "proudTM2", 0, proudTM2plynule)

                            Call("SetControlValue", "VirtualAmmeter", 0, proudTM1+proudTM2)
                        
                        --BATERIE
                            if napetiBaterie > 30 and K02 and baterie and napetiBaterie < 58 then
                                proudBaterie = proudBaterie - math.sqrt(58-napetiBaterie)*60
                            end
                            napetiBaterie = napetiBaterie - proudBaterie*cas/432000
                            proudBaterie = 0

                            vMetrBaterie = napetiBaterie*toInt(baterie)
                            if napetiBaterie > 30 and K02 and baterie and napetiBaterie < 58 then
                                vMetrBaterie = vMetrBaterie + (58-napetiBaterie)/2
                            end

                        --VOLTMETRY
                            for k, v in tabulkaNapeti do
                                oldMetry = tabulkaNapeti[k][1]
                                tabulkaNapeti[k][1] = oldMetry + rychlost * casHry
                                ZpravaDebug(tostring(tabulkaNapeti[k][1]).."m do napeti "..tostring(tabulkaNapeti[k][2])..":"..tostring(tabulkaNapeti[k][3]))
                                if tabulkaNapeti[k][1] >= 0 and oldMetry < 0 then
                                    tabulkaNapeti[k][3] = idealniNapeti
                                    idealniNapeti = tabulkaNapeti[k][2]
                                    ZpravaDebug("Nove napeti je "..tostring(idealniNapeti))
                                elseif tabulkaNapeti[k][1] <= 0 and oldMetry > 0 then
                                    tabulkaNapeti[k][2] = idealniNapeti
                                    idealniNapeti = tabulkaNapeti[k][3]
                                    ZpravaDebug("Nove napeti je "..tostring(idealniNapeti))
                                end
                                if tabulkaNapeti[k][1] >= -4 and oldMetry < -4 then
                                    idealniNapetiPZ = tabulkaNapeti[k][2]
                                    ZpravaDebug("Nove napeti predniho sberace je "..tostring(idealniNapetiPZ))
                                elseif tabulkaNapeti[k][1] <= -4 and oldMetry > -4 then
                                    idealniNapetiPZ = tabulkaNapeti[k][3]
                                    ZpravaDebug("Nove napeti predniho sberace je "..tostring(idealniNapetiPZ))
                                end
                                if tabulkaNapeti[k][1] >= 4 and oldMetry < 4 then
                                    idealniNapetiZZ = tabulkaNapeti[k][2]
                                    ZpravaDebug("Nove napeti zadniho sberace je "..tostring(idealniNapetiZZ))
                                elseif tabulkaNapeti[k][1] <= 4 and oldMetry > 4 then
                                    idealniNapetiZZ = tabulkaNapeti[k][3]
                                    ZpravaDebug("Nove napeti zadniho sberace je "..tostring(idealniNapetiZZ))
                                end
                            end
                            -- if not idealniNapetiPZ then
                            --     idealniNapetiPZ = 0
                            -- end
                            -- if not idealniNapetiZZ then
                            --     idealniNapetiZZ = 0
                            -- end

                            if idealniNapetiPZ ~= idealniNapetiZZ and sberac01Time >= 1 and Q03 and sberac02Time >= 1 and Q04 then
                                zkratSberace = true
                                Q03 = false
                                Q04 = false
                                K02 = false
                            end

                            if math.abs(napetiTargetDelta - napetiDelta) < 1 and obsazena then
                                napetiTargetDelta = math.random()*800-400
                                napetiDeltaSpeed = math.random(1,20)
                                Call("SendConsistMessage",131014,napetiDeltaSpeed..":"..napetiTargetDelta,1)
                            end
                            if napetiTargetDelta > napetiDelta then
                                napetiDelta = napetiDelta + napetiDeltaSpeed*cas
                            else
                                napetiDelta = napetiDelta - napetiDeltaSpeed*cas
                            end

                            if math.abs(tvrdostNapetiTarget - tvrdostNapeti) < 1 and obsazena then
                                tvrdostNapetiTarget = math.random()*300
                                Call("SendConsistMessage",131015,tvrdostNapetiTarget,1)
                            end
                            if tvrdostNapetiTarget > tvrdostNapeti then
                                tvrdostNapeti = tvrdostNapeti + 1*cas
                            else
                                tvrdostNapeti = tvrdostNapeti - 1*cas
                            end

                            vychoziNapeti = math.max(idealniNapetiPZ*toInt(sberac01Time>=1 and Q03), idealniNapetiZZ*toInt(sberac02Time>=1 and Q04))
                            if vychoziNapeti == 0 or not ((sberac01Time >= 1 and Q03) or (sberac02Time >= 1 and Q04)) then
                                napeti = 0
                            else
                                if proudTM1+proudTM2 > 0 and hlavniKontroler > 0.033 then
                                    napeti = (vychoziNapeti - ((proudTM1+proudTM2)*tvrdostNapeti/600)) + napetiDelta
                                else
                                    napeti = vychoziNapeti + napetiDelta
                                end
                            end
                            napetiTrolej = math.min(math.max(napeti,0),4000)
                            if napetiTrolej > napetiTrolejPlynule then
                                napetiTrolejPlynule = napetiTrolejPlynule + math.sqrt(napetiTrolej-napetiTrolejPlynule)*cas*100
                            elseif napetiTrolejPlynule > napetiTrolej then
                                napetiTrolejPlynule = napetiTrolejPlynule - math.sqrt(napetiTrolejPlynule-napetiTrolej)*cas*100
                            end
                            Call("SetControlValue", "UTrol", 0, napetiTrolejPlynule)
                            if vMetrBaterie > vMetrBateriePlynule then
                                vMetrBateriePlynule = vMetrBateriePlynule + math.sqrt(vMetrBaterie-vMetrBateriePlynule)*cas*10
                            elseif vMetrBateriePlynule > vMetrBaterie then
                                vMetrBateriePlynule = vMetrBateriePlynule - math.sqrt(vMetrBateriePlynule-vMetrBaterie)*cas*10
                            end
                            Call("SetControlValue", "UBat", 0, vMetrBateriePlynule)

                        --KLAPKOVNIK
                            S181 = Call("GetControlValue", "klapkovnikTlac", 0) > 0.5
                            klapka1H = (DOHO or (Call("GetControlValue", "1H", 0) > 0.5 and not S181)) and baterie and F111
                            klapka2H = (DOPO or (Call("GetControlValue", "2H", 0) > 0.5 and not S181)) and baterie and F111
                            klapka3H = (false or (Call("GetControlValue", "3H", 0) > 0.5 and not S181)) and baterie and F111
                            klapka4H = (false or (Call("GetControlValue", "4H", 0) > 0.5 and not S181)) and baterie and F111
                            klapka5H = (strataVentilacie or (Call("GetControlValue", "5H", 0) > 0.5 and not S181)) and baterie and F111
                            klapka6H = (nadprudVK or (Call("GetControlValue", "6H", 0) > 0.5 and not S181)) and baterie and F111

                            K111 = klapka1H or klapka2H or klapka3H or klapka4H or klapka5H or klapka6H
                            proudBaterie = proudBaterie + (toInt(klapka1H) + toInt(klapka2H) + toInt(klapka3H) + toInt(klapka4H) + toInt(klapka5H) + toInt(klapka6H))/10

                            Call("SetControlValue", "1H", 0, toInt(klapka1H))
                            Call("SetControlValue", "2H", 0, toInt(klapka2H))
                            Call("SetControlValue", "3H", 0, toInt(klapka3H))
                            Call("SetControlValue", "4H", 0, toInt(klapka4H))
                            Call("SetControlValue", "5H", 0, toInt(klapka5H))
                            Call("SetControlValue", "6H", 0, toInt(klapka6H))
                            
                        --KONTROLKY A SIGNALKY
                            F111 = Call("GetControlValue", "F111", 0)
                            Call("SetControlValue", "signalkaShunty", 0, toInt((stupenHK > 40 or (stupenHK > 1 and stupenHK <= 3)) and baterie and F101))
                            Call("SetControlValue", "signalkaOdpory", 0, toInt(((stupenHK > 0 and stupenHK < 26) or (stupenHK > 28 and stupenHK < 40)) and baterie and F101))
                            Call("SetControlValue", "signalkaOdporyKoncova", 0, toInt(((stupenHKKoncova > 0 and stupenHKKoncova < 26) or (stupenHKKoncova > 28 and stupenHKKoncova < 40))))
                            Call("SetControlValue", "signalkaZaver", 0, toInt(BSE_YZ and baterie and F101))
                            Call("SetControlValue", "signalkaPrutok", 0, toInt(BSE_zvysenyPrutok and baterie and F101))
                            indikaceHVLast = indikaceHV
                            indikaceHV = (0-toInt(baterie and F104 and Q01)+toInt(baterie and F104 and not Q01))/2
                            indikaceHVKoncovaLast = indikaceHVKoncova
                            indikaceHVKoncova = (0-toInt(X202cizi[16] and vedouci)+toInt(X202cizi[17] and vedouci))/2
                            indikaceTopeniLast = indikaceTopeni
                            indikaceTopeni = (0-toInt(vodic211 and (((K85 or X202cizi[11]) and poruchaKoncova or jednotlive) or (X202cizi[12] and S119)))+toInt(vodic211 and not S119))/2
                            if indikaceHV ~= indikaceHVLast or math.abs(indikaceHVOut-prekmitIndikaceHV) < 0.05 then
                                if indikaceHVOut - indikaceHV > 0.05 then
                                    prekmitIndikaceHV = indikaceHV - (indikaceHVOut - indikaceHV)/1.3
                                elseif indikaceHVOut - indikaceHV < -0.05 then
                                    prekmitIndikaceHV = indikaceHV + (indikaceHV - indikaceHVOut)/1.3
                                else
                                    prekmitIndikaceHV = indikaceHV
                                end
                            end
                            if prekmitIndikaceHV - indikaceHVOut > 0.05 then
                                indikaceHVOut = math.min(indikaceHVOut + math.sqrt(prekmitIndikaceHV-indikaceHVOut)*cas*20,prekmitIndikaceHV)
                            elseif prekmitIndikaceHV - indikaceHVOut < -0.05 then
                                indikaceHVOut = math.max(indikaceHVOut - math.sqrt(indikaceHVOut-prekmitIndikaceHV)*cas*20,prekmitIndikaceHV)
                            else
                                indikaceHVOut = indikaceHV
                            end
                            Call("SetControlValue", "indikaceHVvedouci", 0, indikaceHVOut)
                            if indikaceHVKoncova ~= indikaceHVKoncovaLast or math.abs(indikaceHVKoncovaOut-prekmitIndikaceHVKoncova) < 0.05 then
                                if indikaceHVKoncovaOut - indikaceHVKoncova > 0.05 then
                                    prekmitIndikaceHVKoncova = indikaceHVKoncova - (indikaceHVKoncovaOut - indikaceHVKoncova)/1.3
                                elseif indikaceHVKoncovaOut - indikaceHVKoncova < -0.05 then
                                    prekmitIndikaceHVKoncova = indikaceHVKoncova + (indikaceHVKoncova - indikaceHVKoncovaOut)/1.3
                                else
                                    prekmitIndikaceHVKoncova = indikaceHVKoncova
                                end
                            end
                            if prekmitIndikaceHVKoncova - indikaceHVKoncovaOut > 0.05 then
                                indikaceHVKoncovaOut = math.min(indikaceHVKoncovaOut + math.sqrt(prekmitIndikaceHVKoncova-indikaceHVKoncovaOut)*cas*20,prekmitIndikaceHVKoncova)
                            elseif prekmitIndikaceHVKoncova - indikaceHVKoncovaOut < -0.05 then
                                indikaceHVKoncovaOut = math.max(indikaceHVKoncovaOut - math.sqrt(indikaceHVKoncovaOut-prekmitIndikaceHVKoncova)*cas*20,prekmitIndikaceHVKoncova)
                            else
                                indikaceHVKoncovaOut = indikaceHVKoncova
                            end
                            Call("SetControlValue", "indikaceHVkoncova", 0, indikaceHVKoncovaOut)
                            if indikaceTopeni ~= indikaceTopeniLast or math.abs(indikaceTopeniOut-prekmitIndikaceTopeni) < 0.05 then
                                if indikaceTopeniOut - indikaceTopeni > 0.05 then
                                    prekmitIndikaceTopeni = indikaceTopeni - (indikaceTopeniOut - indikaceTopeni)/1.3
                                elseif indikaceTopeniOut - indikaceTopeni < -0.05 then
                                    prekmitIndikaceTopeni = indikaceTopeni + (indikaceTopeni - indikaceTopeniOut)/1.3
                                else
                                    prekmitIndikaceTopeni = indikaceTopeni
                                end
                            end
                            if prekmitIndikaceTopeni - indikaceTopeniOut > 0.05 then
                                indikaceTopeniOut = math.min(indikaceTopeniOut + math.sqrt(prekmitIndikaceTopeni-indikaceTopeniOut)*cas*20,prekmitIndikaceTopeni)
                            elseif prekmitIndikaceTopeni - indikaceTopeniOut < -0.05 then
                                indikaceTopeniOut = math.max(indikaceTopeniOut - math.sqrt(indikaceTopeniOut-prekmitIndikaceTopeni)*cas*20,prekmitIndikaceTopeni)
                            else
                                indikaceTopeniOut = indikaceTopeni
                            end
                            Call("SetControlValue", "indikaceTopeniVlaku", 0, indikaceTopeniOut)
                            
                            --signalizace poruch
                                H1prep = Call("GetControlValue", "diagPrep01", 0) < 0.5
                                H2prep = Call("GetControlValue", "diagPrep02", 0) < 0.5
                                H3prep = Call("GetControlValue", "diagPrep03", 0) < 0.5
                                H4prep = Call("GetControlValue", "diagPrep04", 0) < 0.5
                                H5prep = Call("GetControlValue", "diagPrep05", 0) < 0.5

                                H1 = baterie and F111 and K111
                                H2 = X204cizi[13]
                                H4 = MIRER.poruchy["V-LTS-410 A"] and MIRER.poruchy["K-LTS-410 A"]
                                H5 = MIRER.poruchy["V-LTS-510 A"] and MIRER.poruchy["K-LTS-510 A"]
                                H6 = baterie and F111 and ((absolutniRychlostKolaPodvozek1-5 > absolutniRychlost) or (absolutniRychlostKolaPodvozek2-5 > absolutniRychlost))
                                H7 = baterie and F111 and not K152
                                H8 = false
                                X204vlastni[12] = H1
                                X204vlastni[14] = H7
                                X204vlastni[15] = H6
                                if (H1 and H1prep) or (H2 and H2prep) or (H3 and H3prep) or (H4 and H4prep) or (H5 and H5prep) or H6 or X204cizi[15] then
                                    if impulsorDelay > 0.65 or (not impulsor and impulsorDelay > 0.221) then
                                        impulsor = not impulsor
                                        impulsorDelay = 0
                                    else
                                        impulsorDelay = impulsorDelay + cas
                                    end
                                else
                                    impulsor = false
                                    impulsorDelay = 1
                                end
                                Call("SetControlValue", "H01", 0, toInt(X204vlastni[12] and (impulsor or not H1prep)))
                                Call("SetControlValue", "H02", 0, toInt(X204cizi[13] and (impulsor or not H2prep)))
                                Call("SetControlValue", "H03", 0, toInt(H3 and (impulsor or not H3prep)))
                                Call("SetControlValue", "H04", 0, toInt(MIRER.poruchy["V-LTS-410 A"] and MIRER.poruchy["K-LTS-410 A"] and (impulsor or not H4prep)))
                                Call("SetControlValue", "H05", 0, toInt(MIRER.poruchy["V-LTS-510 A"] and MIRER.poruchy["K-LTS-510 A"] and (impulsor or not H5prep)))
                                Call("SetControlValue", "H06", 0, toInt((X204vlastni[15] or X204cizi[15]) and impulsor))
                                Call("SetControlValue", "H07", 0, toInt(X204vlastni[14]))
                                Call("SetControlValue", "H08", 0, 0)
                                Call("SetControlValue", "H09", 0, toInt(H9))
                                Call("SetControlValue", "H10", 0, toInt(H10))

                                Call("SetControlValue", "KontrolkaPor", 0, toInt(impulsor))

                                if X204vlastni[15] or X204cizi[15] then
                                    MIREL:Skluz()
                                end

                                proudBaterie = proudBaterie + toInt(impulsor)/5

                        --STERACE
                            S185 = Call("GetControlValue", "sterace", 0)
                            if baterie and Call("GetControlValue", "F129", 0) > 0.9 then
                                if S185 < -0.75 then
                                    steraceAnim1 = steraceAnim1+cas*steraceAnim1Smer_skutecny*2
                                    steraceAnim2 = steraceAnim2+cas*steraceAnim2Smer_skutecny*1.91
                                elseif S185 < -0.25 then
                                    steraceAnim1 = steraceAnim1+cas*steraceAnim1Smer_skutecny*0.75
                                    steraceAnim2 = steraceAnim2+cas*steraceAnim2Smer_skutecny*0.72
                                else
                                    if steraceAnim1 >= 0.1 then
                                        steraceAnim1 = steraceAnim1+cas*steraceAnim1Smer_skutecny*0.75
                                    end
                                    if steraceAnim2 >= 0.1 then
                                        steraceAnim2 = steraceAnim2+cas*steraceAnim2Smer_skutecny*0.72
                                    end
                                end
                                if steraceAnim1 >= 0.9 then
                                    steraceAnim1Smer = -1
                                elseif steraceAnim1 <= 0.1 then
                                    steraceAnim1Smer = 1
                                end
                                if steraceAnim1Smer > steraceAnim1Smer_skutecny then
                                    steraceAnim1Smer_skutecny = steraceAnim1Smer_skutecny + math.sqrt(steraceAnim1Smer-steraceAnim1Smer_skutecny)*cas*10
                                elseif steraceAnim1Smer_skutecny > steraceAnim1Smer then
                                    steraceAnim1Smer_skutecny = steraceAnim1Smer_skutecny - math.sqrt(steraceAnim1Smer_skutecny-steraceAnim1Smer)*cas*10
                                end
                                if steraceAnim2 >= 0.9 then
                                    steraceAnim2Smer = -1
                                elseif steraceAnim2 <= 0.1 then
                                    steraceAnim2Smer = 1
                                end
                                if steraceAnim2Smer > steraceAnim2Smer_skutecny then
                                    steraceAnim2Smer_skutecny = steraceAnim2Smer_skutecny + math.sqrt(steraceAnim2Smer-steraceAnim2Smer_skutecny)*cas*10
                                elseif steraceAnim2Smer_skutecny > steraceAnim2Smer then
                                    steraceAnim2Smer_skutecny = steraceAnim2Smer_skutecny - math.sqrt(steraceAnim2Smer_skutecny-steraceAnim2Smer)*cas*10
                                end
                                steraceAnim1 = math.max(math.min(steraceAnim1,1),0)
                                steraceAnim2 = math.max(math.min(steraceAnim2,1),0)
                            end
                            Call("SetTime", "WiperA", steraceAnim1)
                            Call("SetTime", "WiperB", steraceAnim2)
                            Call("SetControlValue", "WiperA", 0, steraceAnim1)
                            Call("SetControlValue", "WiperB", 0, steraceAnim2)

                        --TEST
                            Call("SetControlValue", "kN", 0, output_kN_TM1+output_kN_TM2)
                            Call("SetControlValue", "stupenHK", 0, stupenHK)
                            Call("SetControlValue", "shunt", 0, round(math.max((hlavniKontroler - 0.88)/0.022,0)))
                            Call("SetControlValue", "rychlostKMH", 0, rychlostKMH)

                        --ZVUKY
                            oknoP = Call("GetControlValue", "OknoP", 0)
                            oknoL = Call("GetControlValue", "OknoL", 0)
                            zvkExDoIn = math.max(toInt(venku),oknoP,oknoL)
                            ventilatoryOdporOtackyTarget = math.sqrt(math.max(proudTM1, proudTM2))/2.5*toInt(HKodpor)
                            if ventilatoryOdporOtackyTarget > ventilatoryOdporOtacky then
                                ventilatoryOdporOtacky = math.min(ventilatoryOdporOtacky + math.sqrt(ventilatoryOdporOtackyTarget-ventilatoryOdporOtacky)*cas*0.8,ventilatoryOdporOtackyTarget,100)
                            elseif ventilatoryOdporOtackyTarget < ventilatoryOdporOtacky then
                                ventilatoryOdporOtacky = math.max(ventilatoryOdporOtacky - math.sqrt(ventilatoryOdporOtacky-ventilatoryOdporOtackyTarget)*cas*1.5,0)
                            end
                            -- Call("SoundEngine:SetParameter","ZvukExDoIn",zvkExDoIn)
                            -- Call("SoundCab:SetParameter","ZvukExDoIn",zvkExDoIn)
                            -- Call("SoundBrzdice:SetParameter","ZvukExDoIn",zvkExDoIn)
                            Call("SetControlValue", "ZvukExDoIn", 0, zvkExDoIn)
                            Call("SoundEngine:SetParameter","LoopZvukEx",toInt(venku))
                            Call("SoundCab:SetParameter","LoopZvukEx",toInt(venku))
                            Call("SoundEngine:SetParameter","VentilatoryOtacky",ventilatoryOdporOtacky)
                            Call("SoundEngine:SetParameter","Ventilatory",0)
                            --Call("SoundEngine:SetParameter","Ventilatory",math.sqrt(ventilatoryOdporOtacky*proudTM2))
                            Call("SoundEngine:SetParameter","TlakBV",VirtualDistributorLocoBrakeCylinderPressureBAR)
                            Call("SoundTMzadni:SetParameter","ProudTM",proudTM2)
                            if hlavniKontroler <= 26 then
                                Call("SoundTMpredni:SetParameter","ProudTM",proudTM2)
                            else
                                Call("SoundTMpredni:SetParameter","ProudTM",proudTM1)
                            end
                            Call("SoundTMpredni:SetParameter","WheelAbsoluteSpeed",absolutniRychlostKolaPodvozek1)
                            Call("SoundTMzadni:SetParameter","WheelAbsoluteSpeed",absolutniRychlostKolaPodvozek2)

                            Call("SoundCab:SetParameter","LTSpip",toInt(impulsor))
                    end
                end
            elseif not wasUserControlled then --AI
                if firstStart then
                    firstStart = false
                    if not isDed then
                        sberac01Time = 1
                        sberac02Time = 1
                    else
                        sberac01Time = 0
                        sberac02Time = 0
                    end
                    predMasinou = Call("SendConsistMessage",131999,"DUMMY",0)
                    zaMasinou = Call("SendConsistMessage",131999,"DUMMY",1)
                    Call("SetTime", "Panto01", sberac01Time)
                    Call("SetTime", "Panto02", sberac02Time)
                end
                if not isDed then
                    if absolutniRychlostKMH < 2 then
                        sberac01 = true
                        sberac02 = true
                    else
                        if rychlost > 0 then
                            if sberac02Time >= 1 then
                                sberac01 = false
                            else
                                sberac01 = true
                            end
                            sberac02 = true
                        else
                            sberac01 = true
                            if sberac01Time >= 1 then
                                sberac02 = false
                            else
                                sberac02 = true
                            end
                        end
                    end
                else
                    sberac01 = false
                    sberac02 = false
                end

                koloPredniAnim = divRest(koloPredniAnim - (rychlost*casHry)/(2*math.pi*0.608905),1)
                koloZadniAnim = divRest(koloZadniAnim - (rychlost*casHry)/(2*math.pi*0.608905),1)

                Call("SetTime", "KolaPredni", koloPredniAnim)
                Call("SetTime", "KolaZadni", koloZadniAnim)
                
                Call("Zarivka02a:Activate",0)
                Call("Zarivka02b:Activate",0)
                Call("ActivateNode","osvetleniPodvozkuSvitici",0)
                Call("ActivateNode","osvetleniPodvozku",1)
                Call("SvetloPodvozek1:Activate",0)
                Call("SvetloPodvozek2:Activate",0)
                Call("SvetloPodvozek3:Activate",0)
                Call("SvetloPodvozek4:Activate",0)
                Call("SvetloPodvozek5:Activate",0)
                Call("SvetloPodvozek6:Activate",0)
                Call("SvetloPodvozek7:Activate",0)
                Call("SvetloPodvozek8:Activate",0)
                Call("SvetloStrojovna1:Activate",0)
                Call("SvetloStrojovna2:Activate",0)
                Call("SvetloStrojovna3:Activate",0)
                Call("SvetloStrojovna4:Activate",0)
                Call("SvetloStrojovna5:Activate",0)
                Call("SvetloStrojovna6:Activate",0)
                Call("SvetloStrojovna7:Activate",0)
                Call("SvetloStrojovna8:Activate",0)
                Call("SvetloStrojovna9:Activate",0)
                Call("SvetloStrojovna10:Activate",0)

                if isDed and predMasinou == 0 then
                else
                end

                -- deltaSpeedMinula = deltaSpeed
                -- deltaSpeed = (absolutniRychlost - math.abs(deltaSpeedMinula))*casHry
                deltaSpeed = Call("GetAcceleration")
                local reflektorAI = false
                --Call("SetControlValue", "DeltaSpeed", 0, deltaSpeed)
                if predMasinou == 0 and not isDed then
                    svetlaAI = 1
                else
                    svetlaAI = 0
                end
                if rychlost > 0.05 then
                    smerAI = 1
                elseif rychlost < -0.05 then
                    smerAI = -1
                elseif not isDed then
                    reflektorAI = false
                    reflektorTyp = round(math.random(5)-0.5)
                end
                -- ZpravaDebug(Call("PlayerEngine:GetControlValue", "Headlights", 0))
                if svetlaAI == 1 then
                    if absolutniRychlostKMH > 5 then
                        ujeteMetryAI = ujeteMetryAI + (absolutniRychlost*cas)
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
                        Call("Zarivka01a:Activate",0)
                        Call("Zarivka01b:Activate",0)
                    else
                        ujeteMetryAI = 0
                        casPlayerReflektor = 0
                        reflektorAI = false
                        if SysCall("ScenarioManager:GetSeason") ~= 3 then
                            if dennicas > 063000 or dennicas < 220000 then
                                Call("Zarivka01a:Activate",0)
                                Call("Zarivka01b:Activate",0)
                            end
                        else
                            if dennicas > 080000 or dennicas < 163000 then
                                Call("Zarivka01a:Activate",0)
                                Call("Zarivka01b:Activate",0)
                            end
                        end
                    end
                    if smerAI == -1 then
                        Call("ActivateNode","pozickaLCr",1)
                        Call("ActivateNode","pozickaLZl",0)
                        Call("ActivateNode","pozickaPCr",1)
                        Call("ActivateNode","pozickaPZl",0)
                        Call("ActivateNode","reflektorPPL",0)
                        Call("ActivateNode","reflektorPTL",0)
                        Call("ActivateNode","reflektorLPL",0)
                        Call("ActivateNode","reflektorLTL",0)
                        Call("PozBilaLeva:Activate", 0)
                        Call("PozBilaPrava:Activate", 0)
                        Call("PozCervenaLevaPredni:Activate", 1)
                        Call("PozCervenaPravaPredni:Activate", 1)
                        Call("ReflektorLevyTlumeny:Activate", 0)
                        Call("ReflektorPravyTlumeny:Activate", 0)
                        Call("ReflektorLevyPlny:Activate", 0)
                        Call("ReflektorPravyPlny:Activate", 0)
                    elseif smerAI == 1 then
                        if SysCall("ScenarioManager:GetSeason") ~= 3 then
                            if dennicas < 063000 or dennicas > 220000 then
                                if reflektorAI then
                                    if reflektorTyp == 0 then
                                        Call("ActivateNode","reflektorPPL",0)
                                        Call("ActivateNode","reflektorPTL",0)
                                        Call("ActivateNode","reflektorLPL",1)
                                        Call("ActivateNode","reflektorLTL",0)
                                        Call("ReflektorLevyTlumeny:Activate", 0)
                                        Call("ReflektorPravyTlumeny:Activate", 0)
                                        Call("ReflektorLevyPlny:Activate", 1)
                                        Call("ReflektorPravyPlny:Activate", 0)
                                    elseif reflektorTyp == 1 then
                                        Call("ActivateNode","reflektorPPL",1)
                                        Call("ActivateNode","reflektorPTL",0)
                                        Call("ActivateNode","reflektorLPL",0)
                                        Call("ActivateNode","reflektorLTL",0)
                                        Call("ReflektorLevyTlumeny:Activate", 0)
                                        Call("ReflektorPravyTlumeny:Activate", 0)
                                        Call("ReflektorLevyPlny:Activate", 0)
                                        Call("ReflektorPravyPlny:Activate", 1)
                                    elseif reflektorTyp == 2 then
                                        Call("ActivateNode","reflektorPPL",0)
                                        Call("ActivateNode","reflektorPTL",1)
                                        Call("ActivateNode","reflektorLPL",0)
                                        Call("ActivateNode","reflektorLTL",1)
                                        Call("ReflektorLevyTlumeny:Activate", 1)
                                        Call("ReflektorPravyTlumeny:Activate", 1)
                                        Call("ReflektorLevyPlny:Activate", 0)
                                        Call("ReflektorPravyPlny:Activate", 0)
                                    else
                                        Call("ActivateNode","reflektorPPL",1)
                                        Call("ActivateNode","reflektorPTL",0)
                                        Call("ActivateNode","reflektorLPL",1)
                                        Call("ActivateNode","reflektorLTL",0)
                                        Call("ReflektorLevyTlumeny:Activate", 0)
                                        Call("ReflektorPravyTlumeny:Activate", 0)
                                        Call("ReflektorLevyPlny:Activate", 1)
                                        Call("ReflektorPravyPlny:Activate", 1)
                                    end
                                else
                                    Call("ActivateNode","reflektorPPL",0)
                                    Call("ActivateNode","reflektorPTL",0)
                                    Call("ActivateNode","reflektorLPL",0)
                                    Call("ActivateNode","reflektorLTL",0)
                                    Call("ReflektorLevyTlumeny:Activate", 0)
                                    Call("ReflektorPravyTlumeny:Activate", 0)
                                    Call("ReflektorLevyPlny:Activate", 0)
                                    Call("ReflektorPravyPlny:Activate", 0)
                                end
                                Call("ActivateNode","pozickaLCr",0)
                                Call("ActivateNode","pozickaLZl",1)
                                Call("ActivateNode","pozickaPCr",0)
                                Call("ActivateNode","pozickaPZl",1)
                                Call("PozBilaLeva:Activate", 0)
                                Call("PozBilaPrava:Activate", 0)
                                Call("PozCervenaLevaPredni:Activate", 0)
                                Call("PozCervenaPravaPredni:Activate", 0)
                                Call("ReflektorLevyTlumeny:Activate", 0)
                                Call("ReflektorPravyTlumeny:Activate", 0)
                                Call("ReflektorLevyPlny:Activate", 0)
                                Call("ReflektorPravyPlny:Activate", 0)
                            elseif dennicas > 063000 and dennicas < 220000 then
                                Call("ActivateNode","reflektorPPL",0)
                                Call("ActivateNode","reflektorPTL",0)
                                Call("ActivateNode","reflektorLPL",0)
                                Call("ActivateNode","reflektorLTL",0)
                                Call("ActivateNode","pozickaLCr",0)
                                Call("ActivateNode","pozickaLZl",1)
                                Call("ActivateNode","pozickaPCr",0)
                                Call("ActivateNode","pozickaPZl",1)
                                Call("PozBilaLeva:Activate", 1)
                                Call("PozBilaPrava:Activate", 1)
                                Call("PozCervenaLevaPredni:Activate", 0)
                                Call("PozCervenaPravaPredni:Activate", 0)
                                Call("ReflektorLevyTlumeny:Activate", 0)
                                Call("ReflektorPravyTlumeny:Activate", 0)
                                Call("ReflektorLevyPlny:Activate", 0)
                                Call("ReflektorPravyPlny:Activate", 0)
                            end
                        else
                            if dennicas < 080000 or dennicas > 163000 then
                                if reflektorAI then
                                    if reflektorTyp == 0 then
                                        Call("ActivateNode","reflektorPPL",0)
                                        Call("ActivateNode","reflektorPTL",0)
                                        Call("ActivateNode","reflektorLPL",1)
                                        Call("ActivateNode","reflektorLTL",0)
                                        Call("ReflektorLevyTlumeny:Activate", 0)
                                        Call("ReflektorPravyTlumeny:Activate", 0)
                                        Call("ReflektorLevyPlny:Activate", 1)
                                        Call("ReflektorPravyPlny:Activate", 0)
                                    elseif reflektorTyp == 1 then
                                        Call("ActivateNode","reflektorPPL",1)
                                        Call("ActivateNode","reflektorPTL",0)
                                        Call("ActivateNode","reflektorLPL",0)
                                        Call("ActivateNode","reflektorLTL",0)
                                        Call("ReflektorLevyTlumeny:Activate", 0)
                                        Call("ReflektorPravyTlumeny:Activate", 0)
                                        Call("ReflektorLevyPlny:Activate", 0)
                                        Call("ReflektorPravyPlny:Activate", 1)
                                    elseif reflektorTyp == 2 then
                                        Call("ActivateNode","reflektorPPL",0)
                                        Call("ActivateNode","reflektorPTL",1)
                                        Call("ActivateNode","reflektorLPL",0)
                                        Call("ActivateNode","reflektorLTL",1)
                                        Call("ReflektorLevyTlumeny:Activate", 1)
                                        Call("ReflektorPravyTlumeny:Activate", 1)
                                        Call("ReflektorLevyPlny:Activate", 0)
                                        Call("ReflektorPravyPlny:Activate", 0)
                                    else
                                        Call("ActivateNode","reflektorPPL",1)
                                        Call("ActivateNode","reflektorPTL",0)
                                        Call("ActivateNode","reflektorLPL",1)
                                        Call("ActivateNode","reflektorLTL",0)
                                        Call("ReflektorLevyTlumeny:Activate", 0)
                                        Call("ReflektorPravyTlumeny:Activate", 0)
                                        Call("ReflektorLevyPlny:Activate", 1)
                                        Call("ReflektorPravyPlny:Activate", 1)
                                    end
                                else
                                    Call("ActivateNode","reflektorPPL",0)
                                    Call("ActivateNode","reflektorPTL",0)
                                    Call("ActivateNode","reflektorLPL",0)
                                    Call("ActivateNode","reflektorLTL",0)
                                    Call("ReflektorLevyTlumeny:Activate", 0)
                                    Call("ReflektorPravyTlumeny:Activate", 0)
                                    Call("ReflektorLevyPlny:Activate", 0)
                                    Call("ReflektorPravyPlny:Activate", 0)
                                end
                                Call("ActivateNode","pozickaLCr",0)
                                Call("ActivateNode","pozickaLZl",1)
                                Call("ActivateNode","pozickaPCr",0)
                                Call("ActivateNode","pozickaPZl",1)
                            elseif dennicas > 080000 and dennicas < 163000 then
                                Call("ActivateNode","reflektorPPL",0)
                                Call("ActivateNode","reflektorPTL",0)
                                Call("ActivateNode","reflektorLPL",0)
                                Call("ActivateNode","reflektorLTL",0)
                                Call("ActivateNode","pozickaLCr",0)
                                Call("ActivateNode","pozickaLZl",1)
                                Call("ActivateNode","pozickaPCr",0)
                                Call("ActivateNode","pozickaPZl",1)
                                Call("PozBilaLeva:Activate", 1)
                                Call("PozBilaPrava:Activate", 1)
                                Call("PozCervenaLevaPredni:Activate", 0)
                                Call("PozCervenaPravaPredni:Activate", 0)
                                Call("ReflektorLevyTlumeny:Activate", 0)
                                Call("ReflektorPravyTlumeny:Activate", 0)
                                Call("ReflektorLevyPlny:Activate", 0)
                                Call("ReflektorPravyPlny:Activate", 0)
                            end
                        end
                    else
                        Call("ActivateNode","reflektorPPL",0)
                        Call("ActivateNode","reflektorPTL",0)
                        Call("ActivateNode","reflektorLPL",0)
                        Call("ActivateNode","reflektorLTL",0)
                        Call("ActivateNode","pozickaLCr",0)
                        Call("ActivateNode","pozickaLZl",0)
                        Call("ActivateNode","pozickaPCr",0)
                        Call("PozBilaLeva:Activate", 0)
                        Call("PozCervenaLevaPredni:Activate", 0)
                        Call("PozCervenaPravaPredni:Activate", 0)
                        Call("ReflektorLevyTlumeny:Activate", 0)
                        Call("ReflektorPravyTlumeny:Activate", 0)
                        Call("ReflektorLevyPlny:Activate", 0)
                        Call("ReflektorPravyPlny:Activate", 0)
                        if predMasinou == 0 then
                            Call("ActivateNode","pozickaPZl",1)
                            Call("PozBilaPrava:Activate", 1)
                        else
                            Call("ActivateNode","pozickaPZl",0)
                            Call("PozBilaPrava:Activate", 0)
                        end
                    end
                else
                    Call("ActivateNode","reflektorPPL",0)
                    Call("ActivateNode","reflektorPTL",0)
                    Call("ActivateNode","reflektorLPL",0)
                    Call("ActivateNode","reflektorLTL",0)
                    Call("ActivateNode","pozickaLCr",0)
                    Call("ActivateNode","pozickaLZl",0)
                    Call("ActivateNode","pozickaPCr",0)
                    Call("ActivateNode","pozickaPZl",0)
                    Call("PozBilaLeva:Activate", 0)
                    Call("PozBilaPrava:Activate", 0)
                    Call("PozCervenaLevaPredni:Activate", 0)
                    Call("PozCervenaPravaPredni:Activate", 0)
                    Call("ReflektorLevyTlumeny:Activate", 0)
                    Call("ReflektorPravyTlumeny:Activate", 0)
                    Call("ReflektorLevyPlny:Activate", 0)
                    Call("ReflektorPravyPlny:Activate", 0)
                    Call("Zarivka01a:Activate",0)
                    Call("Zarivka01b:Activate",0)
                end

                if sberac01 and sberac01Time < 1 then
                    sberac01Time = math.min(sberac01Time + (math.abs(math.sin(math.pi*sberac01Time*3))*0.03+0.015)*cas*5, 1)
                    Call("SetTime", "Panto01", sberac01Time)
                elseif not sberac01 and sberac01Time > 0 then
                    sberac01Time = math.max(sberac01Time - math.min(0.075, math.abs(math.cos(math.pi*sberac01Time*3))*0.055+0.027)*cas*3, 0)
                    Call("SetTime", "Panto01", sberac01Time)
                end

                if sberac02 and sberac02Time < 1 then
                    sberac02Time = math.min(sberac02Time + (math.abs(math.sin(math.pi*sberac02Time*3))*0.03+0.015)*cas*5, 1)
                    Call("SetTime", "Panto02", sberac02Time)
                elseif not sberac02 and sberac02Time > 0 then
                    sberac02Time = math.max(sberac02Time - math.min(0.075, math.abs(math.cos(math.pi*sberac02Time*3))*0.055+0.027)*cas*3, 0)
                    Call("SetTime", "Panto02", sberac02Time)
                end

                if not isDed then
                    if rychlostKMH < 0 then
                        rychlostKMH = -rychlostKMH - 0.4
                    end
                    cilovyStupenHK = (round(rychlostKMH)*toInt(rychlostKMH<26)+round(rychlostKMH/4+19.5)*toInt(rychlostKMH>=26))*toInt(deltaSpeed>0.01)
                    if casOdPoslednihoKroku > zpozdeniPneuventiluHK and math.abs(kontrolerAI-cilovyStupenHK) > 0.5 then
                        ZpravaDebug(rychlostKMH)
                        ZpravaDebug(cilovyStupenHK)
                        kontrolerSnd = not kontrolerSnd
                        Call("SoundEngine:SetParameter","HK",toInt(kontrolerSnd))
                        krokCas = casProcesor
                        if kontrolerAI < cilovyStupenHK then
                            kontrolerAI = kontrolerAI + 1
                        else
                            kontrolerAI = kontrolerAI - 1
                        end
                        ZpravaDebug(kontrolerAI)
                    end
                end
                casOdPoslednihoKroku = casProcesor - krokCas
                Call("SetControlValue", "ZvukExDoIn", 0, 1)
                Call("SoundEngine:SetParameter","LoopZvukEx",1)
                Call("SoundCab:SetParameter","LoopZvukEx",1)
                ventilatoryOdporOtackyTarget = 10*kontrolerAI--(hmotnostVlaku*deltaSpeed/20)*toInt(cilovyStupenHK ~= 0)

                if ventilatoryOdporOtackyTarget < 0.5 then
                    if absolutniRychlost < 1 then
                        ventilatoryAI = math.max(ventilatoryAI - cas, 0)
                    end
                else
                    ventilatoryAI = 20
                    if SysCall("ScenarioManager:GetSeason") ~= 3 then
                        if dennicas < 063000 or dennicas > 220000 then
                            Call("Zarivka01a:Activate",1)
                            Call("Zarivka01b:Activate",1)
                        end
                    else
                        if dennicas < 080000 or dennicas > 163000 then
                            Call("Zarivka01a:Activate",1)
                            Call("Zarivka01b:Activate",1)
                        end
                    end
                end
                if ventilatoryOdporOtackyTarget > ventilatoryOdporOtacky then
                    ventilatoryOdporOtacky = math.min(ventilatoryOdporOtacky + math.sqrt(ventilatoryOdporOtackyTarget-ventilatoryOdporOtacky)*cas*0.8,ventilatoryOdporOtackyTarget,100)
                elseif ventilatoryOdporOtackyTarget < ventilatoryOdporOtacky then
                    ventilatoryOdporOtacky = math.max(ventilatoryOdporOtacky - math.sqrt(ventilatoryOdporOtacky-ventilatoryOdporOtackyTarget)*cas*1.5,0)
                end
                Call("SoundEngine:SetParameter","VentilatoryOtacky",ventilatoryOdporOtacky)
                Call("SoundEngine:SetParameter","Ventilatory",0)
                Call("SoundTMzadni:SetParameter","ProudTM",ventilatoryOdporOtackyTarget*50)
                Call("SoundTMpredni:SetParameter","ProudTM",ventilatoryOdporOtackyTarget*50)
                Call("SoundTMpredni:SetParameter","WheelAbsoluteSpeed",rychlost)
                Call("SoundTMzadni:SetParameter","WheelAbsoluteSpeed",rychlost)
                Call("SetControlValue", "diag23", 0, math.min(ventilatoryAI,1))
                Call("SoundEngine:SetParameter","TlakBV",0)
            end
        end
    end
end

function OnControlValueChange ( name, index, value )
	if Call( "*:ControlExists", name, index ) then
		Call( "*:SetControlValue", name, index, value )
    end
    if name == "dummyVirtualThrottle" then
        wasKontrolerOCVC = true
        kontrolerOCVC = value
    end
    if name == "dummyVirtualBrake" then
        wasOBE_OCVC = false
        OBE_OCVC = value
        if not dummy_Brzdit and not dummy_Odbrzdit and (value < 0.4 or value > 0.75) then
            brzdicUnlocked = true
        end
    end
end