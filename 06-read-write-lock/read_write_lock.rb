class ReadWriteLock
  def initialize
    @reading_readers = 0
    @waiting_writers = 0
    @writing_writers = 0
    @prefer_writer = true
    @mutex = Thread::Mutex.new
    @cond = Thread::ConditionVariable.new
  end

  def read_lock
    @mutex.synchronize do
      while @writing_writers > 0 || (@prefer_writer && @waiting_writers > 0)
        @cond.wait(@mutex)
      end
      @reading_readers += 1
    end
  end

  def read_unlock
    @mutex.synchronize do
      @reading_readers -= 1
      @prefer_writer = true
      @cond.broadcast
    end
  end

  def write_lock
    @mutex.synchronize do
      @waiting_writers += 1
      begin
        while @reading_readers > 0 || @writing_writers > 0
          @cond.wait(@mutex)
        end
      ensure
        @waiting_writers -= 1
      end
      @writing_writers += 1
    end
  end

  def write_unlock
    @mutex.synchronize do
      @writing_writers -= 1
      @prefer_writer = false
      @cond.broadcast
    end
  end
end
