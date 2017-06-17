require_relative 'channel'
require_relative 'client_thread'

channel = Channel.new(5)

workers = channel.workers
workers.each(&:start)

threads = [
  *workers,
  ClientThread.new('Alice', channel),
  ClientThread.new('Bobby', channel),
  ClientThread.new('Chris', channel)
]

threads.each(&:join)
