require "rails_helper"

RSpec.describe NinjasController, type: :controller do
  describe "GET index" do
    it "assigns all the available ninjas" do
      create_list(:ninja, 5)

      get :index

      expect(assigns(:ninjas)).to eq(Ninja.all)
    end
  end

  describe "GET show" do
    it "assigns the corresponding ninja" do
      ninja = create(:ninja)

      get :show, params: { id: ninja.id }

      expect(assigns(:ninja)).to eq(ninja)
    end
  end

  describe "GET new" do
    it "assigns a new ninja" do
      get :new

      expect(assigns(:ninja)).to be
    end
  end

  describe "POST #create" do
    it "creates a new ninja resource" do
      ninja_params = attributes_for(:ninja)

      expect do
        post :create, params: { ninja: ninja_params }
      end.to change { Ninja.count }.by(1)
    end

    it "redirects to the created resource page" do
      ninja_params = attributes_for(:ninja)

      post :create, params: { ninja: ninja_params }

      expect(response).to redirect_to(Ninja.last)
    end

    it "doesn't create when provided invalid params" do
      ninja_params = attributes_for(:ninja, name: nil)

      expect do
        post :create, params: { ninja: ninja_params }
      end.not_to change { Ninja.count }
    end
  end

  describe "GET #edit" do
    it "assigns the corresponding ninja" do
      ninja = create(:ninja)

      get :edit, params: { id: ninja.id }

      expect(assigns(:ninja)).to eq(ninja)
    end
  end

  describe "PUT #update" do
    it "correctly updates the resource" do
      ninja = create(:ninja)
      ninja_params = attributes_for(:ninja)

      put :update, params: { id: ninja.id, ninja: ninja_params }

      ninja.reload
      expect(ninja.name).to eq(ninja_params[:name])
      expect(ninja.guardian_name).to eq(ninja_params[:guardian_name])
      expect(ninja.guardian_contact).to eq(ninja_params[:guardian_contact])
      expect(ninja.additional_information).to eq(ninja_params[:additional_information])
    end

    it "redirects to the resource page" do
      ninja = create(:ninja)
      ninja_params = attributes_for(:ninja)

      put :update, params: { id: ninja.id, ninja: ninja_params }

      expect(response).to redirect_to(ninja)
    end

    it "doesn't update when provided invalid params" do
      ninja = create(:ninja)
      ninja_params = { name: "a" * 76 }

      put :update, params: { id: ninja.id, ninja: ninja_params }

      reloaded_ninja = Ninja.find(ninja.id)
      expect(reloaded_ninja.name).to eq(ninja.name)
    end
  end

  describe "DELETE #destroy" do
    it "deletes an existing ninja" do
      ninja = create(:ninja)

      expect do
        delete :destroy, params: { id: ninja.id }
      end.to change { Ninja.count }.by(-1)
    end

    it "redirects to the index page" do
      ninja = create_list(:ninja, 5).first

      delete :destroy, params: { id: ninja.id }

      expect(response).to redirect_to(ninjas_url)
    end

    it "doesn't delete existing ninjas when provided an invalid id" do
      create_list(:ninja, 5)

      expect do
        delete :destroy, params: { id: -1 }
      end.not_to change { Ninja.count }
    end
  end
end
