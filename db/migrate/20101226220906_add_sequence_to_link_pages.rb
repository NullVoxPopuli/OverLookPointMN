class AddSequenceToLinkPages < ActiveRecord::Migration
  def self.up
    #add_column :link_pages, :sequence, :integer
    
    LinkPage.all.each do |lp|
      lp.sequence = LinkPage::NOT_USED
      
      lp.save
    end
  end

  def self.down
    remove_column :link_pages, :sequence
  end
end
