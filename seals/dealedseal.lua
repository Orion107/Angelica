SMODS.Seal {
    key = 'dealedseal',
    pos = { x = 0, y = 0 },
    config = {
        extra = {
            x_mult = 6
        }
    },
    badge_colour = HEX('DC045C'),
   loc_txt = {
        name = 'Dealed Seal',
        label = 'Dealed Seal',
        text = {
        [1] = '{X:red,C:white}x4{} Mult, but destroys card after scoring.'
    }
    },
    atlas = 'CustomSeals',
    unlocked = true,
    discovered = true,
    no_collection = false,
    calculate = function(self, card, context)
        if context.destroy_card and context.cardarea == G.play and context.destroy_card == card and card.should_destroy then
            G.E_MANAGER:add_event(Event({
                func = function()
                    card:start_dissolve()
                    return true
                end
            }))
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Card Destroyed!", colour = G.C.RED})
            return
        end
        if context.main_scoring and context.cardarea == G.play then
            card.should_destroy = false
            card.should_destroy = true
            SMODS.calculate_effect({x_mult = card.ability.seal.extra.x_mult}, card)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Sealed!", colour = G.C.RED})
        end
    end
}