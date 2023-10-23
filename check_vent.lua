local tempGarden = zigbee.value("yard_bf15","temperature")
local tempHome = zigbee.value("home_8715","temperature")
local socket = zigbee.value("vent","state")
local state = obj.get("vent")
local event_type = Event.Type
local msg = "-"

print(event_type,socket,state)
print(tempGarden)
print(tempHome)
if event_type == nil then
  event_type = 0
  msg = "script check_vent.lua  Tvent.Type = nil"
else
  msg = "script check_vent.lua  Tvent.Type = ".. event_type .."; t=".. tempHome .."; "
end

if (state == "temp") then
  if (tempHome >= tempGarden) then
    zigbee.set("vent","state","ON")
    msg = msg .." and vent to ON"
  else
    zigbee.set("vent","state","OFF")
    msg = msg .." and vent to OFF"
--    if (tempHome > 20) then
--      zigbee.set("vent","state","ON")
--      msg = msg .."vent to ON"
--    else
--      zigbee.set("vent","state","OFF")
--      msg = msg .."vent to OFF"
--    end
  end
  scripts.setTimer("check_vent", 600)
elseif event_type >= 4 then
  if (socket == "OFF") then
    zigbee.set("vent","state","ON")
    scripts.setTimer("check_vent", 600)
    msg = msg .. "Включаем на 10 мин"
  else
    zigbee.set("vent","state","OFF")
    if (state == "v10") then
      scripts.setTimer("check_vent", 5400)
      msg = msg .. "Отключаем на 90 мин"
    elseif (state == "v25") then
      scripts.setTimer("check_vent", 1800)
      msg = msg .. "Отключаем на 30 мин"
    elseif (state == "v67") then
      scripts.setTimer("check_vent", 300)
      msg = msg .. "Отключаем на 5 мин"
    end
  end
elseif event_type == 2 then
  scripts.setTimer("check_vent", 30)
  msg = msg .. "Таймер на 30 сек"
end
-- telegram.send(msg)