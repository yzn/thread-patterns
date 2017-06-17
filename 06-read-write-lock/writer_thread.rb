class WriterThread < Thread
  def initialize(name, data, filler)
    self.name = name
    @data = data
    @filler = filler
    @index = 0

    super() do
      execute
    end
  end

  private

  def execute
    loop do
      @data.write(next_char)
      sleep rand(3) + 1
    end
  end

  def next_char
    char = @filler[@index]
    @index += 1
    @index = 0 unless @index < @filler.size
    char
  end
end
