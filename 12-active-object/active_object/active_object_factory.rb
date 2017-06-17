require_relative 'servant'
require_relative 'activation_queue'
require_relative 'scheduler_thread'
require_relative 'proxy'

module ActiveObject
  class ActiveObjectFactory
    def self.create
      servant = Servant.new
      queue = ActivationQueue.new
      scheduler = SchedulerThread.new(queue)
      proxy = Proxy.new(scheduler, servant)
      scheduler.start
      proxy
    end
  end
end
