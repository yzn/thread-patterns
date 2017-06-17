require_relative 'helper'

class Host
  def initialize
    @helper = Helper.new
  end

  def request(count, char)
    output "    request(#{count}, #{char}) BEGIN\n"

    thread = Thread.new do
      @helper.handle(count, char)
    end

    output "    request(#{count}, #{char}) END\n"

    thread
  end

  private

  def output(message)
    $stderr.print(message)
    $stderr.flush
  end
end
