local bodyIp1 = "192.168.1.83"    -- 83 iPhone docn 2.4 G
local bodyIp2 = "192.168.1.55"    -- tv
local bodyIp3 = "192.168.1.139"   -- 63 iPhone mur
local bodyIp4 = "192.168.1.105"   -- 105 macbook
local t0, t1, t2

--print( os.ping(bodyIp1))
--print( os.ping(bodyIp2))
--print( os.ping(bodyIp3))
--print( os.ping(bodyIp4))
t0 = os.time()
if (os.ping(bodyIp1) > 0) 
  or (os.ping(bodyIp2) > 0) 
  --or (os.ping(bodyIp3) > 0) 
  --or (os.ping(bodyIp4) > 0) 
then
  obj.set("bodyAtHome","Y")
  print("Y")
  t1, t2 = obj.getTime("bodyAtHome")
  if (t0 - t1 < 10) and (t0 - t2 > 3600) then 
    zigbee.set("Двор-172","state","ON")
    zigbee.set("Гирлянда","state","ON")
    print("вкл")
  end
else
  obj.set("bodyAtHome","N")
  print("N")
  t1, t2 = obj.getTime("bodyAtHome")
  if (t0 - t1 > 3600) then 
    zigbee.set("Двор-172","state","OFF")
    zigbee.set("Гирлянда","state","OFF")
    print("выкл")
  end
end
print((os.time() - t1)/60/60)
print((os.time() - t2)/60/60)