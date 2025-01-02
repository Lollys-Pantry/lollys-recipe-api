# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Tag, type: :model do
  let(:recipe) { Recipe.create(name: 'cookie') }
  subject do
    described_class.new(
      name: 'Oil Free',
      category: 'Dietary',
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
      expect(Tag.count).to eq 0
    end

    it 'has one after adding one' do
      Tag.create(name: 'Gluten Free', category: 'Dietary', recipe_id: recipe.id)
      expect(Tag.count).to eq 1
    end

    it 'has none after one was created in a previous example' do
      expect(Tag.count).to eq 0
    end
  end

  context 'serializer' do
    it 'serializes the tag' do
      tag = Tag.create(name: 'Breakfast', category: 'Meals', recipe_id: recipe.id)
      expect(tag.as_json).to include('name' => 'Breakfast')
    end
  end
end
