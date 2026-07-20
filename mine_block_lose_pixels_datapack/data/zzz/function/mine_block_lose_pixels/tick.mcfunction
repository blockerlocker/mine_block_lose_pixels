execute as @a if predicate bldp:mined_block run function zzz:mine_block_lose_pixels/player/mined_block

title @a[scores={mine_block_lose_pixels=1..}] actionbar [{"text":"Pixel Size: ",color:yellow},{score:{name:"*",objective:mine_block_lose_pixels},color:aqua}]