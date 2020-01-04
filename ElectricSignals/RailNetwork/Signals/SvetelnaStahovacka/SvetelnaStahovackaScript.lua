probability = math.random(0,1);

function Initialise()
    Call("BeginUpdate")
end

function OnConsistPass (prevFrontDist, prevBackDist, frontDist, backDist, linkIndex)
    if (frontDist < 0 and backDist > 0 and prevFrontDist > 0 and prevBackDist > 0) or (frontDist > 0 and backDist < 0 and prevFrontDist > 0 and prevBackDist > 0) then
        if probability > 0.5 then
            Call("SendConsistMessage",15,"0V")
        end
		-- SysCall("ScenarioManager:ShowAlertMessageExt", "NAV:DEBUG", "0V!!!", 2, 0)
	elseif (frontDist > 0 and backDist < 0 and prevFrontDist < 0 and prevBackDist < 0) or (frontDist < 0 and backDist > 0 and prevFrontDist < 0 and prevBackDist < 0) then
		-- SysCall("ScenarioManager:ShowAlertMessageExt", "NAV:DEBUG", "Projizdene proti srsti!", 2, 0)
	end
end
function OnJunctionStateChange( junction_state, parameter, direction, linkIndex )	
end
function OnSignalMessage( message, parameter, direction, linkIndex )
end
function Update(time)
	if probability > 0.5 then
		Call("ActivateNode", "svetlo", 1)
        Call("*:Activate",1)
	else
		Call("ActivateNode", "svetlo", 0)
        Call("*:Activate",0)
	end
end