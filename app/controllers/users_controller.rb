class UsersController < ApplicationController
    def show
      @user  = current_user
      Item.where("created_at <= ?", Time.now - 7.days).destroy_all
      @items = @user.items
    end
end
