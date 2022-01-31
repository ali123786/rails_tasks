class User < ApplicationRecord
	has_secure_password
	has_many :project_users
	validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  enum user_type: [:manager, :developer, :qa]
end
