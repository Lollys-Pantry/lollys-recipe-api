# frozen_string_literal: true

module Api
  module V1
    # Controller for Recipe actions
    class RecipesController < ApplicationController
      before_action :set_recipe, only: %i[show update destroy]

      # GET /recipes
      def index
        @recipes = Recipe.order(:name)

        render json: @recipes, include: ['ingredients' 'nutritional_labels']
      end

      # GET /recipes/1
      def show
        render json: @recipe, include: ['ingredients' 'nutritional_labels']
      end

      # POST /recipes
      def create
        @recipe = Recipe.new(recipe_params)

        if @recipe.save
          render json: @recipe, status: :created, location: api_v1_recipe_path(@recipe)
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /recipes/1
      def update
        if @recipe.update(recipe_params)
          render json: @recipe, include: ['ingredients', 'nutritional_labels']
        else
          render json: @recipe.errors, status: :unprocessable_entity
        end
      end

      # DELETE /recipes/1
      def destroy
        @recipe.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_recipe
        @recipe = Recipe.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def recipe_params
        params.require(:recipe)
              .permit(:id, :name, :description, :servings, :prep_time,
                      :cook_time, :sprouty_pie, :lollys_pantry, :created_at, :updated_at,
                      ingredients_attributes:
                        [
                          :id, :recipe_id, :quantity, :measurement,
                          :name, :preparation, :created_at, :updated_at,
                          :_destroy
                        ],
                      nutritional_labels_attributes:
                        [
                          :serving_size, :calories, :total_fat,:saturated_fat,
                          :sodium, :carbohydrates, :fiber, :sugar, :protein,
                          :recipe_id
                        ])
      end
    end
  end
end
