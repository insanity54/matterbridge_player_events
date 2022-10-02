
local server_chat_name = 'SERVER'

local function get_setting(setting_name, default)
    return minetest.settings:get_bool(setting_name) or default
end

print("[MOD] yl_matterbridge_player_events loaded.")




if get_setting("yl_matterbridge_player_events.report_join", true) then
    minetest.register_on_joinplayer(
        function(player)
            yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' joined.')
        end
    )
end

if get_setting("yl_matterbridge_player_events.report_die", true) then
    minetest.register_on_dieplayer(
        function(player)
            yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' died.')
        end
    )
end

if get_setting("yl_matterbridge_player_events.report_leave", true) then
    minetest.register_on_leaveplayer(
        function (player, timed_out)
            if timed_out then
                yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' timed out.')
            else
                yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' left.')
            end
        end
    )
end

if get_setting("yl_matterbridge_player_events.report_cheats", false) then
    minetest.register_on_cheat(
        function (player, cheat)
            yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (' .. cheat.type .. ')')
        end
    )
end

