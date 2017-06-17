class RealData
  attr_reader :content

  def initialize(count, char)
    puts "        making RealData(#{count}, #{char.inspect}) BEGIN"

    buffer = ''

    count.times do
      buffer << char
      sleep 0.1
    end

    puts "        making RealData(#{count}, #{char.inspect}) END"

    @content = buffer
  end
end
