require "katsuyou/version"
require_relative "katsuyou/conjugates_verb"

module Katsuyou
  class Error < StandardError; end
  class UnsupportedConjugationTypeError < Error; end
  class InvalidConjugationTypeError < Error; end

  def self.conjugate(verb, type:)
    ConjugatesVerb.new.call(verb, type: type)
  end
end
