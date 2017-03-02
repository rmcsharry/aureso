require 'rails_helper'
require 'rspec/json_expectations'

RSpec.describe "Cars", type: :request do
  describe "GET api/v1/cars" do
    it "respondes with status 200" do
      get api_v1_cars_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET api/v1/cars/:id" do
    it "includes attribute max_speed_on_track as nil value" do
      Car.create!(name:'Suburu Impreza', max_speed:'120km/h')
      get api_v1_car_path(id: 'suburu-impreza')

      car = json(response.body)[:car]            
      msot = car[:max_speed_on_track]
      
      expect(response).to have_http_status(200) 
      expect(response.body).to include_json(car: {max_speed_on_track: nil})
      
    end
  end
end