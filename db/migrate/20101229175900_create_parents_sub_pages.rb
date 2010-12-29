class CreateParentsSubPages < ActiveRecord::Migration
  def self.up
    create_table :parents_sub_pages, :id => false do |t|
      t.references :parent
      t.references :sub_page
    end
  end

  def self.down
    drop_table :parents_sub_pages
  end
end
