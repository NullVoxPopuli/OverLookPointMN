class CreateMenuBars < ActiveRecord::Migration
  def self.up
    create_table :menu_bars do |t|
      t.boolean :is_horizontal

      t.timestamps
    end
    
    create_table :link_pages_menu_bars, :id => false do |t|
      t.references :menu_bar
      t.references :link_page
      t.integer :order
    end
  end

  def self.down
    drop_table :menu_bars
    drop_table :menu_bars_link_pages
  end
end
