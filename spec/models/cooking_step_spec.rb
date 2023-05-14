# frozen_string_literal: true

require 'rails_helper'

RSpec.describe CookingStep, type: :model do
  let(:recipe) { Recipe.create(name: 'cookie') }
  subject do
    described_class.new(
      step: 1,
      description: 'mix dry ingredients',
      recipe_id: recipe.id
    )
  end

  context 'attributes and validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
