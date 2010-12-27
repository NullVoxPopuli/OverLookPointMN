class LinkPage < ActiveRecord::Base
  has_and_belongs_to_many :menu_bar
  
  NOT_USED = -1
end
