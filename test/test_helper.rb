$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "katsuyou"
require "gimme"

require "minitest/autorun"

class UnitTest < Minitest::Test
  include Gimme::DSL

  def teardown
    Gimme.reset
  end
end
