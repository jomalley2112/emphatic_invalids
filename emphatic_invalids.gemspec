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
  s.description = "Utilizes Rails server-side model validations to display client-side error messages for Ajax form submissions."
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.rdoc"]
  s.test_files = Dir["test/**/*"]

  s.add_dependency 'rails', '~> 5.1'
  s.add_dependency 'coffee-rails'
  s.add_dependency 'jquery-rails'
  s.add_dependency 'jquery-ui-rails'
  s.add_development_dependency 'pry-rails'
  s.add_development_dependency 'mysql2'
  s.add_development_dependency 'haml-rails'
end
