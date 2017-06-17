require_relative 'countup_thread'

puts 'main: BEGIN'

t = CountupThread.new
t.start

sleep 10

puts 'main: shutdown_request'
t.shutdown_request

puts 'main: join'
t.join

puts 'main: END'
