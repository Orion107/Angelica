SMODS.Joker{ --Unloaded Joker
    name = "Unloaded Joker",
    key = "unloadedjoker",
    config = {
        extra = {
        }
    },
    loc_txt = {
        ['name'] = 'Unloaded Joker',
        ['text'] = {
            [1] = '{C:inactive}Oops! Joker.JKR failed to load!{}'
        }
    },
    pos = {
        x = 8,
        y = 0
    },
    cost = 1,
    rarity = "angelica_bad",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    set_ability = function(self, card, initial)
        card:set_eternal(true)
        card:add_sticker('rental', true)
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.cardarea == G.jokers and context.joker_main then
                return {
                    message = "Failed to load!"
                }
        end
        if context.pre_discard and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.discard and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.individual and context.cardarea == G.hand and not context.end_of_round and not context.blueprint then
        end
        if context.after and context.cardarea == G.jokers then
                return {
                    message = "Failed to load!"
                }
        end
        if context.hand_drawn and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.first_hand_drawn and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.cardarea == G.hand and context.end_of_round and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.selling_card and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
        if context.reroll_shop and not context.blueprint then
                return {
                    message = "Failed to load!"
                }
        end
    end
}