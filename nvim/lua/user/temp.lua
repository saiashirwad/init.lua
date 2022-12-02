local M = {}

local keyset_lookup = {
	a = 1,
	b = 1,
	c = 1,
	d = 1,
	e = 1,
	f = 1,
	g = 1,
	h = 2,
	i = 2,
	j = 2,
	k = 2,
	l = 2,
	n = 2,
	o = 2,
	p = 2,
	r = 1,
	s = 1,
	t = 1,
	u = 2,
	v = 1,
	w = 1,
	x = 1,
	y = 2,
}

local keysets = {
	[1] = "wertxcvbasdgf",
	[2] = "hklyuiopnj",
}

M.perms = {
	{ "h", "s" },
	{ "k", "s" },
	-- { "l" },
	-- { "y" },
	-- { "u" },
	-- { "i" },
	-- { "o" },
	-- { "p" },
	-- { "n" },
	-- { "w" },
	-- { "e" },
	-- { "r" },
	-- { "t" },
	-- { "x" },
	-- { "c" },
	-- { "v" },
	-- { "b" },
	-- { "a" },
	{ "s" },
	{ "d" },
}

M.Perm = {}

function M.Perm.permutations(keys, n)
	return M.perms
end

return M
