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

	def index
		@user = User.all
	end

def show
  	@user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user = User.find(params[:id])
 
  if @user.update(user_params)
    redirect_to admin_user_path
  else
    render 'edit'
  end
end

    def destroy
    @user = User.find(params[:id])
    @user.destroy

   redirect_to admin_user_path
    end
	private
		def user_params
			params.require(:user).permit(:name, :pwd)	
		end
end
