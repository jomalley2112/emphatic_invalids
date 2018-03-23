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

  s.add_dependency 'rails', '~> 5.1' #was 5.1.2
  s.add_dependency 'coffee-rails', '~> 4.2' #was 4.2.2
  s.add_dependency 'jquery-rails', '~> 4.3' #was 4.3.1
  s.add_dependency 'loofah', '~> 2.2.1'
  s.add_dependency 'jquery-ui-rails', '~> 6.0' #require jquery-ui/widgets/tooltip for 6.0.0+
  
end
