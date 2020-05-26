require "test_helper"

class KatsuyouTest < UnitTest
  def test_that_it_has_a_version_number
    refute_nil Katsuyou::VERSION
  end

  def test_conjugate_calls_class
    conjugates_verb = gimme_next(Katsuyou::ConjugatesVerb)
    give(conjugates_verb).call("thing", type: "lol") { "some conjugations" }

    result = Katsuyou.conjugate("thing", type: "lol")

    assert_equal "some conjugations", result
  end

  def test_conjugatable_calls_class
    checks_conjugability = gimme_next(Katsuyou::ChecksConjugability)
    give(checks_conjugability).call("thing", type: "lol") { "a result" }

    result = Katsuyou.conjugatable?("thing", type: "lol")

    assert_equal "a result", result
  end
end
