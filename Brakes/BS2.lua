BS2 = {
    --SETTINGS
        HANDLE_S = 0.0, --superoverhcarge position
        HANDLE_J = 0.12, --drive position
        HANDLE_N = 0.18, --neutral position
        HANDLE_MIN = 0.3, --minimal reduction position
        HANDLE_MAX = 0.6, --maximal reduction position
        HANDLE_Z = 0.72, --second neutral position
        HANDLE_R = 1, --emergency position

    cab1 = {
        --inputs
            handle = 0.72, --brake handle position (0-1)
            overcharge = false, --low pressure overcharge button
        --internal
            pControl = 0,
            pReference = 5,
            pPipe = 0,
            dPipe = 1,
            cutoff = true,
    },

    cab2 = {
        --inputs
            handle = 0.72, --brake handle position (0-1)
            overcharge = false, --low pressure overcharge button
        --internal
            pControl = 0,
            pReference = 5,
            pPipe = 0,
            dPipe = 1,
            cutoff = true,
    },

    --public I/O variables
        --inputs
            emergencyValve = false, --emergency valve on brake pipe - true if closed

        --outputs
            pPipe = 0, --brake pipe pressure [at]
            pPipeEnd = 0, --brake pipe pressure on end of train [at]
            increasedFlow = false, --increased flow signalisation

        pMainRes = 0, --INPUT/OUTPUT! - pressuer of main reservoir [at]

    pPipeEndLast = 0,
    pPipeConChange = -1,
    trainLenLast = 0,

    Update = function(self, dTime, trainLength)
        if (not trainLength) then
            trainLength = Call("GetConsistLength")
        end

        if trainLength > self.trainLenLast then
            self.pPipeConChange = (self.trainLenLast^2/trainLength^2)*5
            self.trainLenLast = trainLength
        end

        --brake pipe leakage
            self.pPipe = self.pPipe-(((self.pPipe/500)^2)*3*dTime)

        self:_Update(self.cab1, dTime, trainLength)
        self:_Update(self.cab2, dTime, trainLength)

        --pressure calculation for end of train
            local pPipeEnd_target = math.max(self.pPipe - trainLength/1400, 0)
            if self.pPipe > self.pPipeEnd then
                self.pPipeEnd = math.min(self.pPipeEnd + math.min(1/math.max((trainLength-100)/10,2),0.5)*dTime*math.sqrt(pPipeEnd_target-self.pPipeEnd), pPipeEnd_target)
            else
                self.pPipeEnd = math.max(self.pPipeEnd - math.min(1/math.max((trainLength-100)/10,2),0.5)*dTime*math.sqrt(self.pPipeEnd-pPipeEnd_target), pPipeEnd_target)
            end

        --pressure loss from main reservoir when filling brake pipe
            if (self.pPipeEnd > self.pPipeEndLast+0.01*dTime or self.pPipeEnd+0.05 < self.pPipe) and self.pMainRes > self.pPipeEnd and not (self.cab1.cutoff and self.cab2.cutoff) then
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

        --pressure loss after connecting vehicles to consist
            if self.pPipe > self.pPipeConChange and self.pPipeConChange > 0 and self.pPipe - self.pPipeConChange > math.sqrt(self.pPipe-self.pPipeConChange)*dTime*3 then
                self.pPipe = self.pPipe - math.sqrt(self.pPipe-self.pPipeConChange)*dTime*3
            else
                self.pPipeConChange = -1
            end
    end,

    _Update = function(self, brake, dTime, trainLength)
        brake.pPipe = self.pPipe;

        --control pressure leakage
            brake.pControl = brake.pControl-(((brake.pControl/500)^2)*3*dTime)

        --overcharge timing reservoir gradual release
            brake.pReference = math.max(brake.pReference-0.00333*dTime,5)

        --target control pressure setting
            local superovercharge = false
            brake.cutoff = true
            local _pControl = brake.pReference - math.max((brake.handle - self.HANDLE_J)*(2/(self.HANDLE_MAX-self.HANDLE_J)), 0)
            if brake.handle < self.HANDLE_S+(self.HANDLE_J-self.HANDLE_S)/2 then
                superovercharge = true
                brake.cutoff = false
            elseif brake.handle < self.HANDLE_J+(self.HANDLE_N-self.HANDLE_J)/2 then
                brake.cutoff = false
            elseif brake.handle > self.HANDLE_N+(self.HANDLE_MIN-self.HANDLE_N)/2 and brake.handle <= self.HANDLE_MAX+(self.HANDLE_Z-self.HANDLE_MAX)/2 then --0.3 - 0.6
                brake.cutoff = false
            end

        --control pressure calculations
            local dControl = math.sqrt(math.abs(math.min(_pControl, self.pMainRes)-brake.pControl))/3*dTime
            if superovercharge or brake.pPipe > brake.pReference then
                if self.pMainRes > brake.pControl and superovercharge then
                    brake.pControl = math.min(brake.pControl + dControl*10, math.min(_pControl, self.pMainRes))
                elseif brake.pControl > _pControl then
                    brake.pControl = math.max(brake.pControl - dControl*5, _pControl)
                end
            else
                if math.min(_pControl, self.pMainRes) > brake.pControl then
                    brake.pControl = math.min(brake.pControl + dControl, math.min(_pControl, self.pMainRes))
                elseif brake.pControl > _pControl then
                    brake.pControl = math.max(brake.pControl - dControl, _pControl)
                end
            end

        --reference pressure overcharging
            if (brake.pReference < brake.pControl) then
                brake.pReference = math.min(brake.pReference + math.sqrt(brake.pControl-brake.pReference)*dTime*0.025,brake.pControl)
            end

            if brake.overcharge and brake.pReference < 5.3 then --timing reservoir filling
                brake.pReference = math.min(brake.pReference + math.sqrt(5.3-brake.pReference)*dTime*0.5,5.3)
            end

        --dsitribution valve opening calculations
            if not brake.cutoff then
                if superovercharge or (brake.pPipe > brake.pReference and brake.pPipe > 5) then
                    brake.dPipe = 1
                else
                    local _dPipe = math.sqrt(math.abs(brake.pControl-brake.pPipe))/10
                    if _dPipe == 0 then
                        _dPipe = -0.3
                    end
                    if brake.dPipe < _dPipe then
                        brake.dPipe = math.min(brake.dPipe + dTime * math.sqrt(_dPipe - brake.dPipe)/10, _dPipe)
                    elseif brake.dPipe > _dPipe then
                        brake.dPipe = math.max(brake.dPipe - dTime/10, _dPipe)
                    end
                end
            else
                brake.dPipe = math.max(brake.dPipe - dTime/5, 0)
            end

        --brake pipe pressure calculations
            if self.emergencyValve then
                if not brake.cutoff and brake.dPipe > 0 then
                    if self.pPipeConChange <= 0 then
                        if brake.pControl > brake.pPipe and brake.pPipe < self.pMainRes then
                            brake.pPipe = math.min(brake.pPipe + math.abs(brake.dPipe*dTime/(trainLength/500+0.1)*math.min(math.max((self.pMainRes-brake.pPipe)/5,0), 1)), brake.pControl)
                        elseif brake.pControl < brake.pPipe then
                            brake.pPipe = math.max(brake.pPipe - math.abs(brake.dPipe*dTime/(trainLength/500+0.1)), brake.pControl)
                        end
                    end
                end
            else
                if self.pPipe > 0 then
                    self.pPipe = self.pPipe - (math.sqrt(self.pPipe)/(trainLength/500+0.1)) * dTime
                else
                    self.pPipe = 0
                end
            end

        if not brake.cutoff then
            self.pPipe = brake.pPipe
        end
    end,
}