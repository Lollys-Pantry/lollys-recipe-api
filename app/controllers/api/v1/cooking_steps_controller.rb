# frozen_string_literal: true

module Api
  module V1
    # controller for CookingStep actions
    class CookingStepsController < ApplicationController
      before_action :set_cooking_step, only: %i[show update destroy]
      before_action :set_recipe

      # GET /cooking_steps
      def index
        @cooking_steps = @recipe.cooking_steps

        render json: @cooking_steps
      end

      # GET /cooking_steps/1
      def show
        render json: @cooking_step
      end

      # POST /cooking_steps
      def create
        @cooking_step = @recipes.cooking_steps.build

        if @cooking_step.save
          render json: @cooking_step, status: :created, location: @cooking_step
        else
          render json: @cooking_step.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /cooking_steps/1
      def update
        if @cooking_step.update(cooking_step_params)
          render json: @cooking_step
        else
          render json: @cooking_step.errors, status: :unprocessable_entity
        end
      end

      # DELETE /cooking_steps/1
      def destroy
        @cooking_step.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_cooking_step
        @cooking_step = @recipe.cooking_steps.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def cooking_step_params
        params.require(:cooking_step)
              .permit(:number, :description, :recipe_id)
      end

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
