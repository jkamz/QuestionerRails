# frozen_string_literal: true

class V1::SessionsController < Devise::SessionsController
  def create
    user = User.where(email: params[:user][:email]).first

    if user&.valid_password?(params[:user][:password])
      @current_user = user
    else
      render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
    end
  end

  def destroy
    current_user&.authentication_token = nil
    if current_user&.save
      head(:ok)
    else
      head(:unauthorized)
    end
  end
end
