-- seconds.lua

--//// TIME MEASUREMENTS
--// y  | years
--// mo | months
--// w  | weeks
--// d  | days
--// h  | hours
--// m  | minutes
--// s  | seconds


local Seconds = {}

type timeObj = {
	y: number,
	mo: number,
	w: number,
	d: number,
	h: number,
	m: number,
	s: number
}

local worth = {
	{"y", 31557600},
	{"mo", 2629800},
	{"w", 604800},
	{"d", 86400},
	{"h", 3600},
	{"m", 60},
	{"s", 1}
}


--//// Seconds.StringToSeconds
--// Converts time length string to pure seconds.
--// Example string: 2d5m (2 days and 5 minutes)
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

--//// Seconds.SecondsToString
--// Converts time length in seconds to a formatted string
--// The formatted string matches the one returned by StringToSeconds
function Seconds.SecondsToString(seconds: number): string
	local timeString: string = ""

	for _, time in pairs(worth) do
		local sym = time[1]
		local val = time[2]

		local div = seconds / val

		if div >= 1 then
			timeString = timeString .. tostring(math.floor(div)) .. sym
			seconds -= math.floor(div) * val
		end
	end

	return timeString
end

--//// Seconds.SecondsToTime
--// Converts time length in seconds to an object containing various time measurements
function Seconds.SecondsToTime(seconds: number): timeObj
	local timeRes: timeObj = {
		y  = 0,
		mo = 0,
		w  = 0,
		d  = 0,
		h  = 0,
		m  = 0,
		s  = 0
	}

	for _, time in pairs(worth) do
		local sym = time[1]
		local val = time[2]

		local div = seconds / val

		if div >= 1 then
			timeRes[sym] = math.floor(div)
			seconds -= math.floor(div) * val
		end
	end

	return timeRes
end

return Seconds
