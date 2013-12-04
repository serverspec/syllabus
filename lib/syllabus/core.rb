require 'specinfra'

class Syllabus::Core
  extend SpecInfra::Helper::Backend
  extend SpecInfra::Helper::DetectOS

  def self.run(args)
    # XXX
    extend SpecInfra::Helper.const_get(args[:type])

    backend = backend_for(args[:type])
    config  = Syllabus::Config.new_from_file(file: args[:file], backend: backend)
    logger  = Syllabus::Logger.new(level: args[:level])

    config.commands.each do |command|
      result = backend.run_command(command)
      logger.log(command, result)
    end
  end
end
