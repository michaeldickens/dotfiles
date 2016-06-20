require "grid"
require "cycle"

hydra.alert "Hail Hydra"

-- Main Menu
hydra.menu.show(function()
    return {
      {title = "Reload Config", fn = hydra.reload},
      {title = "-"},
      {title = "About", fn = hydra.showabout},
      {title = "Quit Hydra", fn = os.exit},
    }
end)

-- Keybindings
local mash = {"ctrl", "alt", "cmd"}
local mashshift = {"ctrl", "alt", "cmd", "shift"}

hotkey.bind(mash, ',', function() ext.grid.snap(window.focusedwindow()) end)
hotkey.bind(mash, '.', function() fnutils.map(window.visiblewindows(), ext.grid.snap) end)

hotkey.bind(mash, '#', function() ext.cycle.applicationwindows(1) end)
hotkey.bind(mash, '+', function() ext.cycle.applicationwindows(-1) end)

hotkey.bind(mash, 'S', ext.grid.lefthalf)
hotkey.bind(mash, 'D', ext.grid.maximize_window)
hotkey.bind(mash, 'F', ext.grid.righthalf)

hotkey.bind(mash, 'J', ext.grid.pushwindow_down)
hotkey.bind(mash, 'K', ext.grid.pushwindow_up)
hotkey.bind(mash, 'H', ext.grid.pushwindow_left)
hotkey.bind(mash, 'L', ext.grid.pushwindow_right)

hotkey.bind(mash, 'U', ext.grid.resizewindow_taller)
hotkey.bind(mash, 'O', ext.grid.resizewindow_wider)
hotkey.bind(mash, 'I', ext.grid.resizewindow_thinner)


hotkey.bind(mash, "R", repl.open)
