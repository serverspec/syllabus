class Syllabus::Core
  def self.run(args)
    config  = Syllabus::Config.new_from_file(args[:file])
    backend = Syllabus::Backend.new(type: args[:type])

    config.commands.each do |command|
      backend.run_command(command.to_s)
    end
  end
end
