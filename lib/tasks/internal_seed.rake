# We are setting the name of the namespace dynamically. The namespace
# should be the name of the application. 
app_name = Rails.application.class.to_s.split("::").first
namespace "#{app_name}" do
  desc "Internal Seed - for internal use."
  task :internal_seed => :environment do
    app_name = Rails.application.class.to_s.split("::").first

    Rake::Task["#{app_name}:core_seed"].invoke
  end # end internal_seed
end