# frozen_string_literal: true

class Recipe < ApplicationRecord
  has_one_attached :image
  validates :name, presence: true

  def get_image_url
    url_for(self.image)
  end
end
