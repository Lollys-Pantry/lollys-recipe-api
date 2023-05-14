# frozen_string_literal: true

require 'rails_helper'

RSpec.describe '/api/v1/cooking_steps', type: :request do
  let(:recipe) { Recipe.create(name: 'cookie') }
  let(:valid_attributes) do
    {
      step: 1,
      description: 'mix dry ingredients',
      recipe_id: recipe.id
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      CookingStep.create! valid_attributes
      get api_v1_recipe_cooking_steps_path(recipe), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      # cooking_step = CookingStep.create! valid_attributes
      get api_v1_recipe_cooking_steps_url(recipe), as: :json
      expect(response).to be_successful
    end
  end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new CookingStep" do
  #       expect {
  #         post cooking_steps_url,
  #              params: { cooking_step: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(CookingStep, :count).by(1)
  #     end

  #     it "renders a JSON response with the new cooking_step" do
  #       post cooking_steps_url,
  #            params: { cooking_step: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new CookingStep" do
  #       expect {
  #         post cooking_steps_url,
  #              params: { cooking_step: invalid_attributes }, as: :json
  #       }.to change(CookingStep, :count).by(0)
  #     end

  #     it "renders a JSON response with errors for the new cooking_step" do
  #       post cooking_steps_url,
  #            params: { cooking_step: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested cooking_step" do
  #       cooking_step = CookingStep.create! valid_attributes
  #       patch cooking_step_url(cooking_step),
  #             params: { cooking_step: new_attributes }, headers: valid_headers, as: :json
  #       cooking_step.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "renders a JSON response with the cooking_step" do
  #       cooking_step = CookingStep.create! valid_attributes
  #       patch cooking_step_url(cooking_step),
  #             params: { cooking_step: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the cooking_step" do
  #       cooking_step = CookingStep.create! valid_attributes
  #       patch cooking_step_url(cooking_step),
  #             params: { cooking_step: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested cooking_step" do
  #     cooking_step = CookingStep.create! valid_attributes
  #     expect {
  #       delete cooking_step_url(cooking_step), headers: valid_headers, as: :json
  #     }.to change(CookingStep, :count).by(-1)
  #   end
  # end
end
