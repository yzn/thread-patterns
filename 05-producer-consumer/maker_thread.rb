class MakerThread < Thread
  @id = 0
  @mutex = Thread::Mutex.new

  def self.next_id
    @mutex.synchronize do
      id = @id
      @id += 1
      id
    end
  end

  def initialize(name, table)
    self.name = name
    @table = table

    super() do
      execute
    end
  end

  private

  def execute
    loop do
      sleep rand
      cake = "[ Cake No.#{self.class.next_id} by #{name} ]"
      @table.put(cake)
    end
  end
end
