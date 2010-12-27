class ChangeContentInLinkPagesToText < ActiveRecord::Migration
  def self.up
    change_table :link_pages do |t|
     t.change(:content, :text)
    end

  end

  def self.down
    change_table :link_pages do |t|
     t.change(:content, :string)
    end
  end
end
