require_relative 'data_class'
require_relative 'reader_thread'
require_relative 'writer_thread'

data = DataClass.new(10)

threads = [
  ReaderThread.new('ReaderThread-1', data),
  ReaderThread.new('ReaderThread-2', data),
  ReaderThread.new('ReaderThread-3', data),
  ReaderThread.new('ReaderThread-4', data),
  ReaderThread.new('ReaderThread-5', data),
  ReaderThread.new('ReaderThread-6', data),
  WriterThread.new('WriterThread-1', data, 'ABCDEFGHIJKLMNOPQTSTUVWXYZ'),
  WriterThread.new('WriterThread-2', data, 'abcdefghijklmnopqrstuvwxyz')
]

threads.each(&:join)
