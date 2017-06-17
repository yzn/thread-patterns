require_relative 'read_write_lock'

class DataClass
  def initialize(size)
    @buffer = '*' * size
    @lock = ReadWriteLock.new
  end

  def read
    @lock.read_lock
    begin
      do_read
    ensure
      @lock.read_unlock
    end
  end

  def write(char)
    @lock.write_lock
    begin
      do_write(char)
    ensure
      @lock.write_unlock
    end
  end

  private

  def do_read
    buffer = @buffer.dup
    slowly
    buffer
  end

  def do_write(char)
    @buffer.size.times do |i|
      @buffer[i] = char
      slowly
    end
  end

  def slowly
    sleep 0.05
  end
end
