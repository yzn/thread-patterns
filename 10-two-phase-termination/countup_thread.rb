class CountupThread
  class InterruptedException < StandardError
  end

  def initialize
    @counter = 0
    @thread = nil
    @shutdown_requested = false
  end

  def thread
    @thread ||= Thread.new { execute }
  end

  alias start thread

  def join
    thread.join
  end

  def shutdown_requested?
    @shutdown_requested
  end

  def shutdown_request
    @shutdown_requested = true
    thread.raise InterruptedException, '***** shutdown requested *****'
  end

  private

  def execute
    until shutdown_requested?
      do_work
    end
  rescue InterruptedException => error
    puts error.message
  ensure
    do_shutdown
  end

  def do_work
    @counter += 1
    puts "do_work: counter = #{@counter}"
    sleep 0.5
  end

  def do_shutdown
    puts "do_shutdown: counter = #{@counter}"
  end
end
