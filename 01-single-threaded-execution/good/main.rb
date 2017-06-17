require_relative 'gate'
require_relative 'user_thread'

gate = Gate.new

threads = [
  UserThread.new(gate, 'Alice', 'Alaska'),
  UserThread.new(gate, 'Bobby', 'Brazil'),
  UserThread.new(gate, 'Chris', 'Canada')
]

threads.each(&:join)
