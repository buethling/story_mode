namespace :db do
  desc "Fill database with sample data"
    task :populate => :environment do
        Rake::Task['db:reset'].invoke
        admin = User.create!(:name => "Chris Lydon",
                     :email => "chris.lydon@gmail.com",
                     :password => "testtest",
                     :password_confirmation => "testtest")
        admin.toggle!(:admin)
     end
end
