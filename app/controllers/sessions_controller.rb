class SessionsController < ApplicationController
  skip_before_action :authenticate
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:user][:email])
    if @user && @user.authenticate(params[:user][:password])
      session[:current_user_id] = @user.id
      redirect_to root_path, notice: 'Добро пожаловать'
    else
      @errors = 'Все плохо'
      render 'new'
    end
  end

  def destroy
    session[:current_user_id] = nil
    redirect_to root_path
  end

end
