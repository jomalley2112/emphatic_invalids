$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "emphatic_invalids/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = "emphatic_invalids"
  s.version     = EmphaticInvalids::VERSION
  s.authors     = ["John OMalley"]
  s.email       = ["jom@nycap.rr.com"]
  s.homepage    = ""
  s.summary     = "Helps to highlight invalid form field values after a form is submitted."
  s.description = "EmphaticInvalids works with normal server-side ActiveModel validations to highlight, set the focus and tab order to make it easier for end users to find and navigate a form's fields on the client-side."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency "rails", '~> 5.1'
  s.add_development_dependency 'mysql2'
end
