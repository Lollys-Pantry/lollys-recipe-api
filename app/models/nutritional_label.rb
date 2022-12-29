# frozen_string_literal: true

class NutritionalLabel < ApplicationRecord
  belongs_to :recipe, optional: true
end
