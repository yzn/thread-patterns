class TSLog
  def initialize(filename)
    @output = open(filename, 'w')
  end

  def puts(str)
    @output.puts(str)
  end

  def close
    @output.puts('==== End of log ====')
    @output.close
  end
end
