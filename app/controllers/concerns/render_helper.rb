module RenderHelper
	
	def emphasize_invalids(resource, format)
		# flash[:error] = error_message(resource) #TODO may want to make this an option
		format.js { render json: resource.errors, status: :unprocessable_entity }
  end

  private

  def error_message(resource)
    "Unable to #{action_name} #{resource.class.to_s.humanize}: #{ resource.errors.full_messages.join(', ') }"
  end

end