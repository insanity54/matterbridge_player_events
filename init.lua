
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
        print(cheat)
        if cheat == 'moved_too_fast' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (moved too fast)')
        elseif cheat == 'interacted_too_far' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (interacted too far)')
        elseif cheat == 'interacted_while_dead' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (interacted while dead)')
        elseif cheat == 'finished_unknown_dig' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (finished unknown dig)')
        elseif cheat == 'dug_unbreakable' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (dug unbreakable)')
        elseif cheat == 'dug_too_fast' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (dug too fast)')
        end
    end
)

