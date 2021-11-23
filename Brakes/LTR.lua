DISTRIBUTOR = {
    --THIS IS THE BASE SIMULATION SCRIPT OF DAKO's LTR LOCO DISTRIBUTORS AND CV CARRIAGE DISTRIBUTORS

    --ALL PRESSURES CALCULATED IN TECHNICAL ATMOSPHERES [at]! 
    --1 at ~ 1 BAR

    --SETTINGS
        LOCO_LENGTH = 16.44, --loco length in meters
        OL2_TYPE = true, --true if using OL2 will do full release, false if another lowering pressure will reapply the brake force
        CONVERT_RATIO = 2.53, --convert ratio - SHOULD BE LEFT 2.53 - pressure drop of 150 kPa will apply 380 kPa into brake cyllinders [at]
        MAX_CYLINDER_PRESSURE = 3.8, --max brake cylinders pressure [at]
        HAS_LTV = false, --true if loco has LTV high pressure mode
        LTV_HIGH_PRESSURE = 6.5, --cylinder pressure when LTV high pressure mode active [at]

    --private variables
        targetBrakeControl = 0, --output brake percentage before smoothing

    --public I/O variables
        --inputs
            pPipe = 0, --brake pipe pressure [at]
            pPipeEnd = 0, --brake pipe pressure at end of consist [at]
            locoBrakeRegimeG = false, --sets the loco brake regime to G if true
            trainBrakeRegimeG = false, --sets the consist brake regime to G if true
            OL2 = false, --loco brake release
            bailOffRelay = false, --loco brake release from cooperation with another type of brake

            highPressure = false, --LTV high pressure active

        --outputs
            pLocoCylinder = 0, --brake cylinder pressure to display on gauge [at]
            outputBrakeControl = 0, --output brake percentage smoothed

        pMainRes = 0, --INPUT/OUTPUT! - main loco reservoir pressure [at]

    LTR = {
        pAux = 0, --auxiliary pressure of loco distributor [at]
        pControl = 0, --control pressure of loco distributor [at]
        pCylinder = 0, --output pressure to be displayed on gauge [at]
        pOutput = 0, --output pressure from distributor - before pressure relay [at]
        brakeRegimeG = false, --brake regime G?

        OL2 = false, --loco brake release
        bailOffRelay = false, --loco brake release from cooperation with another type of brake
        highPressure = false, --LTV high pressure active
    },

    firstCV = {
        pAux = 0, --auxiliary pressure of loco distributor [at]
        pControl = 0, --control pressure of loco distributor [at]
        pCylinder = 0, --output pressure to be displayed on gauge [at]
        pOutput = 0, --output pressure from distributor - before pressure relay [at]
        brakeRegimeG = false, --brake regime G?
    },

    lastCV = {
        pAux = 0, --auxiliary pressure of loco distributor [at]
        pControl = 0, --control pressure of loco distributor [at]
        pCylinder = 0, --output pressure to be displayed on gauge [at]
        pOutput = 0, --output pressure from distributor - before pressure relay [at]
        brakeRegimeG = false, --brake regime G?
    },

    --private
    _DoDistributorUpdate = function(self, dTime, dist, pPipe, pMainRes)
        dTime = dTime or 0
        pPipe = pPipe or 0
        pMainRes = pMainRes or 0

        --pressure drops due to leakage
            dist.pAux = dist.pAux-(((dist.pAux/500)^2)*5*dTime)
            dist.pControl = dist.pControl-(((dist.pControl/200)^2)*dTime)

            if dist.pAux < 0 then
                dist.pAux = 0
            end

            if dist.pControl < 0 then
                dist.pControl = 0
            end

        if dist.pAux < pPipe then --filling aux reservoir
            dist.pAux = dist.pAux+math.sqrt(math.abs(pPipe - dist.pAux))/100*15*dTime
        end

        if dist.pAux < (pMainRes or 0) then --filling aux reservoir from main res when loco dist with LTV
            dist.pAux = dist.pAux+math.sqrt(math.abs(pMainRes - dist.pAux))/100*15*dTime
            self.pMainRes = math.max(self.pMainRes-math.sqrt(math.abs(pMainRes - dist.pAux))/1000*15*dTime, 0)
        end

        --control reservoir pressure handling
            if not dist.OL2 or self.OL2_TYPE then
                if dist.pControl < pPipe then
                    if dist.pControl > 5 then
                        dist.pControl = dist.pControl+math.sqrt(math.abs(pPipe - dist.pControl))*0.005*dTime
                    else
                        dist.pControl = dist.pControl+math.sqrt(math.abs(pPipe - dist.pControl))*0.03*dTime
                    end
                elseif math.abs(dist.pControl - pPipe) < 0.07 then
                    dist.pControl = math.max(dist.pControl-0.007*dTime, 0)
                end
            elseif dist.pControl > pPipe then
                dist.pControl = math.max(dist.pControl-math.sqrt(math.abs(pPipe - dist.pControl))*0.5*dTime, 0)
                dist.pOutput = 0
            end

        --three-way valve control values
            local ltvMaxPressure = (dist.highPressure and self.LTV_HIGH_PRESSURE) or self.MAX_CYLINDER_PRESSURE
            local convertRatioWithLtv = (dist.highPressure and (self.CONVERT_RATIO/self.MAX_CYLINDER_PRESSURE)*self.LTV_HIGH_PRESSURE) or self.CONVERT_RATIO

            local targetDistOut = math.min(math.max(dist.pControl-pPipe,0)*convertRatioWithLtv, ltvMaxPressure)
            local dOutputPressure = math.max(math.abs(dist.pControl-pPipe), 1)

        --three-way valve output values
            local dAux = math.min(math.sqrt(math.max(dist.pAux-dist.pOutput, 0)),1)
            if self.OL2_TYPE and dist.OL2 and pPipe > 2.4 then
                dist.pOutput = math.max(dist.pOutput-math.sqrt(dist.pOutput)*0.5*dTime, 0)
            elseif not self.OL2_TYPE or targetDistOut - dist.pOutput < 0.2 or pPipe < 2.4 or dist.OL2 == nil then
                if targetDistOut > dist.pOutput then
                    dist.pOutput = math.min(dist.pOutput + 14*dTime*dOutputPressure*dAux,targetDistOut)
                elseif targetDistOut < dist.pOutput then
                    dist.pOutput = math.max(dist.pOutput - 6*dTime*dOutputPressure*math.sqrt(dist.pOutput),targetDistOut)
                end
            end

        --pressure relay
            local dAux = math.min(math.sqrt(math.max(dist.pAux-dist.pCylinder, 0)),1)
            local dCylinderPressure = math.sqrt(math.abs(((dist.bailOffRelay and 0) or dist.pOutput)-dist.pCylinder))
            if dist.brakeRegimeG then
                if dist.pOutput > dist.pCylinder and not dist.bailOffRelay then
                    dist.pCylinder = math.min(dist.pCylinder + 0.3*dTime*dCylinderPressure*dAux, dist.pOutput)
                    dist.pAux = math.max(dist.pAux-0.03*dTime*dCylinderPressure*dAux, 0)
                elseif dist.pCylinder > dist.pOutput or (dist.bailOffRelay and dist.pCylinder > 0) then
                    dist.pCylinder = math.max(dist.pCylinder - 0.15*dTime*dCylinderPressure, 0)
                end
            else
                if dist.pOutput > dist.pCylinder and not dist.bailOffRelay then
                    dist.pCylinder = math.min(dist.pCylinder + 1.5*dTime*dCylinderPressure*dAux, dist.pOutput)
                    dist.pAux = math.max(dist.pAux-0.15*dTime*dCylinderPressure*dAux, 0)
                elseif dist.pCylinder > dist.pOutput or (dist.bailOffRelay and dist.pCylinder > 0) then
                    dist.pCylinder = math.max(dist.pCylinder - 0.75*dTime*dCylinderPressure, 0)
                end
            end
    end,

    Update = function(self, dTime) --dTime - delta time from last call in seconds
        local trainLength = Call("GetConsistLength")
        self.LTR.OL2 = self.OL2
        self.LTR.bailOffRelay = self.bailOffRelay
        self.LTR.brakeRegimeG = self.locoBrakeRegimeG
        self.LTR.highPressure = self.highPressure

        self.firstCV.brakeRegimeG = self.trainBrakeRegimeG
        self.lastCV.brakeRegimeG = self.trainBrakeRegimeG

        self:_DoDistributorUpdate(dTime, self.LTR, self.pPipe, self.pMainRes)

        if math.abs(trainLength - self.LOCO_LENGTH) > 1 then --CARRIAGE DISTRIBUTORS
            self:_DoDistributorUpdate(dTime, self.firstCV, self.pPipe)
            self:_DoDistributorUpdate(dTime, self.lastCV, self.pPipeEnd)
        end

        self.pLocoCylinder = self.LTR.pCylinder

        --returned brake value calculations
            local max_tbc = -math.log(0.18*math.abs(Call("GetSpeed"))+20)+4
            local max_cylinder_pressure = (self.HAS_LTV and self.LTV_HIGH_PRESSURE) or self.MAX_CYLINDER_PRESSURE
            if math.abs(trainLength - self.LOCO_LENGTH) < 1 then --single loco
                self.targetBrakeControl = math.max(max_tbc*math.min(self.pLocoCylinder/max_cylinder_pressure, 1), 0)
            else --more vehicles
                self.targetBrakeControl =
                    math.max(max_tbc*math.min(self.pLocoCylinder/max_cylinder_pressure, 1), 0)*(self.LOCO_LENGTH/trainLength)+
                    math.max(max_tbc*(
                        math.min(self.lastCV.pCylinder/self.MAX_CYLINDER_PRESSURE, 1)+
                        math.min(self.firstCV.pCylinder/self.MAX_CYLINDER_PRESSURE, 1)
                    )/2, 0)*(1-(self.LOCO_LENGTH/trainLength))
            end

            if self.targetBrakeControl > self.outputBrakeControl then
                self.outputBrakeControl = self.outputBrakeControl + math.sqrt(math.abs(self.targetBrakeControl-self.outputBrakeControl))*0.75*dTime
            elseif self.outputBrakeControl > self.targetBrakeControl then
                self.outputBrakeControl = self.outputBrakeControl - math.sqrt(math.abs(self.targetBrakeControl-self.outputBrakeControl))*0.375*dTime
            end

        return self.outputBrakeControl
    end
}
