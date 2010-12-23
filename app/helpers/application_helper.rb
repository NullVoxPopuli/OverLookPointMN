# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def horizontal_menu_bar
      return MenuBar.find(:first, :conditions => {:is_horizontal => true})
    end
    
    def vertical_menu_bar
      return MenuBar.find(:first, :conditions => {:is_horizontal => false})
    end
  
end
