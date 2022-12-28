# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/ingredients', type: :request do
  let(:recipe) { Recipe.create(name: 'cookie') }
  let(:valid_attributes) do
    { quantity: 1,
      measurement: 'cup',
      name: 'flour',
      recipe_id: recipe.id }
  end

  let(:invalid_attributes) do
    {
      quantity: nil,
      measurement: nil,
      name: nil,
      recipe_id: nil
    }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # IngredientsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Ingredient.create! valid_attributes
      get api_v1_recipe_ingredients_path(recipe), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      get api_v1_recipe_ingredients_url(recipe), as: :json
      expect(response).to be_successful
    end
  end

  # describe 'POST /create' do
  #   context 'with valid parameters' do
  #     it 'creates a new Ingredient' do
  #       expect do
  #         post api_v1_recipe_ingredients_url(recipe),
  #           params: { recipe: recipe, ingredient: valid_attributes }, headers: valid_headers, as: :json
  #       end.to change(Ingredient, :count).by(1)
  #     end

  #     it 'renders a JSON response with the new ingredient' do
  #       post api_v1_recipe_ingredients_url,
  #            params: { recipe: recipe, ingredient: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new Ingredient' do
  #       expect do
  #         post api_v1_recipe_ingredients_url,
  #              params: { ingredient: invalid_attributes }, as: :json
  #       end.to change(Ingredient, :count).by(0)
  #     end

  #     it 'renders a JSON response with errors for the new ingredient' do
  #       post api_v1_recipe_ingredients_url,
  #            params: { ingredient: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       { quantity: 2,
  #         measurement: 'cup',
  #         name: 'flour',
  #         recipe_id: recipe.id }
  #     end

  #     it 'updates the requested ingredient' do
  #       ingredient = Ingredient.create! valid_attributes
  #       patch api_v1_recipe_ingredient_url(ingredient),
  #             params: { ingredient: new_attributes }, headers: valid_headers, as: :json
  #       ingredient.reload
  #       expect(ingredient.quantity).to eq 2
  #     end

  #     it 'renders a JSON response with the ingredient' do
  #       ingredient = Ingredient.create! valid_attributes
  #       patch api_v1_recipe_ingredient_url(ingredient),
  #             params: { ingredient: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'renders a JSON response with errors for the ingredient' do
  #       ingredient = Ingredient.create! valid_attributes
  #       patch api_v1_recipe_ingredient_url(ingredient),
  #             params: { ingredient: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested ingredient' do
  #     ingredient = Ingredient.create! valid_attributes
  #     expect do
  #       delete api_v1_recipe_ingredient_url, headers: valid_headers, as: :json
  #     end.to change(Ingredient, :count).by(-1)
  #   end
  # end
end
