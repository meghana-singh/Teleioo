class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end
  
  def create
    @user      = current_user
    @item      = @user.items.build(post_params)
    @item.user = current_user
    
    if @item.save
      flash[:notice] = "Task was saved"
      redirect_to :root
    else
      flash.now[:alert] = "There was an error saving the task. Please try again."
      render :new
    end
  end

  def post_params
    params.require(:item).permit(:name)
  end
  
end
