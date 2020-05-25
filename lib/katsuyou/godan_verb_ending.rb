require_relative "verb_ending"

module Katsuyou
  class GodanVerbEnding < VerbEnding
    def initialize(tail)
      @tail = tail
    end

    def present_polite
      "#{to_い}ます"
    end

    def present_negative
      "#{to_あ}ない"
    end

    def present_negative_polite
      "#{to_い}ません"
    end

    def past
      TAIL_FORMS[@tail][:connector] + TAIL_FORMS[@tail][:た]
    end

    def past_polite
      "#{to_い}ました"
    end

    def past_negative
      "#{to_あ}なかった"
    end

    def past_negative_polite
      "#{to_い}ませんでした"
    end

    def te
      TAIL_FORMS[@tail][:connector] + TAIL_FORMS[@tail][:て]
    end

    def te_negative
      "#{to_あ}なくて"
    end

    def volitional
      "#{to_お}う"
    end

    def volitional_polite
      "#{to_い}ましょう"
    end

    def imperative
      to_え
    end

    def potential
      "#{to_え}る"
    end

    def potential_polite
      "#{to_え}ます"
    end

    def potential_negative
      "#{to_え}ない"
    end

    def potential_negative_polite
      "#{to_え}ません"
    end

    def passive
      "#{to_あ}れる"
    end

    def passive_polite
      "#{to_あ}れます"
    end

    def passive_negative
      "#{to_あ}れない"
    end

    def passive_negative_polite
      "#{to_あ}れません"
    end

    def causative
      "#{to_あ}せる"
    end

    def causative_polite
      "#{to_あ}せます"
    end

    def causative_negative
      "#{to_あ}せない"
    end

    def causative_negative_polite
      "#{to_あ}せません"
    end

    def causative_passive
      "#{to_あ}せられる"
    end

    def causative_passive_polite
      "#{to_あ}せられます"
    end

    def causative_passive_negative
      "#{to_あ}せられない"
    end

    def causative_passive_negative_polite
      "#{to_あ}せられません"
    end

    private

    def to_い
      TAIL_FORMS[@tail][:い]
    end

    def to_あ
      TAIL_FORMS[@tail][:あ]
    end

    def to_え
      TAIL_FORMS[@tail][:え]
    end

    def to_お
      TAIL_FORMS[@tail][:お]
    end

    TAIL_FORMS = {
      "う" => {
        い: "い",
        あ: "わ",
        え: "え",
        お: "お",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "く" => {
        い: "き",
        あ: "か",
        え: "け",
        お: "こ",
        connector: "い",
        た: "た",
        て: "て"
      },
      "ぐ" => {
        い: "ぎ",
        あ: "が",
        え: "げ",
        お: "ご",
        connector: "い",
        た: "だ",
        て: "で"
      },
      "す" => {
        い: "し",
        あ: "さ",
        え: "せ",
        お: "そ",
        connector: "し",
        た: "た",
        て: "て"
      },
      "つ" => {
        い: "ち",
        あ: "た",
        え: "て",
        お: "と",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "る" => {
        い: "り",
        あ: "ら",
        え: "れ",
        お: "ろ",
        connector: "っ",
        た: "た",
        て: "て"
      }
    }
  end
end
