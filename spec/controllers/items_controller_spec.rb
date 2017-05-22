require 'rails_helper'

RSpec.describe ItemsController, type: :controller do
    
  describe "not signed in" do
      
    let(:factory_user)         { create(:user) }
    let(:factory_item)         { create(:item, user: factory_user) }
    
      before do
        @user   = factory_user
        sign_in   @user
      end
      
    describe "GET new" do
      it "returns http success" do
        get :new, user_id: factory_user.id
        expect(response).to have_http_status(:success)
      end

      it "renders the #new view" do
        get :new, user_id: factory_user.id
        expect(response).to render_template :new
      end

      it "instantiates @item" do
        get :new, user_id: factory_user.id
        expect(assigns(:item)).not_to be_nil
      end
    end

    describe "POST create" do
      it "increases the number of Item by 1" do
        expect{ post :create, user_id: factory_user.id, item: {name: "random_name"} }.to change(Item,:count).by(1)
      end

      it "assigns the new item to @item" do
        post :create, user_id: factory_user.id, item: {name: "random_name"}
        expect(assigns(:item)).to eq Item.last
      end

      it "redirects to the new item" do
        post :create, user_id: factory_user.id, item: {name: "random_name"}
        expect(response).to redirect_to root_path
      end
    end
  
    describe "DELETE destroy" do
      it "deletes the item" do
        delete :destroy, format: :js, user_id: factory_user.id, id: factory_item.id
        count = Item.where({id: factory_item.id}).size
        expect(count).to eq 0
      end

      it "redirects to posts index" do
        delete :destroy, format: :js, user_id: factory_user.id, id: factory_item.id
        expect(response).to have_http_status (:success)     
      end
    end
    
  end
end