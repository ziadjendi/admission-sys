class InterviewsStudent < ApplicationRecord
  belongs_to :interview
  belongs_to :student
  has_one :candidate, foreign_key: "student_id"

  scope :accepted_in_batch, ->(id){where("result = ?","مقبول").joins(:interview).where("batch_id = ? ",id);}
  scope :refused_in_batch, ->(id){where("result = ?","مرفوض").joins(:interview).where("batch_id = ? ",id);}
  scope :reserved_in_batch,->(id){where("result = ?","احتياط").joins(:interview).where("batch_id = ? ",id);}

  require 'roo'

  def self.import(file, intid)
  spreadsheet = Roo::Spreadsheet.open(file.path, extension: :xlsx)
  header = spreadsheet.row(1)
  (2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    row["student_id"] = Student.find_by(registration_no: row["student_id"]).id
    interviews_student = find_by(student_id: row["student_id"]) || new
    interviews_student.attributes = row.to_hash
    if interviews_student.result == "احتياط"
      interviews_student.update_attributes(:result => nil)
    end
    interviews_student.update_attributes(:interview_id => intid)
    interviews_student.save!
  end
 end

 def self.open_spreadsheet(file)
  case File.extname(file.original_filename)
  when ".csv" then Roo::CSV.new(file.path, nil, :ignore)
  when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
  when ".xlsx" then Roo::Excelx.new(file.path, nil, :ignore)
  else raise "Unknown file type: #{file.original_filename}"
  end
end


end
