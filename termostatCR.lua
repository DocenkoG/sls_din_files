local termostatState,t2 = obj.get("termostat.CR.state")
local termostatSwitch = zigbee.value("porch_4452","state")
local termostatTarget,t2 = obj.get("termostat.CR.target")
local delta = 0.1
local tempC = zigbee.value("porch_fba4","temperature")

-- telegram.send("t="..tempC.."; Event.Name="..Event.Name.."; Event.Type="..Event.Type.."; termostat.CR.state="..termostatState.."; Розетка="..termostatSwitch)
local c=string.find(tempC,".",1,true)
local s=string.sub(tempC,1,c+2)

if (termostatState == "OFF") then
  zigbee.set("porch_4452","state","OFF")
elseif (tempC > termostatTarget +0) then
  zigbee.set("porch_4452","state","OFF")
  obj.set("termostat.CR.state","INACTIVE")
--  termostatSwitch = zigbee.value("Крыльцо-4452","state")
--  termostatState,t2 = obj.get("termostat.CR.state")
--  telegram.send(s.." Выключаем; termostat.CR.state="..termostatState.."; Розетка="..termostatSwitch)
elseif (tempC < termostatTarget+0) then
  zigbee.set("porch_4452","state","ON")
  obj.set("termostat.CR.state","HEATING")
--  termostatSwitch = zigbee.value("Крыльцо-4452","state")
--  termostatState,t2 = obj.get("termostat.CR.state")
--  telegram.send(s.." Включаем; termostat.CR.state="..termostatState.."; Розетка="..termostatSwitch)
end

