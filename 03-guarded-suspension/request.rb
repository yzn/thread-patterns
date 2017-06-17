class Request
  attr_reader :name

  def initialize(name)
    @name = name.dup.freeze
  end

  def to_s
    "[ Request #{name} ]"
  end
end
