Gem::Specification.new do |s|
  s.name = "alarm_it"
  s.version = '0.0.0'
  # s.platform = Gem::Platform::RUBY
  
  s.authors = ["Yannis Jaquet"]
  s.date = %q{2011-05-24}
  s.description = %q{Associate alarms to any model}
  s.summary = %q{Associate alarms to any model}
  s.email = %q{suvar3_7@mac.com}
  
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {spec}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_dependency "rails", "~> 3.1.0.rc1"
  s.add_dependency "mysql2", "~> 0.3.2"
  s.add_dependency "will_paginate", "~>3.0.pre2"
  
  s.add_development_dependency "rspec", "~> 2.6.0"
  s.add_development_dependency 'shoulda-matchers'
  s.add_development_dependency 'factory_girl'
end

