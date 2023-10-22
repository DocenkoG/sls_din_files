dofile("/int/init_secret.lua")
telegram.send("SLS_DIN загружен!!!")
-- scripts.setTimer("bodyping",60)

obj.set("termostat.1.target",16)
obj.set("termostat.1.state","OFF")
obj.onChange('termostat.1.target', 'termostat1.lua')
obj.onChange('termostat.1.state', 'termostat1.lua')

obj.set("termostat.WS.target",5)
obj.set("termostat.WS.state","OFF")
obj.onChange('termostat.WS.target', 'termostatWS.lua')
obj.onChange('termostat.WS.state', 'termostatWS.lua')

obj.set("bodyAtHome","Y")
obj.set("bodyAtHome","N")