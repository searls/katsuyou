require_relative "conjugation_type"

module Katsuyou
  CONJUGATION_TYPES = [
    ConjugationType.new(code: "adj-i", description: "adjective (keiyoushi)", category: :adjective, supported: false),
    ConjugationType.new(code: "adj-na", description: "adjectival nouns or quasi-adjectives (keiyodoshi)", category: :adjective, supported: false),
    ConjugationType.new(code: "adj-t", description: "`taru' adjective", category: :adjective, supported: false),
    ConjugationType.new(code: "adv-to", description: "adverb taking the `to' particle", category: :adverb, supported: false),
    ConjugationType.new(code: "aux", description: "auxiliary", category: :auxiliary, supported: false),
    ConjugationType.new(code: "aux-v", description: "auxiliary verb", category: :auxiliary, supported: false),
    ConjugationType.new(code: "aux-adj", description: "auxiliary adjective", category: :auxiliary, supported: false),
    ConjugationType.new(code: "v1", description: "Ichidan verb", category: :ichidan_verb, supported: true),
    ConjugationType.new(code: "v1-s", description: "Ichidan verb - kureru special class", category: :ichidan_verb, supported: true),
    ConjugationType.new(code: "v2a-s", description: "Nidan verb with 'u' ending (archaic)", category: :other_verb, supported: false),
    ConjugationType.new(code: "v4h", description: "Yodan verb with `hu/fu' ending (archaic)", category: :other_verb, supported: false),
    ConjugationType.new(code: "v4r", description: "Yodan verb with `ru' ending (archaic)", category: :other_verb, supported: false),
    ConjugationType.new(code: "v5aru", description: "Godan verb - -aru special class", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5b", description: "Godan verb with `bu' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5g", description: "Godan verb with `gu' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5k", description: "Godan verb with `ku' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5k-s", description: "Godan verb - Iku/Yuku special class", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5m", description: "Godan verb with `mu' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5n", description: "Godan verb with `nu' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5r", description: "Godan verb with `ru' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5r-i", description: "Godan verb with `ru' ending (irregular verb)", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5s", description: "Godan verb with `su' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5t", description: "Godan verb with `tsu' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5u", description: "Godan verb with `u' ending", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5u-s", description: "Godan verb with `u' ending (special class)", category: :godan_verb, supported: true),
    ConjugationType.new(code: "v5uru", description: "Godan verb - Uru old class verb (old form of Eru)", category: :godan_verb, supported: false),
    ConjugationType.new(code: "vz", description: "Ichidan verb - zuru verb (alternative form of -jiru verbs)", category: :ichidan_verb, supported: true),
    ConjugationType.new(code: "vk", description: "Kuru verb - special class", category: :kuru_verb, supported: true),
    ConjugationType.new(code: "vn", description: "irregular nu verb", category: :other_verb, supported: false),
    ConjugationType.new(code: "vr", description: "irregular ru verb, plain form ends with -ri", category: :other_verb, supported: false),
    ConjugationType.new(code: "vs", description: "noun or participle which takes the aux. verb suru", category: :suru_verb, supported: true),
    ConjugationType.new(code: "vs-c", description: "su verb - precursor to the modern suru", category: :suru_verb, supported: false),
    ConjugationType.new(code: "vs-s", description: "suru verb - special class", category: :suru_verb, supported: true),
    ConjugationType.new(code: "vs-i", description: "suru verb - included", category: :suru_verb, supported: true)
  ]

  class DeterminesType
    def self.type_for(code)
      CONJUGATION_TYPES.find { |type| type.code == code }
    end

    def call(text:, type:)
      type = type.to_s
      if type == "ichidan_verb"
        type_for("v1")
      elsif type == "godan_verb"
        guess_godan_type(text)
      else
        type_for(type)
      end
    end

    private

    def guess_godan_type(text)
      case text[-1]
      when "ぶ" then type_for("v5b")
      when "ぐ" then type_for("v5g")
      when "く" then type_for("v5k")
      when "む" then type_for("v5m")
      when "ぬ" then type_for("v5n")
      when "る" then type_for("v5r")
      when "す" then type_for("v5s")
      when "つ" then type_for("v5t")
      when "う" then type_for("v5u")
      end
    end

    def type_for(code)
      self.class.type_for(code)
    end
  end
end
