class UsersController < ApplicationController
  before_filter :authenticate_owner!, except: [:index]
  def new
    @user = User.new
  end
end
