--colour function
function ConvertHexToRGB(hex)
	local red = string.sub(hex, 1, 2)
	local green = string.sub(hex, 3, 4)
	local blue = string.sub(hex, 5, 6)
	red = tonumber(red, 16) / 255
	green = tonumber(green, 16) / 255
	blue = tonumber(blue, 16) / 255
	return red, green, blue
end

--tests

print(ConvertHexToRGB(“FFCC99“))
print(ConvertHexToRGB(“FFFFFF“))
print(ConvertHexToRGB(“000000“))

--mean of 2 numbers function
function mean(num1, num2)
	return (num1 + num2) / 2
end

--x amount of arguemnts called a vararg function
function test_print(...)
	print(“testing“, ...)
end

--creates an array table
function newtable(...)
	return {...}
end

--tests
tbl = newtable(“alpha“, “beta“, “gamma“)
for i=1, #tbl do
	print(i, tbl[i])
end

--using select() with varargs
function printargs(...)
	local num_args = select("#", ...)
	for i=1, num_args do
		local arg = select(i, ...)
		print(i, arg)
	end
end

--test
printargs("alpha", "beta", 13, "gamma")

--example showing nil values vs vararg values
function test1(...)
	local tbl = {...}
	for i = 1, #tbl do
		print(i, tbl[i])
	end
end

function test2(...)
	for i = 1, select("#", ...) do
		print(i, (select(i, ...)))
	end
end

--tests

test1("alpha", "beta", "gamma", nil)
test2("alpha", "beta", "gamma", nil)

--generic for loops ipairs()

tbl = {"alpha", "beta", "gamma"}
for idx, value in ipairs(tbl) do
	print(idx, value)
end

--tests
print(ipairs(tbl))
print(tbl)

--pairs()
tbl = {"alpha", "beta", ["one"] = "uno", ["two"] = "dos"}
for key, value in pairs(tbl) do
	print(key, value)
end

--to clear all element in a table use next()
for key, value in pairs(tbl) do
	tbl[key] = nil
end

--string.gmatch() can be use for pattern matching 
for word in string.gmatch("These are some words", "%S+") do
	print(word)
end

for char in string.gmatch("Hello!", ".") do
	print(char)
end

--sorting tables

guild = {}
table.insert(guild, {
	name = "Cladhaire",
	class = "Rogue",
	level = 80,
	})
table.insert(guild, {
	name = "Draoi",
	class = "Druid",
	level = 80,
	})
table.insert(guild, {
	name = "Deathsquid",
	class = "Deathknight",
	level = 68,
	})

for idx, value in ipairs(guild) do
	print(idx, value.name)
end

--compare sort function
function sortNameFunction(a, b)
	return a.name < b.name
end

table.sort(guild, sortNameFunction)
for idx, value in ipairs(guild) do
	print(idx, value.name)
end

function sortNameFucntionDescending(a, b)
	return b.name < a.name
end

table.sort(guild, sortNameFucntionDescending)
for idx, value in ipairs(guild) do
	print(idx, value.name)
end

--more complex sort function
function sortLevelNameAcending(a, b)
	if a.level == b.level then
		return a.name < b.name
	end
	return a.level < b.level
end

table.sort(guild, sortLevelNameAcending)
for idx, value in ipairs(guild) do
	print(idx, value.name, value.level)
end

function sortLevelNameDecending(a, b)
	if a.level == b.level then
		return a.name > b.name
	end
	return a.level < b.level
end

table.sort(guild, sortLevelNameDecending)
for idx, value in ipairs(guild) do
	print(idx, value.name, value.level)
end
