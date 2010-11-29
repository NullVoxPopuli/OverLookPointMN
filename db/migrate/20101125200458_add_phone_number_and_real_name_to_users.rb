class AddPhoneNumberAndRealNameToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :phone_number, :string
    add_column :users, :real_name, :string
  end

  def self.down
    remove_column :users, :phone_number
    remove_column :users, :real_name
  end
end
