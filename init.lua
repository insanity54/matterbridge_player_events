
local server_chat_name = 'SERVER'

print("[MOD] yl_matterbridge_player_events loaded.")


minetest.register_on_joinplayer(
    function(player)
        yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' joined.')
    end
)

minetest.register_on_dieplayer(
    function(player)
        yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' died.')
    end
)

minetest.register_on_leaveplayer(
    function (player, timed_out)
        if timed_out then
            yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' timed out.')
        else
            yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' left.')
        end
    end
)

minetest.register_on_cheat(
    function (player, cheat)
        yl_matterbridge.send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (' .. cheat.type .. ')')
    end
)

