class Person
  attr_reader :name, :address

  def initialize(name, address)
    @name = name.dup.freeze
    @address = address.dup.freeze
  end

  def to_s
    "[ Person: name = #{name}, address = #{address} ]"
  end
end
