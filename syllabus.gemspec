# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'syllabus/version'

Gem::Specification.new do |spec|
  spec.name          = 'syllabus'
  spec.version       = Syllabus::VERSION
  spec.authors       = ['Kentaro Kuribayashi']
  spec.email         = ['kentarok@gmail.com']
  spec.description   = %q{Yet Another Configuration Management Tool in the Era of Immutable Infrastructure}
  spec.summary       = %q{Yet Another Configuration Management Tool in the Era of Immutable Infrastructure}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'specinfra'
  spec.add_dependency 'thor'
  spec.add_dependency 'term-ansicolor'

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
end
