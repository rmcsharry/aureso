class Car < ApplicationRecord
  include FriendlyId
  attr_accessor :max_speed_on_track

  friendly_id :name, use: :slugged

  has_many :events

  validates_presence_of :name
  validates_uniqueness_of :name

  def track
    @track
  end

  def track=(value)
    if value.present?
      @track = value
      self.max_speed_on_track = SpeedCalculator.max_on_track(self)
    else
      @track = 'no track selected'    
      self.max_speed_on_track = @track      
    end
  end

  def as_json(options = {})
    if track.present?
      options.merge!(methods: [:max_speed_on_track])
    end
    super(options)
  end

end
