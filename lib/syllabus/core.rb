class Syllabus::Core
  def self.run(args)
    config = Syllabus::Config.new_from_file(args[:file])
  end
end
