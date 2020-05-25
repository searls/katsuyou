require_relative "verb_ending"

module Katsuyou
  class IchidanVerbEnding < VerbEnding
    def present_polite
      "ます"
    end

    def present_negative
      "ない"
    end

    def present_negative_polite
      "ません"
    end

    def past
      "た"
    end

    def past_polite
      "ました"
    end

    def past_negative
      "なかった"
    end

    def past_negative_polite
      "ませんでした"
    end

    def conjunctive
      "て"
    end

    def conjunctive_polite
      "まして"
    end

    def conjunctive_negative
      "なくて"
    end

    def conjunctive_negative_polite
      "ませんで"
    end

    def provisional
      "れば"
    end

    def provisional_negative
      "なければ"
    end

    def volitional
      "よう"
    end

    def volitional_polite
      "ましょう"
    end

    def imperative
      if @type.code == "v1-s"
        ""
      else
        "ろ"
      end
    end

    def potential
      "られる"
    end

    def potential_polite
      "られます"
    end

    def potential_negative
      "られない"
    end

    def potential_negative_polite
      "られません"
    end

    def passive
      "られる"
    end

    def passive_polite
      "られます"
    end

    def passive_negative
      "られない"
    end

    def passive_negative_polite
      "られません"
    end

    def causative
      "させる"
    end

    def causative_polite
      "させます"
    end

    def causative_negative
      "させない"
    end

    def causative_negative_polite
      "させません"
    end

    def causative_passive
      "させられる"
    end

    def causative_passive_polite
      "させられます"
    end

    def causative_passive_negative
      "させられない"
    end

    def causative_passive_negative_polite
      "させられません"
    end
  end
end
