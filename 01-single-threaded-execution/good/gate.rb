class Gate
  def initialize
    @counter = 0
    @name = 'Nobody'
    @address = 'Nowhere'
    @mutex = Thread::Mutex.new
  end

  def pass(name, address)
    @mutex.synchronize do
      @counter += 1
      sleep rand
      @name = name
      sleep rand
      @address = address

      check
    end
  end

  def to_s
    @mutex.synchronize do
      "No. #{@counter}: #{@name}, #{@address}"
    end
  end

  private

  def check
    if @name[0] != @address[0]
      puts "***** BROKEN ***** #{self}"
    end
  end
end
