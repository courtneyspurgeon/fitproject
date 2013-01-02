# We are setting the name of the namespace dynamically. The namespace
# should be the name of the application. 
app_name = Rails.application.class.to_s.split("::").first
namespace "#{app_name}" do
  desc "Core Seed - for all deployments."
  task :core_seed => :environment do
    u = User.new
    u.first_name = "Tyemill"
    u.last_name = "Developer"
    u.email = "developers@tyemill.com"
    u.password = "p@ssw0rd"
    u.save
  end # end core_seed
end