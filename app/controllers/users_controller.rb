class UsersController < ApplicationController

  def index
    @users = User.sorted
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    # Instantiate a new object using form parameters
    @user = User.new(user_params)
    # Save the object
    if @user.save
    # If save succeeds, redirect to the index action
    flash[:notice]= "تم إنشاء المستخدم بنجاح."
      redirect_to(users_path)
    else
    # If save fails, redisplay the form so user can fix problems
      render('new')
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # Instantiate a new object using form parameters
    @user = User.find(params[:id])
    # Save the object
    if @user.update_attributes(user_params)
    # If save succeeds, redirect to the show action
      flash[:notice]= "تم تحديث المستخدم بنجاح."
      redirect_to(user_path(@user))
    else
    # If save fails, redisplay the form so user can fix problems
      render('edit')
    end
  end

  def delete
    @user = User.find(params[:id])
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:notice]= "تم حذف المستخدم '#{@user.full_name}' بنجاح."
    redirect_to(users_path)
  end

  private

  def user_params
    params.require(:user).permit(:username, :full_name, :hashed_password, :is_employee, :is_student)
  end

end
