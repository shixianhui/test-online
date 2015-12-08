class User < ActiveRecord::Base
	validates :pwd, presence: true,
                    length: { minimum: 5 }
end
