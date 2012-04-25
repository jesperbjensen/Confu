class Shake < ActiveRecord::Base
  belongs_to :source_user, :class_name => 'User'
  belongs_to :dest_user, :class_name => 'User'
end
