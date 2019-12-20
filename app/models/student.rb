class Student < ApplicationRecord
  has_one :parent
  belongs_to :batch
  has_many :interviews_students
  has_many :interviews, :through => :interviews_students
  has_one :user
  # belongs_to  :user , {:foreign_key => 'created_by'}
  # belongs_to :user, {:foreign_key => 'updated_by'}

  scope :sorted, lambda {order("registration_no ASC");}
  scope :filter_student_by_batch, ->(id) { where("batch_id = ?",id).order("registration_no DESC");}
  scope :registerd_in_batch, -> (id) {where("is_registered = 1 and batch_id= ?", id);}
  

  validates_presence_of :name

  require 'csv'


  def full_name
    ([name, father, grand_father, tribe, last_name] - [' ']).compact.join(' ')
  end

  def batch_name
    return Batch.find(self.batch_id).name
  end


  def self.to_csv(column_names, students, options = {})
    CSV.generate(options) do |csv|
      csv << column_names
      students.each do |student|
        csv << student.attributes.values_at(*column_names)
      end
    end
  end


end
