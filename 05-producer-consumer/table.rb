class Table
  def initialize(count)
    @buffer = Array.new(count)
    @head = 0
    @tail = 0
    @count = 0
    @mutex = Thread::Mutex.new
    @full_cond = Thread::ConditionVariable.new
    @empty_cond = Thread::ConditionVariable.new
  end

  def put(cake)
    @mutex.synchronize do
      while @count >= @buffer.size
        @full_cond.wait(@mutex)
      end

      puts "#{Thread.current.name} puts  #{cake}"

      @buffer[@tail] = cake
      @tail = (@tail + 1) % @buffer.size
      @count += 1

      @empty_cond.broadcast
    end
  end

  def take
    @mutex.synchronize do
      while @count <= 0
        @empty_cond.wait(@mutex)
      end

      cake = @buffer[@head]
      @head = (@head + 1) % @buffer.size
      @count -= 1

      @full_cond.broadcast

      puts "#{Thread.current.name} takes #{cake}"

      cake
    end
  end
end
