BP = {
    --SETTINGS
        P_CYLINDER_MAX = 3.8, --max cylinder pressure [at]
        P_CYLINDER_ATTACK = 0.4, --max cylinder pressure attack per second [at/s]
        P_CYLINDER_RELEASE = 0.2, --max cylinder pressure release per second [at/s]
        CYLINDER_VOLUME_RATIO = 0.1, --volume ratio cylinder:resevoir [NaN]
        PAD_APPLY_DELAY = 0, --time for which piston travels between release position and wheel [s/at]
        P_SENSITIVITY = 0.3, --pressure sensitivity - hysteresis [at]

    --public I/O variables
        --output
            cylinderAnim = 0, --cylinder animation time from beginning (-PAD_APPLY_DELAY - P_CYLINDER_MAX)
            pCylinder = 0, --cylinder pressure from direct brake [at]

        pMainRes = 0, --INPUT/OUTPUT! - main reservoir pressure [at]

    --internal variables
        pCylinderTarget = 0,

    Update = function(self, control, dTime)
        local padApplyEquiv = self.PAD_APPLY_DELAY*self.P_CYLINDER_ATTACK
        local hysteresisMultiplier = (self.P_CYLINDER_MAX + 2*self.P_SENSITIVITY + padApplyEquiv)/self.P_CYLINDER_MAX
        local _pCylinderTarget = math.min(control*self.P_CYLINDER_MAX*hysteresisMultiplier - self.P_SENSITIVITY - padApplyEquiv, self.pMainRes)

        if self.pCylinderTarget > _pCylinderTarget + self.P_SENSITIVITY then
            self.pCylinderTarget = _pCylinderTarget + self.P_SENSITIVITY
        elseif self.pCylinderTarget < _pCylinderTarget - self.P_SENSITIVITY then
            self.pCylinderTarget = _pCylinderTarget - self.P_SENSITIVITY
        end

        if self.cylinderAnim > self.pCylinderTarget then
            local dCylinder = (self.cylinderAnim - self.pCylinderTarget)*dTime*self.P_CYLINDER_RELEASE
            self.cylinderAnim = self.cylinderAnim - dCylinder
        elseif self.pCylinderTarget > self.cylinderAnim then
            local dCylinder = (self.pCylinderTarget - self.cylinderAnim)*dTime*self.P_CYLINDER_ATTACK
            self.cylinderAnim = self.cylinderAnim + dCylinder
            self.pMainRes = self.pMainRes - dCylinder*self.CYLINDER_VOLUME_RATIO
        end

        self.pCylinder = math.max(self.cylinderAnim, 0)
        return self.pCylinder/self.P_CYLINDER_MAX
    end,
}