class ReaderThread < Thread
  def initialize(name, data)
    self.name = name
    @data = data

    super() do
      execute
    end
  end

  private

  def execute
    loop do
      buffer = @data.read
      print "#{Thread.current.name} reads #{buffer}\n"
    end
  end
end
