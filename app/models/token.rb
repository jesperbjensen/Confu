class Token < ActiveRecord::Base
  belongs_to :badge

  validates :code, :badge_id, presence: true

  def available_for user
  	number_of_current_badge = user.awards.where("badge_id = ?", badge.id).count()
  	return number_of_current_badge == 0
  end
end
