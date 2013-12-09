# Syllabus [![BuildStatus](https://travis-ci.org/serverspec/syllabus.png)](http://travis-ci.org/serverspec/syllabus)

Syllabus is a configuration management tool for the era of "immutable infrastructure." which just provides a thin abstraction layer onto plain shell script.

## Commands

### `init`

`init` sets up files to start configuration management with Syllabus.

```
$ syllabus init
```

This creates `syllabus.rb` into the current working directory.

### `exec`

`exec` reads the configuration from the file specified by `--file` option and executes commands along with the type specified `--type` option.

```
$ syllabus exec --file examples/mac.rb --type Exec
```

`--type` can be either one of the type which are provided by [SpecInfra](https://github.com/mizzy/).

## Configuration

Syllabus provides a simple DSL to configure servers like below:

```
hosts   %[app1.example.com app2.example.com]
path    '/path/to/bin'

install 'httpd'
install 'git'
# ...
```

### Configuration for Syllabus

There are serveral methods to configure Syllabus itself.

  * `hosts`: Servers to be configured by Syllabus
  * `path`: `PATH` environment variable to be set on the servers

### Configuration for Servers

  * `install`: Specifies a package to be installed
  * (TODO)

## Installation

Add this line to your application's Gemfile:

    gem 'syllabus'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install syllabus

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
