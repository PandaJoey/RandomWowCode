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

--tests
add_test = tbl1 + tbl2
print(#add_test)
6
for i = 1, #add_test do 
	print(i, add_test[i]) 
end