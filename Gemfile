source :gemcutter

gem 'rails', '3.0.0.rc'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3-ruby', :require => 'sqlite3'

# Use unicorn as the web server
# gem 'unicorn'

gem "paperclip",">=2.3.3"  # attachments
gem "devise", ">=1.1rc2" # replacing with devise instead of authlogic
gem 'formtastic', :git => "git://github.com/justinfrench/formtastic.git", :branch => 'rails3'
gem 'will_paginate', '>=3.0.pre'


group :development do
  # gem "linecache19"
  # gem install linecache19 -- --with-ruby-include=/Users/mc/.rvm/src/ruby-1.9.2-rc2
  # gem install ruby-debug-base19 -- --with-ruby-include=/Users/mc/.rvm/src/ruby-1.9.2-rc2
  
  # gem "ruby-debug-base19"
  # gem "ruby-debug19"
  gem "ruby-debug"
  gem 'capistrano'
end 


group :test do
  # trying to add and get working
  gem "autotest-rails"
  gem "autotest"  
  gem "rcov"
  
  gem "rspec-rails",    ">=2.0.0.beta.12"
  gem "cucumber-rails", ">=0.3.2"
  gem "capybara",       ">=0.3.8"
  gem "launchy"
  gem "jasmine"
  gem "cucumber"
  gem "database_cleaner"
  gem "spork"
  gem "rspec",        ">=2.0.0.beta.12"
  gem "machinist"
  gem "forgery"
  gem "mocha"
end
