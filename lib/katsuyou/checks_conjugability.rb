require_relative "determines_type"

module Katsuyou
  class ChecksConjugability
    def initialize
      @determines_type = DeterminesType.new
    end

    def call(word, type:)
      return false if any_not_present?(word, type)
      return false unless (conjugation_type = @determines_type.call(text: word, type: type))
      return false unless conjugation_type.supported?

      case conjugation_type.category
      when :ichidan_verb then valid_ichidan_verb?(word, conjugation_type)
      when :godan_verb then valid_godan_verb?(word, conjugation_type)
      when :kuru_verb then valid_kuru_verb?(word, conjugation_type)
      when :suru_verb then valid_suru_verb?(word, conjugation_type)
      else false
      end
    end

    private

    def valid_ichidan_verb?(word, conjugation_type)
      word.end_with?("る")
    end

    def valid_godan_verb?(word, conjugation_type)
      return false unless word.end_with?("ぶ", "ぐ", "く", "む", "ぬ", "る", "す", "つ", "う")
      last_char = word[-1]
      case conjugation_type.code
      when "v5b" then last_char == "ぶ"
      when "v5g" then last_char == "ぐ"
      when "v5k" then last_char == "く"
      when "v5k-s" then last_char == "く"
      when "v5m" then last_char == "む"
      when "v5n" then last_char == "ぬ"
      when "v5r" then last_char == "る"
      when "v5r-i" then last_char == "る"
      when "v5s" then last_char == "す"
      when "v5t" then last_char == "つ"
      when "v5u" then last_char == "う"
      end
    end

    def valid_kuru_verb?(word, conjugation_type)
      word.end_with?("来る", "くる")
    end

    def valid_suru_verb?(word, conjugation_type)
      if conjugation_type.code == "vs"
        !word.end_with?("為る", "する")
      else
        word.end_with?("為る", "する")
      end
    end

    def any_not_present?(*args)
      args.any? { |arg|
        arg.to_s.size.zero?
      }
    end
  end
end
