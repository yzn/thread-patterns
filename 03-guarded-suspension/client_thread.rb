require_relative 'request'

class ClientThread < Thread
  def initialize(name, queue)
    self.name = name
    @queue = queue

    super() do
      execute
    end
  end

  private

  def execute
    10000.times do |i|
      request = Request.new("No. #{i}")
      puts "#{Thread.current.name} requests #{request}"
      @queue.enq(request)
      sleep rand
    end
  end
end
