class Interview < ApplicationRecord
  belongs_to :batch
  has_many :interviews_students
  has_many :students, :through => :interviews_students

  scope :sorted, lambda {order("batch_id ASC, interview_date ASC")}
  scope :filter_Interview_by_batch, ->(id) {where("batch_id = ?", id).order("interview_date ASC");}
end
