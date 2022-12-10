# frozen_string_literal: true

class Ingredient < ApplicationRecord
  belongs_to :recipe

  validates :measurement, :name, presence: true
end
