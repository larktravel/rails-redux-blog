class UsersController < ApplicationController
  # include DeviseTokenAuth::Concerns::SetUserByToken

  def show
    @user = User.find(params[:id])
  end

  def index
    @users = User.all
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      render 'show'
    else
      render json: { errors: @user }, status: :not_modified
    end
  end

  def create
    @user = User.initialize_user(user_params)
    render :show
  end

  def raw_params
    {
      email: params[:email],
      first_name: params[:first_name],
      last_name: params[:last_name]
    }
  end

  def user_params
    return raw_params unless params[:user]
    params.require(:user).permit(
      :email,
      :first_name,
      :last_name
    )
  end
end
