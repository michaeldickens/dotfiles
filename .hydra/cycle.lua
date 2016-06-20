ext.cycle = {}

function ext.cycle.next_window(activewindow, windows, dir)
  local filteredwindows = fnutils.filter(windows, function(win) return win:isstandard() end)

  if #filteredwindows < 2 then
    return nil
  end

  table.sort(filteredwindows, function(a, b) return a:id() < b:id() end)
  local activewindowindex = fnutils.indexof(filteredwindows, activewindow)

  if activewindowindex then
    local nextwindowindex
    if dir < 0 and activewindowindex <= math.abs(dir) then
      nextwindowindex = #filteredwindows + dir + 1
    elseif dir > 0 and activewindowindex == #filteredwindows then
      nextwindowindex = dir
    else
      nextwindowindex = activewindowindex + dir
    end

    filteredwindows[nextwindowindex]:focus()
  end
end

function ext.cycle.applicationwindows(dir)
  local activewindow = window.focusedwindow()
  local applicationwindows = activewindow:application():visiblewindows()
  ext.cycle.next_window(activewindow, applicationwindows, dir)
end
