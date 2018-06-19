require 'spec_helper'

describe Recipe do

  describe 'validations' do
    it 'should be invalid with duplicate names' do
      recipe = create(:recipe, name: 'Negroni')
      recipe.save!

      duplicate_recipe = build(:recipe, name: 'negroni')
      expect(duplicate_recipe).not_to be_valid
    end
  end

end