class NutritionalLabel < ApplicationRecord
  belongs_to :recipe, optional: true
end
