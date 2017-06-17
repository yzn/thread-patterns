require_relative 'request'

class ClientThread < Thread
  def initialize(name, channel)
    self.name = name
    @channel = channel

    super() do
      execute
    end
  end

  private

  def execute
    i = 0
    loop do
      request = Request.new(name, i)
      @channel.put(request)
      sleep rand
      i += 1
    end
  end
end
