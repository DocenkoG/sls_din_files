--   Event.Type = 1 если изменилось состояние датчика, к которому привязан скрипт
--   Event.Type = 2 если изменился объект, к которому привязан скрипт

-- print("SLS_DIN Скрипт вызван termostat1")
-- telegram.send("SLS_DIN Скрипт вызван termostat1")
local termostatState,t2 = obj.get("termostat.1.state")
local termostatSwitch = zigbee.value("Дом-ABD4","state")
local termostatTarget,t2 = obj.get("termostat.1.target")
local delta = 0.1
local tempC = zigbee.value("Дом-8715","temperature")

-- telegram.send("t=" .. tempC .. "; Event.Name=" .. Event.Name .. "; Event.Type=" .. Event.Type .. "; termostat.1.state=" .. termostatState .. "; Розетка=" .. termostatSwitch)

if (termostatState == "OFF") then
  zigbee.set("Дом-ABD4","state","OFF")
elseif (tempC > termostatTarget + delta) then
  zigbee.set("Дом-ABD4","state","OFF")
  obj.set("termostat.1.state","INACTIVE")
elseif (tempC < termostatTarget - delta) then
  zigbee.set("Дом-ABD4","state","ON")
  obj.set("termostat.1.state","HEATING")
end

-- termostatState,t2 = obj.get("termostat.1.state")
-- termostatSwitch = zigbee.value("Дом-ABD4","state")
-- telegram.send("t="..tempC.."; Event.Name="..Event.Name.."; Event.Type="..Event.Type.."; termostat.1.state="..termostatState.."; Розетка="..termostatSwitch)
