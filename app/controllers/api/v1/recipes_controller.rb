# frozen_string_literal: true

module Api
  module V1
    # Controller for Recipe actions
    class RecipesController < ApplicationController
      before_action :set_recipe, only: %i[show update destroy]

      # GET /recipes
      def index
        @recipes = Recipe.all

        render json: @recipes
      end

      # GET /recipes/1
      def show
        render json: @recipe
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
          render json: @recipe
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
        params.require(:recipe).permit(:name, :description, :servings, :prep_time, :cook_time, :sprouty_pie,
                                       :lollys_pantry)
      end
    end
  end
end
