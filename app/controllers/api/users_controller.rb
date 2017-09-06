class Api::UsersController < ApplicationController
  before_action :authenticated?

  def index
    return permission_denied_error unless authenticated?
    users = User.all
    render json: users, each_serializer: UsersSerializer
  end
end
