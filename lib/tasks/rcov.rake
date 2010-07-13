# Based on http://github.com/jaymcgavren
# and tweaked for rspec2 by http://github.com/gberenfield
#
# Save this as rcov.rake in lib/tasks and use rcov:all =>
# to get accurate spec/feature coverage data
#
# Use rcov:rspec or rcov:cucumber
# to get non-aggregated coverage reports for rspec or cucumber separately

require 'cucumber/rake/task'
require 'rspec/core/rake_task' # was : require 'spec/rake/spectask'

namespace :rcov do
  Cucumber::Rake::Task.new(:cucumber_run) do |t|
    t.rcov = true
    t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/ --aggregate coverage.data}
    t.rcov_opts << %[-o "coverage"]
  end
  
  # RSpec::Core::RakeTask.new(:rspec_run) do |tttt|
  task :rspec_run do
    #t.rspec_opts = ['--options', "\"#{RAILS_ROOT}/spec/spec.opts\""]    # deprecated?
    # t.pattern = FileList['spec/**/*_spec.rb']
    # t.rcov = true
    # t.rcov_opts = lambda do
    #   IO.readlines("#{RAILS_ROOT}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
    # end
    spec_prereq = Rails.root.join('config', 'database.yml').exist? ? "db:test:prepare" : :noop
    [:requests, :models, :controllers, :views, :helpers, :mailers, :lib, :routing].each do |sub|
      desc "Run the code examples in spec/#{sub}"
      RSpec::Core::RakeTask.new(sub => spec_prereq) do |t|
        t.pattern = "./spec/#{sub}/**/*_spec.rb"
        t.rcov = true
        t.rcov_opts = lambda do
          IO.readlines("#{RAILS_ROOT}/spec/rcov.opts").map {|l| l.chomp.split " "}.flatten
        end        
      end
    end
    # 
    # RSpec::Core::RakeTask.new(sub => spec_prereq) do |t|
    #   t.pattern = "./spec/#{sub}/**/*_spec.rb"
    # end
    # 
  end
  
  desc "Run both specs and features to generate aggregated coverage"
  task :all do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:cucumber_run"].invoke
    Rake::Task["rcov:rspec_run"].invoke
  end
  
  desc "Run only rspecs"
  task :rspec do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:rspec_run"].invoke
  end
  
  desc "Run only cucumber"
  task :cucumber do |t|
    rm "coverage.data" if File.exist?("coverage.data")
    Rake::Task["rcov:cucumber_run"].invoke
  end
end
