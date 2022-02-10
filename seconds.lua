-- seconds.lua

local Seconds = {}


local worth = {
	{"y", 31557600},
	{"mo", 2629800},
	{"w", 604800},
	{"d", 86400},
	{"h", 3600},
	{"m", 60},
	{"s", 1}
}


function Seconds.StringToSeconds(timeStr: string): number
	local totalSeconds: number = 0
	
	for _, time in pairs(worth) do
		local sym = time[1]
		local val = time[2]
		
		for num in string.gmatch(timeStr, "(%d+)"..sym) do
			totalSeconds += val * tonumber(num)
		end
	end
	
	return totalSeconds
end

function Seconds.SecondsToString(seconds: number): string
	local timeString: string = ""
	
	for _, time in pairs(worth) do
		local sym = time[1]
		local val = time[2]
		
		local div = seconds / val
		
		if div >= 1 then
			timeString = timeString .. tostring(math.floor(div)) .. sym
			
			seconds -= math.floor(div) * val
			print(seconds)
		end
	end
	
	return timeString
end

return Seconds
