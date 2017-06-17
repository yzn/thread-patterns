class MakerClientThread < Thread
  def initialize(name, active_object)
    self.name = name
    @active_object = active_object
    @fillchar = name[0]

    super() do
      execute
    end
  end

  private

  def execute
    i = 0
    loop do
      result = @active_object.make_string(i, @fillchar)
      sleep 0.01
      value = result.value
      puts "#{Thread.current.name}: value = #{value}"
      i += 1
    end
  end
end
