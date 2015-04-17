class Course < ActiveRecord::Base
	has_many :videos, dependent: :destroy
	validates :title, presence: true
end
