-- seconds.lua

local Seconds = {}

local worth = {
	m  = 60,
	h  = 3600,
	d  = 86400,
	w  = 604800,
	mo = 2629800,
	y  = 31557600
}

function Seconds.ParseTimeString(timeStr: string): number
	local totalSeconds: number = 0
	
	for sym, symWorth in pairs(worth) do
		for num in string.gmatch(timeStr, "(%d+)"..sym) do
			totalSeconds += symWorth * tonumber(num)
		end
	end
	
	return totalSeconds
end

return Seconds
