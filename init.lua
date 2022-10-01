
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
        -- for key, val in pairs(cheat) do  -- Table iteration.
        --   print(key, val)
        -- end
        print(cheat.type)
        if cheat.type == 'moved_too_fast' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (moved too fast)')
        elseif cheat.type == 'interacted_too_far' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (interacted too far)')
        elseif cheat.type == 'interacted_while_dead' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (interacted while dead)')
        elseif cheat.type == 'finished_unknown_dig' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (finished unknown dig)')
        elseif cheat.type == 'dug_unbreakable' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (dug unbreakable)')
        elseif cheat.type == 'dug_too_fast' then
            yl_matterbridge:send_to_bridge(server_chat_name, player:get_player_name() .. ' cheated. (dug too fast)')
        end
    end
)

