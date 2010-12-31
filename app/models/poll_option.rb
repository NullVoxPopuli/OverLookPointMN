class PollOption < ActiveRecord::Base
  belongs_to :poll
  belongs_to :address
  
  accepts_nested_attributes_for :address, :allow_destroy => true

end
