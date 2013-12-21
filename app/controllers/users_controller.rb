class UsersController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    redirect_to "/" if current_user != @user
  end

  # PUT /users/1
  def update
    @user = User.find(params[:id])

    respond_to do |format|
      if current_user != @user
        redirect_to "/"
      elsif @user.update_attributes(params[:user])
        format.html { redirect_to "/", notice: 'Public key was successfully updated.' }
      else
        format.html { redirect_to "/", notice: 'Not allowed.' }
      end
    end
  end

end