require "test_helper"

class KatsuyouTest < UnitTest
  def test_that_it_has_a_version_number
    refute_nil Katsuyou::VERSION
  end

  def test_conjugate_calls_class
    conjugates_verb = gimme_next(Katsuyou::ConjugatesVerb)
    give(conjugates_verb).call("thing", type: "lol") { "some conjugations" }

    result = Katsuyou.conjugate("thing", type: "lol")

    assert_equal result, "some conjugations"
  end
end
