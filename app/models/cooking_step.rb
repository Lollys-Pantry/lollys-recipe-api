# frozen_string_literal: true

class CookingStep < ApplicationRecord
  belongs_to :recipe, optional: true
end
