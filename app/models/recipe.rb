# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy, inverse_of: :recipe
  has_many :nutritional_labels, dependent: :destroy, inverse_of: :recipe
  has_many :cooking_steps, dependent: :destroy, inverse_of: :recipe

  validates :name, presence: true

  accepts_nested_attributes_for :ingredients, reject_if: ->(i) { i.values.all?(&:blank?) }, allow_destroy: true
  accepts_nested_attributes_for :nutritional_labels, reject_if: ->(i) { i.values.all?(&:blank?) }, allow_destroy: true
  accepts_nested_attributes_for :cooking_steps, reject_if: ->(i) { i.values.all?(&:blank?) }, allow_destroy: true
end
