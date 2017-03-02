class Car < ApplicationRecord
  include FriendlyId
  
  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_uniqueness_of :name
end
