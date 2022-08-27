# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/recipes', type: :request do
  let(:valid_attributes) do
    { name: 'Spicy Salsa' }
  end

  let(:invalid_attributes) do
    { name: nil }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # RecipesController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Recipe.create! valid_attributes
      get api_v1_recipes_url, headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      recipe = Recipe.create! valid_attributes
      get api_v1_recipe_url(recipe), as: :json
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Recipe' do
        expect do
          post api_v1_recipes_url,
               params: { recipe: valid_attributes }, headers: valid_headers, as: :json
        end.to change(Recipe, :count).by(1)
      end

      it 'renders a JSON response with the new recipe' do
        post api_v1_recipes_url,
             params: { recipe: valid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Recipe' do
        expect do
          post api_v1_recipes_url,
               params: { recipe: invalid_attributes }, as: :json
        end.to change(Recipe, :count).by(0)
      end

      it 'renders a JSON response with errors for the new recipe' do
        post api_v1_recipes_url,
             params: { recipe: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        { name: 'Roasted Salsa' }
      end

      it 'updates the requested recipe' do
        recipe = Recipe.create! valid_attributes
        patch api_v1_recipe_url(recipe),
              params: { recipe: new_attributes }, headers: valid_headers, as: :json
        recipe.reload
        expect(recipe.name).to eq 'Roasted Salsa'
      end

      it 'renders a JSON response with the recipe' do
        recipe = Recipe.create! valid_attributes
        patch api_v1_recipe_url(recipe),
              params: { recipe: new_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end

    context 'with invalid parameters' do
      it 'renders a JSON response with errors for the recipe' do
        recipe = Recipe.create! valid_attributes
        patch api_v1_recipe_url(recipe),
              params: { recipe: invalid_attributes }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including('application/json'))
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested recipe' do
      recipe = Recipe.create! valid_attributes
      expect do
        delete api_v1_recipe_url(recipe), headers: valid_headers, as: :json
      end.to change(Recipe, :count).by(-1)
    end
  end
end
