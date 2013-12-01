require 'logger'
require 'term/ansicolor'

class Syllabus::Logger
  include Term::ANSIColor

  def initialize(args)
    @level        = args[:level] || 'info'
    @logger       = ::Logger.new(args[:io] || STDOUT)
    @logger.level = log_level_for(@level)
  end

  def log_level_for(level)
    Logger.const_get(level.upcase.to_sym)
  end

  def log(command, result)
    message = ''

    if result[:exit_status] == 0
      message << green(command.to_s)
    else
      message << "\n#{red(command.to_s)}"
      message << "\n  stdout: #{result[:stdout]}" if result[:stdout]
      message << "\n  stderr: #{result[:stderr]}" if result[:stderr]
    end

    @logger.send(@level.to_sym, message)
  end
end
