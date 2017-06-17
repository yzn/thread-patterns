module ActiveObject
  class SchedulerThread
    def initialize(queue)
      @queue = queue
      @thread = nil
    end

    def thread
      @thread ||= Thread.new { execute }
    end

    alias start thread

    def join
      thread.join
    end

    def invoke(&block)
      @queue.put(block)
    end

    private

    def execute
      loop do
        request = @queue.take
        request.call
      end
    end
  end
end
