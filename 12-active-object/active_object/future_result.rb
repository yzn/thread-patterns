module ActiveObject
  class FutureResult
    def initialize
      @result = nil
      @ready = false
      @mutex = Thread::Mutex.new
      @cond = Thread::ConditionVariable.new
    end

    def result=(result)
      @mutex.synchronize do
        @result = result
        @ready = true
        @cond.broadcast
      end
    end

    def value
      @mutex.synchronize do
        until @ready
          @cond.wait(@mutex)
        end
        @result.value
      end
    end
  end
end
