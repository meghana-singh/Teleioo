require 'rails_helper'

RSpec.describe UsersController, type: :controller do

 describe "not signed in" do
     let(:factory_user)         { create(:user) }
     let(:factory_item)         { create(:item, user: factory_user) }
     let(:seven_days_old_item)  { Item.create!(name: "old item", created_at: 8.days.ago, user: factory_user)}
     
     before do
      @user   = factory_user
      sign_in   @user
     end

     it "returns http success" do
       get :show, {id: factory_user.id}
       expect(response).to have_http_status(:success)
     end

     it "renders the #show view" do
       get :show, {id: factory_user.id}
       expect(response).to render_template :show
     end

     it "assigns factory_user to @user" do
       get :show, {id: factory_user.id}
       expect(assigns(:user)).to eq(factory_user)
     end
     
     it "assigns factory_item to @items" do
       get :show, {id: factory_user.id}
       expect(assigns(:items)).to eq([factory_item])
     end
   
     it "deletes 7 days old items" do
       get :show, {id: factory_user.id}
       expect(assigns(:items)).not_to eq([seven_days_old_item])
     end
    
   end
end
