class User < ActiveRecord::Base
	has_many :awards
  has_many :shakes, foreign_key: "source_user_id"
  
	validates :email, :name, presence: true

  def points
    awards.count * 20
  end

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
end
