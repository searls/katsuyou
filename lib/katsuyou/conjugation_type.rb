module Katsuyou
  class ConjugationType < Struct.new(:code, :description, :category, :supported, keyword_init: true)
    def initialize(supported: true, **kwargs)
      @supported = supported
      super
    end
  end
end
