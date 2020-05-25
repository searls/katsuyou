require_relative "verb_conjugation"

module Katsuyou
  class ConjugatesVerb
    def call(verb, type:)
      stem, tail = split(verb, type)
      VerbConjugation.new(
        # Present
        present: verb,
        present_polite: "#{stem}#{to_い(tail)}ます",
        present_negative: "#{stem}#{to_あ(tail)}ない",
        present_negative_polite: "#{stem}#{to_い(tail)}ません",
        # Past
        past: "#{stem}#{to_past(tail)}",
        past_polite: "#{stem}#{to_い(tail)}ました",
        past_negative: "#{stem}#{to_あ(tail)}なかった",
        past_negative_polite: "#{stem}#{to_い(tail)}ませんでした",
        # て
        te: "#{stem}#{to_te(tail)}",
        te_negative: "#{stem}#{to_あ(tail)}なくて",
        # Volitional
        volitional: "#{stem}#{to_お(tail)}う",
        volitional_polite: "#{stem}#{to_い(tail)}ましょう",
        # Imperative
        imperative: "#{stem}#{to_imperative(tail, type)}",
        imperative_negative: "#{verb}な",
        # Potential
        potential: "#{stem}#{to_え(tail)}る",
        potential_polite: "#{stem}#{to_え(tail)}ます",
        potential_negative: "#{stem}#{to_え(tail)}ない",
        potential_negative_polite: "#{stem}#{to_え(tail)}ません",
        # Passive
        passive: "#{stem}#{to_あ(tail)}れる",
        passive_polite: "#{stem}#{to_あ(tail)}れます",
        passive_negative: "#{stem}#{to_あ(tail)}れない",
        passive_negative_polite: "#{stem}#{to_あ(tail)}れません",
        # Causative
        causative: "#{stem}#{to_あ(tail)}せる",
        causative_polite: "#{stem}#{to_あ(tail)}せます",
        causative_negative: "#{stem}#{to_あ(tail)}せない",
        causative_negative_polite: "#{stem}#{to_あ(tail)}せません",
        # Causative-passive
        causative_passive: "#{stem}#{to_あ(tail)}せられる",
        causative_passive_polite: "#{stem}#{to_あ(tail)}せられます",
        causative_passive_negative: "#{stem}#{to_あ(tail)}せられない",
        causative_passive_negative_polite: "#{stem}#{to_あ(tail)}せられません"
      )
    end

    private

    def split(verb, type)
      if type == :godan_verb
        [verb[0...-1], verb[-1]]
      elsif type == :ichidan_verb
        [verb[0...-1], ""]
      end
    end

    TAIL_FORMS = {
      "" => {
        い: "",
        あ: "",
        え: "",
        お: "よ",
        connector: "",
        た: "た",
        て: "て"
      },
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

    def to_い(tail)
      TAIL_FORMS[tail][:い]
    end

    def to_あ(tail)
      TAIL_FORMS[tail][:あ]
    end

    def to_え(tail)
      TAIL_FORMS[tail][:え]
    end

    def to_お(tail)
      TAIL_FORMS[tail][:お]
    end

    def to_past(tail)
      TAIL_FORMS[tail][:connector] + TAIL_FORMS[tail][:た]
    end

    def to_te(tail)
      TAIL_FORMS[tail][:connector] + TAIL_FORMS[tail][:て]
    end

    def to_imperative(tail, type)
      if type == :godan_verb
        to_え(tail)
      elsif type == :ichidan_verb
        "ろ"
      end
    end
  end
end
