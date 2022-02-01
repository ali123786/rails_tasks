class User < ApplicationRecord
	has_secure_password
	has_many :bugs, foreign_key: 'creator_id'
  has_many :project_users
  has_many :projects
	validates_uniqueness_of :email
  validates_presence_of :email
  validates_presence_of :password, :on => :create
  enum user_type: [:manager, :developer, :qa]
end
