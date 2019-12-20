class StudentsController < ApplicationController

  def index
    @active_batchs = Batch.active
    if (@active_batchs.count == 1 ||  !params[:batch_id].nil?)
      @batch_id = params[:batch_id] || @active_batchs.first.id
      @students = Student.filter_student_by_batch(@batch_id)
      @listed_students = @students
      @accepted_student_ids = InterviewsStudent.accepted_in_batch(@batch_id).map{|accepted_student| accepted_student.student_id}
      @refused_student_ids = InterviewsStudent.refused_in_batch(@batch_id).map{|refused_student| refused_student.student_id}
      @except_ids = []
      if @accepted_student_ids.count > 0
        @except_ids += @accepted_student_ids
      end
      if @refused_student_ids.count > 0
        @except_ids += @refused_student_ids
      end
      if @except_ids.count > 0
        @listed_students = @students.where.not(id: @except_ids)
      end
    else
      flash[:notice]="لاتوجد أي دفعة فعالة. قم بإضافة دفعة جديدة أو تفعيل دفعة سابقة."
      redirect_to(batches_path);
    end
  end

  def show
    @student =Student.find(params[:id])
  end

  def show_another_details
    @student =Student.find(params[:id])
  end

  def show_education_details
    @student =Student.find(params[:id])
  end

  def new
    @student = Student.new
    @active_batchs = Batch.active
  end

  def create
    # Instantiate a new object using form parameters
    @student = Student.new(student_params)
    # DateTime.strptime(student_params[:registration_date], "%Y/%m/%d %H:%M:%S")
    @active_batchs = Batch.active
    @students_batch = Student.filter_student_by_batch(student_params[:batch_id])
    if @students_batch.empty?
      @student.registration_no = Batch.find(student_params[:batch_id]).code + "001"
    else
      @student.registration_no = next_registration_no(@students_batch.first.registration_no, Batch.find(student_params[:batch_id]).code)
    end
    # Save the object
    if @student.save
      # if save succeeds, redirect to the next step "add parents"
      @my_parent = @student.build_parent
      if @my_parent.save
        redirect_to(edit_parent_path(@my_parent))
      else
        redirect_to(students_path)
      end
    else
      # if save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def another_details
    @student = Student.find(params[:id])
  end

  def education_details
    @student = Student.find(params[:id])
  end

  def edit
    @student = Student.find(params[:id])
    @active_batchs = Batch.active
  end

  def edit_another_details
    @student = Student.find(params[:id])
  end

  def edit_education_details
    @student = Student.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @student = Student.find(params[:id])
    if params[:first_time] == 'true'
      # Update the object
      if params[:totale_rate].nil?
        if @student.update_attributes(student_params)
          flash[:notice]= "تم تحديث تفاصيل الطالب بنجاح."
          redirect_to(education_details_student_path(@student))
        else
          render('another_details')
        end
      else
        if @student.user_id.nil?
          @username = @student.registration_no
          @password = @student.registration_no + '123'
          @name = @student.full_name
          @my_user = @student.build_user({ username: @username , hashed_password: @password , full_name: @name, is_student: true })
          @my_user.save
          @student.user_id = @my_user.id
          @student.is_registered = true
          @student.grades_rate = calculate_rate(params[:totale_rate], params[:student_rate])
          if @student.update_attributes(student_params)
            flash[:notice]= "تم تحديث تفاصيل الطالب بنجاح."
            redirect_to(students_path)
          else
            render('education_details')
          end
        else
          if @student.update_attributes(student_params)
            flash[:notice]= "تم تحديث تفاصيل الطالب بنجاح."
          else
            flash[:notice]= "عذراً حدث خطأ ولم يتم تحديث تفاصيل الطالب"
          end
          redirect_to(students_path)
        end
      end
    else
      @updated_part = params[:updated_part]
      if @student.update_attributes(student_params)
        flash[:notice]= "تم تحديث تفاصيل الطالب بنجاح."
        case @updated_part
        when 'first_step'
          redirect_to(student_path(@student))
          # when second_step parent update
        when 'third_step'
          redirect_to(show_another_details_student_path(@student))
        when 'fourth_step'
          redirect_to(show_education_details_student_path(@student))
        end
      else
        case @updated_part
        when 'first_step'
          render('edit')
          # when second_step parent update
        when 'third_step'
          render('edit_another_details')
        when 'fourth_step'
          render('edit_eduction_details')
        end
      end
    end
  end

  def delete
    @student = Student.find(params[:id])
  end

  def destroy
    @student = Student.find(params[:id])
    @user = User.find(@student.user_id)
    @user.destroy
    @student.destroy
    flash[:notice]= "تم حذف الطالب '#{@student.full_name}' بنجاح."
    redirect_to(students_path)
  end

  def profile
    @student = Student.find(params[:id])

  end
  def export
    selected_col = ["registration_no", "registration_date", "name", "father", "grand_father", "last_name", "tribe", "birth_date",
      "birth_place","nationality", "marital_status", "full_mother", "wife_nationality", "passport_number", "passport_issue_date",
      "passport_expiry_date", "passport_country", "passport_type", "e_id", "family_id", "family_head_id", "emirate_name", "language",
      "other_languages", "religion", "doctrine", "tallness", "weight", "mother_nationality", "mother_tribe", "mother_grand_father",
      "mother_father", "year_high_shcool_diploma", "edu_section", "school_name", "grades_rate", "achievements", "kid_cop", "scouts",
      "scholarship", "remarks", "exam_grade", "military_service", "remark_for_military_service", "fired_from_other_colleges", "criminal_status"]
      if params[:Students_list].nil?
        @students = Student.where(is_registered: true).sorted
      else
        @list = params[:Students_list].split(',').map(&:to_s)
        @students = Student.where(registration_no: @list)
      end
      respond_to do |format|
        response.headers['Content-Disposition'] = 'attachment; filename="Students_list.xlsx"'
        format.html
        format.csv { send_data Student.to_csv(selected_col, @students), :filename => "Students_list.csv" }
        format.xlsx
      end
    end

    private

    def student_params
      params.require(:student).permit( :registration_no, :registration_date, :photo, :name, :father, :grand_father, :last_name, :tribe, :batch_id,  :birth_date, :birth_place, :nationality, :marital_status, :full_mother,
      :wife_nationality, :passport_number, :passport_issue_date, :passport_expiry_date, :user_id,  :passport_country, :passport_type, :e_id, :family_id, :family_head_id, :emirate_name,
      :home_address_emirate, :home_address_city, :home_address_area, :home_address_building, :home_address_pobox, :home_address_phone, :mobile1, :mobile2, :email, :created_by,  :updated_by,
      :language, :other_languages, :religion, :doctrine, :tallness, :weight, :mother_nationality, :mother_tribe, :mother_grand_father, :mother_father, :year_high_shcool_diploma, :edu_section,
      :school_name, :grades_rate, :achievements, :kid_cop, :scouts, :scholarship, :remarks, :exam_grade, :military_service, :remark_for_military_service, :fired_from_other_colleges,
      :criminal_status, :is_registered)
    end

    def next_registration_no(previouse_no, batch_code)
      @current_counter = previouse_no.remove(batch_code)
      return batch_code + ('%03d' % (1 + @current_counter.to_i)).to_s
    end

    def calculate_rate(totale_rate, student_rate)
      return student_rate.to_i(0) * 100 / totale_rate.to_i
    end

end
