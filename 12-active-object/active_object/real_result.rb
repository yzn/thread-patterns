module ActiveObject
  class RealResult
    attr_reader :value

    def initialize(value)
      @value = value
    end
  end
end
