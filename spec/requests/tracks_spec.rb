require 'rails_helper'

RSpec.describe "Tracks", type: :request do
  describe "GET api/v1/tracks" do
    it "responds with status 200" do
      get api_v1_tracks_path
      expect(response).to have_http_status(200)
    end
  end
end
