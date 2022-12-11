# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe, optional: true

  validates :measurement, :name, presence: true
end
