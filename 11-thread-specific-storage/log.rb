require_relative 'tslog'

module Log
  class << self
    def puts(str)
      tslog.puts(str)
    end

    def close
      tslog.close
    end

    private

    def tslog
      tslog = Thread.current[:tslog]

      unless tslog
        tslog = TSLog.new(File.expand_path("#{Thread.current.name}-log.txt", __dir__))
        Thread.current[:tslog] = tslog
      end

      tslog
    end
  end
end
