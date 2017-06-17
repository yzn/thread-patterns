class DataClass
  def initialize(filename, content)
    @filename = filename
    @content = content
    @changed = true
    @mutex = Thread::Mutex.new
  end

  def change(content)
    @mutex.synchronize do
      @content = content
      @changed = true
    end
  end

  def save
    @mutex.synchronize do
      return unless @changed
      do_save
      @changed = false
    end
  end

  private

  def do_save
    puts "#{Thread.current.name} calls do_save, content = #{@content.inspect}"
    File.open(@filename, 'w') do |io|
      io << @content
    end
  end
end
