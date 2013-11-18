class OwnersController < ApplicationController
  before_filter :authenticate_owner!, except: [:index]
  def new
     @owners = Owner.all
  end

end