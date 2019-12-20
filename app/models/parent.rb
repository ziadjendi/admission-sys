class Parent < ApplicationRecord
  belongs_to :student

  scope :sorted, lambda {order("first_name ASC, last_name ASC")}
end
