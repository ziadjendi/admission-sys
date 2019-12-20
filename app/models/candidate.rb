class Candidate < ApplicationRecord
  belongs_to :interviews_student, foreign_key: "student_id"
  scope :sorted, lambda {order("is_key_student, is_reserve_student, is_scholarship_student, student_id ASC")}

end
