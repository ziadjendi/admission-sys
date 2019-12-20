class BatchesController < ApplicationController

  def index
    @batches = Batch.sorted
  end

  def show
    @batch = Batch.find(params[:id])
  end

  def new
    @batch = Batch.new
  end

  def create
    # Instantiate a new object using form parameters
    @batch = Batch.new(batch_params)
    # Save the object
    if @batch.save
    # If save succeeds, redirect to the index action
    flash[:notice]= "تم إنشاء الدفعة بنجاح."
    redirect_to(batches_path)
    else
    # If save fails, redisplay the form so user can fix problems
    render('new')
    end
  end

  def edit
    @batch = Batch.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @batch = Batch.find(params[:id])
    # Save the object
    if @batch.update_attributes(batch_params)
    # If save succeeds, redirect to the show action
    flash[:notice]= "تم تحديث الدفعة بنجاح."
      redirect_to(batch_path(@batch))
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @batch = Batch.find(params[:id])
  end

  def destroy
    @batch = Batch.find(params[:id])
    @batch.destroy
    flash[:notice]= "تم حذف الدفعة '#{@batch.name}' بنجاح."
    redirect_to(batches_path)
  end

  private

  def batch_params
    params.require(:batch).permit(:code,:name, :is_active)
  end



end
