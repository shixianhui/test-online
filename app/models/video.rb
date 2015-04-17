class Video < ActiveRecord::Base
  belongs_to :course
  has_many :tests
  validates :title, :video, :introduce, :teacher, :poster, presence: true
end
