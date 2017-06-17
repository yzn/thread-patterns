require_relative 'table'
require_relative 'maker_thread'
require_relative 'eater_thread'

table = Table.new(3)

threads = [
  MakerThread.new('MakerThread-1', table),
  MakerThread.new('MakerThread-2', table),
  MakerThread.new('MakerThread-3', table),
  EaterThread.new('EaterThread-1', table),
  EaterThread.new('EaterThread-2', table),
  EaterThread.new('EaterThread-3', table)
]

threads.each(&:join)
