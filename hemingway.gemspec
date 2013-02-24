# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'hemingway/version'

Gem::Specification.new do |gem|
  gem.name          = "hemingway"
  gem.version       = Hemingway::VERSION
  gem.authors       = ["William Myers"]
  gem.email         = ["griffin.myers@gmail.com"]
  gem.description   = %q{Hemingway is a LaTeX to HTML parser.}
  gem.summary       = %q{Hemingway is a LaTeX to HTML parser.}
  gem.homepage      = "https://rubygems.org/gems/hemingway"

  gem.add_development_depedency "rspec"
  gem.add_development_depedency "treetop"
  gem.add_development_depedency "polyglot"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
