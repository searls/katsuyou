require "katsuyou/version"
require_relative "katsuyou/conjugates_verb"
require_relative "katsuyou/checks_conjugability"

module Katsuyou
  class Error < StandardError; end
  class UnsupportedConjugationTypeError < Error; end
  class InvalidConjugationTypeError < Error; end

  def self.conjugate(verb, type:)
    ConjugatesVerb.new.call(verb, type: type)
  end

  def self.conjugatable?(verb, type:)
    ChecksConjugability.new.call(verb, type: type)
  end
end
