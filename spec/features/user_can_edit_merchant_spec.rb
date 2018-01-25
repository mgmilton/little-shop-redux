# describe "As a user" do
#   context 'when I visit edit merchants path' do
#     it "I can change the merchants name" do
#       desired_merchant = Merchant.create(name:"Merles Bells", id: 1)
#
#       visit '/merchants/1/edit'
#
#       fill_in "merchant[name]", with: "Chocolate Spoons"
#
#       click_on 'Submit'
#
#       expect(current_path).to eq('/merchants/1')
#       expect(desired_merchant.name).to eq("Chocolate Spoons")
#     end
#   end
# end
