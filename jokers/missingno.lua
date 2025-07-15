SMODS.Joker{ --MISSINGNO
    name = "MISSINGNO",
    key = "missingno",
    config = {
        extra = {
            juggle = 0
        }
    },
    loc_txt = {
        ['name'] = 'MISSINGNO',
        ['text'] = {
            [1] = 'Enemy {C:inactive}4  85 hfdwsh8 245ghj 93825 nfhwuti oabif TMTRAINER MissingNo.{} is {C:planet}frozen solid{}!',
            [2] = 'Enemy {C:inactive}4  85 hfdwsh8 245ghj 93825 nfhwuti oabif TMTRAINER MissingNo.{} is {C:diamonds}hurt by the burn{}!'
        }
    },
    pos = {
        x = 6,
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
        x = 7,
        y = 0
    },

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    set_ability = function(self, card, initial)
        card:add_sticker('perishable', true)
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
                return {
                    func = function()
            local target_cards = {}
            for i, consumable in ipairs(G.consumeables.cards) do
                if consumable.ability.set == "" then
                    table.insert(target_cards, consumable)
                end
            end
            if #target_cards > 0  then
                local card_to_copy = pseudorandom_element(target_cards, pseudoseed('copy_consumable'))
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local copied_card = copy_card(card_to_copy)
                        copied_card:set_edition("e_negative", true)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                        
                        return true
                    end
                }))
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "Ran Away!", colour = G.C.GREEN})
            end
                    return true
                end
                }
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
                local created_tarot = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local tarot_card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, nil, 'joker_forge_tarot')
                        tarot_card:set_edition("e_negative", true)
                        tarot_card:add_to_deck()
                        G.consumeables:emplace(tarot_card)
                        return true
                    end
                }))
                local created_planet = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local planet_card = create_card('Planet', G.consumeables, nil, nil, nil, nil, nil, 'joker_forge_planet')
                        planet_card:set_edition("e_negative", true)
                        planet_card:add_to_deck()
                        G.consumeables:emplace(planet_card)
                        return true
                    end
                }))
                local created_spectral = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local spectral_card = create_card('Spectral', G.consumeables, nil, nil, nil, nil, nil, 'joker_forge_spectral')
                        spectral_card:set_edition("e_negative", true)
                        spectral_card:add_to_deck()
                        G.consumeables:emplace(spectral_card)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                func = function()
                    local tag = Tag("tag_juggle")
                    tag:set_ability()
                    add_tag(tag)
                    play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
                    return true
                end
            }))
                return {
                    message = created_tarot and localize('k_plus_tarot') or nil,
                    extra = {
                        message = created_planet and localize('k_plus_planet') or nil,
                        colour = G.C.SECONDARY_SET.Planet,
                        extra = {
                            message = created_spectral and localize('k_plus_spectral') or nil,
                            colour = G.C.SECONDARY_SET.Spectral,
                        extra = {
                            message = "Created Tag!",
                            colour = G.C.GREEN
                        }
                        }
                        }
                }
        end
    end
}