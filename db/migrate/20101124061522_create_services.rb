class CreateServices < ActiveRecord::Migration
  def self.up
    create_table :services do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
    
    create_table :services_users, :id => false do |t|
      t.references :user
      t.references :service
    end
  end

  def self.down
    drop_table :services
  end
end
