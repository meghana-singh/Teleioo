class UsersController < ApplicationController
    def show
      @user  = current_user
      @items = Item.all
    end
end
