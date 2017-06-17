class FutureData
  def initialize
    @real_data = nil
    @ready = false
    @mutex = Thread::Mutex.new
    @cond = Thread::ConditionVariable.new
  end

  def real_data=(real_data)
    @mutex.synchronize do
      return if @ready
      @real_data = real_data
      @ready = true
      @cond.broadcast
    end
  end

  def content
    @mutex.synchronize do
      until @ready
        @cond.wait(@mutex)
      end
      @real_data.content
    end
  end
end
