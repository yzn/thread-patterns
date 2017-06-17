require_relative 'future_data'
require_relative 'real_data'

class Host
  def request(count, char)
    puts "    request(#{count}, #{char.inspect}) BEGIN"

    future = FutureData.new

    Thread.new do
      future.real_data = RealData.new(count, char)
    end

    puts "    request(#{count}, #{char.inspect}) END"

    future
  end
end
