# frozen_string_literal: true

class Recipe < ApplicationRecord
  validates :name, presence: true
end
