class ParentsController < ApplicationController


  def index

  end

  def show
    @parent = Parent.find(params[:id])
    @student = Student.find(@parent.student_id)
  end

  def new

  end

  def create
  end

  def edit
    @parent = Parent.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @parent = Parent.find(params[:id])
    # Save the object
    if @parent.update_attributes(parent_params)
    # If save succeeds, redirect to the show action
      @student = Student.find(@parent.student_id)
      flash[:notice]= "تم تحديث تفاصيل ولي اﻷمر بنجاح."
      if @student.is_registered
        redirect_to(parent_path(@parent))
      else
        redirect_to({:controller => 'students', :action => 'another_details', :id => @parent.student_id})
      end
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
  end

  def destroy
  end

  private

  def parent_params
    params.require(:parent).permit(:first_name, :last_name, :relation, :dob, :education, :occupation, :incom, :police_relatives, :country, :state, :city, :email, :address_line1,
                                   :address_line2, :phone1, :phone2, :mobile, :company)
  end

end
