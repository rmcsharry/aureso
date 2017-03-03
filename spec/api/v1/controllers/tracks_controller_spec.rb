require 'rails_helper'

RSpec.describe Api::V1::TracksController, type: :controller do


  let(:valid_attributes) {{
    "name": "Brands Hatch",
    "surface_type": "gravel"
  }}

  let(:invalid_attributes) {{
    "name": nil,
    "surface_type": "snow"
  }}

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # TracksController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tracks as @tracks" do
      track = Track.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:tracks)).to eq([track])
    end
  end

  describe "GET #show" do
    it "assigns the requested track as @track" do
      track = Track.create! valid_attributes
      get :show, params: {id: track.to_param}, session: valid_session
      expect(assigns(:track)).to eq(track)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Track" do
        expect {
          post :create, params: {track: valid_attributes}, session: valid_session
        }.to change(Track, :count).by(1)
      end

      it "assigns a newly created track as @track" do
        post :create, params: {track: valid_attributes}, session: valid_session
        expect(assigns(:track)).to be_a(Track)
        expect(assigns(:track)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved track as @track" do
        post :create, params: {track: invalid_attributes}, session: valid_session
        expect(assigns(:track)).to be_a_new(Track)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {{
        "name": "Brands Hatch",
        "surface_type": "snow"
      }}

      it "updates the requested track" do
        track = Track.create! valid_attributes
        put :update, params: {id: track.to_param, track: new_attributes}, session: valid_session
        track.reload
        expect(track.surface_type).to eq("snow")
      end

      it "assigns the requested track as @track" do
        track = Track.create! valid_attributes
        put :update, params: {id: track.to_param, track: valid_attributes}, session: valid_session
        expect(assigns(:track)).to eq(track)
      end
    end

    context "with invalid params" do
      it "assigns the track as @track" do
        track = Track.create! valid_attributes
        put :update, params: {id: track.to_param, track: invalid_attributes}, session: valid_session
        expect(assigns(:track)).to eq(track)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested track" do
      track = Track.create! valid_attributes
      expect {
        delete :destroy, params: {id: track.to_param}, session: valid_session
      }.to change(Track, :count).by(-1)
    end
  end

end
