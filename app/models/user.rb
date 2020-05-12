class User < ApplicationRecord
  validates_presence_of :first_name,
                        :last_name,
                        :password, require: true
  validates  :email, uniqueness: true, presence: true

  has_secure_password

  def name
    first_name + " " + last_name
  end
end
