require_relative 'client_thread'

threads = [
  ClientThread.new('Alice'),
  ClientThread.new('Bobby'),
  ClientThread.new('Chris')
]

threads.each(&:join)
