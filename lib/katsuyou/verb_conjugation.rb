module Katsuyou
  class VerbConjugation < Struct.new(
    :conjugation_type,
    # Present
    :present,
    :present_polite,
    :present_negative,
    :present_negative_polite,
    # Past
    :past,
    :past_polite,
    :past_negative,
    :past_negative_polite,
    # て
    :te,
    :te_negative,
    # Volitional
    :volitional,
    :volitional_polite,
    # Imperative
    :imperative,
    :imperative_negative,
    # Potential
    :potential,
    :potential_polite,
    :potential_negative,
    :potential_negative_polite,
    # Passive
    :passive,
    :passive_polite,
    :passive_negative,
    :passive_negative_polite,
    # Causative
    :causative,
    :causative_polite,
    :causative_negative,
    :causative_negative_polite,
    # Causative-passive
    :causative_passive,
    :causative_passive_polite,
    :causative_passive_negative,
    :causative_passive_negative_polite,
    keyword_init: true
  )
  end
end
