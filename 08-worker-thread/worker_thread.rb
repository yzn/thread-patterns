class WorkerThread
  def initialize(name, channel)
    @name = name
    @channel = channel
    @thread = nil
  end

  def thread
    unless @thread
      @thread = Thread.new { execute }
      @thread.name = @name
    end
    @thread
  end

  alias start thread

  def join
    thread.join
  end

  private

  def execute
    loop do
      request = @channel.take
      request.execute
    end
  end
end
