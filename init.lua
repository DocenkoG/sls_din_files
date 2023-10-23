dofile("/int/init_secret.lua")
telegram.receive(true)
telegram.send("SLS_DIN загружен!!!")
-- scripts.setTimer("bodyping",60)

obj.set("termostat.1.target",13)
obj.set("termostat.1.state","ON")
obj.onChange('termostat.1.target', 'termostat1.lua')
obj.onChange('termostat.1.state', 'termostat1.lua')

obj.set("termostat.WS.target",5)
obj.set("termostat.WS.state","ON")
obj.onChange('termostat.WS.target', 'termostatWS.lua')
obj.onChange('termostat.WS.state', 'termostatWS.lua')

obj.set("termostat.CR.target",7)
obj.set("termostat.CR.state","OFF")
obj.onChange('termostat.CR.target', 'termostatCR.lua')
obj.onChange('termostat.CR.state', 'termostatCR.lua')

obj.set("vent","temp")
obj.onChange('vent','check_vent.lua')
scripts.setTimer("check_vent", 20)