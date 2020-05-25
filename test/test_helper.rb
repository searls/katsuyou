$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "katsuyou"
require "gimme"

require "minitest/autorun"
require "minitest/hooks/test"

class UnitTest < Minitest::Test
  include Gimme::DSL
  include Minitest::Hooks

  def teardown
    Gimme.reset
  end
end
