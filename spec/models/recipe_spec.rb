# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Recipe, type: :model do
  subject do
    described_class.new(
      name: 'Spicy Salsa',
      description: "Cole's famous roasted tomato and serrano pepper spicy salsa.",
      servings: 8,
      prep_time: '20 minutes',
      cook_time: '10 minutes',
      sprouty_pie: false,
      lollys_pantry: false
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
      expect(Recipe.count).to eq 0
    end

    it 'has one after adding one' do
      Recipe.create(name: 'Recipe Title')
      expect(Recipe.count).to eq 1
    end

    it 'has none after one was created in a previous example' do
      expect(Recipe.count).to eq 0
    end
  end

  context 'serializer' do
    it 'serializes the recipe' do
      recipe = Recipe.create(name: 'Recipe Title')
      expect(recipe.as_json).to include('name' => 'Recipe Title')
    end
  end
end
