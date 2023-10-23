local a = zigbee.value("button1","action")

print(a)
if (a == "single") then
  zigbee.set("0xA4C1381FEA667D0B","state","toggle") 
  zigbee.set("0xA4C1387003491B8B","state","toggle") 
elseif a == "double"then
  zigbee.set("stars","state","toggle") 
end
  
