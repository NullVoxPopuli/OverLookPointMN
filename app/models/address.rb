class Address < ActiveRecord::Base
  belongs_to :user
  has_one :poll_option
  apply_addresslogic :fields => [[:number, :street], :city, [:state, :zip_code]]
end