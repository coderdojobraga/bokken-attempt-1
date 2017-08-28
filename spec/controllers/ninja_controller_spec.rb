require "rails_helper"

RSpec.describe NinjasController, type: :controller do
  describe "GET index" do
    before { @ninjas = FactoryGirl.create_list(:ninja, 5) }
    it "assigns @ninja correctly" do
      get :index
      expect(assigns(:ninjas)).to eq(@ninjas)
    end
  end

  describe "GET show" do
    before { @ninja = FactoryGirl.create :ninja }
    it "assigns @ninja correctly" do
      get :show, params: { id: @ninja.id }
      expect(assigns(:player)).to eq(@player)
    end
  end

  describe "POST #create" do
    it "correctly creates the ninja" do
      expect do
        post :create, params: { ninja: FactoryGirl.attributes_for(:ninja) }
      end.to change { Ninja.count }.by(1)

      expect(response).to redirect_to(Ninja.last)
    end

    it "doesn't allow invalid ninja" do
      expect do
        post :create, params: { ninja: { name: "a" * 76 } }
      end.to_not change { Ninja.count }

      expect(response).to render_template(:new)
    end
  end

  describe "GET #edit" do
    before { @ninja = FactoryGirl.create(:ninja) }
    it "correctly assigns the ninja" do
      get :edit, params: { id: @ninja.id }
      expect(assigns(:ninja)).to eq(@ninja)
    end
  end

  describe "UPDATE ninja" do
    before { @ninja = create(:ninja) }
    it "correctly updates the ninja" do
      name = "Ollie"
      patch :update, params: { id: @ninja.id, ninja: { name: name } }
      @ninja.reload
      expect(@ninja.name).to eq(name)
      expect(response).to redirect_to(@ninja)
    end

    it "doesn't allow invalid ninja" do
      name = @ninja.name
      patch :update, params: { id: @ninja.id, ninja: { name: "a" * 76 } }
      @ninja.reload
      expect(response).to render_template(:edit)
      expect(name).to eq(@ninja.name)
    end
  end

  context "DELETE ninja" do
    context "when the ninja exists" do
      before { @ninja = FactoryGirl.create(:ninja) }

      it "correctly destroys the ninja" do
        expect do
          delete :destroy, params: { id: @ninja.id }
        end.to change { Ninja.count }.by(-1)
      end
    end
  end
end
