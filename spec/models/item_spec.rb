require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "not signed in" do
      
    let(:factory_user)  { create(:user) }
    let(:factory_item)  { create(:item, user: factory_user) }
    
      describe "attributes" do
        it "has a name attribute" do
          expect(factory_item).to have_attributes(name: factory_item.name, user: factory_item.user)
        end
      end
  end
  
end
