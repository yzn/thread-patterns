require_relative 'host'

puts 'main BEGIN'

host = Host.new
data1 = host.request(10, 'A')
data2 = host.request(20, 'B')
data3 = host.request(30, 'C')

puts "main otherJob BEGIN"
sleep 2
puts "main otherJob END"

puts "data1 = #{data1.content.inspect}"
puts "data2 = #{data2.content.inspect}"
puts "data3 = #{data3.content.inspect}"

puts 'main END'
