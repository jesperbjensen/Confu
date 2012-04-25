module ApplicationHelper
  def render_profile_small profile
    render partial: 'users/profile_small', 
           locals: { profile: profile }
  end
end
