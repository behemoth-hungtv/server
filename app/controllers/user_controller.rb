class UserController < ApplicationController
  skip_before_action :authenticate_request

  def register
    form = Users::RegisterForm.new(user_params)

    if !form.valid?
      execution_error('validation', form.errors)
      nil
    else
      @user = User.create! user_params

      render json: {
        message: 'Success !!!'
      }
    end
  end

  def login
    form = Users::LoginForm.new(user_params)

    unless form.valid?
      execution_error('validation', form.errors)
      return
    end

    authenticate params[:name], params[:password]
  end

  private

  def user_params
    params.permit :name, :password
  end

  def loadUser(name)
    @user = User.find_by! name:
  end

  def authenticate(name, password)
    command = AuthenticateUser.call(name, password)

    if command.success?
      render json: {
        data: loadUser(name),
        auth_token: command.result
      }
    else
      render json: { message: 'email or password wrong' }, status: :unauthorized
    end
  end
end
