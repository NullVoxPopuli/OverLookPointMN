class LinkPage < ActiveRecord::Base
  has_and_belongs_to_many :menu_bar
  
  NOT_USED = -1
  
  has_and_belongs_to_many :sub_pages, :class_name => "LinkPage",
                          :join_table => :parents_sub_pages,
                          :association_foreign_key => :parent_id, :foreign_key => :sub_page_id
                          
    has_and_belongs_to_many :parents, :class_name => "LinkPage",
                          :join_table => :parents_sub_pages,
                          :association_foreign_key => :sub_page_id, :foreign_key => :parent_id
end
