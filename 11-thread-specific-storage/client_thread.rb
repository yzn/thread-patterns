require_relative 'log'

class ClientThread < Thread
  def initialize(name)
    self.name = name

    super() do
      execute
    end
  end

  private

  def execute
    puts "#{name} BEGIN"

    10.times do |i|
      Log.puts("i = #{i}")
      sleep 0.1
    end

    Log.close

    puts "#{name} END"
  end
end
