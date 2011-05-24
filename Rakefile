begin
  require 'rspec/core/rake_task'

  desc 'Default: run specs'
  task :default => :spec  
  RSpec::Core::RakeTask.new do |t|
    t.pattern = "spec/**/*_spec.rb"
  end
  
  RSpec::Core::RakeTask.new('rcov') do |t|
    t.pattern = "spec/**/*_spec.rb"
    t.rcov = true
    t.rcov_opts = ['--exclude', 'spec']
  end

rescue LoadError
  puts "Rspec not available. Install it with: gem install rspec"  
end


begin
  require 'jeweler'
  Jeweler::Tasks.new do |gemspec|
    gemspec.name = "alarm_it"
    gemspec.summary = "AlarmIt is a tagging plugin for Rails that provides multiple tagging contexts on a single model."
    gemspec.description = "With AlarmIt, you could attach alarms to a single model."
    gemspec.email = "suvar3_7@mac.com"
    gemspec.homepage = ""
    gemspec.authors = ["Yannis Jaquet"]
    gemspec.files =  FileList["[A-Z]*", "{generators,lib,spec,rails}/**/*"] - FileList["**/*.log"]
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler not available. Install it with: gem install jeweler"
end