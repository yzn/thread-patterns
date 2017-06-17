require_relative 'active_object/active_object_factory'
require_relative 'maker_client_thread'
require_relative 'display_client_thread'

active_object = ActiveObject::ActiveObjectFactory.create

threads = [
  active_object.scheduler,
  MakerClientThread.new('Alice', active_object),
  MakerClientThread.new('Bobby', active_object),
  DisplayClientThread.new('Chris', active_object)
]

threads.each(&:join)
