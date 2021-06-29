Vsoll = 0
Vakt = 0 --aktuelní rychlost

Asoll = (Vsoll - Vakt)/10

Aakt1 = 0 --zrychlení nápravy 1
Aakt2 = 0 --zrychlení nápravy 2
Aakt3 = 0 --zrychlení nápravy 3
Aakt4 = 0 --zrychlení nápravy 4

Aakt = (Aakt1 + Aakt2 + Aakt3 + Aakt4)/4

dPT = (Asoll - Aakt)*dTime
dPTmax = dPT_MAX*dTime
pt = pt + restrict(dPT, dPTmax, -dPTmax)

as = as + dPT

if as > AS_APPLY then
    pulsB = pulsB + 1
    as = 0
elseif as < AS_RELEASE then
    pulsO = pulsO + 1
    as = 0
end