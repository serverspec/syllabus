module Syllabus
  require 'syllabus/version'
  require 'syllabus/cli'
  require 'syllabus/core'
  require 'syllabus/logger'
  require 'syllabus/config'
  require 'syllabus/backend'
  require 'syllabus/command'
  require 'syllabus/command/base'
  require 'syllabus/command/darwin'
  require 'syllabus/command/linux'
  require 'syllabus/command/redhat'
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
