BSE = {
    --SETTINGS
        SOUND_PROXYNAME = "SoundBrzdice", --proxyname of BSE sounds
        SOUND_RELEASE_VALVE = "BSE_YO", --release valve click sound name [0/1]
        SOUND_RELEASE = "BSE_fill", --release hiss sound name [0~2.236]
        SOUND_APPLY_VALVE = "BSE_YB", --apply valve click sound name [0/1]
        SOUND_APPLY = "BSE_release", --release hiss sound name [0~2.236]
        SOUND_EMERGENCY = "BSE_RB", --emergency apply sound name [0~3.162]
        SOUND_LINEAR_OVERCH = "BSE_prebiti", --overcharge timing reservoir gradual release sound name [0~3.162]
        MAX_CYLINDER_PRESSURE = 3.8, --maximal cylinder pressure for emergency control [at]

    --public I/O variables
        --inputs
            emergencyValve = false, --emergency valve on brake pipe - true if closed

            emergencyOperation = false, --emergency operation of BSE - true if enabled
            pCylinder = 0, --brake cylinder pressure for emergency operation [at]

            YO = false, --release valve (S, P, O)
            YB = false, --apply valve (S, P, Z, O, J)
            YS = false, --superovercharge valve (S)
            YZ = false, --cutoff valve (Z, R)
            YP = false, --overcharge valve (P)

        --outputs
            pPipe = 0, --brake pipe pressure [at]
            pPipeEnd = 0, --brake pipe pressure on end of train [at]
            increasedFlow = false, --increased flow signalisation

        pMainRes = 0, --INPUT/OUTPUT! - main reservoir pressure [at]

    --private
        pControl = 0,
        pOut = 0,
        pOvercharge = 0,

        distValve = 0,
        distValveHysteresis = 0,

        pPipeConChange = -1,
        trainLenLast = -1,

        pPipeEndLast = 0,

    Update = function(self, dTime)
        local trainLength = Call("GetConsistLength")

        if trainLength > self.trainLenLast then
            self.pPipeConChange = (self.trainLenLast^2/trainLength^2)*5
            self.trainLenLast = trainLength
        end

        --control pressure leakage
            self.pControl = self.pControl-(((self.pControl/500)^2)*3*dTime)

        --brake pipe leakage
            self.pPipe = self.pPipe-(((self.pPipe/500)^2)*3*dTime)

        --overcharge timing reservoir gradual release
            self.pOvercharge = math.max(self.pOvercharge-0.0333*dTime,0)
            Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_LINEAR_OVERCH, math.sqrt(self.pOvercharge))

        --control pressure calculations
            local min5pRes = math.min(self.pMainRes, 5)
            if self.YB and self.pControl > 4.7 and self.pControl < min5pRes then
                self.pControl = math.min(self.pControl + math.sqrt(min5pRes-self.pControl)*dTime*0.05, min5pRes)
            elseif self.pControl > 4.7 and self.pControl > self.pMainRes then
                self.pControl = math.max(self.pControl - math.sqrt(self.pControl-self.pMainRes)*dTime*0.05, self.pMainRes)
            end
            if not self.emergencyOperation then
                if self.YO then
                    local pMaxControl = math.min(5, self.pMainRes)
                    if self.pControl < pMaxControl then
                        local dRelease = math.sqrt(pMaxControl-self.pControl)
                        self.pControl = math.min(self.pControl + dRelease*dTime*0.2, pMaxControl)
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_RELEASE, dRelease)
                    else
                        local dRelease = math.sqrt(self.pControl-pMaxControl)
                        self.pControl = math.max(self.pControl - dRelease*dTime*0.2, pMaxControl)
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_RELEASE, dRelease)
                    end
                else
                    Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_RELEASE, 0)
                end
                if not self.YB then
                    if self.pControl > 0 then
                        self.pControl = math.max(self.pControl - math.sqrt(self.pControl)*dTime*0.2, 0)
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_APPLY, math.sqrt(self.pControl))
                    else
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_APPLY, 0)
                    end
                else
                    Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_APPLY, 0)
                end
                if self.YS then
                    if self.pOut < self.pMainRes then
                        self.pOut = math.min(self.pOut + dTime*5, self.pMainRes)
                    else
                        self.pOut = math.max(self.pOut - dTime*5, self.pMainRes)
                    end
                else
                    local maxOut = math.min(self.pControl, self.pMainRes)
                    if self.pOut < maxOut then
                        self.pOut = math.min(self.pOut + dTime*5, maxOut)
                    else
                        self.pOut = math.max(self.pOut - dTime*5, maxOut)
                    end
                end
                if self.YP then
                    if self.pOvercharge < self.pPipe then
                        self.pOvercharge = math.min(self.pOvercharge + dTime, self.pPipe)
                    --else
                        --self.pOvercharge = math.max(self.pOvercharge - dTime, self.pPipe)
                    end
                end
            else
                Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_RELEASE, 0)
                Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_APPLY, 0)
                self.pControl = math.min(5-(self.pCylinder/self.MAX_CYLINDER_PRESSURE)*1.5, self.pMainRes)
            end

        --distribution valve calculations
            local pPipeTarget = self.pOut*(1+self.pOvercharge/50) --this defines the amount of low overcharge (nizkotlake prebitie) - 67.5 => 5.4bar, 55 => 5.5bar
            local distValveTarget = math.max(math.min((pPipeTarget-self.pPipe)*math.max(self.pMainRes-self.pPipe,1),1),-1)

            if math.abs(self.distValve) < 0.01 and math.abs(distValveTarget - self.distValve) < 0.01 then
                self.distValveHysteresis = math.min(self.distValveHysteresis + dTime*0.01, 0.25)
                if math.abs(self.pPipe-pPipeTarget) < 0.01 and self.pPipeConChange <= 0 and not self.YZ then
                    self.pPipe = pPipeTarget
                end
            elseif math.abs(distValveTarget - self.distValve) > 0.01 then
                self.distValveHysteresis = math.max(self.distValveHysteresis - dTime*math.sqrt(math.abs(distValveTarget-self.distValve))/10,0)
            end

            if math.abs(self.distValve) < 0.01 and math.abs(distValveTarget) < 0.01 then
                self.distValve = 0
            elseif self.distValve < distValveTarget-self.distValveHysteresis then
                self.distValve = math.min(self.distValve + math.sqrt(math.abs(distValveTarget-self.distValve))*dTime,1)
            elseif self.distValve > distValveTarget+self.distValveHysteresis then
                self.distValve = math.max(self.distValve - math.sqrt(math.abs(distValveTarget-self.distValve))*dTime,-1)
            end

        --pipe pressure calculations
            if self.emergencyValve then
                if not self.YZ then
                    if self.pPipeConChange <= 0 then
                        if self.distValve > 0 and self.pPipe < self.pMainRes then
                            self.pPipe = self.pPipe + math.abs(self.distValve*dTime*math.max(self.pPipe-self.pMainRes,1)/(math.max(trainLength, 150)/100))
                        elseif self.distValve < 0 then
                            self.pPipe = math.max(self.pPipe - math.abs(self.distValve*dTime/(math.max(trainLength, 150)/100)),0)
                        end
                    end
                end
                Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_EMERGENCY, 0)
            else
                if not self.YZ then
                    local dPipe = math.sqrt(math.abs(self.pPipe-math.min(self.pOut/2.5, self.pMainRes/5)))/(math.max(trainLength*10, 150)/50)
                    if self.pPipe > math.min(self.pOut/2.5, self.pMainRes/5) then
                        self.pPipe = self.pPipe - dPipe * 15 * dTime
                    else
                        self.pPipe = self.pPipe + dPipe * 15 * dTime
                    end
                    if self.pPipe > 0 then
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_EMERGENCY, math.sqrt(self.pPipe))
                    else
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_EMERGENCY, 0)
                    end
                    self.pMainRes = self.pMainRes - (distValveTarget/3)*dTime
                else
                    local dPipe = math.sqrt(self.pPipe)/(math.max(trainLength*10, 150)/50)
                    if self.pPipe > 0 then
                        self.pPipe = self.pPipe - dPipe * 15 * dTime
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_EMERGENCY, math.sqrt(self.pPipe))
                    else
                        self.pPipe = 0
                        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_EMERGENCY, 0)
                    end
                end
            end

        --pressure loss after connecting vehicles to consist
            if self.pPipe > self.pPipeConChange and self.pPipeConChange > 0 and self.pPipe - self.pPipeConChange > math.sqrt(self.pPipe-self.pPipeConChange)*dTime*3 then
                self.pPipe = self.pPipe - math.sqrt(self.pPipe-self.pPipeConChange)*dTime*3
            else
                self.pPipeConChange = -1
            end

        --pressure calculation for end of train
            local pPipeEnd_target = math.max(self.pPipe - trainLength/1400, 0)
            if self.pPipe > self.pPipeEnd then
                self.pPipeEnd = math.min(self.pPipeEnd + math.min(1/math.max((trainLength-100)/10,2),0.5)*dTime*math.sqrt(pPipeEnd_target-self.pPipeEnd), pPipeEnd_target)
            else
                self.pPipeEnd = math.max(self.pPipeEnd - math.min(1/math.max((trainLength-100)/10,2),0.5)*dTime*math.sqrt(self.pPipeEnd-pPipeEnd_target), pPipeEnd_target)
            end

        --pressure loss from main reservoir when filling brake pipe
            if (self.pPipeEnd > self.pPipeEndLast+0.01*dTime or self.pPipeEnd+0.05 < self.pPipe) and self.pMainRes > self.pPipeEnd and not self.YZ then
                local dPipe = (self.pPipeEnd - self.pPipeEndLast)*trainLength/6
                if dPipe > 0.005 then
                    self.increasedFlow = true
                elseif dPipe < 0.001 then
                    self.increasedFlow = false
                end
                self.pMainRes = self.pMainRes - dPipe*dTime
            else
                self.increasedFlow = false
            end
            self.pPipeEndLast = self.pPipeEnd

        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_RELEASE_VALVE, (self.YO and 1) or 0)
        Call(self.SOUND_PROXYNAME..":SetParameter", self.SOUND_APPLY_VALVE, (self.YB and 1) or 0)
    end,
}
