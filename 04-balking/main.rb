require_relative 'data_class'
require_relative 'changer_thread'
require_relative 'saver_thread'

data = DataClass.new(File.expand_path('data.txt', __dir__), '(empty)')

threads = [
  ChangerThread.new('ChangerThread', data),
  SaverThread.new('SaverThread', data)
]

threads.each(&:join)
