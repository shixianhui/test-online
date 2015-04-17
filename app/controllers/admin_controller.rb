class AdminController < ApplicationController
	http_basic_authenticate_with name: "admin", password: "123456"
	def course
		@courses = Course.all
	end

	def video
		@courses = Course.all
	end

	def test	
		@videos = Video.all
	end

	def addcourse
		@course = Course.new
	end

end
	