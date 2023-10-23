--telegram.send(Event.Name .." ".. Event.nwkAddr .." ".. Event.ieeeAddr .." ".. Event.FriendlyName .." ".. Event.State.Name .." ".. tostring(Event.State.Value)) 
local movement = zigbee.value("ws_9976","occupancy")
if (movement) then
  zigbee.set("ws_lamp","state","ON")
  scripts.setTimer("plafon_off", 0)
else
  --zigbee.set("Плафон","state","OFF")
  scripts.setTimer("plafon_off", os.time() + 600)
end