class CreateLinkPages < ActiveRecord::Migration
  def self.up
    create_table :link_pages do |t|
      t.string :name
      t.text :content
      t.boolean :visible
      t.boolean :is_link

      t.timestamps
    end
  end

  def self.down
    drop_table :link_pages
  end
end
