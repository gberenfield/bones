require 'rubygems'
require 'spork'

Spork.prefork do
  


  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  require 'rspec/rails'
  require File.join(File.dirname(__FILE__), 'blueprints')
  include Devise::TestHelpers

  # Requires supporting files with custom matchers and macros, etc,
  # in ./support/ and its subdirectories.
  Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each {|f| require f}

  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    config.mock_with :rspec
    # config.mock_with :flexmock
    # config.mock_with :rr
    # config.mock_with :mocha


    # Configure RSpec to run focused specs, and also respect the alias 'fit' for focused specs
    # config.filter_run :focused => true
    # config.run_all_when_everything_filtered = true
    # config.alias_example_to :fit, :focused => true


    # Turn color on if we are NOT inside Textmate, Emacs, or VIM
    # config.color_enabled = ENV.keys.none? { |k| k.include?("TM_MODE", "EMACS", "VIM") }

    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, comment the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true

  end
  
end

Spork.each_run do
  # This code will be run each time you run your specs.
  require 'simplecov'
  SimpleCov.start 'rails' do
    add_filter '/test/'
    add_filter '/config/'
    add_filter '/spec/'
    add_filter '/vendor/'

    add_group 'Controllers', 'app/controllers'
    add_group 'Models', 'app/models'
    add_group 'Helpers', 'app/helpers'
    add_group 'Libraries', 'lib'
  end
  
end

# --- Instructions ---
# - Sort through your spec_helper file. Place as much environment loading 
#   code that you don't normally modify during development in the 
#   Spork.prefork block.
# - Place the rest under Spork.each_run block
# - Any code that is left outside of the blocks will be ran during preforking
#   and during each_run!
# - These instructions should self-destruct in 10 seconds.  If they don't,
#   feel free to delete them.
#

