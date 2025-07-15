SMODS.Joker{ --ERROR
    name = "ERROR",
    key = "errorjok",
    config = {
        extra = {
            Xmult_min = 0.1,
            Xmult_max = 23
        }
    },
    loc_txt = {
        ['name'] = 'ERROR',
        ['text'] = {
            [1] = '{C:dark_edition}ERRORERRORERRORERROR',
            [2] = 'ERRORERRORERRORERROR',
            [3] = 'ERRORERRORERRORERROR',
            [4] = 'ERRORERRORERRORERROR{}'
        }
    },
    pos = {
        x = 4,
        y = 0
    },
    cost = 333,
    rarity = "angelica_angelic",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint then
                return {
                    Xmult = pseudorandom('Xmult_807f7893', card.ability.extra.Xmult_min, card.ability.extra.Xmult_max)
                }
        end
    end
}