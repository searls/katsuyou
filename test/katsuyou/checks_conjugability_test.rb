require "test_helper"

module Katsuyou
  class ChecksConjugabilityTest < UnitTest
    def setup
      @subject = ChecksConjugability.new
    end

    def test_ichidan
      assert @subject.call("食べる", type: :ichidan_verb)
      assert @subject.call("食べる", type: "v1")
      refute @subject.call("食べす", type: "v1")
      refute @subject.call("食", type: :ichidan_verb)
    end

    def test_godan
      assert @subject.call("買う", type: "v5u")
      assert @subject.call("買す", type: :godan_verb)
      assert @subject.call("なぶ", type: "v5b")
      assert @subject.call("なぐ", type: "v5g")
      assert @subject.call("なく", type: "v5k")
      assert @subject.call("なく", type: "v5k-s")
      assert @subject.call("なむ", type: "v5m")
      assert @subject.call("なぬ", type: "v5n")
      assert @subject.call("なる", type: "v5r")
      assert @subject.call("なる", type: "v5r-i")
      assert @subject.call("なす", type: "v5s")
      assert @subject.call("なつ", type: "v5t")
      assert @subject.call("なう", type: "v5u")
      refute @subject.call("なぶ", type: "v5u")
      refute @subject.call("なぐ", type: "v5b")
      refute @subject.call("なく", type: "v5g")
      refute @subject.call("なく", type: "v5g")
      refute @subject.call("なむ", type: "v5k")
      refute @subject.call("なぬ", type: "v5m")
      refute @subject.call("なる", type: "v5n")
      refute @subject.call("なる", type: "v5s")
      refute @subject.call("なす", type: "v5r")
      refute @subject.call("なつ", type: "v5u")
      refute @subject.call("なう", type: "v5b")
      refute @subject.call("かも", type: :godan_verb)
      refute @subject.call("買う", type: "v5b")
    end

    def test_kuru
      assert @subject.call("来る", type: :kuru_verb)
      assert @subject.call("来る", type: "vk")
      assert @subject.call("くる", type: :kuru_verb)
      assert @subject.call("くる", type: "vk")
      assert @subject.call("日本にくる", type: :kuru_verb)
      refute @subject.call("ふる", type: "vk")
      refute @subject.call("ふる", type: :kuru_verb)
    end

    def test_suru
      assert @subject.call("する", type: :suru_verb)
      assert @subject.call("何がする", type: :suru_verb)
      assert @subject.call("する", type: "vs-i")
      assert @subject.call("為る", type: :suru_verb)
      assert @subject.call("為る", type: "vs-i")
      assert @subject.call("勉強", type: :suru_verb)
      assert @subject.call("勉強", type: "vs")
      assert @subject.call("為る", type: "vs-i")

      refute @subject.call("ぷる", type: "vs-i")
      refute @subject.call("みる", type: "vs-s")
      refute @subject.call("勉強する", type: "vs")
    end

    def test_nonsense
      refute @subject.call("する", type: nil)
      refute @subject.call(nil, type: :suru_verb)
      refute @subject.call("", type: :suru_verb)
      refute @subject.call("anythingる", type: "blah")
    end
  end
end
