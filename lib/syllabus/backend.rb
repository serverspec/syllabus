require 'delegate'
require 'specinfra/backend'

class Syllabus::Backend < Delegator
  attr_reader :backend_type

  class NotImplementedError < StandardError; end

  def initialize(args)
    @backend_type = args[:type]
    @backend      = backend_class.instance
  end

  def backend_class
    if SpecInfra::Backend.const_defined?(backend_type.to_sym)
      SpecInfra::Backend.const_get(backend_type.to_sym)
    else
      raise NotImplementedError.new("Backend for #{backend_type} has not been implemented yet")
    end
  end

  def __getobj__
    @backend
  end
end
