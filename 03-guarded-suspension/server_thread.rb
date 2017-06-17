class ServerThread < Thread
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
      request = @queue.deq
      puts "#{Thread.current.name} handles  #{request}"
      sleep rand
    end
  end
end
