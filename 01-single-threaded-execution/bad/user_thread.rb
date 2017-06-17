class UserThread < Thread
  def initialize(gate, name, address)
    @gate = gate
    @name = name
    @address = address

    super() do
      execute
    end
  end

  private

  def execute
    puts "#{@name} BEGIN"

    loop do
      @gate.pass(@name, @address)
    end
  end
end
