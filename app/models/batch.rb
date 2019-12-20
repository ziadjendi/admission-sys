class Batch < ApplicationRecord
  has_many :students
  has_many :interviews

  scope :sorted, lambda {order("created_at ASC")}
  scope :active, lambda {where(is_active: true)}
end
