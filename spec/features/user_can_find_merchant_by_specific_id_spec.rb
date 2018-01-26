# describe "As a user" do
#   context "when I visit merchant by id path" do
#     it "I see a link to merchant index" do
#
#       Merchant.create(name: "Georginas Nails", id: 2)
#
#       visit 'merchants/2'
#
#       expect(page).to have_text("Merchant Index")
#     end
#
#     it "When I click on merchant index link I go to merchants page" do
#
#       click_link 'Merchant Index'
#
#       expect(current_path).to eq('/merchants')
#     end
#   end
# end
