# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'capistrano/uwsgi/version'

Gem::Specification.new do |spec|
  spec.name          = 'capistrano-uwsgi'
  spec.version       = Capistrano::Uwsgi::VERSION
  spec.authors       = ['Elia Schito']
  spec.email         = ['elia@schito.me']
  spec.description   = %q{Simple uWSGI management with capistrano}
  spec.summary       = %q{Configuration and managements capistrano tasks for uWSGI}
  spec.homepage      = 'https://github.com/elia/capistrano-uwsgi'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'capistrano', ['>= 2.15.5', '< 3']
  spec.add_dependency 'railties',   ['>= 3.2.14', '< 5']

  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
