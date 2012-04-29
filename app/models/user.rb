class User < ActiveRecord::Base
	has_many :awards, :after_add => :calculate_points
  has_many :shakes, foreign_key: "source_user_id", :after_add => :calculate_points
  has_many :tweets, :after_add => :calculate_points
	validates :email, :name, presence: true

  has_and_belongs_to_many :developers

  def title
    case points
      when 0..40 then "The Lolcat"
      when 41..80 then "The Star Wars Kid"
      when 81..120 then "The Master of Rickrolling"
      when 121..180 then "The Monkeydancer"
      when 181..240 then "The Double Rainbow"
      when 241..320 then "The Tron Guy"
      else "Darth Confu"
    end

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
    self.points = (awards.count * 20) + (shakes.count * 20) + (tweets.count * 5)
    save
  end
end
