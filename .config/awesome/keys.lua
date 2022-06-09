local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("apps")

-- {{{ Key bindings
----------------------------
mod = "Mod4"
alt = "Mod1"
ctrl = "Control"
shift = "Shift"



-- General Awesome keys
awful.keyboard.append_global_keybindings({
    -- App launcher
    awful.key({ mod }, "space", function()
      awful.spawn(apps.default.app_launcher)
    end, { description = "open app launcher", group = "app" }),
    awful.key({ mod }, "s", hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ mod }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ mod, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ mod, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ mod }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ mod }, "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),
		-- Toggle floating
		awful.key({ mod, ctrl }, "space", function(c) awful.client.floating.toggle(c) end),
		-- Center window
		awful.key({ mod }, "c", function()
			awful.placement.centered(c, { honor_workarea = true, honor_padding = true })
		end),
		-- Close window
		awful.key({ mod }, "q", function()
			client.focus:kill()
		end),
    -- Select Tag
    awful.key {
        modifiers   = { modkey },
        keygroup    = "numrow",
        description = "only view tag",
        group       = "tag",
        on_press    = function (index)
            local screen = awful.screen.focused()
            local tag = screen.tags[index]
            if tag then
                tag:view_only()
            end
        end,
    },
    awful.key({modkey, ctrl }, "o", awful.client.movetoscreen),
    awful.key {
        modifiers = { modkey, "Shift" },
        keygroup    = "numrow",
        description = "move focused client to tag",
        group       = "tag",
        on_press    = function (index)
            if client.focus then
                local tag = client.focus.screen.tags[index]
                if tag then
                    client.focus:move_to_tag(tag)
                end
            end
        end,
    },
    awful.key({ modkey }, "x",
      function ()
          awful.prompt.run {
            prompt       = "Run Lua code: ",
            textbox      = awful.screen.focused().mypromptbox.widget,
            exe_callback = awful.util.eval,
            history_path = awful.util.get_cache_dir() .. "/history_eval"
          }
      end,
      {description = "lua execute prompt", group = "awesome"}),
})

-- Resizing keybindings
awful.keyboard.append_global_keybindings({
	awful.key({ mod, shift }, "k", function(c)
		helpers.resize_client(client.focus, "up")
	end, { description = "resize to the up", group = "client" }),
	awful.key({ mod, shift }, "j", function(c)
		helpers.resize_client(client.focus, "down")
	end, { description = "resize to the down", group = "client" }),
	awful.key({ mod, shift }, "h", function(c)
		helpers.resize_client(client.focus, "left")
	end, { description = "resize to the left", group = "client" }),
	awful.key({ mod, shift }, "l", function(c)
		helpers.resize_client(client.focus, "right")
	end, { description = "resize to the right", group = "client" }),
})
-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ mod, shift }, "h",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ mod, shift }, "l",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
})

-- Resizing with mouse
client.connect_signal("request::default_mousebindings", function()
    awful.mouse.append_client_mousebindings({
        awful.button({ }, 1, function (c)
            c:activate { context = "mouse_click" }
        end),
        awful.button({ modkey }, 1, function (c)
            c:activate { context = "mouse_click", action = "mouse_move"  }
        end),
        awful.button({ modkey }, 3, function (c)
            c:activate { context = "mouse_click", action = "mouse_resize"}
        end),
    })
end)

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ mod }, "h",
        function ()
            awful.client.focus.bydirection("left")
        end,
        {description = "focus left client", group = "client"}
    ),
    awful.key({ mod }, "j",
        function ()
            awful.client.focus.bydirection("down")
        end,
        {description = "focus down client", group = "client"}
    ),
    awful.key({ mod }, "k",
        function ()
            awful.client.focus.bydirection("up")
        end,
        {description = "focus up client", group = "client"}
    ),
    awful.key({ mod }, "l",
        function ()
            awful.client.focus.bydirection("right")
        end,
        {description = "focus right client", group = "client"}
    ),
    -- to go to next screen
    awful.key({ modkey, ctrl}, "l", function () awful.screen.focus(1) end),
    -- to active screen 2
    awful.key({ modkey, ctrl, }, "h", function () awful.screen.focus(2) end)

})

