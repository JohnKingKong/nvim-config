return {
  "nvzone/timerly",
  dependencies = "nvzone/volt",
  cmd = "TimerlyToggle",
  opts = {
    -- "center" (default) sits over your code; corner placement stays out
    -- of the way. Width/height aren't configurable upstream (hardcoded in
    -- timerly's own init.lua/state.lua) -- only position is.
    position = "top-right",
  },
}
