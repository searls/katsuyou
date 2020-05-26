require_relative "verb_ending"

module Katsuyou
  class GodanVerbEnding < VerbEnding
    def present_polite
      "#{to_い}ます"
    end

    def present_negative
      if code == "v5r-i"
        "ない"
      else
        "#{to_あ}ない"
      end
    end

    def present_negative_polite
      "#{to_い}ません"
    end

    def past
      TAIL_FORMS[code][:connector] + TAIL_FORMS[code][:た]
    end

    def past_polite
      "#{to_い}ました"
    end

    def past_negative
      if code == "v5r-i"
        "なかった"
      else
        "#{to_あ}なかった"
      end
    end

    def past_negative_polite
      "#{to_い}ませんでした"
    end

    def conjunctive
      TAIL_FORMS[code][:connector] + TAIL_FORMS[code][:て]
    end

    def conjunctive_polite
      "#{to_い}まして"
    end

    def conjunctive_negative
      if code == "v5r-i"
        "なくて"
      else
        "#{to_あ}なくて"
      end
    end

    def conjunctive_negative_polite
      "#{to_い}ませんで"
    end

    def provisional
      "#{to_え}ば"
    end

    def provisional_negative
      if code == "v5r-i"
        "なければ"
      else
        "#{to_あ}なければ"
      end
    end

    def volitional
      "#{to_お}う"
    end

    def volitional_polite
      "#{to_い}ましょう"
    end

    def imperative
      if @type.code == "v5aru"
        to_い
      else
        to_え
      end
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

    def code
      @type.code
    end

    def to_い
      TAIL_FORMS[code][:い]
    end

    def to_あ
      TAIL_FORMS[code][:あ]
    end

    def to_え
      TAIL_FORMS[code][:え]
    end

    def to_お
      TAIL_FORMS[code][:お]
    end

    TAIL_FORMS = {
      "v5aru" => {
        い: "い",
        あ: "ら",
        え: "れ",
        お: "ろ",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "v5b" => {
        い: "び",
        あ: "ば",
        え: "べ",
        お: "ぼ",
        connector: "ん",
        た: "だ",
        て: "で"
      },
      "v5g" => {
        い: "ぎ",
        あ: "が",
        え: "げ",
        お: "ご",
        connector: "い",
        た: "だ",
        て: "で"
      },
      "v5k" => {
        い: "き",
        あ: "か",
        え: "け",
        お: "こ",
        connector: "い",
        た: "た",
        て: "て"
      },
      "v5k-s" => {
        い: "き",
        あ: "か",
        え: "け",
        お: "こ",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "v5m" => {
        い: "み",
        あ: "ま",
        え: "め",
        お: "も",
        connector: "ん",
        た: "だ",
        て: "で"
      },
      "v5n" => {
        い: "に",
        あ: "な",
        え: "ね",
        お: "の",
        connector: "ん",
        た: "だ",
        て: "で"
      },
      "v5s" => {
        い: "し",
        あ: "さ",
        え: "せ",
        お: "そ",
        connector: "し",
        た: "た",
        て: "て"
      },
      "v5t" => {
        い: "ち",
        あ: "た",
        え: "て",
        お: "と",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "v5u" => {
        い: "い",
        あ: "わ",
        え: "え",
        お: "お",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "v5u-s" => {
        い: "い",
        あ: "わ",
        え: "え",
        お: "お",
        connector: "う",
        た: "た",
        て: "て"
      },
      "v5r" => {
        い: "り",
        あ: "ら",
        え: "れ",
        お: "ろ",
        connector: "っ",
        た: "た",
        て: "て"
      },
      "v5r-i" => {
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
