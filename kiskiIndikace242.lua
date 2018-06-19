--ABOUT
--This object is used to get, if same loco is exactly next to ours. It is used f.e. for showing cable jumpers between locos.

--HOW TO USE
--Firstly, you should copy locoPosAPI object and paste it to your code.
--There has to be also functions specified on lines 45 and 46. They must be declared BEFORE this object. Otherwise, it wont work, or it will even break script.
--This functions are called on second loco response. It can take some time (max 5 updates) to get response, so it can`t be pushed as normal return value.
--Both of them are returning one value, which can be locoPosAPI.ON_FRONT_CODE, when it is returned from front side, or locoPosAPI.ON_REAR_CODE when it is response from rear side.
--When ON_FAIL_FUNCTION is called, it means, that no loco was found on specified side, or it was too far. When ON_SUCCESS_FUNCTION is, it means, that loco was found on specified side and it is nearer than max limit.
--Max limit can be set on line 40, and it is named TRIGGER_DISTANCE. When distance exceeds this value, Fail function is called, otherwise Success fnc is called.

--On lines 41 - 44 (including) you can set message codes. You should choose such ones, that aren`t used anywhere else. I recommend to use syntax like 3 digit class number, and 3 digits msg number. In my case i have class 242, so 242xxx was used.

--OCM function is function, which has to be called on every ConsistMessage. It has arguments message code, message content and message direction.
--It processes the message, and returns true, if message doesn`t relate to loco position and should be forwarded to next vehicle. Otherwise false is returned and message SHOULDN`T BE forwarded! Otherwise you are risking performance problems.

--Update is method, which should be called every game Update. It has no arguments and it also doesn`t return anything.

--Finally there are two functions: GetIsNearOnFront and GetIsNearOnRear. These should be called only, when we need to know, if there is loco AND ONLY IF THERE WAS CONSIST LENGHT CHANGE!
--Otherwise you are risking serious problems with performance. It definitelly shouldn` be called every update!
--They are both returning 1 if there is any vehicle, or 0 if there isn`t even any vehicle.
--On these functions call, request is processed and then ON_SUCCESS_FUNCTION, or ON_FAIL_FUNCTION respectively are called.

function OnConsistMessage(msg,arg,dir)
    if locoPosAPI:OCM(msg,arg,dir) then
        Call("SendConsistMessage", msg, arg, dir)
    end
end
function Update(time)
    locoPosAPI:Update()
end
function Success(dir)
    --do what you want here
end
function Failed(dir)
    --do what you want here
end
locoPosAPI = {
    --settings constants
        TRIGGER_DISTANCE = 12,
        Y_COORD_MSG_CODE = 242999,
        X_COORD_MSG_CODE = 242998,
        SUCCESS_MSG_CODE = 242995,
        FAILED_MSG_CODE = 242994,
        ON_SUCCESS_FUNCTION = Success, --function to be called on success
        ON_FAIL_FUNCTION = Failed, --function to be called on fail

    --internal variables - do not change them ;)
        receivedMsgs = {},
        ON_FRONT_CODE = 1,
        ON_REAR_CODE = 2,
        frontSendTimeStamp = nil,
        rearSendTimeStamp = nil,
        lastTime = os.clock(),
    
    --methods
        OCM = function(self, msg, arg, dir) --called on received message; returns true, if message should be forwarded
            if msg == self.Y_COORD_MSG_CODE then --write y coord
                if not self.receivedMsgs[dir+1] then
                    self.receivedMsgs[dir+1] = {}
                end
                self.receivedMsgs[dir+1]["y"] = arg
                return false
            elseif msg == self.X_COORD_MSG_CODE then --write x coord
                if not self.receivedMsgs[dir+1] then
                    self.receivedMsgs[dir+1] = {}
                end
                self.receivedMsgs[dir+1]["x"] = arg
                return false
            elseif msg == self.SUCCESS_MSG_CODE then --success; 1 on front, 0 on rear 
                self.ON_SUCCESS_FUNCTION(dir)
                if dir == 1 then
                    self.frontSendTimeStamp = nil
                else
                    self.rearSendTimeStamp = nil
                end
                return false
            elseif msg == self.FAILED_MSG_CODE then --failed; 1 on front, 0 on rear
                self.ON_FAIL_FUNCTION(dir)
                if dir == 1 then
                    self.frontSendTimeStamp = nil
                else
                    self.rearSendTimeStamp = nil
                end
                return false
            else
                return true
            end
        end,
        Update = function(self) --called every update frame, no args
            local deltaTime = os.clock() - self.lastTime
            self.lastTime = os.clock()
            if table.getn(self.receivedMsgs) > 0 then --are there even any received coords?
                for i in self.receivedMsgs do --read them
                    if self.receivedMsgs[i]["x"] ~= nil and self.receivedMsgs[i]["y"] ~= nil then --are they x and y both?
                        local xFM, yFM = self.receivedMsgs[i]["x"], self.receivedMsgs[i]["y"] --write them to local vars
                        self.receivedMsgs[i] = nil --clear their table
                        local x, _, y = Call("*:getNearPosition") --get actual loco pos
                        local distance = math.sqrt((xFM-x)^2 + (yFM-y)^2) --get vector distance
                        if distance < self.TRIGGER_DISTANCE then --if there are near
                            if i == 1 then --if it comes in direction 0, so it comes from direction 1, so loco is on rear
                                self.ON_SUCCESS_FUNCTION(ON_REAR_CODE)
                                Call("SendConsistMessage", self.SUCCESS_MSG_CODE, "", 1) --send it back to rear
                            else --else it comes in direction 1, so it comes from direction 0, so loco is on front
                                self.ON_SUCCESS_FUNCTION(ON_FRONT_CODE)
                                Call("SendConsistMessage", self.SUCCESS_MSG_CODE, "", 0) --send it back to front
                            end
                        else --no near loco
                            self.ON_FAIL_FUNCTION()
                        end
                    end
                end
            end
            if self.frontSendTimeStamp then --waiting for response from front
                if self.frontSendTimeStamp + (deltaTime*5) < self.lastTime then --response time exceeds limit (5 times update time)
                    self.ON_FAIL_FUNCTION(1)
                    self.frontSendTimeStamp = nil
                end
            end
            if self.rearSendTimeStamp then --waiting for response from rear
                if sel.frontSendTimeStamp + (deltaTime*5) < self.lastTime then --response time exceeds limit (5 times update time)
                    self.ON_FAIL_FUNCTION(0)
                    self.rearSendTimeStamp = nil
                end
            end
        end,
        GetIsNearOnFront = function(self) --called to check if loco on front is near; no args; returns 1 if there is even any vehicle, 0 if there is nothing
            local x, _, y = Call("*:getNearPosition")
            Call("SendConsistMessage", self.Y_COORD_MSG_CODE, string.sub(y, 1, 10), 0)
            self.frontSendTimeStamp = os.clock()
            return Call("SendConsistMessage", self.X_COORD_MSG_CODE, string.sub(x, 1, 10), 0)
        end,
        GetIsNearOnRear = function(self) --called to check if loco on rear is near; no args; returns 1 if there is even any vehicle, 0 if there is nothing
            local x, _, y = Call("*:getNearPosition")
            Call("SendConsistMessage", self.Y_COORD_MSG_CODE, string.sub(y, 1, 10), 1)
            self.rearSendTimeStamp = os.clock()
            return Call("SendConsistMessage", self.X_COORD_MSG_CODE, string.sub(x, 1, 10), 1)
        end
}
