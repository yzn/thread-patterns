class EaterThread < Thread
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
      cake = @table.take
      sleep rand
    end
  end
end
