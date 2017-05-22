class UsersController < ApplicationController
    def show
      @user  = current_user
      @items = @user.items
      Item.where("created_at <= ?", Time.now - 7.days).destroy_all
    end
end
