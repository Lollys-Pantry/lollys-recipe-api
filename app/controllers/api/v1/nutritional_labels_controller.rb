# frozen_string_literal: true

module Api
  module V1
    # controller for NutritionalLabel actions
    class NutritionalLabelsController < ApplicationController
      before_action :set_nutritional_label, only: %i[ show update destroy ]
      before_action :set_recipe

      # GET /nutritional_labels
      def index
        @nutritional_labels = @recipe.nutritional_labels

        render json: @nutritional_labels
      end

      # GET /nutritional_labels/1
      def show
        render json: @nutritional_label
      end

      # POST /nutritional_labels
      def create
        @nutritional_label = @recipes.nutritional_labels.build

        if @nutritional_label.save
          render json: @nutritional_label, status: :created, location: api_v1_recipe_nutritional_labels_path(@recipe)
        else
          render json: @nutritional_label.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /nutritional_labels/1
      def update
        if @nutritional_label.update(nutritional_label_params)
          render json: @nutritional_label
        else
          render json: @nutritional_label.errors, status: :unprocessable_entity
        end
      end

      # DELETE /nutritional_labels/1
      def destroy
        @nutritional_label.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_nutritional_label
        @nutritional_label = @recipe.nutritional_labels.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def nutritional_label_params
        params.require(:nutritional_label)
              .permit(:serving_size,
                      :calories,
                      :total_fat,
                      :saturated_fat,
                      :sodium,
                      :carbohydrates,
                      :fiber,
                      :sugar,
                      :protein,
                      :recipe_id)
      end

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
