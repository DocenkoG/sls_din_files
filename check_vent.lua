local tempGarden = zigbee.value("Двор-BF15","temperature")
local tempHome = zigbee.value("Дом-8715","temperature")

print(tempGarden)
print( type(tempGarden))
print(tempHome)
print( type(tempHome))

if (tempHome < tempGarden) then
  zigbee.set("Вентиляция","state","OFF")
else
  if (tempHome > 22) then
    zigbee.set("Вентиляция","state","ON")
  else
    zigbee.set("Вентиляция","state","OFF")
  end
end