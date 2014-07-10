module ApplicationHelper

	def user_is_creator?(guide)
		if current_user
			current_user.id == guide.creator_id ? true : false
		end
	end

end
