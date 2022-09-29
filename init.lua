local lava_nodes = {"default:lava_source","default:lava_flowing"}

local function get_biome_name(pos)
	if not pos then return "" end
	local data = minetest.get_biome_data(pos)
	if not data then return "" end
	local name = minetest.get_biome_name(data.biome)
	return name
end

minetest.register_abm({
    nodenames = lava_nodes,
    interval = 1,
    chance = 1,
    action = function(pos, node)
        if pos.y > -50 then
            if not (get_biome_name(pos) == "fiery") then
                --isn't fiery, so lets see one more thing
                local is_protected = minetest.is_protected
                if is_protected then
                    local owner = nil
                    if not is_protected(pos, "") then
                        --isn't protected, so block lava
                        minetest.set_node(pos, {name="default:stone"})
                    end
                else
                    minetest.set_node(pos, {name="default:stone"})
                end
            end
        end
    end,
})
