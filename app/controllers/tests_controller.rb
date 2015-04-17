class TestsController < ApplicationController
	def index
		@tests = Test.all
	end

	def new
		@video = Video.find(params[:video_id])
		@test = @video.tests.new
	end

	def create
		@video = Video.find(params[:video_id])
		if @test = @video.tests.create(test_params)
			redirect_to @test
		else
			render 'new'
		end
	end

	def show
		@video = Video.find(params[:video_id])
		@test = @video.tests.find(params[:id])
	end

private
	def test_params
		params.require(:test).permit(:problem, :option_a, :option_b, :option_c, :option_d, :answer, :score)
	end
end
