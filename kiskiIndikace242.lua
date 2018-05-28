
predMasinouTornado = nil
zaMasinouTornado = nil
predMasinouTornadoCas = nil
predMasinouTornadoPosledniZpravaCas = 0
zaMasinouTornadoCas = nil
zaMasinouTornadoPosledniZpravaCas = 0
poleKOdeslani = {}
maxVzdalenost = 25000 --trigger/threshold vzdálenosti středů

delkaVlakuLast = 0
delkaVlaku = 0

function OnConsistMessage(zprava,argument,smer)
    if zprava ~= 460995 then --zpráva 460995 nesmí projít skrz
		if smer == 1 and zaMasinouTornado then --nebudeme posílat, pokud víme, že tam 460 není
			stavPoslane = Call("SendConsistMessage",zprava,argument,1)
		elseif smer == 0 and predMasinouTornado then --to samé ale dozadu
			stavPoslane = Call("SendConsistMessage",zprava,argument,0)
        elseif predMasinouTornado == nil or zaMasinouTornado == nil then --pokud je ale nil, tak si zprávu zapamatuj a pošli ji po dokončení kofigurace
			table.insert(poleKOdeslani, {zprava, argument, smer})
		end
	end
	if zprava == 460995 then
		local xZS = string.sub(argument, 1, 5)/10
		local yZS = string.sub(argument, 6, 10)/10
		x, _, y = Call("*:getNearPosition") --getNearPosition je z nějakého důvodu volaný na všechny childy a s malým g?! Pokud je volaný jenom na blueprint loco, vrací nil, to samé s "G"
		local vzdalenost = math.sqrt((xZS-x)^2 + (yZS-y)^2)
		if vzdalenost < maxVzdalenost then --pakliže je vzdálenost menší, než práh, je tam tornádo
			if smer == 1 then
                predMasinouTornado = true
                predMasinouTornadoCas = nil
				predMasinouTornadoPosledniZpravaCas = os.clock() --zapamatuj si čas poslední přijaté zprávy, zprávy chodí od vozů asynchronně, nemůžeme nulovat něco, co ještě nepřišlo
			else
                zaMasinouTornado = true
                zaMasinouTornadoCas = nil
				zaMasinouTornadoPosledniZpravaCas = os.clock() --viz. 33
            end
        else --jinak tam není tornádo
			if smer == 1 then
				predMasinouTornado = false
                predMasinouTornadoCas = nil
				predMasinouTornadoPosledniZpravaCas = os.clock() --opět 33
			else
				zaMasinouTornado = false
                zaMasinouTornadoCas = nil
				zaMasinouTornadoPosledniZpravaCas = os.clock() --a zase viď. 33
            end
		end
    end
end
function Update (casHry)
	if ToBolAndBack (Call("GetIsNearCamera")) then --jenom, pokud je mašina vidět, jinak není potřeba vykonávat ani AI část skriptu
        casMinuly = casProcesor
        casProcesor = os.clock()
        cas = math.abs(casProcesor - casMinuly)
        if math.abs(cas - casHry) > 2 then --byla pauzlá hra -> resetuj čítače do nuly, jinak hned zasáhnou všechny ochrany
            cas = 0
        end
		delkaVlaku = Call("GetConsistLength")
        if Call("GetIsPlayer") == 1 then --pokud je řízená uživatelem
            if delkaVlakuLast ~= delkaVlaku then --pokud se změnila délka soupravy -> něco bylo odpojeno/připojeno
                x, _, y = Call("*:getNearPosition") --získej pozici mašiny
				predMasinou = Call("SendConsistMessage",460995,string.sub(x*10, 1, 5)..string.sub(y*10, 1, 5),0) --pošli žádost o identifikaci dopředu
				if predMasinou == 0 then --pokud vepředu nic není, rovnou zapiš před mašinou false
					predMasinouTornado = false
				else --pokud tam něco je, zapiš do predMasinouTornadoCas čas poslání zprávy a zahaj odpočet
					predMasinouTornadoCas = os.clock()
				end
				zaMasinou = Call("SendConsistMessage",460995,string.sub(x*10, 1, 5)..string.sub(y*10, 1, 5),1) --to samé, ale dozadu
				if zaMasinou == 0 then
					zaMasinouTornado = false
				else
					zaMasinouTornadoCas = os.clock()
				end
				Call("SetControlValue","PredMasinou",0,predMasinou) --zapiš jestli je něco před
				Call("SetControlValue","ZaMasinou",0,zaMasinou) --a za
				delkaVlakuLast = delkaVlaku --aktualizuj zpracovanou délku vlaku
			end
			if predMasinouTornadoCas ~= nil then --pokud jsi ještě nic nepřišlo a je zahájený odpočet
				if predMasinouTornadoCas + (cas*5) < os.clock() then --pak kontroluj, jestli čas dosáhl cca. 5ti updatů
					predMasinouTornado = false --a pokud ne, 460 před námi není
				end
			end
			if zaMasinouTornadoCas ~= nil then --to samé, ale dozadu
				if zaMasinouTornadoCas + (cas*5) < os.clock() then
					zaMasinouTornado = false
				end
			end
            if predMasinouTornado ~= nil and zaMasinouTornado ~= nil then --pokud víme obě strany, může začít probíhat update
                --tady odešleme co jsme nemohli odeslat, dokud nebyla známá konfigurace
				for _, v in pairs(poleKOdeslani) do
					Call("SendConsistMessage", v[1], v[2], v[3])
				end
                poleKOdeslani = {} --vymažeme pole
                --update
            end
        end
    end
end