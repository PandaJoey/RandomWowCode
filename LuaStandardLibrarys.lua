--table concat function
tbl = {"alpha", "beta", "gamma"}
print(table.concat(tbl, ": "))
print(table.concat(tbl, nil, 1, 2))
print(table.concat(tbl, "\n", 2, 3))
print(table.concat(tbl, "\n", 1, 3))

--table insert function

tbl = {"alpha", "beta", "gamma"}
table.insert(tbl, "delta")
table.insert(tbl, "epsilon")
print(table.concat(tbl, ", "))
table.insert(tbl, 3, "zeta")
print(table.concat(tbl, ", "))

--max table index functions
tbl = {[1] = "a", [2] = "b", [3] = "c", [26] = "z"}
print(#tbl)
print(table.maxn(tbl))
tbl[91.32] = true
print(table.maxn(tbl))

--remove table values
tbl = {"alpha", "beta", "gamma", "delta"}
print(table.remove(tbl))
print(table.concat(tbl, ", "))

-- table.sort()
tbl = {"alpha", "beta", "gamma", "delta"}
table.sort(tbl)
print(table.concat(tbl, ", "))

sortFunc = function(a,b) return b < a end
table.sort(tbl, sortFunc)
print(table.concat(tbl, ", "))

--string.format used to format arguments according to a defined format

string.format("%%c: %c", 83) 			--%c: S
string.format("%+d", 17.0) 				--+17
string.format("%05d", 17) 				--00017
string.format("%o", 17) 				--21
string.format("%u", 3.14)				--3
string.format("%x", 13) 				--D
string.format("%X", 13) 				--D
string.format("%e", 1000) 				--1.000000e+03
string.format("%E", 1000) 				--1.000000E+03
string.format("%6.3f", 13) 				--13.000
string.format("%q", [["One", “Two"]]) 	--“\“One\“, \“Two\““
string.format("%s", "monkey") 		 	--monkey
string.format("%10s", "monkey") 		--monkey
string.format("%5.3s", "monkey")		--mon

--pattern matching functions
string.gmatch(s, pattern)

--iterates over all words and prints them on new lines
s = "hello world from Lua"
for word in string.gmatch(s, “%a+“) do
	print(word)
end

-- collects all key=value pairs from a string and puts them in a table
t = {}
s = "from=world, to=Lua"
for k, v in string.gmatch(s, "(%w+)=(%w+)") do
	t[k] = v
end
for k,v in pairs(t) do
	print(k, v)
end

-- returns all words that have been replaced with the repl argument also tells 
-- how many times it happened
string.gsub(s, pattern, repl [, n])

--examples
print(string.gsub("hello world", "(%w+)", "%1 %1"))
print(string.gsub("hello world", "%w+", "%0 %0", 1))
print(string.gsub("hello Lua", "(%w+)%s*(%w+)", "%2 %1"))

lookupTable = {["hello"] = "hola", ["world"] = "mundo"}
function lookupFunc(pattern)
	return lookupTable[pattern]
end
print(string.gsub("hello world", "(%w+)", lookupTable))
print(string.gsub("hello world", "(%w+)", lookupFunc))

--returns the first matched pattern in the string if it finds one it returns it
--can specify init for where you want ot start in the stirng
string.match(s, pattern [, init])

--looks for the first match of a pattern and returns the indicies of s where 
-- it was found, plain can be used to just find the word manually.
string.find(s, pattern [, init [, plain]])

--maths library stuff

math.abs(x) Returns the absolute
value of x.
print(math.abs(13))
13
print(math.abs(-13))
13
math.ceil(x) Returns the smallest
integer larger than or
equal to x.
print(math.ceil(1.03))
2
print(math.cell(13))
13
print(math.cell(17.99))
18
math.deg(x) Returns the angle x
(given in radians) in
degrees.
print(math.deg(math.pi))
180
print(math.deg(math.pi * 2.5))
450
math.exp(x) Returns the value of the
mathematical constant
e raised to the x power.
print(math.exp(27))
532048240601.8
math.floor(x) Returns the largest
integer smaller than or
equal to x.
print(math.floor(1.03))
1
print(math.floor(13.0))
13
print(math.floor(17.99)
	17
	Continued106 Part I ■ Learning to Program
	Table 6-8: (continued)
	FUNCTION DESCRIPTION EXAMPLE
	math.fmod(x, y) Returns the remainder
	of the division of x by
	y, rounding the
	quotient toward
	zero.
	print(math.fmod(14, 3))
	2
	(print(math.fmod(14, 2))
		0
		math.log(x) Returns the natural
		logarithm of x.
		print(math.log(532048240601.8))
		27
		math.log10(x) Returns the base-10
		logarithm of x.
		print(math.log10(10 ˆ 2))
		2
		math.max(x, y,
			z, ...)
		Returns the maximum
		value among its
		arguments.
		print(math.max(-13, 7, 32))
		32
		math.min(x, y,
			z, ...)
		Returns the minimum
		value among its
		arguments.
		print(math.min(-13, 7, 32, 17))
		-13
		math.modf(x) Returns two numbers,
		the integral part of x
		and the fractional part
		of x.
		print(math.modf(10.23))
		10, 0.23
		print(math.modf(7/22))
		0, 0.31818181818182)
	math.pi The value of the
	mathematical constant
	pi.
	print(math.pi)
	3.1415926535898
	math.pow(x, y) Returns x raised to the
	y power. (You can also
		use the expression x ˆ y
		to compute this value.)
	print(math.pow(2, 10))
	1024
	print(math.pow(2, -10))
	0.0009765625
	math.rad(x) Returns the angle x
	(given in degrees) in
	radians.
	print(math.rad(180))
	3.1415926535898
	print(math.rad(180) == math.pi)
	true
	print(math.rad(450))
	7.8539816339745
	math.random([m
		[, n]])
	Generates
	pseudo-random
	numbers. The numbers
	generated may not be
	sufficient for statistical
	analysis but provide an
	easy way to create
	pseudo-randomness in
	print(math.random())
	7.8263692594256e-06
	print(math.random(100))
	14
	print(math.random(10, 20))
	18Chapter 6 ■ Lua Standard Libraries 107
	FUNCTION DESCRIPTION EXAMPLE
	a program. For
	example, this function
	can be used along with
	the
	SendChatMessage()
	World of Warcraft API
	function to allow your
		character to make
		random sayings based
		on certain events.
		When called without
		arguments, returns a
		pseudo-random real
		number between 0 and
		1 (not including 1).
		When called with a
		number m, returns a
		pseudo-random integer
		between and including
		1 and m. When called
		with two numbers m
		and n, returns a
		pseudo-random integer
		between and including
		m and n.
		math.randomseed
		(x)
		The pseudo-random
		number generator used
		by Lua takes an initial
		seed and generates a
		sequence of numbers
		based on that seed. As
		a result, the same initial
		seed will always
		produce the same
		sequence. This function
		has been removed from
		the Lua implementation
		in World of Warcraft,
		but is listed here for
		completeness.
		math.randomseed(1000)
		print(math.random(100))
		1
		print(math.random(100))
		54
		print(math.random(100))
		61
-- reset the seed
math.randomseed(1000)
print(math.random(100))
1
print(math.random(100))
54
print(math.random(100))
61
math.sqrt(x) Returns the square root
of x. (You can also use
	the expression x ˆ 0.5
	to compute this value.)
print(math.sqrt(169)
	13
	print(math.sqrt(2))
	1.4142135623731

--function to round
function round(num, idp)
	local mult = 10 ˆ (idp or 0)
	return math.floor(num * mult + 0.5) / mult
end

--utlitity functions for develops in wow

-- takes in a string and splits it into seperate strings based
-- on the seperator sep
strsplit(sep, str)

-- takes a list of strings and concats them based ob sep
strjoin(sep, ...)

-- concatinates multiple strings does not leave spaces unless specified
strconcat(...)

--depricated
getglobal(name)

-- takes a var name a a string with a value and sets it to that var name
setglobal(name, value)

-- used to debug using a stack trace
debugstack([start[, count1[, count2]]])