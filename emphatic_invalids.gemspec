$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "emphatic_invalids/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "emphatic_invalids"
  s.version     = EmphaticInvalids::VERSION
  s.authors     = ["John OMalley"]
  s.email       = ["jom@nycap.rr.com"]
  s.homepage    = "https://github.com/jomalley2112/emphatic_invalids"
  s.summary     = "Helps to highlight invalid form field values after a form is submitted."
  s.description = "Lightweight gem that utilizes Rails server-side model validations to display client-side error messages for Ajax form submissions."
  s.license     = "MIT"

  s.files = Dir["{app,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  # s.test_files = Dir["test/**/*"]

  s.add_dependency 'sprockets-rails', '~> 3.2'
  s.add_dependency "activerecord", '~> 6.0'
  s.add_dependency 'activesupport', '>= 6.0.3.1' #mitigate vulnerability: CVE-2020-8165
  s.add_dependency 'coffee-rails', '~> 5.0'
  s.add_dependency 'jquery-rails', '~> 4.3'
  s.add_dependency 'loofah', '~> 2.3'
  s.add_dependency 'sprockets', '~> 3.7.2'
  s.add_dependency 'rack', '>= 2.1.4'
  s.add_dependency "nokogiri", '~> 1.10'
  
end
