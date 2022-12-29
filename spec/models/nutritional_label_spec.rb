require 'rails_helper'

RSpec.describe NutritionalLabel, type: :model do
  let(:recipe) { Recipe.create(name: 'salsa') }
  subject do
    described_class.new(
      serving_size: '1/2 cup',
      calories: '150',
      total_fat: '26g',
      saturated_fat: '0g',
      sodium: '400mg',
      carbohydrates: '44g',
      fiber: '6g',
      sugar: '1g',
      protein: '1g',
      recipe_id: recipe.id
    )
  end

  context 'attributes and validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end

  context 'transactions' do
    it 'has none to begin with' do
      expect(NutritionalLabel.count).to eq 0
    end

    it 'has one after adding one' do
      NutritionalLabel.create(
        serving_size: '1 cup',
        calories: '350',
        total_fat: '26g',
        saturated_fat: '0g',
        sodium: '400mg',
        carbohydrates: '44g',
        fiber: '5g',
        sugar: '2g',
        protein: '7g', recipe_id: recipe.id
      )
      expect(NutritionalLabel.count).to eq 1
    end

    it 'has none after one was created in a previous example' do
      expect(NutritionalLabel.count).to eq 0
    end
  end

  context 'serializer' do
    it 'serializes the NutritionalLabel' do
      nutritional_label = NutritionalLabel.create(
        serving_size: '1 cup',
        calories: '350',
        total_fat: '26g',
        saturated_fat: '0g',
        sodium: '400mg',
        carbohydrates: '44g',
        fiber: '5g',
        sugar: '2g',
        protein: '7g', recipe_id: recipe.id 
      )
      expect(nutritional_label.as_json).to include('serving_size' => '1 cup')
    end
  end

end
