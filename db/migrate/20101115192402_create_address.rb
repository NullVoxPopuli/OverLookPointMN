class CreateAddress < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.string :number
      t.string :street
      t.string :city
      t.string :state
      t.string :zip_code
      t.references :user
    end
  end

  def self.down
    drop_table :addresses
  end
end
