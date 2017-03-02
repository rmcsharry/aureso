require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe "Cars", type: :request do
  describe "GET api/v1/cars" do
    it "respondes with status 200" do
      get api_v1_cars_path
      expect(response).to have_http_status(200)
    end

    it "does not include attribute max_speed_on_track in response" do
      Car.create!(name:'Suburu Impreza', max_speed:'120km/h')
      get api_v1_cars_path
      car = json(response.body).first
      expect(car).not_to include_json(car: {max_speed_on_track: nil})      
    end
  end

  describe "GET api/v1/cars/:id" do
    it "max_speed_on_track = 'no track selected' when no track provided" do
      Car.create!(name:'Suburu Impreza', max_speed:'120km/h', track: nil)
      get api_v1_car_path(id: 'suburu-impreza')      
      expect(response).to have_http_status(200) 
      expect(response.body).to include_json(car: {max_speed_on_track: 'no track selected'})
    end

    it "max_speed_on_track = 'track not found' when non-existent track provided" do
      Car.create!(name:'Suburu Impreza', max_speed:'120km/h', track: 'test')
      get api_v1_car_path(id: 'suburu-impreza')      
      expect(response).to have_http_status(200) 
      expect(response.body).to include_json(car: {max_speed_on_track: 'track not found'})
    end    
  end
end