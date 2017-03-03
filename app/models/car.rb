class Car < ApplicationRecord
  include FriendlyId
  attr_accessor :max_speed_on_track

  friendly_id :name, use: :slugged

  validates_presence_of :name
  validates_uniqueness_of :name

  def track
    @track
  end

  def track=(value)
    if value.present?
      @track = value
      calculate_max_speed
    else
      self.max_speed_on_track = 'no track selected'
      @track = 'none'      
    end
  end

  def calculate_max_speed
    my_track = Track.find_by name: @track
    if my_track
      self.max_speed_on_track = "100km/h"
    else
      self.max_speed_on_track = 'track not found'
    end
  end

  def as_json(options = {})
    if track.present?
      options.merge!(methods: [:max_speed_on_track])
    end
    super(options)
  end

end
