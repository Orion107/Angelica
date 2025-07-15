SMODS.Rarity {
    key = "angelic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0.01,
    badge_colour = HEX('f8e71c'),
    loc_txt = {
        name = "Angelic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "bad",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('5b6d4c'),
    loc_txt = {
        name = "Bad"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}