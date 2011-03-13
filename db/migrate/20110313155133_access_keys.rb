class AccessKeys < ActiveRecord::Migration
  def self.up
    create_table :access_keys do |t|
      t.references :user
      t.date :expiration
      t.string :access_code
      
      t.timestamps
    end
    
    
  end

  def self.down
    drop_table :access_keys
  end
end
