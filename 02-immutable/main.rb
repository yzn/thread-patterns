require_relative 'person'
require_relative 'print_person_thread'

person = Person.new('Alice', 'Alaska')

threads = [
  PrintPersonThread.new('Thread-1', person),
  PrintPersonThread.new('Thread-2', person),
  PrintPersonThread.new('Thread-3', person)
]

threads.each(&:join)
