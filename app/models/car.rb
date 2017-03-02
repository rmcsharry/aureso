class Car < ApplicationRecord
  include FriendlyId
  attr_accessor :max_speed_on_track

  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_uniqueness_of :name
end
