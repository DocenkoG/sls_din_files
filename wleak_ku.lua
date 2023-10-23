-- Подключить к изменению статуса датчика протечки
local wleak = zigbee.value("wleak_kitchen","water_leak")

print(wleak)

if (wleak) then
  telegram.send("Протечка в кухне!")
else
  telegram.send("В кухне протечка устранена!")
end