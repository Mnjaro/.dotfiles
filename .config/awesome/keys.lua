local awful = require("awful")
local hotkeys_popup = require("awful.hotkeys_popup")
local apps = require("apps")

-- {{{ Key bindings


-- General Awesome keys
awful.keyboard.append_global_keybindings({
    -- App launcher
    awful.key({ modkey }, "space", function()
      awful.spawn(apps.default.app_launcher)
    end, { description = "open app launcher", group = "app" }),
    awful.key({ modkey }, "s", hotkeys_popup.show_help,
              {description="show help", group="awesome"}),
    awful.key({ modkey }, "w", function () mymainmenu:show() end,
              {description = "show main menu", group = "awesome"}),
    awful.key({ modkey, "Control" }, "r", awesome.restart,
              {description = "reload awesome", group = "awesome"}),
    awful.key({ modkey, "Shift"   }, "q", awesome.quit,
              {description = "quit awesome", group = "awesome"}),
    awful.key({ modkey }, "Return", function () awful.spawn(terminal) end,
              {description = "open a terminal", group = "launcher"}),
    awful.key({ modkey }, "r", function () awful.screen.focused().mypromptbox:run() end,
              {description = "run prompt", group = "launcher"}),
})

-- Tags related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "Left",   awful.tag.viewprev,
              {description = "view previous", group = "tag"}),
    awful.key({ modkey }, "Right",  awful.tag.viewnext,
              {description = "view next", group = "tag"}),
})

-- Focus related keybindings
awful.keyboard.append_global_keybindings({
    awful.key({ modkey }, "h",
        function ()
            awful.client.focus.bydirection("left")
        end,
        {description = "focus left client", group = "client"}
    ),
    awful.key({ modkey }, "j",
        function ()
            awful.client.focus.bydirection("down")
        end,
        {description = "focus down client", group = "client"}
    ),
    awful.key({ modkey }, "k",
        function ()
            awful.client.focus.bydirection("up")
        end,
        {description = "focus up client", group = "client"}
    ),
    awful.key({ modkey }, "l",
        function ()
            awful.client.focus.bydirection("right")
        end,
        {description = "focus right client", group = "client"}
    ),
})

