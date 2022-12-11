# frozen_string_literal: true

module Api
  module V1
    # controller for Ingredient actions
    class IngredientsController < ApplicationController
      before_action :set_ingredient, only: %i[show update destroy]
      before_action :get_recipe

      # GET /ingredients
      def index
        @ingredients = @recipe.ingredients

        render json: @ingredients
      end

      # GET /ingredients/1
      def show
        render json: @ingredient
      end

      # POST /ingredients
      def create
        @ingredient = @recipes.ingredients.build

        if @ingredient.save
          render json: @ingredient, status: :created, location: api_v1_recipe_ingredients_path(@recipe)
        else
          render json: @ingredient.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /ingredients/1
      def update
        if @ingredient.update(ingredient_params)
          render json: @ingredient
        else
          render json: @ingredient.errors, status: :unprocessable_entity
        end
      end

      # DELETE /ingredients/1
      def destroy
        @ingredient.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_ingredient
        @ingredient = @recipe.ingredients.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def ingredient_params
        params.require(:ingredient).permit(:quantity, :measurement, :name, :preparation, :recipe_id)
      end

      def get_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
