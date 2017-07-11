module EmphaticInvalids
  class ApplicationController < ::ApplicationController
    protect_from_forgery with: :exception

    def emphasize_invalids(resource, format)
	    flash[:error] = error_message(resource) 
	    format.js { render json: resource.errors, status: :unprocessable_entity }
	  end

	  private

	  def error_message(resource)
	    "Unable to #{action_name} #{resource.class.to_s.humanize}: #{ resource.errors.full_messages.join(', ') }"
	  end
  end
end
