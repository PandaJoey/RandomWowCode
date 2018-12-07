tbl1 = {"alpha", "beta", "gamma"}
tbl2 = {"delta", "epsilon", "zeta"}
tbl3 = {}
mt = {}
setmetatable(tbl1, mt)
setmetatable(tbl2, mt)
setmetatable(tbl3, mt)

function mt.__add(a,b)
	local result = setmetatable({}, mt)
-- Copy table a in first
for i = 1, #a do
	table.insert(result, a[i])
end
-- Copy table b in second
for i = 1, #b do
	table.insert(result, b[i])
end
return result
end

--tests
add_test = tbl1 + tbl2
print(#add_test)
for i = 1, #add_test do 
	print(i, add_test[i]) 
end

function mt.__tostring(tbl)
	local result = “{“
	for i = 1, #tbl do
		if i > 1 then
			result = result .. “, “
		end
		result = result .. tostring(tbl[i])
	end
	result = result .. “}“
	return result
end

-- tests
print(tbl1)
print(tbl2)
print(tbl3)

mt.__concat = mt.__add
print(tbl1 .. tbl2)

tbl4 = {["Night elf"] = "Nachtelf"}
setmetatable(tbl4, mt)

enUS_defaults = {
["Human"] = "Human",
["Night elf"] = "Night elf",
}
mt.__index = enUS_defaults

--tests

print(tbl4[“Night elf“])
print(tbl4[“Human“])
print(tbl3[“Night elf“])

defaults_mt = {
__index = function(tbl, key)
if type(key) == "string" then
	print("Return default value of '" .. key .. "' for key: " .. key)
	return key
else
	return nil
end
end,
}
setmetatable(enUS_defaults, defaults_mt)

--tests
print(tbl4["Night elf"])
print(tbl4["Human"])
print(tbl4["Gnome"])
print(tbl4[1])

function mt.__newindex(tbl, key, value)
	if key == "banana" then
		error("Cannot set a protected key")
	else
		rawset(tbl, key, value)
	end
end

--tests
tbl1.apple = “red“
print(tbl1.apple)
tbl1.banana = “yellow“
print(tbl1.banana)