class SessionsController < ApplicationController
  skip_before_action :authenticate_request

  def create
    auth = AuthenticateUser.call(params[:email],params[:password])
    if auth.success?
      render json: { auth_token: auth.result}
    else
      render json: {errors: auth.errors}, status: :unauthorized
    end
  end

  def registration
    auth = RegistrationUser.call(params[:email],params[:password])
    if auth.success?
      render json: {response: 'You create user, try log in'}
    else
      render json: {errors: auth.errors}, status: :unauthorized
    end
  end
end
