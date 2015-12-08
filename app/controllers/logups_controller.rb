class LogupsController < ApplicationController
	def new
		@logup = User.new
	end

	def create
		@logup = User.new(user_params)

		if @logup.save
			redirect_to admin_user_path
		else
			render 'new'
		end
	end

	private
	def user_params
		params.require(:user).permit(:name, :pwd)	
	end
end
