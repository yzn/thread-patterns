class ChangerThread < Thread
  def initialize(name, data)
    self.name = name
    @data = data

    super() do
      execute
    end
  end

  private

  def execute
    i = 0
    loop do
      @data.change("No.#{i}")
      sleep rand
      @data.save
      i += 1
    end
  end
end
