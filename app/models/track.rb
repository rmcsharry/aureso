class Track < ApplicationRecord
  enum surface_type: [:asphalt, :gravel, :snow], _prefix: true
  
  has_many :events

  validates_presence_of :name, :surface_type
  validates_uniqueness_of :name

end
