#
# Zack is small set of tasks that help manage basic seeding, etc... 
#
namespace :zack do
  desc "Drop, Create, Migrate, Seed, Prepare, Load, Test"
  task :clean, :env do |t, args|
    args.with_defaults(:env => Rails.env)
    
    puts " "
    puts " "
    puts "Hi, I'm Zack. I'm the cleaner."
    puts " "
    puts "Your environment: #{args[:env]}"
    
    Rake::Task['zack:build'].invoke
    
    # In addition to cleaning the database ... We clean the resources
    # put in place by file uploads
#    Rake::Task['ts:clean_resources'].invoke
    
    
    # Why rake for 'core' vs. 'using fixtures': Fixtures are for testing.
    #
    # When using doubling-up the usage of fixtures to ALSO be a bootstrap 
    # mechanism for production... the test mechanism
    # loses it's value as a test mechanism.
    
    if args[:env] == 'internal'
      puts "Seeding Database (internal)"
      Rake::Task['zack:int_seed'].invoke
    else
      #
      # could check for 'development' vs. 'test' vs. 'production'
      #
      puts "Seeding Database (dev)"
      Rake::Task['zack:dev_seed'].invoke
    end
    
    Rake::Task['zack:test'].invoke
    
    puts " "
    puts "Zack, the cleaner, is complete."
    puts " "
  end
  
  desc "Drop, Create, Migrate"
  task :build do
    
    if Rails.env.production?
      puts " "
      puts "!!!!Danger Will Robinson! Danger! - Production Detected!"
      Rake::Task['zack:db_you_sure?'].invoke
    end
    
    puts " "
    puts "Dropping Database"
    Rake::Task['db:drop'].invoke
    puts " "
    puts "Creating Database"
    Rake::Task['db:create'].invoke
    puts " "
    Rake::Task['zack:mig'].invoke
  end
  
  desc "Prepare, Load, Test"
  task :test do
    puts " "
    puts "Preparing Tests"
    Rake::Task['db:test:prepare'].invoke
    puts " "
    puts "Loading Tests"
    Rake::Task['db:test:load'].invoke
    puts " "
    puts "Testing"
    Rake::Task['test'].invoke
    puts " "
  end

  desc "Prepare, Load, Test with code coverage enabled"
  task :test_coverage do
    require 'simplecov'
    SimpleCov.start 'rails'

    puts " "
    puts " "
    puts "Hi, I'm Zack. I'm enabling running test with code coverage enabled."
    puts " "

    # Save the state of the COVERAGE environment variable
    coverage = ENV["COVERAGE"]

    # Set the COVERAGE env. variable to true (so coverage runs for tests)
    puts "Enabling Code Coverage"
    ENV["COVERAGE"] = "true"

    SimpleCov.command_name "zack"
    Rake::Task['zack:test'].invoke
    # Restore the prev value of the COVERAGE env. variable
    ENV["COVERAGE"] = coverage
  end

  # seed for internal evn
  task :int_seed do
    # The namespace for the internal seed is the name of the app
    app_name = Rails.application.class.to_s.split("::").first
    Rake::Task["#{app_name}:internal_seed"].invoke
  end
  
  # seed for dev env
  task :dev_seed do
    Rake::Task['zack:int_seed'].invoke
    Rake::Task['db:seed'].invoke
  end
  
  
  # Migrates
  task :mig do
    puts "Migrating Database"
    Rake::Task['db:migrate'].invoke
    puts " "
  end
  
  # From: https://gist.github.com/129590
  task :db_you_sure? do
    puts "!!!WARNING!!! This task will DESTROY your env's database!"
    puts "Continue? y/n"
    continue = STDIN.gets.chomp
    unless continue == 'y'
      puts "Exiting..."
      exit! 
    end # end unless
  end # end you_sure
end