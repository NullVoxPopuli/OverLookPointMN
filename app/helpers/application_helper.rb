# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
    def horizontal_menu_bar
      return MenuBar.find(:first, :conditions => {:is_horizontal => true})
    end
    
    def vertical_menu_bar
      return MenuBar.find(:first, :conditions => {:is_horizontal => false})
    end
    
    def site_title
      @site_title = Dictionary.find(:first, :conditions => ['key = ?', Dictionary::SITE_TITLE_KEY]).value
    end
    
    def tag_line
      @tag_line = Dictionary.find(:first, :conditions => ['key = ?', Dictionary::TAG_LINE_KEY]).value
    end
  
end
