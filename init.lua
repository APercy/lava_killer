local lava_nodes = {"default:lava_source","default:lava_flowing"}

minetest.register_abm({
    nodenames = lava_nodes,
    interval = 1,
    chance = 1,
    action = function(pos, node)
        if pos.y > -50 then
            local is_protected = minetest.is_protected
            if is_protected then
                local owner = nil
                if not is_protected(pos, "") then
                    minetest.env:set_node(pos, {name="default:stone"})
                end
            else
                minetest.env:set_node(pos, {name="default:stone"})
            end
        end
    end,
})
