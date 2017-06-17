require_relative 'real_result'

module ActiveObject
  class Servant
    def make_string(count, fillchar)
      buffer = ''
      count.times do
        buffer << fillchar
        sleep 0.1
      end
      RealResult.new(buffer)
    end

    def display_string(str)
      puts "display_string: #{str}"
      sleep 0.01
    end
  end
end
