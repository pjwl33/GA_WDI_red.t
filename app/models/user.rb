class User < ActiveRecord::Base
  has_secure_password
  has_many :posts

  validates :username, :email, :password, :password_confirmation, presence: true
  validates :username, :email, uniqueness: true

end
