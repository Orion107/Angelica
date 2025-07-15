SMODS.Joker{ --Drag n Drop
    name = "Drag n Drop",
    key = "dragndropjok",
    config = {
        extra = {
            Xmult = 0.1,
            odds = 8,
            j_joker = 0
        }
    },
    loc_txt = {
        ['name'] = 'Drag n Drop',
        ['text'] = {
            [1] = '{X:red,C:white}x0.1{} Mult.',
            [2] = '{C:green}#1# in #2#{} chance of creating a',
            [3] = 'random Negative {C:legendary}Legendary{} Joker and destroying self.'
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    cost = 10,
    rarity = 3,
    blueprint_compat = false,
    eternal_compat = false,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {G.GAME.probabilities.normal, card.ability.extra.odds}}
    end,

    calculate = function(self, card, context)
        if context.cardarea == G.jokers and context.joker_main then
            if true then
                return {
                    Xmult = card.ability.extra.Xmult,
                    message = "Dragged!"
                ,
                    func = function()
                        if pseudorandom('group_0_95571883') < G.GAME.probabilities.normal / card.ability.extra.odds then
                        local created_joker = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local joker_card = SMODS.add_card({
                            set = 'Joker',
                            rarity = 'Legendary',
                            key_append = 'joker_forge_random'
                        })
                        joker_card:set_edition("e_negative", true)
                        return true
                    end
                }))
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = created_joker and localize('k_plus_joker') or nil, colour = G.C.BLUE})
                        SMODS.calculate_effect({func = function()
                card:start_dissolve()
                return true
            end}, card)
                        card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Dropped!", colour = G.C.RED})
                    end
                        return true
                    end
                }
            end
        end
    end
}