class Token < ActiveRecord::Base
  belongs_to :badge

  validates :code, :badge_id, presence: true
	validates :number_of_times_allowed, :minimum_time_between_scans_in_minutes, :numericality => { :greater_than => 0 }

  def available_for user
  	return number_of_times_left(user) > 0 && minutes_until_unlock(user) == 0
  end

  def number_of_times_left user
    awards = user.awards.where("badge_id = ?", badge.id).order("created_at desc")
    num_of = awards.count
    return number_of_times_allowed - num_of
  end

  def minutes_until_unlock user
    last_award = user.awards.where("badge_id = ?", badge.id).order("created_at desc").first
    
    if last_award.nil?
      return 0
    end

    min_since_last = (Time.now - last_award.created_at) / 1.minute
    time_to_unlock = minimum_time_between_scans_in_minutes - min_since_last

    if time_to_unlock < 0
      return 0
    else
      return time_to_unlock
    end
  end
end
