require_relative "determines_type"
require_relative "verb_conjugation"
require_relative "zips_endings"

module Katsuyou
  class ConjugatesVerb
    def initialize
      @determines_type = DeterminesType.new
      @zips_endings = ZipsEndings.new
    end

    def call(verb, type:)
      conjugation_type = @determines_type.call(text: verb, type: type)
      ensure_valid_conjugation_type!(type, conjugation_type)

      VerbConjugation.new({
        conjugation_type: conjugation_type
      }.merge(@zips_endings.call(verb, conjugation_type)))
    end

    private

    def ensure_valid_conjugation_type!(user_type, conjugation_type)
      if conjugation_type.nil?
        raise InvalidConjugationTypeError.new(
          "We don't know about conjugation type '#{user_type}'"
        )
      elsif !conjugation_type.supported
        raise UnsupportedConjugationTypeError.new(
          "Conjugation type '#{conjugation_type.code}' is not yet supported"
        )
      end
    end
  end
end
