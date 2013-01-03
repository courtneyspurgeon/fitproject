# We are setting the name of the namespace dynamically. The namespace
# should be the name of the application. 
app_name = Rails.application.class.to_s.split("::").first
namespace "#{app_name}" do
  desc "Core Seed - for all deployments."
  task :core_seed => :environment do
    # u = User.new
    # u.first_name = "Tyemill"
    # u.last_name = "Developer"
    # u.email = "developers@tyemill.com"
    # u.password = "p@ssw0rd"
    # u.save
    brand_names = ['Express', 'Gap', 'Guess', 'Levis',
      'Tommy Hilfiger', '7 for all Mankind', 'Free People',
      'Miss Me', 'Calvin Klein Jeans'
    ]
    brand_names.uniq.each_with_index do |name, index|
      b = Brand.new
      b.name = name.titleize
      b.save
    end # end brand_names.each
    
  end # end core_seed

   
end # end app namespace