# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Ingredient, type: :model do
  let(:recipe) { Recipe.create(name: 'cookie') }
  subject do
    described_class.new(
      quantity: 1,
      measurement: 'cup',
      name: 'flour',
      recipe_id: recipe.id
    )
  end

  context 'attributes and validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).to_not be_valid
    end
  end

  context 'transactions' do
    it 'has none to begin with' do
      expect(Ingredient.count).to eq 0
    end

    it 'has one after adding one' do
      Ingredient.create(quantity: 2, measurement: 'Tbsp', name: 'Tamari', recipe_id: recipe.id)
      expect(Ingredient.count).to eq 1
    end

    it 'has none after one was created in a previous example' do
      expect(Ingredient.count).to eq 0
    end
  end

  context 'serializer' do
    it 'serializes the ingredient' do
      ingredient = Ingredient.create(quantity: 5, measurement: 'each', name: 'tomato')
      expect(ingredient.as_json).to include('name' => 'tomato')
    end
  end
end
