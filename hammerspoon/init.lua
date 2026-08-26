-- Helper function to launch, focus, or cycle windows of an app
function toggleOrCycleApp(bundleID)
    local app = hs.application.get(bundleID)

    -- 1. If app is not running, launch it
    if not app then
        hs.application.launchOrFocusByBundleID(bundleID)
        return
    end

    -- 2. Get all visible windows belonging to this app
    local windows = app:visibleWindows()
    if #windows == 0 then
        app:activate() -- If open with no active windows, bring app forward
        return
    end

    local focusedWindow = hs.window.focusedWindow()

    -- 3. If the app is already focused, cycle to its next window
    if focusedWindow and focusedWindow:application():bundleID() == bundleID then
        if #windows > 1 then
            -- Move the focused window to the back, bring the second window forward
            windows[#windows]:focus()
        end
    else
        -- 4. If the app wasn't focused, bring its main window to front
        windows[1]:focus()
    end
end

hs.hotkey.bind({"alt"}, "j", function() toggleOrCycleApp("com.mitchellh.ghostty") end)          -- Ghostty
hs.hotkey.bind({"alt"}, "k", function() toggleOrCycleApp("com.apple.Safari") end)                -- Safari
hs.hotkey.bind({"alt"}, "l", function() toggleOrCycleApp("com.anthropic.claudefordesktop") end)  -- Claude