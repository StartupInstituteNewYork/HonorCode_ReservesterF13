class OwnersController < ApplicationController
    before_filter :authenticate_owner!, except: [:index]

    def index
      @owners = Owner.all
    end
end