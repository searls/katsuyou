module Katsuyou
  class VerbStem
    def self.for(text, conjugation_type)
      if conjugation_type.code == "v5r-i"
        AruVerbStem.new(text, conjugation_type)
      elsif conjugation_type.code == "vk"
        KuruVerbStem.new(text, conjugation_type)
      elsif conjugation_type.category == :suru_verb
        SuruVerbStem.new(text, conjugation_type)
      else
        new(text, conjugation_type)
      end
    end

    def initialize(text, conjugation_type)
      @stem = text[0...-1]
      @conjugation_type = conjugation_type
    end

    [
      :present_polite,
      :present_negative,
      :present_negative_polite,
      :past,
      :past_polite,
      :past_negative,
      :past_negative_polite,
      :conjunctive,
      :conjunctive_polite,
      :conjunctive_negative,
      :conjunctive_negative_polite,
      :provisional,
      :provisional_negative,
      :volitional,
      :volitional_polite,
      :imperative,
      :potential,
      :potential_polite,
      :potential_negative,
      :potential_negative_polite,
      :passive,
      :passive_polite,
      :passive_negative,
      :passive_negative_polite,
      :causative,
      :causative_polite,
      :causative_negative,
      :causative_negative_polite,
      :causative_passive,
      :causative_passive_polite,
      :causative_passive_negative,
      :causative_passive_negative_polite
    ].each do |conjugated_form|
      define_method conjugated_form do
        @stem
      end
    end
  end

  class AruVerbStem < VerbStem
    def initialize(text, conjugation_type)
      @shortened_stem = text[0...-2]
      super
    end

    def present_negative
      @shortened_stem
    end

    def past_negative
      @shortened_stem
    end

    def conjunctive_negative
      @shortened_stem
    end

    def provisional_negative
      @shortened_stem
    end
  end

  class KuruVerbStem < VerbStem
    def initialize(text, conjugation_type)
      @replace_ku = text[-2] == "く"
      super
    end

    [
      :present_polite,
      :present_negative_polite,
      :past,
      :past_polite,
      :past_negative_polite,
      :conjunctive,
      :conjunctive_polite,
      :conjunctive_negative_polite,
      :volitional_polite
    ].each do |conjugated_form|
      define_method conjugated_form do
        maybe_replace(super(), "き")
      end
    end

    [
      :present_negative,
      :past_negative,
      :conjunctive_negative,
      :provisional_negative,
      :volitional,
      :imperative,
      :potential,
      :potential_polite,
      :potential_negative,
      :potential_negative_polite,
      :passive,
      :passive_polite,
      :passive_negative,
      :passive_negative_polite,
      :causative,
      :causative_polite,
      :causative_negative,
      :causative_negative_polite,
      :causative_passive,
      :causative_passive_polite,
      :causative_passive_negative,
      :causative_passive_negative_polite
    ].each do |conjugated_form|
      define_method conjugated_form do
        maybe_replace(super(), "こ")
      end
    end

    private

    def maybe_replace(stem, replacement)
      return stem unless @replace_ku
      stem.dup.tap do |s|
        s[-1] = replacement
      end
    end
  end

  class SuruVerbStem < VerbStem
    def initialize(text, conjugation_type)
      @replace_su = text[-2] == "す"
      super(text, conjugation_type)
    end

    [
      :present_polite,
      :present_negative,
      :present_negative_polite,
      :past,
      :past_negative,
      :past_polite,
      :past_negative_polite,
      :conjunctive,
      :conjunctive_polite,
      :conjunctive_negative,
      :conjunctive_negative_polite,
      :provisional_negative,
      :volitional,
      :volitional_polite,
      :imperative
    ].each do |conjugated_form|
      define_method conjugated_form do
        maybe_replace(super(), "し")
      end
    end

    [
      :potential,
      :potential_polite,
      :potential_negative,
      :potential_negative_polite
    ].each do |conjugated_form|
      define_method conjugated_form do
        if @conjugation_type.code == "vs-s"
          @stem[0..-2] + "しえ"
        else
          @stem[0..-2] + "でき"
        end
      end
    end

    [
      :passive,
      :passive_polite,
      :passive_negative,
      :passive_negative_polite,
      :causative,
      :causative_polite,
      :causative_negative,
      :causative_negative_polite,
      :causative_passive,
      :causative_passive_polite,
      :causative_passive_negative,
      :causative_passive_negative_polite
    ].each do |conjugated_form|
      define_method conjugated_form do
        maybe_replace(super(), "さ")
      end
    end

    private

    def maybe_replace(stem, replacement)
      return stem unless @replace_su
      stem.dup.tap do |s|
        s[-1] = replacement
      end
    end
  end
end
