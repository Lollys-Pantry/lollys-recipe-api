# frozen_string_literal: true

class Tag < ApplicationRecord
  belongs_to :recipe, optional: true
end
