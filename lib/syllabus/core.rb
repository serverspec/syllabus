class Syllabus::Core
  def self.run(args)
    config  = Syllabus::Config.new_from_file(args[:file])
    backend = Syllabus::Backend.new(type: args[:type])
    logger  = Syllabus::Logger.new(level: args[:level])

    config.commands.each do |command|
      result = backend.run_command(command.to_s)
      logger.log(command, result)
    end
  end
end
