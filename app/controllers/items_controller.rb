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

  def destroy
    @item      = Item.find(params[:id])
    
    if @item.destroy
      flash[:notice] = "Task was deleted."
    else
      flash.now[:alert] = "There was an error deleting the task. Please try again."
    end
    
    respond_to do |format|
      format.html
      format.js
    end
  end

  def post_params
    params.require(:item).permit(:name, :created_at)
  end
  
end
