class PrintPersonThread < Thread
  def initialize(name, person)
    self.name = name
    @person = person

    super() do
      execute
    end
  end

  private

  def execute
    loop do
      sleep rand
      puts "#{Thread.current.name} prints #{@person}"
    end
  end
end
