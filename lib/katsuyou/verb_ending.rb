module Katsuyou
  class VerbEnding
  end
end

require_relative "godan_verb_ending"
require_relative "ichidan_verb_ending"

module Katsuyou
  class VerbEnding
    def self.for(type)
      case type.category
      when :godan_verb then GodanVerbEnding.new(type)
      when :ichidan_verb then IchidanVerbEnding.new(type)
      end
    end

    def initialize(type)
      @type = type
    end
  end
end
