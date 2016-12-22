# coding: utf-8
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'fastlane/plugin/xcpretty_report/version'

Gem::Specification.new do |spec|
  spec.name          = 'fastlane-plugin-xcpretty_report'
  spec.version       = Fastlane::XcprettyReport::VERSION
  spec.author        = 'Fernando Saragoca'
  spec.email         = 'fsaragoca@me.com'

  spec.summary       = 'Generate xcodebuild reports using xcpretty'
  spec.homepage      = "https://github.com/fsaragoca/fastlane-plugin-xcpretty_report"
  spec.license       = "MIT"

  spec.files         = Dir["lib/**/*"] + %w(README.md LICENSE)
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency 'xcpretty', '>= 0.2.4', '< 1.0.0'
  spec.add_dependency 'xcpretty-json-formatter', '>= 0.1.0', '< 1.0.0'

  spec.add_development_dependency 'pry'
  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rubocop'
  spec.add_development_dependency 'fastlane', '>= 2.0.5'
end
