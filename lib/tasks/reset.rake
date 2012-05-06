
desc "Resets the system"
task :reset_system => :environment do
  Tweet.destroy_all
  Shake.destroy_all
  Award.destroy_all
  User.destroy_all
end