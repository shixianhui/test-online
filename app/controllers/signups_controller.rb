class SignupsController < ApplicationController
	def new
		@signup = User.new
	end

	def create
		@signup = User.new(user_params)

		if @signup.save
			redirect_to new_user_path
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :pwd)	
	end
end
