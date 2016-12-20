-- TODO: Use bg.grid.pushwindows_[direction] to move window instead of nudge and expand. The way I do it now doesn't fit to a grid. See Dash documentation.

key1 = {}
key2 = {"shift"}

-- A global variable for the Hyper Mode
hyper = hs.hotkey.modal.new({}, "F17")

-- For if you hit shift before hitting hyper
hyper2 = hs.hotkey.modal.new({}, "F16")

pressedF18 = function()
  hyper:enter()
end

releasedF18 = function()
  hyper:exit()
end

pressedShiftF18 = function()
  hyper2:enter()
end

releasedShiftF18 = function()
  hyper2:exit()
end

-- Bind the Hyper key
hs.hotkey.bind({}, 'F18', pressedF18, releasedF18)
hs.hotkey.bind({"shift"}, 'F18', pressedShiftF18, releasedShiftF18)

hs.grid.MARGINX = 0
hs.grid.MARGINY = 0
hs.grid.GRIDWIDTH = 2
hs.grid.GRIDHEIGHT = 2

screens = hs.screen.allScreens()
screen1 = screens[1]
screen2 = screens[2]

-- a helper function that returns another function that resizes the
-- current window to a certain grid size.
local gridset = function(target_screen, x, y, w, h)
   return function()
      cur_window = hs.window.focusedWindow()
      hs.grid.set(
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

nudgeDistance = 720 / 6

expand = function(dw, dh)
   local win = hs.window.focusedWindow()
   local f = win:frame()
   f.w = f.w + dw
   f.h = f.h + dh
   win:setFrame(f)
end

nudge = function(dx, dy)
   local win = hs.window.focusedWindow()
   local f = win:frame()
   f.x = f.x + dx
   f.y = f.y + dy
   win:setFrame(f)
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

function key1_bind(letter, action)
   hyper:bind(key1, letter, nil, action)
end

function key2_bind(letter, action)
   hyper:bind(key2, letter, nil, action)
   hyper2:bind(key2, letter, nil, action)
end

key1_bind('s', gridset1(0, 0, 1, 2)) -- left half
key1_bind('d', gridset1(0, 0, 2, 2))
key1_bind('f', gridset1(1, 0, 1, 2)) -- right half

key1_bind('w', gridset2(0, 0, 1, 2)) -- left half
key1_bind('e', gridset2(0, 0, 2, 2))
key1_bind('r', gridset2(1, 0, 1, 2)) -- right half

key1_bind("left", expandLeft)
key1_bind("right", expandRight)
key1_bind("up", expandUp)
key1_bind("down", expandDown)

key2_bind("left", nudgeLeft)
key2_bind("right", nudgeRight)
key2_bind("up", nudgeUp)
key2_bind("down", nudgeDown)

function focus(letter, name)
   key2_bind(letter, function () hs.application.launchOrFocus(name) end)
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
focus('p', 'Preview')
focus('s', 'Messages')
focus('t', 'iTerm')
focus('v', 'VMWare Fusion')
focus('w', 'Trader Workstation')
focus('x', 'Microsoft Excel')
focus('y', 'Spotify')


-- Paste for websites that disable normal paste
hs.hotkey.bind({"cmd", "alt"}, "V", function() hs.eventtap.keyStrokes(hs.pasteboard.getContents()) end)
