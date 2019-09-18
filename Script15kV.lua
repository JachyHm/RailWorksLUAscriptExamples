function Initialise ()
end

function OnConsistPass (prevFrontDist, prevBackDist, frontDist, backDist, linkIndex)
	if (frontDist < 0 and backDist > 0 and prevFrontDist > 0 and prevBackDist > 0) or (frontDist > 0 and backDist < 0 and prevFrontDist > 0 and prevBackDist > 0) then
		Call("SendConsistMessage",15,"15000V")
		-- SysCall("ScenarioManager:ShowAlertMessageExt", "NAV:DEBUG", "15000V!!!", 2, 0)
	elseif (frontDist > 0 and backDist < 0 and prevFrontDist < 0 and prevBackDist < 0) or (frontDist < 0 and backDist > 0 and prevFrontDist < 0 and prevBackDist < 0) then
		-- SysCall("ScenarioManager:ShowAlertMessageExt", "NAV:DEBUG", "Projizdene proti srsti!", 2, 0)
	end
end
function OnJunctionStateChange( junction_state, parameter, direction, linkIndex )	
end
function OnSignalMessage( message, parameter, direction, linkIndex )
end