local M = {}

local temp_perms = require("user.temp").perms
print(vim.inspect(temp_perms))
local log = require("user.log")

-- Get the first key of a key set.
local function first_key(keys)
	-- return keys:sub(1, vim.fn.byteidx(keys, 1))  --- ?????
	return keys:sub(1, 1)
end

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

-- Get the next key of the input key in the input key set, if any, or return nil.
local function next_key(keys, key)
	local _, e = keys:find(key, 1, true)

	if e == #keys then
		return nil
	end

	-- local cur_keyset = keyset_lookup[key]
	-- if cur_keyset == 1 then
	-- 	keys = keysets[2]
	-- else
	-- 	keys = keysets[1]
	-- end

	local next = keys:sub(e + 1)
	local n = next:sub(1, vim.fn.byteidx(next, 1))

	return n
end

-- Permutation algorithm based on tries and backtrack filling.
M.TrieBacktrackFilling = {}

-- Get the sequence encoded in a trie by a pointer.
function M.TrieBacktrackFilling:lookup_seq_trie(trie, p)
	local seq = {}
	local t = trie

	for _, i in pairs(p) do
		local current_trie = t[i]

		seq[#seq + 1] = current_trie.key
		t = current_trie.trie
	end

	seq[#seq + 1] = t[#t].key

	return seq
end

-- Add a new permutation to the trie at the current pointer by adding a key.
function M.TrieBacktrackFilling:add_trie_key(trie, p, key)
	local seq = {}
	local t = trie

	-- find the parent trie
	for _, i in pairs(p) do
		local current_trie = t[i]

		seq[#seq + 1] = current_trie.key
		t = current_trie.trie
	end

	t[#t + 1] = { key = key, trie = {} }

	return trie
end

-- Maintain a trie pointer of a given dimension.
--
-- If a pointer has components { 4, 1 } and the dimension is 4, this function will automatically complete the missing
-- dimensions by adding the last index, i.e. { 4, 1, X, X }.
local function maintain_deep_pointer(depth, n, p)
	local q = vim.deepcopy(p)

	for i = #p + 1, depth do
		q[i] = n
	end

	return q
end

-- Generate the next permutation with backtrack filling.
--
-- - `keys` is the input key set.
-- - `trie` is a trie representing all the already generated permutations.
-- - `p` is the current pointer in the trie. It is a list of indices representing the parent layer in which the current
--   sequence occurs in.
--
-- Returns `perms` added with the next permutation.
function M.TrieBacktrackFilling:next_perm(keys, trie, p)
	if #trie == 0 then
		return { { key = first_key(keys), trie = {} } }, p
	end

	-- check whether the current sequence can have a next one
	local current_seq = self:lookup_seq_trie(trie, p)
	local key = next_key(keys, current_seq[#current_seq])

	if key ~= nil then
		-- we can generate the next permutation by just adding key to the current trie
		self:add_trie_key(trie, p, key)
		return trie, p
	else
		-- we have to backtrack; first, decrement the pointer if possible
		local max_depth = #p
		local keys_len = vim.fn.strwidth(keys)

		while #p > 0 do
			local last_index = p[#p]
			if last_index > 1 then
				p[#p] = last_index - 1

				p = maintain_deep_pointer(max_depth, keys_len, p)

				-- insert the first key at the new pointer after mutating the one already there
				self:add_trie_key(trie, p, first_key(keys))
				self:add_trie_key(trie, p, next_key(keys, first_key(keys)))
				return trie, p
			else
				-- we have exhausted all the permutations for the current layer; drop the layer index and try again
				p[#p] = nil
			end
		end

		-- all layers are completely full everywhere; add a new layer at the end
		p = maintain_deep_pointer(max_depth, keys_len, p)

		p[#p + 1] = #trie -- new layer
		self:add_trie_key(trie, p, first_key(keys))
		self:add_trie_key(trie, p, next_key(keys, first_key(keys)))

		return trie, p
	end
end

function M.TrieBacktrackFilling:trie_to_perms(trie, perm)
	local perms = {}
	local p = vim.deepcopy(perm)
	p[#p + 1] = trie.key

	if #trie.trie > 0 then
		for _, sub_trie in pairs(trie.trie) do
			vim.list_extend(perms, self:trie_to_perms(sub_trie, p))
		end
	else
		perms = { p }
	end

	return perms
end

function M.TrieBacktrackFilling:permutations(keys, n)
	-- local perms = {}
	-- local trie = {}
	-- local p = {}
	--
	-- -- keys = string.sub(keys, 1, 4)
	-- --  print(keys)
	--
	-- for _ = 1, n do
	-- 	trie, p = self:next_perm(keys, trie, p)
	-- end
	--
	-- for _, sub_trie in pairs(trie) do
	-- 	vim.list_extend(perms, self:trie_to_perms(sub_trie, {}))
	-- end
	--
	-- log.debug("Permutations: ", perms)
	-- return perms
	return temp_perms
end

-- function M.permutations(keys, n, opts)
-- 	local perms = opts.perm_method:permutations(keys, n, opts)
-- 	return perms
-- end

return M
