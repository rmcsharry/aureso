require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe "Cars", type: :request do
  describe "GET list of cars" do
    it "does not include attribute max_speed_on_track in response" do
      Car.create!(name:'Subaru Impreza', max_speed:'120km/h')
      get api_v1_cars_path
      car = json(response.body).first
      expect(car).not_to include_json(car: {max_speed_on_track: nil})      
    end
  end

  describe "GET a car with and without track param" do
    it "max_speed_on_track = 'no track selected' when no track provided" do
      Car.create!(name:'Subaru Impreza', max_speed:'120km/h')
      get api_v1_car_path(id: 'subaru-impreza', track: nil)      
      expect(response).to have_http_status(200) 
      expect(response.body).to include_json(car: {max_speed_on_track: 'no track selected'})
    end

    it "max_speed_on_track = 'track not found' when non-existent track provided" do
      Car.create!(name:'Subaru Impreza', max_speed:'120km/h')
      get api_v1_car_path(id: 'subaru-impreza', track: 'test')      
      expect(response).to have_http_status(200) 
      expect(response.body).to include_json(car: {max_speed_on_track: 'track not found'})
    end    
  end
end