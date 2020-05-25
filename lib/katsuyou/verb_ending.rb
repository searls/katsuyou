module Katsuyou
  class VerbEnding
  end
end

require_relative "godan_verb_ending"
require_relative "ichidan_verb_ending"

module Katsuyou
  class VerbEnding
    def self.for(type, tail: nil)
      case type
      when :godan_verb then GodanVerbEnding.new(tail)
      when :ichidan_verb then IchidanVerbEnding.new
      end
    end
  end
end
