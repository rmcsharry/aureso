require 'rails_helper'

RSpec.describe Api::V1::CarsController, type: :controller do

  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all cars as @cars" do
      car = Car.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:cars)).to eq([car])
    end
  end

  describe "GET #show" do
    it "assigns the requested car as @car" do
      car = Car.create! valid_attributes
      get :show, params: {id: car.to_param}, session: valid_session
      expect(assigns(:car)).to eq(car)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Car" do
        expect {
          post :create, params: {car: valid_attributes}, session: valid_session
        }.to change(Car, :count).by(1)
      end

      it "assigns a newly created car as @car" do
        post :create, params: {car: valid_attributes}, session: valid_session
        expect(assigns(:car)).to be_a(Car)
        expect(assigns(:car)).to be_persisted
      end

      it "redirects to the created car" do
        post :create, params: {car: valid_attributes}, session: valid_session
        expect(response).to redirect_to(Car.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved car as @car" do
        post :create, params: {car: invalid_attributes}, session: valid_session
        expect(assigns(:car)).to be_a_new(Car)
      end

      it "re-renders the 'new' template" do
        post :create, params: {car: invalid_attributes}, session: valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested car" do
        car = Car.create! valid_attributes
        put :update, params: {id: car.to_param, car: new_attributes}, session: valid_session
        car.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested car as @car" do
        car = Car.create! valid_attributes
        put :update, params: {id: car.to_param, car: valid_attributes}, session: valid_session
        expect(assigns(:car)).to eq(car)
      end

      it "redirects to the car" do
        car = Car.create! valid_attributes
        put :update, params: {id: car.to_param, car: valid_attributes}, session: valid_session
        expect(response).to redirect_to(car)
      end
    end

    context "with invalid params" do
      it "assigns the car as @car" do
        car = Car.create! valid_attributes
        put :update, params: {id: car.to_param, car: invalid_attributes}, session: valid_session
        expect(assigns(:car)).to eq(car)
      end

      it "re-renders the 'edit' template" do
        car = Car.create! valid_attributes
        put :update, params: {id: car.to_param, car: invalid_attributes}, session: valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested car" do
      car = Car.create! valid_attributes
      expect {
        delete :destroy, params: {id: car.to_param}, session: valid_session
      }.to change(Car, :count).by(-1)
    end

    it "redirects to the cars list" do
      car = Car.create! valid_attributes
      delete :destroy, params: {id: car.to_param}, session: valid_session
      expect(response).to redirect_to(cars_url)
    end
  end

end
