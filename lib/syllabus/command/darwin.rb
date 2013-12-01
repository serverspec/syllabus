class Syllabus::Command::Darwin < Configspec::Commands::Base
  def install(package)
    cmd = "brew install '#{package}'"
  end
end
