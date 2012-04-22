module ApplicationHelper
  def render_profile_small profile
    render partial: 'users/profile_small', 
           locals: { profile: current_user }
  end
end
