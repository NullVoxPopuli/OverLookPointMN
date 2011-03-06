class User < ActiveRecord::Base
  acts_as_authentic
  has_many :addresses
  has_and_belongs_to_many :services
  
  validates_format_of :phone_number,
      :message => "must be a valid telephone number.",
      :with => /^[\(\)0-9\- \+\.]{10,20} *[extension\.]{0,9}/
  
  NOT_MEMBER = -1
  MEMBER_BASIC = 0
  MEMBER_ADMIN = 1
  
  def deliver_password_reset_instructions!  
    reset_perishable_token!  
    Notifier.deliver_password_reset_instructions(self)  
  end
  
  def is_admin?
    self.membership == MEMBER_ADMIN
  end
  
  def is_member?
    self.membership >= MEMBER_BASIC
  end
  
end
