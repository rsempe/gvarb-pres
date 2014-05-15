require 'spec_helper'

describe BrigadesController do

  describe "#index" do
    let!(:geneva_brigade) { create(:brigade, name: 'Geneva.rb') }
    let!(:lyon_brigade) { create(:brigade, name: 'Lyon.rb') }

    it "renders all the brigades" do
      get :index
      expect(response).to be_ok
      expect(assigns(:brigades)).to include(geneva_brigade)
      expect(assigns(:brigades)).to include(lyon_brigade)
    end
  end

end
