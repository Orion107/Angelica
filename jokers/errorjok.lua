SMODS.Joker{ --ERROR
    key = "errorjok",
    config = {
        extra = {
            emult_min = 1,
            emult_max = 2.3
        }
    },
    loc_txt = {
        ['name'] = 'ERROR',
        ['text'] = {
            [1] = '{C:green}ERRORERRORERRORERROR',
            [2] = 'ERRORERRORERRORERROR',
            [3] = 'ERRORERRORERRORERROR',
            [4] = 'ERRORERRORERRORERROR{}'
        },
        ['unlock'] = {
            [1] = ''
        }
    },
    pos = {
        x = 2,
        y = 0
    },
    display_size = {
        w = 71 * 1, 
        h = 95 * 1
    },
    cost = 127,
    rarity = "angelica_angelic",
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play  then
                return {
                    e_mult = pseudorandom('emult_bb29b5c5', card.ability.extra.emult_min, card.ability.extra.emult_max),
                    message = "ERROR"
                }
        end
    end
}