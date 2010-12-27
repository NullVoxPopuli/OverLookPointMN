class AddHasPaidToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :has_paid, :boolean
  end

  def self.down
    remove_column :users, :has_paid
  end
end
