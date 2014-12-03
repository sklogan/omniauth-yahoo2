$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "yahoo/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "yahoo"
  s.version     = Yahoo::VERSION
  s.authors     = ["sklogan"]
  s.email       = ["logan.senthilkumar@gmail.com"]
  s.homepage    = "https://github.com/sklogan/omniauth-yahoo2"
  s.summary     = "Yahoo OAuth2 Strategy for OmniAuth"
  s.license     = "MIT"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
  s.require_paths = ['lib']

  s.add_runtime_dependency 'omniauth-oauth2', '~> 1.2'

  s.add_development_dependency 'minitest'
  s.add_development_dependency 'mocha'
  s.add_development_dependency 'rake'
end
