class User < ActiveRecord::Base
	has_many :awards

	validates :email, :name, presence: true
end
