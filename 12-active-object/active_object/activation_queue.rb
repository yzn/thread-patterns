module ActiveObject
  class ActivationQueue
    MAX_METHOD_REQUEST = 100

    def initialize
      @queue = Array.new(MAX_METHOD_REQUEST)
      @head = 0
      @tail = 0
      @count = 0
      @mutex = Thread::Mutex.new
      @full_cond = Thread::ConditionVariable.new
      @empty_cond = Thread::ConditionVariable.new
    end

    def put(request)
      @mutex.synchronize do
        while @count >= @queue.size
          @full_cond.wait(@mutex)
        end
        @queue[@tail] = request
        @tail = (@tail + 1) % @queue.size
        @count += 1
        @empty_cond.broadcast
      end
    end

    def take
      @mutex.synchronize do
        while @count <= 0
          @empty_cond.wait(@mutex)
        end
        request = @queue[@head]
        @head = (@head + 1) % @queue.size
        @count -= 1
        @full_cond.broadcast
        request
      end
    end
  end
end
