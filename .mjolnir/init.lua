-- TODO: Use bg.grid.pushwindows_[direction] to move window instead of nudge and expand. The way I do it now doesn't fit to a grid. See Dash documentation.

local application = require "mjolnir.application"
local grid = require "mjolnir.bg.grid"
local hotkey = require "mjolnir.hotkey"
local window = require "mjolnir.window"
local screen = require "mjolnir.screen"
local fnutils = require "mjolnir.fnutils"

key1 = {"cmd", "alt", "ctrl"}
key2 = {"cmd", "alt", "ctrl", "shift"}

grid.MARGINX = 0
grid.MARGINY = 0
grid.GRIDWIDTH = 2
grid.GRIDHEIGHT = 2

screens = screen.allscreens()
screen1 = screens[1]
screen2 = screens[2]

-- a helper function that returns another function that resizes the
-- current window to a certain grid size.
local gridset = function(target_screen, x, y, w, h)
   return function()
      cur_window = window.focusedwindow()
      grid.set(
         cur_window,
         {x=x, y=y, w=w, h=h},
         target_screen
      )
   end
end

local gridset1 = function(x, y, w, h)
   return gridset(screen1, x, y, w, h)
end

local gridset2 = function(x, y, w, h)
   return gridset(screen2, x, y, w, h)
end

hotkey.bind(key1, 's', gridset1(0, 0, 1, 2)) -- left half
hotkey.bind(key1, 'd', gridset1(0, 0, 2, 2))
hotkey.bind(key1, 'f', gridset1(1, 0, 1, 2)) -- right half

hotkey.bind(key1, 'w', gridset2(0, 0, 1, 2)) -- left half
hotkey.bind(key1, 'e', gridset2(0, 0, 2, 2))
hotkey.bind(key1, 'r', gridset2(1, 0, 1, 2)) -- right half

nudgeDistance = 720 / 6

expand = function(dw, dh)
   local win = window.focusedwindow()
   local f = win:frame()
   f.w = f.w + dw
   f.h = f.h + dh
   win:setframe(f)
end

nudge = function(dx, dy)
   local win = window.focusedwindow()
   local f = win:frame()
   f.x = f.x + dx
   f.y = f.y + dy
   win:setframe(f)
end

expandLeft = function()
   expand(-nudgeDistance, 0)
end

expandRight = function()
   expand(nudgeDistance, 0)
end

expandUp = function()
   expand(0, -nudgeDistance)
end

expandDown = function()
   expand(0, nudgeDistance)
end

nudgeLeft = function()
   nudge(-nudgeDistance, 0)
end

nudgeRight = function()
   nudge(nudgeDistance, 0)
end

nudgeUp = function()
   nudge(0, -nudgeDistance)
end

nudgeDown = function()
   nudge(0, nudgeDistance)
end

hotkey.bind(key1, "left", expandLeft)
hotkey.bind(key1, "right", expandRight)
hotkey.bind(key1, "up", expandUp)
hotkey.bind(key1, "down", expandDown)

hotkey.bind(key2, "left", nudgeLeft)
hotkey.bind(key2, "right", nudgeRight)
hotkey.bind(key2, "up", nudgeUp)
hotkey.bind(key2, "down", nudgeDown)

function focus(letter, name)
   hotkey.bind(key2, letter, function () application.launchorfocus(name) end)
end

focus('a', 'Activity Monitor')
focus('b', 'Bean')
focus('c', 'Google Chrome')
focus('d', 'Finder')
focus('e', 'Emacs')
focus('f', 'Firefox')
focus('g', 'Messenger')
focus('i', 'iTunes')
focus('j', 'Slack')
focus('k', 'KeePassX')
focus('l', 'VLC')
-- focus('m', 'Mail')
focus('p', 'Preview')
focus('s', 'Messages')
focus('t', 'iTerm')
focus('v', 'VMWare Fusion')
focus('w', 'Microsoft Word')
focus('x', 'Microsoft Excel')
focus('y', 'Spotify')
