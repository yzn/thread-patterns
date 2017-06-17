class DisplayClientThread < Thread
  def initialize(name, active_object)
    self.name = name
    @active_object = active_object

    super() do
      execute
    end
  end

  private

  def execute
    i = 0
    loop do
      @active_object.display_string("#{Thread.current.name} #{i}")
      sleep 0.2
      i += 1
    end
  end
end
