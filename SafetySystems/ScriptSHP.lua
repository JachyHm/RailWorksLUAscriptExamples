function Initialise ()
end

function OnConsistPass (prevFrontDist, prevBackDist, frontDist, backDist, linkIndex)
	if (frontDist < 0 and backDist > 0 and prevFrontDist > 0 and prevBackDist > 0) or (frontDist > 0 and backDist < 0 and prevFrontDist > 0 and prevBackDist > 0) then
		Call("SendConsistMessage",15,"SHP")
		-- SysCall("ScenarioManager:ShowAlertMessageExt", "NAV:DEBUG", "SHP!!!", 2, 0)
	elseif (frontDist > 0 and backDist < 0 and prevFrontDist < 0 and prevBackDist < 0) or (frontDist < 0 and backDist > 0 and prevFrontDist < 0 and prevBackDist < 0) then
		-- SysCall("ScenarioManager:ShowAlertMessageExt", "NAV:DEBUG", "Wrong direction!", 2, 0)
	end
end
function OnJunctionStateChange( junction_state, parameter, direction, linkIndex )	
end
function OnSignalMessage( message, parameter, direction, linkIndex )
end
