class V1::SessionsController < ApplicationController
  def create
    @user = User.where(email: params[:email]).first

    if @user&.valid_password?(params[:password])
      token = JWT.encode(
        { user_id: @user.id },
        Rails.application.secrets.secret_key_base,
        'HS256'
      )
      render :create, status: :created
    else
      head(:unauthorized)
    end
  end

  def destroy

  end
end
