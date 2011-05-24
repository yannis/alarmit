# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = %q{alarm_it}
  s.version = ""

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["Yannis Jaquet"]
  s.date = %q{2011-05-23}
  s.description = %q{With AlarmIt, you could attach alarms to a single model.}
  s.email = %q{suvar3_7@mac.com}
  s.extra_rdoc_files = [
    "README.rdoc"
  ]
  s.files = [
    "CHANGELOG",
    "Gemfile",
    "Gemfile.lock",
    "MIT-LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "generators/alarm_it_migration/alarm_it_migration_generator.rb",
    "generators/alarm_it_migration/templates/migration.rb",
    "lib/alarm_it.rb",
    "lib/alarm_it/alarm.rb",
    "lib/alarm_it/alarm_it.rb",
    "lib/alarm_it/alarms_helper.rb",
    "lib/generators/alarm_it/migration/migration_generator.rb",
    "lib/generators/alarm_it/migration/templates/active_record/migration.rb",
    "rails/init.rb",
    "spec/alarm_it/tag_spec.rb",
    "spec/database.yml",
    "spec/database.yml.sample",
    "spec/models.rb",
    "spec/schema.rb",
    "spec/spec_helper.rb"
  ]
  s.homepage = %q{}
  s.require_paths = ["lib"]
  s.rubygems_version = %q{1.3.7}
  s.summary = %q{AlarmIt is a tagging plugin for Rails that provides multiple tagging contexts on a single model.}

  if s.respond_to? :specification_version then
    current_version = Gem::Specification::CURRENT_SPECIFICATION_VERSION
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>, ["= 3.1.0.rc1"])
      s.add_runtime_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_runtime_dependency(%q<mysql2>, ["~> 0.3"])
      s.add_runtime_dependency(%q<jeweler>, [">= 0"])
      s.add_runtime_dependency(%q<rcov>, [">= 0"])
      s.add_development_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_development_dependency(%q<shoulda-matchers>, [">= 0"])
    else
      s.add_dependency(%q<rails>, ["= 3.1.0.rc1"])
      s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
      s.add_dependency(%q<mysql2>, ["~> 0.3"])
      s.add_dependency(%q<jeweler>, [">= 0"])
      s.add_dependency(%q<rcov>, [">= 0"])
      s.add_dependency(%q<rspec>, ["~> 2.6.0"])
      s.add_dependency(%q<shoulda-matchers>, [">= 0"])
    end
  else
    s.add_dependency(%q<rails>, ["= 3.1.0.rc1"])
    s.add_dependency(%q<sqlite3-ruby>, [">= 0"])
    s.add_dependency(%q<mysql2>, ["~> 0.3"])
    s.add_dependency(%q<jeweler>, [">= 0"])
    s.add_dependency(%q<rcov>, [">= 0"])
    s.add_dependency(%q<rspec>, ["~> 2.6.0"])
    s.add_dependency(%q<shoulda-matchers>, [">= 0"])
  end
end
