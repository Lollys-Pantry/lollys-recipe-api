# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'api/v1/nutritional_labels', type: :request do
  let(:recipe) { Recipe.create(name: 'cookie') }
  let(:valid_attributes) do
    {
      serving_size: '1 cup',
      calories: '350',
      total_fat: '26g',
      saturated_fat: '0g',
      sodium: '400mg',
      carbohydrates: '44g',
      fiber: '5g',
      sugar: '2g',
      protein: '7g',
      recipe_id: recipe.id
    }
  end

  let(:valid_headers) do
    {}
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      NutritionalLabel.create! valid_attributes
      get api_v1_recipe_nutritional_labels_path(recipe), headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      # nutritional_label = NutritionalLabel.create! valid_attributes
      get api_v1_recipe_nutritional_labels_url(recipe), as: :json
      expect(response).to be_successful
    end
  end

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new NutritionalLabel" do
  #       expect {
  #         post api_v1_recipe_nutritional_labels_url(recipe),
  #              params: { nutritional_label: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(NutritionalLabel, :count).by(1)
  #     end

  #     it "renders a JSON response with the new nutritional_label" do
  #       post nutritional_labels_url,
  #            params: { nutritional_label: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  # end

  #   context "with invalid parameters" do
  #     it "does not create a new NutritionalLabel" do
  #       expect {
  #         post nutritional_labels_url,
  #              params: { nutritional_label: invalid_attributes }, as: :json
  #       }.to change(NutritionalLabel, :count).by(0)
  #     end

  #     it "renders a JSON response with errors for the new nutritional_label" do
  #       post nutritional_labels_url,
  #            params: { nutritional_label: invalid_attributes }, headers: valid_headers, as: :json
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

  #     it "updates the requested nutritional_label" do
  #       nutritional_label = NutritionalLabel.create! valid_attributes
  #       patch nutritional_label_url(nutritional_label),
  #             params: { nutritional_label: new_attributes }, headers: valid_headers, as: :json
  #       nutritional_label.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "renders a JSON response with the nutritional_label" do
  #       nutritional_label = NutritionalLabel.create! valid_attributes
  #       patch nutritional_label_url(nutritional_label),
  #             params: { nutritional_label: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the nutritional_label" do
  #       nutritional_label = NutritionalLabel.create! valid_attributes
  #       patch nutritional_label_url(nutritional_label),
  #             params: { nutritional_label: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  # describe "DELETE /destroy" do
  #   it "destroys the requested nutritional_label" do
  #     nutritional_label = NutritionalLabel.create! valid_attributes
  #     expect {
  #       delete api_v1_recipe_nutritional_labels_url(recipe), headers: valid_headers, as: :json
  #     }.to change(NutritionalLabel, :count).by(-1)
  #   end
  # end
end
