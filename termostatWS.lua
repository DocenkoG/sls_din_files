--   Event.Type = 1 если изменилось состояние датчика, к которому привязан скрипт
--   Event.Type = 2 если изменился объект, к которому привязан скрипт

local termostatState,t2 = obj.get("termostat.WS.state")
local termostatSwitch = zigbee.value("WS-7B01","state")
local termostatTarget,t2 = obj.get("termostat.WS.target")
local delta = 0.1
local tempC = zigbee.value("WS-A046","temperature")

-- telegram.send("t="..tempC.."; Event.Name="..Event.Name.."; Event.Type="..Event.Type.."; termostat.WS.state="..termostatState.."; Розетка="..termostatSwitch)

if (termostatState == "OFF") then
  zigbee.set("WS-7B01","state","OFF")
elseif (tempC > termostatTarget + delta) then
  zigbee.set("WS-7B01","state","OFF")
  obj.set("termostat.WS.state","INACTIVE")
elseif (tempC < termostatTarget - delta) then
  zigbee.set("WS-7B01","state","ON")
  obj.set("termostat.WS.state","HEATING")
end

-- termostatState,t2 = obj.get("termostat.WS.state")
-- termostatSwitch = zigbee.value("WS-7B01","state")
-- telegram.send("t="..tempC.."; Event.Name="..Event.Name.."; Event.Type="..Event.Type.."; termostat.WS.state="..termostatState.."; Розетка="..termostatSwitch)