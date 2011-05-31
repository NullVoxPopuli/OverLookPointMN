namespace :db do
  desc "Load initial data"
  
  task :bootstrap => :environment do
    puts "creating tables..."
    Rake::Task["db:migrate"].invoke
    
    puts "Loading Data..."
    if MenuBar.count == 0
      Menus = [
               {"is_horizontal" => "t"}, 
               {"is_horizontal" => "f"}
              ].collect do |menu|
                MenuBar.create(menu)
              end
    end
    
    
      
      