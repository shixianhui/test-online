class Video < ActiveRecord::Base
  belongs_to :course
  has_many :tests
  validates :title, :teacher, presence: true
end
