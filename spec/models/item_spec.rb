require 'rails_helper'

RSpec.describe Item, type: :model do
  describe "not signed in" do
      
    let(:factory_user)  { create(:user) }
    let(:factory_item)  { create(:item, user: factory_user) }
    
    it { is_expected.to belong_to(:user) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_length_of(:name).is_at_least(5) }
   
      describe "attributes" do
        it "has a name attribute" do
          expect(factory_item).to have_attributes(name: factory_item.name, user: factory_item.user)
        end
      end
  end
  
end
