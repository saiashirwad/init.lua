local Keymap = require("user.keymap").keymap

local hop = require("hop")

hop.setup({
	keys = "hklyuiopnwertxcvbasdgjf",
})

local directions = require("hop.hint").HintDirection

-- Keymap("n", "F", function()
-- 	hop.hint_words({
-- 		direction = directions.BEFORE_CURSOR,
-- 		multi_windows = false,
-- 	})
-- end)
--
-- Keymap("n", "f", function()
-- 	hop.hint_words({
-- 		direction = directions.AFTER_CURSOR,
-- 		multi_windows = false,
-- 	})
-- end)
