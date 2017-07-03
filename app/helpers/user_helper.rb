module UserHelper
	def admin?
        User.find_by(:id => session[:user_id]).admin
	end
end
