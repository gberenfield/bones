RSpec::Core::RakeTask.new(:rcov => "db:test:prepare") do |t|
  t.pattern = "./spec/**/*_spec.rb"
  t.rcov_opts = %w{--rails --exclude osx\/objc,gems\/,spec\/,features\/ --aggregate coverage.data}
  t.rcov = true
end