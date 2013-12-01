require 'configspec/commands/base'
require 'configspec/commands/linux'
require 'configspec/commands/redhat'

class Syllabus::Command
  attr_reader :os_type, :name, :args

  class NotImplementedError < StandardError; end

  def initialize(args)
    @os_type = args[:os_type]
    @name    = args[:name]
    @args    = args[:args]
  end

  def command_class
    if Syllabus::Command.const_defined?(os_type.to_sym)
      Syllabus::Command.const_get(os_type.to_sym)
    else
      raise NotImplementedError.new("Command for #{os_type} has not been implemented yet")
    end
  end

  def to_s
    command = command_class.new
    command.send(name.to_sym, args.first)
  end
end
