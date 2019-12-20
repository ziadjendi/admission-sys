class InterviewsController < ApplicationController

  before_action :find_batch

  def index
    if @batch.nil?
      @active_batchs = Batch.active
      if @active_batchs.count == 1
        redirect_to(interviews_path(:batch_id => @active_batchs.first.id))
      end
    else
      @interviews = @batch.interviews.sorted
    end
  end

  def show
    @interview = Interview.find(params[:id])
  end

  def new
    @interview = Interview.new(:batch_id => @batch.id)
  end

  def create
    # Instantiate a new object using form parameters
    @interview = Interview.new(interview_params)
    # Save the object
    if @interview.save
    # If save succeeds, redirect to the index action
    flash[:notice]= "تم إنشاء المقابلة بنجاح."
    redirect_to(interviews_path(:batch_id => @batch.id))
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end
  def edit
    @interview = Interview.find(params[:id])
  end

  def update
    @interview = Interview.find(params[:id])
    if @interview.update_attributes(interview_params)
      flash[:notice] = "تم تحديث تفاصيل المقابلة بنجاح."
      redirect_to(interviews_path(:batch_id => @batch.id))
    else
      render('edit')
    end
  end

  def delete
    @interview = Interview.find(params[:id])
  end

  def destroy
    @interview = Interview.find(params[:id])
    @interview.destroy
    flash[:notice] = "تم حذف المقابلة بنجاح."
    redirect_to(interviews_path(:batch_id => @batch.id))
  end

  private




  def interview_params
    params.require(:interview).permit(:code , :interview_date, :batch_id)
  end

  def find_batch
    if params[:batch_id].present?
    @batch = Batch.find(params[:batch_id])
    end
  end


end
