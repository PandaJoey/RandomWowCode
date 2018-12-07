-- Create a new scope for local variables
do
	local function get(self)
		return self.count
	end

	local function inc(self)
		self.count = self.count + 1
	end

	function new_counter(value)
		if type(value) ~= “number“ then
			value = 0
		end
		local obj = {
			count = value,
			get = get,
			inc = inc,
		}
		return obj
	end
end