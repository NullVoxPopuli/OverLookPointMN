class LinkPage < ActiveRecord::Base
  has_and_belongs_to_many :menu_bar
end
