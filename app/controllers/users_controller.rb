class UsersController < ApplicationController
	def new
		@user = User.new
	end

	def create
		if @user = User.exists?(user_params)
			redirect_to videos_path
		else
			redirect_to new_user_path
		end
	end

	private
		def user_params
			params.require(:user).permit(:name, :pwd)	
		end
end
