class CreateStudents < ActiveRecord::Migration[5.0]
  def up
    create_table :students do |t|
      t.string :registration_no, index: true
      t.datetime :registration_date, defalut: DateTime.now.to_s
      t.string :photo
      t.string :name, index: true
      t.string :father
      t.string :grand_father
      t.string :last_name
      t.string :tribe
      t.integer :batch_id, index: true
      t.date :birth_date
      t.string :birth_place
      t.string :nationality
      t.string :marital_status
      t.string :full_mother
      t.string :wife_nationality
      t.string :passport_number
      t.date :passport_issue_date
      t.date :passport_expiry_date
      t.integer :user_id, index: true
      t.string :passport_country
      t.string :passport_type
      t.string :e_id
      t.string :family_id
      t.string :family_head_id
      t.string :emirate_name
      t.string :home_address_emirate
      t.string :home_address_city
      t.string :home_address_area
      t.string :home_address_building
      t.string :home_address_pobox
      t.string :home_address_phone
      t.string :mobile1
      t.string :mobile2
      t.string :email
      t.integer :created_by, index: true
      t.integer :updated_by, index: true
      t.string :language
      t.string :other_languages
      t.string :religion
      t.string :doctrine
      t.integer :tallness
      t.integer :weight
      t.string :mother_nationality
      t.string :mother_tribe
      t.string :mother_grand_father
      t.string :mother_father
      t.integer :year_high_shcool_diploma
      t.string :edu_section
      t.string :school_name
      t.string :grades_rate
      t.string :achievements
      t.string :kid_cop
      t.string :scouts
      t.string :scholarship
      t.string :remarks
      t.integer :exam_grade
      t.string :military_service
      t.string :remark_for_military_service
      t.boolean :fired_from_other_colleges
      t.string :criminal_status
      t.boolean :is_registered, :defalut => false

      t.timestamps
    end
  end

  def down
    drop_table :students
  end
end
