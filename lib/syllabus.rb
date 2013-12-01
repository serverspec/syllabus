module Syllabus
  require 'syllabus/version'
  require 'Syllabus/cli'
  require 'Syllabus/core'
  require 'Syllabus/logger'
  require 'Syllabus/config'
  require 'Syllabus/backend'
  require 'Syllabus/command'
  require 'Syllabus/command/base'
  require 'Syllabus/command/darwin'
  require 'Syllabus/command/linux'
  require 'Syllabus/command/redhat'
end

# XXX: Workacount to avoid the dependency on RSpec
require 'specinfra/configuration'
module SpecInfra
  class << self
    def configuration
      SpecInfra::Configuration
    end
  end
end
