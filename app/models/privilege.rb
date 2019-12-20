class Privilege < ApplicationRecord
  has_many :privileges_users
  has_many :users, :through => :privileges_users

  scope :sorted, lambda{order("description ASC")}
end
