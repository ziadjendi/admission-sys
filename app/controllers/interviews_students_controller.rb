class InterviewsStudentsController < ApplicationController
  before_action :find_interview
  before_action :statistics

  def index
    if @registerd >0
    @interview_students = InterviewsStudent.where(:interview_id =>  @interview.id)
  else
    flash[:notice] = "لم يتم تسجيل طلاب في الدفعة #{@interview.batch.name} بعد!"
    redirect_to(interviews_path(:batch_id => @interview.batch_id))
  end
  end

  def show
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
    @interview_student = InterviewsStudent.find(params[:id])
    # Save the object
    if @interview_student.update_attributes(interviews_student_params)
    # If save succeeds, redirect to the show action
      flash[:notice]= "تم تثبيت نتيجة المقابلة للطالب #{@interview_student.student.full_name}."
      # if result "مقبول"  create new candidate
      if @interview_student.result == "مقبول"
        @candidate =  @interview_student.build_candidate
        if @candidate.save
          flash[:notice] += "  تم إنشاء مرشح جديد."
        else
          flash[:notice] += " حدث خطأ ولم يتم إنشاء مرشح جديد."
        end
      end

      redirect_to(interviews_students_path(@interview_student, :interview_id => @interview_student.interview_id))
    else
    flash[:notice]= "حدث خطأ ولم يتم تثبيت نتيجة المقابلة للطالب #{@interview_student.student.full_name}."
      redirect_to(interviews_students_path(@interview_student, :interview_id => @interview_student.interview_id))
    end
  end

  def delete
  end

  def destroy
  end

  def init_import

  end

  def import
    InterviewsStudent.import(params[:file], @interview.id)
    flash[:notice] = "تم استيراد الطلاب بنجاح."
    redirect_to interviews_path(:batch_id => @interview.batch_id)
  end

  private

  def interviews_student_params
    params.require(:interviews_student).permit(:interview_id , :student_id, :result)
  end

  def find_interview
    @interview = Interview.find(params[:interview_id])
  end

  def statistics
    @registerd = Student.registerd_in_batch(@interview.batch_id).count

    if @registerd > 0
    @accepted = InterviewsStudent.accepted_in_batch(@interview.batch_id).count
    @accepted_percent = @accepted * 100 / @registerd
    @refused = InterviewsStudent.refused_in_batch(@interview.batch_id).count
    @refused_percent = @refused * 100 / @registerd
    @reserved = InterviewsStudent.reserved_in_batch(@interview.batch_id).count
    @reserved_percent = @reserved * 100 / @registerd
    @standby = @registerd - @accepted - @refused - @reserved
    @standby_percent = @standby * 100 / @registerd
    @total_percent = 100 - @standby_percent
    end
  end

end
