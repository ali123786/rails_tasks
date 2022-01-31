class Project < ApplicationRecord
  has_many :bugs
  has_many :project_users
end
