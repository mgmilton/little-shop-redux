describe Category do
  describe "Validations" do
    context "Cateogry validations" do
      it "it is valid with all parameters" do
        category = Category.create(id: 1, name: "Skiing")

        expect(category).to be_valid
      end

      it "it is invalid without a name" do
        category = Category.create(id: 99)

        expect(category).to_not be_valid
      end
    end
  end
end
