require "test_helper"

module Katsuyou
  class DeterminesTypeTest < UnitTest
    def setup
      @subject = DeterminesType.new
    end

    def test_unknown_code_returns_nil
      result = @subject.call(text: "garbage", type: "blah fake code blah")

      refute result
    end

    def test_specific_code_always_trusts_the_user
      result = @subject.call(text: "garbage", type: "v5uru")

      assert result
      assert_equal DeterminesType.type_for("v5uru"), result
    end

    def test_unknown_ichidan_verb
      result = @subject.call(text: "basic stuff", type: :ichidan_verb)

      assert result
      assert_equal DeterminesType.type_for("v1"), result
    end

    def test_guess_godan_verbs
      assert_equal "v5b", @subject.call(text: "飛ぶ", type: :godan_verb).code
      assert_equal "v5g", @subject.call(text: "泳ぐ", type: :godan_verb).code
      assert_equal "v5k", @subject.call(text: "書く", type: :godan_verb).code
      assert_equal "v5m", @subject.call(text: "住む", type: :godan_verb).code
      assert_equal "v5n", @subject.call(text: "死ぬ", type: :godan_verb).code
      assert_equal "v5r", @subject.call(text: "走る", type: :godan_verb).code
      assert_equal "v5s", @subject.call(text: "話す", type: :godan_verb).code
      assert_equal "v5t", @subject.call(text: "持つ", type: :godan_verb).code
      assert_equal "v5u", @subject.call(text: "買う", type: :godan_verb).code
    end
  end
end
