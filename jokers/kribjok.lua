SMODS.Joker{ --krib
    name = "krib",
    key = "kribjok",
    config = {
        extra = {
            gold = 0
        }
    },
    loc_txt = {
        ['name'] = 'krib',
        ['text'] = {
            [1] = 'ralsei i frew up'
        }
    },
    pos = {
        x = 5,
        y = 0
    },
    cost = 20,
    rarity = 4,
    blueprint_compat = true,
    eternal_compat = true,
    unlocked = true,
    discovered = true,
    atlas = 'CustomJokers',

    loc_vars = function(self, info_queue, card)
        return {vars = {}}
    end,

    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
                return {
                    func = function()
                        G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                        local copied_card = copy_card(context.other_card, nil, nil, G.playing_card)
                        copied_card:add_to_deck()
                        G.deck.config.card_limit = G.deck.config.card_limit + 1
                        table.insert(G.playing_cards, copied_card)
                        G.hand:emplace(copied_card)
                        copied_card.states.visible = nil
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                copied_card:start_materialize()
                                return true
                            end
                        }))
                        
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({ playing_card_added = true, cards = { copied_card } })
                                return true
                            end
                        }))
                    end,
                    message = "your choices dont matter"
                }
        end
        if context.pre_discard and not context.blueprint then
            if G.GAME.current_round.discards_left <= 1 then
                return {
                    func = function()
                local card_front = G.P_CARDS.S_J
                local new_card = create_playing_card({
                    front = card_front,
                    center = G.P_CENTERS.m_lucky
                }, G.discard, true, false, nil, true)
            new_card:set_seal("gold", true)
            new_card:set_edition("e_polychrome", true)
                
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                new_card.playing_card = G.playing_card
                table.insert(G.playing_cards, new_card)
                
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand:emplace(new_card)
                        new_card:start_materialize()
                        SMODS.calculate_context({ playing_card_added = true, cards = { new_card } })
                        return true
                    end
                }))
            end,
                    message = "Lancered"
                }
            end
        end
    end
}