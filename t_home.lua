local tempHome = zigbee.value("home_8715","temperature")

print(type(tempHome))
print(tempHome)

if (tempHome < 10) then
  c=string.find(tempHome,".",1,true)
  s=string.sub(tempHome,1,c+2)
  telegram.send("Температура в доме "..s)
end
dofile("/int/termostat1.lua")
dofile("/int/check_vent.lua")