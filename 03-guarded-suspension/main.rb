require_relative 'request_queue'
require_relative 'client_thread'
require_relative 'server_thread'

queue = RequestQueue.new

threads = [
  ClientThread.new('Alice', queue),
  ServerThread.new('Bobby', queue)
]

threads.each(&:join)
