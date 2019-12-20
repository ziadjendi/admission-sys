class User < ApplicationRecord
  #has_many :students
  belongs_to :student, required: false
  has_many :privileges_users
  has_many :privileges, :through => :privileges_users

  scope :is_employee, lambda { where(:is_employee => true); order("full_name ASC") }
  scope :is_student, lambda { where(:is_student => true); order("full_name ASC")}
  scope :sorted, lambda {order("is_employee DESC, full_name ASC")}
end
