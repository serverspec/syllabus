class Syllabus::Config
  def self.new_from_file(file)
    configuration = File.read(file)
    new(configuration, file)
  end

  def initialize(configuration, file = '')
    instance_eval(configuration, file)
  end

  def hosts(arg = nil)
    if arg
      @hosts = arg.kind_of?(Proc) ? arg.call : arg
    end

    @hosts
  end
end
