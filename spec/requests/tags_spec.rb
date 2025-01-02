# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/tags', type: :request do
  let(:recipe) { Recipe.create(name: 'cookie') }
  let(:valid_attributes) do
    { name: 'Oil Free',
      category: 'Dietary',
      recipe_id: recipe.id }
  end

  let(:invalid_attributes) do
    { name: nil,
      category: nil,
      recipe_id: nil }
  end

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # TagsController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Tag.create! valid_attributes
      get api_v1_recipe_tags_path(recipe), headers: valid_headers, as: :json
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
  #     it 'creates a new Tag' do
  #       expect do
  #         post tags_url,
  #              params: { tag: valid_attributes }, headers: valid_headers, as: :json
  #       end.to change(Tag, :count).by(1)
  #     end

  #     it 'renders a JSON response with the new tag' do
  #       post tags_url,
  #            params: { tag: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'does not create a new Tag' do
  #       expect do
  #         post tags_url,
  #              params: { tag: invalid_attributes }, as: :json
  #       end.to change(Tag, :count).by(0)
  #     end

  #     it 'renders a JSON response with errors for the new tag' do
  #       post tags_url,
  #            params: { tag: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'PATCH /update' do
  #   context 'with valid parameters' do
  #     let(:new_attributes) do
  #       skip('Add a hash of attributes valid for your model')
  #     end

  #     it 'updates the requested tag' do
  #       tag = Tag.create! valid_attributes
  #       patch tag_url(tag),
  #             params: { tag: new_attributes }, headers: valid_headers, as: :json
  #       tag.reload
  #       skip('Add assertions for updated state')
  #     end

  #     it 'renders a JSON response with the tag' do
  #       tag = Tag.create! valid_attributes
  #       patch tag_url(tag),
  #             params: { tag: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end

  #   context 'with invalid parameters' do
  #     it 'renders a JSON response with errors for the tag' do
  #       tag = Tag.create! valid_attributes
  #       patch tag_url(tag),
  #             params: { tag: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including('application/json'))
  #     end
  #   end
  # end

  # describe 'DELETE /destroy' do
  #   it 'destroys the requested tag' do
  #     tag = Tag.create! valid_attributes
  #     expect do
  #       delete tag_url(tag), headers: valid_headers, as: :json
  #     end.to change(Tag, :count).by(-1)
  #   end
  # end
end
