-- Подключить к изменению статуса датчика протечки
local wleak = zigbee.value("wleak_bath","water_leak")

print(wleak)

if (wleak) then
  telegram.send("Протечка в санузле!")
else
  telegram.send("В санузле протечка устранена!")
end