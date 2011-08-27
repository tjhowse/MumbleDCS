-- Mumble Data Export script - 1.0
mumbleLocalAddress = "127.0.0.1"
mumblePort = 1626

ImportedData = {
	[4]="%0.4f",   -- AoA
	[12]="%0.4f",  -- Variometer
    	[13]="%0.4f",  -- APU RPM
    	[14]="%0.4f",  -- APU EGT
	[19]="%0.1f",  -- ADI Course Warning Flag
	[25]="%0.1f",  -- ADI Warning Flag
	[26]="%0.1f",  -- ADI Glideslop Flag
	[40]="%0.1f",  -- HSI Power Off Flag
	[32]="%0.1f",  -- HSI Range Flag
	[46]="%0.1f",  -- HSI Bearing Flag
	[48]="%0.4f",  -- Airspeed Needle
	[65]="%0.1f",  -- SAI Attitude Warning Flag
	[70]="%0.4f",  -- Engine Temperature Left
	[73]="%0.4f",  -- Engine Temperature Right	
	[76]="%0.4f",  -- Fan Speed RPM Left
	[77]="%0.4f",  -- Fan Speed RPM Right
	[78]="%0.4f",  -- Engine RPM Left
	[80]="%0.4f",  -- Engine RPM Right
	[82]="%0.4f",  -- Engine Oil Pressure Left
	[83]="%0.4f",  -- Engine Oil Pressure Right
    	[84]="%0.4f",  -- Fuel Flow Left
    	[85]="%0.4f",  -- Fuel Flow Right
	[178]="%0.1f", -- Left Aileron Emergency Disengage
	[179]="%0.1f", -- Right Aileron Emergency Disengage
	[181]="%0.1f", -- L Elevator Emergency Disengage
	[182]="%0.1f", -- R Elevator Emergency Disengage
	[191]="%0.1f", -- Takeoff Trim
	[215]="%0.1f", -- Left Engine Fire
	[216]="%0.1f", -- APU Fire
	[217]="%0.1f", -- Right Engine Fire
	[260]="%0.1f", -- TACAN Test Light
	[372]="%0.1f", -- CMSC Missile Launch Indicator
	[373]="%0.1f", -- CMSC Priority Status Indicator
	[374]="%0.1f", -- CMSC Unknown Status Indicator
	[404]="%0.1f", -- MASTER CAUTION lamp/button
	[480]="%0.1f", -- Caution Panel : ENG START CYCLE
	[481]="%0.1f", -- Caution Panel : L HYD PRESS
	[482]="%0.1f", -- Caution Panel : R HYD PRESS
	[483]="%0.1f", -- Caution Panel : GUN UNSAFE
	[484]="%0.1f", -- Caution Panel : ANTI SKID
	[485]="%0.1f", -- Caution Panel : L HYD RES
	[486]="%0.1f", -- Caution Panel : R HYD RES
	[487]="%0.1f", -- Caution Panel : OXY LOW
	[488]="%0.1f", -- Caution Panel : ELEV DISENG
	[489]="%0.1f", -- Caution Panel : VOID1
	[490]="%0.1f", -- Caution Panel : SEAT NOT ARMED
	[491]="%0.1f", -- Caution Panel : BLEED AIR LEAK
	[492]="%0.1f", -- Caution Panel : AIL DISENG
	[493]="%0.1f", -- Caution Panel : L AIR TAB
	[494]="%0.1f", -- Caution Panel : R AIR TAB
	[495]="%0.1f", -- Caution Panel : SERVICE AIR HOT
	[496]="%0.1f", -- Caution Panel : PITCH SAS
	[497]="%0.1f", -- Caution Panel : L ENG HOT
	[498]="%0.1f", -- Caution Panel : R ENG HOT
	[499]="%0.1f", -- Caution Panel : WINDSHIELD HOT
	[500]="%0.1f", -- Caution Panel : YAW SAS
	[501]="%0.1f", -- Caution Panel : L ENG OIL PRESS
	[502]="%0.1f", -- Caution Panel : R ENG OIL PRESS
	[503]="%0.1f", -- Caution Panel : CICU
	[504]="%0.1f", -- Caution Panel : GCAS
	[505]="%0.1f", -- Caution Panel : L MAIN PUMP
	[506]="%0.1f", -- Caution Panel : R MAIN PUMP
	[507]="%0.1f", -- Caution Panel : VOID2
	[508]="%0.1f", -- Caution Panel : LASTE
	[509]="%0.1f", -- Caution Panel : L WING PUMP
	[510]="%0.1f", -- Caution Panel : R WING PUMP
	[511]="%0.1f", -- Caution Panel : HARS
	[512]="%0.1f", -- Caution Panel : IFF MODE 4
	[513]="%0.1f", -- Caution Panel : L MAIN FUEL LOW
	[514]="%0.1f", -- Caution Panel : R MAIN FUEL LOW
	[515]="%0.1f", -- Caution Panel : L R TKS UNEQUAL
	[516]="%0.1f", -- Caution Panel : EAC
	[517]="%0.1f", -- Caution Panel : L FUEL PRESS
	[518]="%0.1f", -- Caution Panel : R FUEL PRESS
	[519]="%0.1f", -- Caution Panel : NAV
	[520]="%0.1f", -- Caution Panel : STALL SYS
	[521]="%0.1f", -- Caution Panel : L CONV
	[522]="%0.1f", -- Caution Panel : R CONV
	[523]="%0.1f", -- Caution Panel : CADC
	[524]="%0.1f", -- Caution Panel : APU GEN
	[525]="%0.1f", -- Caution Panel : L GEN
	[526]="%0.1f", -- Caution Panel : R GEN
	[527]="%0.1f", -- Caution Panel : INST INV
	[540]="%0.1f", -- AoA Indexer High
	[541]="%0.1f", -- AoA Indexer Norm
	[542]="%0.1f", -- AoA Indexer Low
	[600]="%0.1f", -- Air Flow White lamp
	[606]="%0.1f", -- NMSP HARS
	[608]="%0.1f", -- NMSP EGI
	[610]="%0.1f", -- NMSP TISL
	[612]="%0.1f", -- NMSP STRPT
	[614]="%0.1f", -- NMSP ANCHR
	[616]="%0.1f", -- NMSP TCN
	[618]="%0.1f", -- NMSP ILS
	[619]="%0.1f", -- NMSP UHF
	[620]="%0.1f", -- NMSP FM
	[647]="%0.4f", -- Hydraulic Pressure Left
	[648]="%0.4f", -- Hydraulic Pressure Right
	[653]="%0.4f", -- Flaps Indicator Gauge
	[660]="%0.1f", -- Landing Gear Left Safe
	[661]="%0.1f", -- Landing Gear Right Safe
	[662]="%0.1f", -- GUN READY lamp
	[663]="%0.1f", -- NOSEWHEEL STEERING lamp
	[665]="%0.1f", -- Canopy Unlocked lamp
	[664]="%0.1f", -- Marker Beacon
	[659]="%0.1f", -- Landing Gear Nose Safe
	[730]="%0.1f", -- Air Refuel Ready
	[731]="%0.1f", -- Air Refuel Latched
	[732]="%0.1f", -- Air Refuel Disconnect
	[737]="%0.1f"} -- Handle Gear Warning

function UpdateRadios(mainPanelDevice)
	local lUHFRadio = GetDevice(54)
	SendData(2006, string.format("%7.3f", lUHFRadio:get_frequency()/1000000))
	--mumbleLog:write("%7.3f\n", lUHFRadio:get_frequency()/1000000)
    --mumbleLog:flush()
	--SendData(2007, string.format("%0.2f;%0.2f;%0.2f;%0.2f", mainPanelDevice:get_argument_value(139),mainPanelDevice:get_argument_value(140),mainPanelDevice:get_argument_value(141),mainPanelDevice:get_argument_value(142)))
	--SendData(2008, string.format("%0.2f;%0.2f;%0.2f;%0.2f", mainPanelDevice:get_argument_value(153),mainPanelDevice:get_argument_value(154),mainPanelDevice:get_argument_value(155),mainPanelDevice:get_argument_value(156)))
end

os.setlocale("ISO-8559-1", "numeric")
-- State data for export
packetSize = 0
Commands = {}
LastCommands = {}

-- DCS Export Functions
function LuaExportStart()
-- Works once just before mission start.

    -- Open log file for export
    mumbleLog = io.open("./Temp/MumbleDCS.log", "w")

    if mumbleLog then
        mumbleLog:write("Log: Start", "\n")
        mumbleLog:flush()
    end        	
	
    -- 2) Setup udp sockets to talk to HawgTouch
    package.path  = package.path..";.\\LuaSocket\\?.lua"
    package.cpath = package.cpath..";.\\LuaSocket\\?.dll"
   
    --socket = require("socket")
    mumbleLog:write("Log: About to connect", "\n")
	mumbleLog:flush()
    --mumbleC = socket.udp()
	--mumbleC:setsockname('*', 0)
    --mumbleC:setpeername(mumbleLocalAddress, mumblePort)
    --mumbleC:settimeout(.1)
	--socket.try(mumbleC:send("woo\n"))
	--mumbleC:sendto("woo\n", "localhost", 1626);
	--dofile "lua.lua"
	socket = require("socket")
	host = "127.0.0.1"
	port = 1626
	mumbleC = socket.try(socket.connect(host, port)) -- connect to the listener socket
	mumbleC:setoption("tcp-nodelay",true) -- set immediate transmission mode
	socket.try(mumbleC:send("Woo!\n"))
	mumbleLog:write("Log: Connection success?", "\n")
	mumbleLog:flush()
end

function LuaExportBeforeNextFrame()
end

function LuaExportAfterNextFrame()	
end

function LuaExportStop()
	mumbleLog:write("Log: End\n")
    mumbleLog:flush()    
    mumbleLog:close()

    mumbleC:close()
end

function LuaExportActivityNextEvent(t)
	t = t + 0.033

	local lDevice = GetDevice(0)
	if type(lDevice) == "table" then
		lDevice:update_arguments()
		--ProcessArguments(lDevice, ImportedData)
		UpdateRadios(lDevice)
		FlushData()
	else
		mumbleLog:write("GetDevice(0) failed.\n")
	end

	return t
end

function StrSplit(str, delim, maxNb)
    if string.find(str, delim) == nil then
        return { str }
    end
    if maxNb == nil or maxNb < 1 then
        maxNb = 0
    end
    local result = {}
    local pat = "(.-)" .. delim .. "()"
    local nb = 0
    local lastPos
    for part, pos in string.gfind(str, pat) do
        nb = nb + 1
        result[nb] = part
        lastPos = pos
        if nb == maxNb then break end
    end
    if nb ~= maxNb then
        result[nb + 1] = string.sub(str, lastPos)
    end
    return result
end

function ProcessArguments(device, arguments)
	local lArgument , lFormat , lArgumentValue
		
	for lArgument, lFormat in pairs(arguments) do 
		lArgumentValue = string.format(lFormat,device:get_argument_value(lArgument))
		SendData(lArgument, lArgumentValue)
	end
end

function SendData(id, value)	
	if string.len(value) > 3 and value == string.sub("-0.00000000",1, string.len(value)) then
		value = value:sub(2)
	end
	
	if LastCommands[id] == nil or LastCommands[id] ~= value then
		local data =  id .. "=" .. value
		local dataLen = string.len(data)

		if dataLen + packetSize > 576 then
			FlushData()
		end

		table.insert(Commands, data)
		LastCommands[id] = value	
		packetSize = packetSize + dataLen + 1
	end	
end

function FlushData()
	if #Commands > 0 then
		local packet = table.concat(Commands, ":") .. "\n"
		socket.try(mumbleC:send(packet))
		Commands = {}
		packetSize = 0
	end
end
