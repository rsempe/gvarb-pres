require 'spec_helper'

describe BrigadesController do

  describe "GET new" do
    it "assigns a new brigade as @brigade" do
      get :new
      expect(assigns(:brigade)).to be_a_new(Brigade)
    end
  end

  describe "POST create" do
    context "with valid params" do
      it "creates a new brigade" do
        expect {
          post :create, { brigade: attributes_for(:brigade) }
        }.to change(Brigade, :count).by(1)
      end

      it "assigns a newly created brigade as @brigade" do
        post :create, { brigade: attributes_for(:brigade) }
        expect(assigns(:brigade)).to be_a(Brigade)
        expect(assigns(:brigade)).to be_persisted
      end

      it "redirects to the list of brigades" do
        post :create, { brigade: attributes_for(:brigade) }
        expect(response).to redirect_to(brigades_path)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved brigade as @brigade" do
        post :create, { brigade: { "name" => "" } }
        expect(assigns(:brigade)).to be_a_new(Brigade)
      end

      it "re-renders the 'new' template" do
        post :create, { brigade: { "name" => "" } }
        expect(response).to render_template("new")
      end
    end
  end

  describe "GET index" do
    let!(:geneva_brigade) { create(:brigade, name: 'Geneva.rb') }
    let!(:lyon_brigade) { create(:brigade, name: 'Lyon.rb') }

    it "assigns all brigades as @brigades" do
      get :index
      expect(assigns(:brigades)).to include(geneva_brigade)
      expect(assigns(:brigades)).to include(lyon_brigade)
    end
  end

  describe "GET edit" do
    let!(:brigade) { create(:brigade, name: 'Geneva.rb') }

    it "assigns the requested brigade as @brigade" do
      get :edit, { :id => brigade.id }
      expect(assigns(:brigade)).to eql(brigade)
    end
  end

  describe "PUT update" do
    let!(:brigade) { create(:brigade, name: 'Geneva.rb') }

    context "with valid params" do
      it "updates the requested brigade" do
        put :update, { id: brigade.id, brigade: { "name" => "Lyon.rb" } }
        expect(assigns(:brigade)).to eql(brigade)
        expect(brigade.reload.name).to eql('Lyon.rb')
      end

      it "redirects to the brigade" do
        put :update, { id: brigade.id, brigade: { "name" => "Lyon.rb" } }
        expect(response).to redirect_to(brigades_path)
      end
    end

    context "with invalid params" do
      it "assigns the brigade as @brigade" do
        put :update, { id: brigade.id, brigade: { "name" => "" } }
        expect(assigns(:brigade)).to eql(brigade)
      end

      it "re-renders the 'edit' template" do
        put :update, { id: brigade.id, brigade: { "name" => "" } }
        expect(response).to render_template("edit")
      end
    end
  end

end
