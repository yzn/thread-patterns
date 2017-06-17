class RequestQueue
  def initialize
    @queue = []
    @mutex = Thread::Mutex.new
    @cond = Thread::ConditionVariable.new
  end

  def deq
    @mutex.synchronize do
      while @queue.empty?
        @cond.wait(@mutex)
      end

      @queue.shift
    end
  end

  def enq(request)
    @mutex.synchronize do
      @queue.push(request)
      @cond.broadcast
    end
  end
end
