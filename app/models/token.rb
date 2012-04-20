class Token < ActiveRecord::Base
  belongs_to :badge

  validates :code, :badge_id, presence: true
	validates :number_of_times_allowed, :minimum_time_between_scans_in_minutes, :numericality => { :greater_than => 0 }
  
  def available_for user
  	current_awards = user.awards.where("badge_id = ?", badge.id).order("created_at desc")
  	last_award = current_awards.first
  	number_of_current_badge = current_awards.count

  	minutes_since_last = (Time.now - last_award.created_at) / 1.minute

  	return (number_of_current_badge < number_of_times_allowed) && minutes_since_last >= minimum_time_between_scans_in_minutes
  end
end
