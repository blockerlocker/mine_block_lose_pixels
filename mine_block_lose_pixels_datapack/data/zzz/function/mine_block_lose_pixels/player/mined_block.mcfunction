function bldp:mined_block/reset

execute unless score @s mine_block_lose_pixels matches 1.. run scoreboard players add @s mine_block_lose_pixels 1

execute store result storage mine_block_lose_pixels:temp all.pixels int 1 run scoreboard players add @s mine_block_lose_pixels 1

function zzz:mine_block_lose_pixels/player/apply_post_effect with storage mine_block_lose_pixels:temp all