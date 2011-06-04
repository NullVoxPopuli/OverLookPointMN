namespace :db do
  desc "Load initial data"
  
  task :bootstrap => :environment do
    puts "creating tables..."
    Rake::Task["db:migrate"].invoke
    
    puts "Loading Data..."
    if MenuBar.count == 0
      menus = [
        {"is_horizontal" => "t"}, 
        {"is_horizontal" => "f"}
      ].collect do |menu|
        MenuBar.create(menu)
      end
    end
    
    puts "All done, you can use the program now... yay!"
  end
end
      
      