class Address < ActiveRecord::Base
  belongs_to :user
  apply_addresslogic :fields => [[:number, :street], :city, [:state, :zip_code]]
end