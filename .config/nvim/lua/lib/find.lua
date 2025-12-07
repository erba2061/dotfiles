return function(t, f)
	for i = 1, #t do
		if f(t[i]) then
			return i, t[i]
		end
	end
end
