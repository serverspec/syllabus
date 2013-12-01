class Syllabus::Config
  attr_reader :commands

  def self.new_from_file(file)
    configuration = File.read(file)
    new(configuration, file)
  end

  def initialize(configuration, file = '')
    @commands = []
    instance_eval(configuration, file)
  end

  def hosts(arg = nil)
    if arg
      @hosts = arg.kind_of?(Proc) ? arg.call : arg
    end

    @hosts
  end

  def os_type(arg = nil)
    if arg
      @os_type = arg.kind_of?(Proc) ? arg.call : arg
    end

    @os_type
  end

  def path(arg = nil)
    if arg
      @path = arg.kind_of?(Proc) ? arg.call : arg
      SpecInfra::Configuration.path = @path
    end

    @path
  end

  def method_missing(name, *args)
    command = Syllabus::Command.new(
      os_type: os_type,
      name:    name,
      args:    args,
    )
    @commands.push(command)
  end
end
