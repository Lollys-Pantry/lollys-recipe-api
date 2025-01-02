# frozen_string_literal: true

module Api
  module V1
    # Controller for Tag actions
    class TagsController < ApplicationController
      before_action :set_tag, only: %i[show update destroy]
      before_action :set_recipe

      # GET /tags
      def index
        @tags = @recipe.tags

        render json: @tags
      end

      # GET /tags/1
      def show
        render json: @tag
      end

      # POST /tags
      def create
        @tag = @recipes.tags.build

        if @tag.save
          render json: @tag, status: :created, location: @tag
        else
          render json: @tag.errors, status: :unprocessable_entity
        end
      end

      # PATCH/PUT /tags/1
      def update
        if @tag.update(tag_params)
          render json: @tag
        else
          render json: @tag.errors, status: :unprocessable_entity
        end
      end

      # DELETE /tags/1
      def destroy
        @tag.destroy
      end

      private

      # Use callbacks to share common setup or constraints between actions.
      def set_tag
        @tag = @recipe.tags.find(params[:id])
      end

      # Only allow a list of trusted parameters through.
      def tag_params
        params.require(:tag).permit(:name, :category, :recipe_id)
      end

      def set_recipe
        @recipe = Recipe.find(params[:recipe_id])
      end
    end
  end
end
