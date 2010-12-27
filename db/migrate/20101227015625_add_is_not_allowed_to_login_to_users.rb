class AddIsNotAllowedToLoginToUsers < ActiveRecord::Migration
  def self.up
    add_column :users, :is_not_allowed_to_login, :boolean
    add_column :users, :locked_reason, :string
  end

  def self.down
    remove_column :users, :is_not_allowed_to_login
    remove_column :users, :locked_reason
  end
end
