class SaverThread < Thread
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
      @data.save
      sleep 1
    end
  end
end
