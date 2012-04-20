class Badge < ActiveRecord::Base
	has_many :awards

	def award_to user
		awards.create({user: user})
	end

	def to_s
		"#{name} (##{id})"
	end
end
