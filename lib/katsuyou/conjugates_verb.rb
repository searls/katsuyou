require_relative "determines_type"
require_relative "verb_conjugation"
require_relative "verb_ending"

module Katsuyou
  class ConjugatesVerb
    def initialize
      @determines_type = DeterminesType.new
    end

    def call(verb, type:)
      stem, tail = split(verb)
      conjugation_type = @determines_type.call(text: verb, type: type)

      ending = VerbEnding.for(conjugation_type, tail: tail)

      VerbConjugation.new(
        # Present
        present: verb,
        present_polite: stem + ending.present_polite,
        present_negative: stem + ending.present_negative,
        present_negative_polite: stem + ending.present_negative_polite,
        # Past
        past: stem + ending.past,
        past_polite: stem + ending.past_polite,
        past_negative: stem + ending.past_negative,
        past_negative_polite: stem + ending.past_negative_polite,
        # て
        te: stem + ending.te,
        te_negative: stem + ending.te_negative,
        # Volitional
        volitional: stem + ending.volitional,
        volitional_polite: stem + ending.volitional_polite,
        # Imperative
        imperative: stem + ending.imperative,
        imperative_negative: verb + "な",
        # Potential
        potential: stem + ending.potential,
        potential_polite: stem + ending.potential_polite,
        potential_negative: stem + ending.potential_negative,
        potential_negative_polite: stem + ending.potential_negative_polite,
        # Passive
        passive: stem + ending.passive,
        passive_polite: stem + ending.passive_polite,
        passive_negative: stem + ending.passive_negative,
        passive_negative_polite: stem + ending.passive_negative_polite,
        # Causative
        causative: stem + ending.causative,
        causative_polite: stem + ending.causative_polite,
        causative_negative: stem + ending.causative_negative,
        causative_negative_polite: stem + ending.causative_negative_polite,
        # Causative-passive
        causative_passive: stem + ending.causative_passive,
        causative_passive_polite: stem + ending.causative_passive_polite,
        causative_passive_negative: stem + ending.causative_passive_negative,
        causative_passive_negative_polite: stem + ending.causative_passive_negative_polite
      )
    end

    private

    def split(verb)
      [verb[0...-1], verb[-1]]
    end
  end
end
