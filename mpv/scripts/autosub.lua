-- requires subliminal, version 1.0 or newer
-- default keybinding: b
-- add the following to your input.conf to change the default keybinding:
-- keyname script_binding auto_load_subs
local utils = require 'mp.utils'
function load_sub_fn()
    lang_ids = {"en", "es"}
    subl = "/usr/bin/subliminal" 
    --local path = mp.get_property("working-directory").."/"..mp.get_property("path")
    local pathfile = mp.get_property("path")
    local path, file = utils.split_path(pathfile)
    -- we now use 'which subliminal' to find the path
    t = {}
    t.args = {"which", "subliminal"}
    which = utils.subprocess(t).stdout:gsub("^%s*(.-)%s*$", "%1")
    if string.len(which) > 0 then
        subl = which
    else
        mp.msg.warn("which can't find subliminal!")
    end
    for i in ipairs(lang_ids) do
        info = "Searching "..lang_ids[i].." subtitle for "..path
        mp.msg.info(info)
        mp.osd_message(info)
        t.args = {subl, "download", "-l",lang_ids[i], path}
        res = utils.subprocess(t)
        if res.status == 0 then
            subname = path..mp.get_property("filename/no-ext").."."..lang_ids[i].."."
            mp.msg.info("Subtitle "..lang_ids[i].." download succeeded as "..subname)
            mp.osd_message("Subtitle "..lang_ids[i].." download succeeded as "..subname)
            local files = utils.readdir(path, "files")
            for i = 1, #files do
                mp.msg.info("got file "..files[i].."looking for "..subname.." in "..path)
                if ((string.find(path..files[i], subname, 1, true) == nil) == false) then
                    subname = path..files[i]
                    mp.msg.info("adding "..subname)
                    mp.commandv("sub-add", subname, "auto")
                end
            end
        else
            mp.msg.warn("Subtitle "..lang_ids[i].." download failed")
            mp.osd_message("Subtitle "..lang_ids[i].." download failed")
        end
    end
end

mp.add_key_binding("b", "auto_load_subs", load_sub_fn)
