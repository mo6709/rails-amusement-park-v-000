class UsersController < ApplicationController
	def new
	end

	def create
      @user = User.create(user_param)
      if @user.valid?
      	session[:user_id] = @user.id
      	redirect_to user_path(@user.id)
      else
        render :new
      end 
	end
    
    def show
    	redirect_to root_path unless params[:id].to_i == session[:user_id]	
        @user = User.find_by(:id => session[:user_id])
    end

	private

	def user_param
		params.require(:user).permit(:name, :height, :happiness, :nausea, :tickets, :password, :admin)
	end
end