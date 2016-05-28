if RUBY_PLATFORM == "java"
  require 'simplecov'
  SimpleCov.start
else
  require "codeclimate-test-reporter"
  CodeClimate::TestReporter.start
end

$:.unshift(File.join(File.dirname(__FILE__), '..', 'lib'))

gem 'minitest'
require 'minitest/autorun'
require 'minitest/spec'
require 'purdytest'
require 'fileutils'
require 'yaml'
require 'bundler/setup'

require 'gem_name'

def travis_ci?
  !!ENV['TRAVIS']
end
Bundler.require(:extras) if defined?(Bundler) && !travis_ci?
