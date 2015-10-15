class User < ActiveRecord::Base
  include Authenticable

  validates :email, presence: true,  uniqueness: true
  validate :validate_password_presence
  validate :validate_password_length

  def validate_password_presence
    if (new_record? && @password.blank?) || (!@password.nil? && @password.empty?)
      errors.add(:password, "can't be blank")
    end
  end

  def validate_password_length
    if @password.present? && @password.length < 8
      errors.add(:password, 'must be at least 8 characters')
    end
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
  
  def set_access_token
    self.update(access_token: SecureRandom.hex(50))
  end

  def destroy_access_token
    self.update(access_token: nil)
  end


end