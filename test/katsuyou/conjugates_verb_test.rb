require "test_helper"
require "yaml"

module Katsuyou
  class ConjugatesVerbTest < UnitTest
    def setup
      @subject = ConjugatesVerb.new
    end

    def before_all
      @tested_conjugation_types = []
    end

    def test_waku
      result = @subject.call("沸く", type: :godan_verb)

      assert_equal DeterminesType.type_for("v5k"), result.conjugation_type
      assert_equal "沸く", result.present
      assert_equal "沸きます", result.present_polite
      assert_equal "沸かない", result.present_negative
      assert_equal "沸きません", result.present_negative_polite

      assert_equal "沸いた", result.past
      assert_equal "沸きました", result.past_polite
      assert_equal "沸かなかった", result.past_negative
      assert_equal "沸きませんでした", result.past_negative_polite

      assert_equal "沸いて", result.conjunctive
      assert_equal "沸きまして", result.conjunctive_polite
      assert_equal "沸かなくて", result.conjunctive_negative
      assert_equal "沸きませんで", result.conjunctive_negative_polite

      assert_equal "沸けば", result.provisional
      assert_equal "沸かなければ", result.provisional_negative

      assert_equal "沸こう", result.volitional
      assert_equal "沸きましょう", result.volitional_polite

      assert_equal "沸け", result.imperative
      assert_equal "沸くな", result.imperative_negative

      assert_equal "沸ける", result.potential
      assert_equal "沸けます", result.potential_polite
      assert_equal "沸けない", result.potential_negative
      assert_equal "沸けません", result.potential_negative_polite

      assert_equal "沸かれる", result.passive
      assert_equal "沸かれます", result.passive_polite
      assert_equal "沸かれない", result.passive_negative
      assert_equal "沸かれません", result.passive_negative_polite

      assert_equal "沸かせる", result.causative
      assert_equal "沸かせます", result.causative_polite
      assert_equal "沸かせない", result.causative_negative
      assert_equal "沸かせません", result.causative_negative_polite

      assert_equal "沸かせられる", result.causative_passive
      assert_equal "沸かせられます", result.causative_passive_polite
      assert_equal "沸かせられない", result.causative_passive_negative
      assert_equal "沸かせられません", result.causative_passive_negative_polite
    end

    def test_raises_for_invalid_types
      error = assert_raises(InvalidConjugationTypeError) {
        @subject.call("バカ", type: "nonsense")
      }

      assert_equal "We don't know about conjugation type 'nonsense'", error.message
    end

    def test_raises_for_unsupported_types
      error = assert_raises(UnsupportedConjugationTypeError) {
        @subject.call("bleep bloop", type: "v5uru")
      }

      assert_equal "Conjugation type 'v5uru' is not yet supported", error.message
    end

    Dir["test/examples/*.yml"].sort.each do |file|
      define_method "test_#{File.basename(file, ".*")}" do
        example = YAML.load_file(file)
        text = example.delete("text")
        type = example.delete("type")

        result = Katsuyou.conjugate(text, type: type)
        @tested_conjugation_types << result.conjugation_type

        example.each.with_index do |(property, expected), i|
          assert_equal expected, result.send(property), "Conjugation ##{property} (##{i}) failed"
        end
      end
    end

    def after_all
      untested_conjugation_types = CONJUGATION_TYPES.select(&:supported) - @tested_conjugation_types
      unless untested_conjugation_types.empty?
        warn <<~WARN

          Uh oh! You didn't test the following supported conjugations!

          #{untested_conjugation_types.map { |t| "  • #{t.code}" }.join("\n")}
        WARN
      end
    end
  end
end
