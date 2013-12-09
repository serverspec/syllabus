class Syllabus::Config
  attr_reader :commands

  def self.new_from_file(args)
    config = File.read(args[:file])
    new(config: config, file: args[:file], backend: args[:backend])
  end

  def initialize(args)
    @backend  = args[:backend]
    @hosts    = nil
    @commands = []
    instance_eval(args[:config], args[:file] || '')
  end

  def hosts(arg = nil)
    if arg
      @hosts = arg.kind_of?(Proc) ? arg.call : arg
    end

    @hosts
  end

  def path(arg = nil)
    if arg
      @path = arg.kind_of?(Array) ? arg : arg.split(':')
    end

    @path
  end

  def method_missing(name, *args)
    command = @backend.commands.send(name, *args)
    @commands.push(command)
  end
end
