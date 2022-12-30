# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Api::V1::NutritionalLabelsController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/api/v1/recipes/1/nutritional_labels', recipe_id: 1)
        .to route_to('api/v1/nutritional_labels#index', recipe_id: '1')
    end

    it 'routes to #show' do
      expect(get: '/api/v1/recipes/1/nutritional_labels/1')
        .to route_to('api/v1/nutritional_labels#show', id: '1', recipe_id: '1')
    end

    it 'routes to #create' do
      expect(post: '/api/v1/recipes/1/nutritional_labels')
        .to route_to('api/v1/nutritional_labels#create', recipe_id: '1')
    end

    it 'routes to #update via PUT' do
      expect(put: '/api/v1/recipes/1/nutritional_labels/1')
        .to route_to('api/v1/nutritional_labels#update', id: '1', recipe_id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/api/v1/recipes/1/nutritional_labels/1')
        .to route_to('api/v1/nutritional_labels#update', id: '1', recipe_id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/api/v1/recipes/1/nutritional_labels/1')
        .to route_to('api/v1/nutritional_labels#destroy', id: '1', recipe_id: '1')
    end
  end
end
