-- Подключить к изменению статуса датчика протечки
local wleak = zigbee.value("wleak_deep","water_leak")

print(wleak)

if (wleak) then
  telegram.send("Протечка в погребе!")
else
  telegram.send("В погребе протечка устранена!")
end