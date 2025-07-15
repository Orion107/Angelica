SMODS.Joker{ --Luck of the Jimbo
    name = "Luck of the Jimbo",
    key = "luckofthejimbojok",
    config = {
        extra = {
            repetitions = 1,
            emult = 1.07
        }
    },
    loc_txt = {
        ['name'] = 'Luck of the Jimbo',
        ['text'] = {
            [1] = '{X:legendary,C:white}^1.7{} Mult and Retrigger when {C:attention}Lucky{} Card is triggered.',
            [2] = 'Turns all non-{C:attention}Lucky{} Cards into {C:attention}Lucky{} Cards.{C:dark_edition}{}'
        }
    },
    pos = {
        x = 0,
        y = 0
    },
    cost = 333,
    rarity = "angelica_angelic",
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',
    soul_pos = {
        x = 1,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    repetitions = card.ability.extra.repetitions,
                    message = localize('k_again_ex')
                }
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            if SMODS.get_enhancements(context.other_card)["m_lucky"] == true then
                return {
                    e_mult = card.ability.extra.emult
                }
            else
                context.other_card:set_ability(G.P_CENTERS.m_lucky)
                return {
                    message = "Lucked!"
                }
            end
        end
    end
}