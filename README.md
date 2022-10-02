# matterbridge_player_events Minetest mod

Requires the [yl_matterbridge](https://content.minetest.net/packages/AliasAlreadyTaken/yl_matterbridge/) mod which must be configured first for this mod to work.

This mod adds the following features

  * When a player joins, a message is sent to yl_matterbridge
  * When a player dies, a message is sent to yl_matterbridge
  * When a player leaves, a message is sent to yl_matterbridge
  * When a player cheats, a message is sent to yl_matterbridge

Each feature is optional, and can be enabled/disabled with the following settings in your minetest.conf

  * matterbridge_player_events.report_join   (default true)
  * matterbridge_player_events.report_die    (default true)
  * matterbridge_player_events.report_leave  (default true)
  * matterbridge_player_events.report_cheats (default false) (Use with caution: this can cause lag because there are lots of false positives which are rapidly fired)

