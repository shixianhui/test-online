class TestsController < ApplicationController
	def index
		@tests = Test.where("video_id = ?", params[:video_id])
		if @tests.exists?
			@title = @tests.first.video.title
		else
			redirect_to videos_path
		end
	end

	def new
		@video = Video.find(params[:video_id])
		@test = @video.tests.new
	end

	def create
		@video = Video.find(params[:video_id])
		if @test = @video.tests.create(test_params)
			redirect_to admin_test_path
		else
			render 'new'
		end
	end

	def show
		@video = Video.find(params[:video_id])
		@test = @video.tests.find(params[:id])
	end

	def edit
		@video = Video.find(params[:video_id])
		@test = @video.tests.find(params[:id])
	end

	def update
		@video = Video.find(params[:video_id])
		@test = @video.tests.find(params[:id])
		if @test.update(test_params)
			redirect_to admin_test_path
		else
			redirect_to admin_test_path
		end
	end

	def destroy
		@video = Video.find(params[:video_id])
		@test = @video.tests.find(params[:id])
		@test.destroy
		redirect_to admin_test_path
	end

private
	def test_params
		params.require(:test).permit(:problem, :option_a, :option_b, :option_c, :option_d, :answer, :score)
	end
end
