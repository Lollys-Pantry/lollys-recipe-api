# frozen_string_literal: true

class Recipe < ApplicationRecord
  include Rails.application.routes.url_helpers

  has_one_attached :image
  # rails active_storage:install
  # raild db:migrate

  # sudo apt install libvips
  validates :name, presence: true
  # validates :image, {
  #   presence: true
  # }

  # def image_as_thumbnail
  #   image.variant(resize_to_limit: [300, 300]).processed
  # end

  # def get_image_url
  #   url_for(self.image)
  # end
end
