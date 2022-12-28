# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_many :ingredients, dependent: :destroy, inverse_of: :recipe
  validates :name, presence: true
  accepts_nested_attributes_for :ingredients, reject_if: ->(i) { i.values.all?(&:blank?) }, allow_destroy: true
end
