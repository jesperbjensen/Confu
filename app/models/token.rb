class Token < ActiveRecord::Base
  belongs_to :badge

  validates :code, :badge_id, presence: true
	validates :number_of_times_allowed, :numericality => { :greater_than => 0 }
  
  def available_for user
  	number_of_current_badge = user.awards.where("badge_id = ?", badge.id).count()
  	return number_of_current_badge < number_of_times_allowed
  end
end
