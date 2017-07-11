module EmphaticInvalids
  class Engine < ::Rails::Engine
    isolate_namespace EmphaticInvalids
    require 'jquery-rails'
    require 'jquery-ui-rails'
    initializer "emphatic_invalids.load_render_helper" do |app|
	    ActionController::Base.send :include, EmphaticInvalids::RenderHelper
	  end
  end
end
