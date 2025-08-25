SMODS.Rarity {
    key = "angelic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('fbee58'),
    loc_txt = {
        name = "Angelic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}

SMODS.Rarity {
    key = "seraphic",
    pools = {
        ["Joker"] = true
    },
    default_weight = 0,
    badge_colour = HEX('ffec00'),
    loc_txt = {
        name = "Seraphic"
    },
    get_weight = function(self, weight, object_type)
        return weight
    end,
}