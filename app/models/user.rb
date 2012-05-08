class User < ActiveRecord::Base
	has_many :awards, :after_add => :calculate_points
  has_many :shakes, foreign_key: "source_user_id", :after_add => :calculate_points
  has_many :tweets, :after_add => :calculate_points
	validates :email, :name, presence: true
  
  def title
    case points
      when 0..60 then "The_Scared_Cat"
      when 61..80 then "Tech_Support_Cat"
      when 81..100 then "The_Rick_Rolled_Cat"
      when 101..140 then "The_Suicide_Cat"
      when 141..180 then "The_Ninja_Cat"
      when 181..220 then "The_Trollcat"
      else "Darth_Kitty"
    end
  end

  def title_image
    "#{title}.jpg"
  end

  def shake_code
    "#{id}-#{email.downcase}"
  end

  def image_url
    unless twitter_name.blank?
      "https://api.twitter.com/1/users/profile_image?screen_name=#{twitter_name}&size=bigger"
    else
      "http://www.gravatar.com/avatar/#{gravatar_code}.jpg?s=128&d=wavatar"
    end
  end

  def gravatar_code
    return Digest::MD5.hexdigest(email)
  end

  def calculate_points not_used=nil
    self.points = (awards.count * 20) + (shakes.count * 20) + ([tweets.count,20].min * 5)
    save
  end
end
