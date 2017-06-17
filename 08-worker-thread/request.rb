class Request
  def initialize(name, number)
    @name = name
    @number = number
  end

  def execute
    puts "#{Thread.current.name} executes #{self}"
    sleep rand
  end

  def to_s
    "[ Request from #{@name} No.#{@number} ]"
  end
end
