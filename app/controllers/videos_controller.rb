class VideosController < ApplicationController
	def index
		@videos = Video.all
	end

	def new
		@course  = Course.find(params[:course_id])
		@video = @course.videos.new
	end

	def create
		@course  = Course.find(params[:course_id])
		if @video = @course.videos.create(video_params)
			redirect_to admin_video_path
		else
			render course_path(@course)
		end
	end

	def show
		@course = Course.find(params[:course_id])
		@video = @course.videos.find(params[:id])
	end

	def destroy
		@course = Course.find(params[:course_id])
		@video = @course.videos.find(params[:id])
		@video.destroy
		redirect_to course_path(@course)
	end

	def edit
		@course = Course.find(params[:course_id])
		@video = @course.videos.find(params[:id])
	end

	def update
		@course = Course.find(params[:course_id])
		@video = @course.videos.find(params[:id])
		if @video.update(video_params)
			redirect_to admin_video_path
		else
			redirect_to course_path(@course)
		end
	end

	private
		def video_params
			params.require(:video).permit(:title, :introduce, :teacher, :poster, :video)
		end
end
