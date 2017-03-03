require 'rails_helper'

RSpec.describe SpeedCalculator do
  include SpeedCalculator

  it "uses an adjustment between 0 and 0.35" do
    expect(SpeedCalculator.adjustment).to be >= 0
    expect(SpeedCalculator.adjustment).to be <= 0.35
  end

  describe "max_on_track returns correct results" do
    let!(:car) { Fabricate(:car, track:'does not exist') }
    let!(:track) { Fabricate(:track) }

    it "returns track not found when non existing track provided" do
      expect(SpeedCalculator.max_on_track(car)).to eq 'track not found'
    end

    it "returns correct max_speed_on_track when track provided" do
      car.track = "monaco"
      expect(SpeedCalculator).to receive(:adjustment).and_return(0.1)
      expect(SpeedCalculator.max_on_track(car)).to eq "180#{car.speed_unit}"
    end

  end
end