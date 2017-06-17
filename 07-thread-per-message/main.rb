require_relative 'host'

puts "main BEGIN"

host = Host.new

threads = [
  host.request(10, 'A'),
  host.request(20, 'B'),
  host.request(30, 'C')
]

puts "main END"

threads.each(&:join)
