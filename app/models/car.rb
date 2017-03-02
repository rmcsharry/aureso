class Car < ApplicationRecord
  include FriendlyId
  
  friendly_id :car_slug, use: :slugged, slug_column: :car_slug

end
