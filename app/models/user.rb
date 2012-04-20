class User < ActiveRecord::Base
	has_many :awards

	validates :email, presence: true
end
