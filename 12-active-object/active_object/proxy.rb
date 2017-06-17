require_relative 'future_result'

module ActiveObject
  class Proxy
    attr_reader :scheduler

    def initialize(scheduler, servant)
      @scheduler = scheduler
      @servant = servant
    end

    def make_string(count, fillchar)
      future = FutureResult.new
      @scheduler.invoke do
        future.result = @servant.make_string(count, fillchar)
      end
      future
    end

    def display_string(str)
      @scheduler.invoke do
        @servant.display_string(str)
      end
    end
  end
end
