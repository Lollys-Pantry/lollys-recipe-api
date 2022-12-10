# frozen_string_literal: true

module Api
  module V1
    # controller for Ingredient actions
    class IngredientsController < ApplicationController
      before_action :set_ingredient, only: %i[show update destroy]

      # GET /ingredients
      def index
        @ingredients = Ingredient.all

        render json: @ingredients
      end

      # GET /ingredients/1
      def show
        render json: @ingredient
      end

      # POST /ingredients
      def create
        @ingredient = Ingredient.new(ingredient_params)

        if @ingredient.save
          render json: @ingredient, status: :created, location: api_v1_ingredient_path(@ingredient)
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
        @ingredient = Ingredient.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def ingredient_params
        params.require(:ingredient).permit(:quantity, :measurement, :name, :preparation, :recipe_id)
      end
    end
  end
end
