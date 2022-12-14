local wilder = require("wilder")

wilder.setup({ modes = { ":", "/", "?" } })

wilder.set_option(
	"renderer",
	wilder.wildmenu_renderer(wilder.wildmenu_airline_theme({
		highlights = { default = "StatusLine" },
		highlighter = wilder.basic_highlighter(),
		separator = " . ",
	}))
)
