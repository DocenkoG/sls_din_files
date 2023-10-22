--telegram.send(Event.Name .." ".. Event.nwkAddr .." ".. Event.ieeeAddr .." ".. Event.FriendlyName .." ".. Event.State.Name .." ".. tostring(Event.State.Value)) 
local movement = zigbee.value("WS-9976","occupancy")
if (movement) then
  zigbee.set("Плафон","state","ON")
  scripts.setTimer("plafon_off", 0)
else
  --zigbee.set("Плафон","state","OFF")
  scripts.setTimer("plafon_off", os.time() + 600)
end