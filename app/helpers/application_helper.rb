module ApplicationHelper
	def body_target
		controller.controller_name + "_" + controller.action_name
	end	
end
