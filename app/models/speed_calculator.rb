module SpeedCalculator
  def self.max_on_track(car)
    track = Track.where('lower(name) LIKE ?', "%#{car.track.downcase}").first
    if track
      return "#{calculate_adjustment(track, car.max_speed)}#{car.speed_unit}"
    else
      return 'track not found'
    end
  end

  def self.adjustment
    Random.rand(0..0.35)
  end

  def self.calculate_adjustment(track, car_speed)
    case track.surface_type
      when "asphalt"
        car_speed - (car_speed * self.adjustment).ceil
      when "gravel"
        car_speed - (car_speed * self.adjustment).ceil
      when "snow"
        car_speed - (car_speed * self.adjustment).ceil
      else
        car_speed
    end
  end  
end