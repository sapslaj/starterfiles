ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/spec'

# TODO: More tests.

class ActiveSupport::TestCase
  # Fixtures
  fixtures :all

  # Factories 
  include FactoryGirl::Syntax::Methods
end

module Minitest::Spec::DSL
  def xit(desc = "anonymous", &block)
    it(desc) { skip "(pending)" }
  end
end

module Minitest::Assertions
  # Custom assertions go here!
end
