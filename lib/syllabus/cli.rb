require 'thor'
require 'syllabus/core'

class Syllabus::CLI < Thor
  desc 'init', 'Sets up files to start configuration management with Syllabus.'
  def init
    configuration = <<'EOS'
# This is a configuration file for syllabus.

# Packages
# package 'httpd'
EOS
    File.write('syllabus.rb', configuration)
  end

  desc 'exec [--file FILE], [--type TYPE]', 'Execute commands against backend(s) according to a backend type'
  option :type,  default: 'exec'
  option :file,  default: 'syllabus.rb'
  option :level, default: 'info'
  def exec
    Syllabus::Core.run(
      type:  options[:type],
      file:  options[:file],
      level: options[:level],
    )
  end
end
