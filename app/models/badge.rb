class Badge < ActiveRecord::Base
	has_many :awards

	def to_s
		"#{name} (##{id})"
	end
end
