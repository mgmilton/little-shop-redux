describe "As a user" do
  context "when I click on the edit link" do
    it " I am redirected to items/:id/edit" do
      Item.create(name: "itemtime", id: 1)

      visit 'items'

      click_link('Edit')
      expect(current_path).to eq('items/1/edit')
    end
  end
end
