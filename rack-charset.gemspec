# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rack/charset/version'

Gem::Specification.new do |spec|

  spec.name          = "rack-charset"
  spec.version       = Rack::Charset::VERSION
  spec.authors       = ["Adam Luzsi"]
  spec.email         = ["adamluzsi@gmail.com"]

  spec.summary       = %q{A simple rack middleware that add charset to the response}
  spec.description   = %q{A simple rack middleware that add charset to the response. Useful when the Browser cannot tell about your website that it use utf-8 or latin1 as charset for the html code}
  spec.homepage      = "https://github.com/adamluzsi/rack-charset"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.11"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "rack-app"

end
