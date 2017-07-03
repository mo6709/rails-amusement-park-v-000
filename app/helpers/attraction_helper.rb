module AttractionHelper
	def attractions_table(user_id)
        user = User.find_by(:id => user_id)
        if user.admin
        	render partial: 'attractions_admin_table', locals: {attractions: @attractions}
        else
        	render partial: 'attractions_user_table', locals: {attractions: @attractions}
        end
	end
end