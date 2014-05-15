class BrigadesController < ApplicationController

  def index
    @brigades = Brigade.all
  end

end
