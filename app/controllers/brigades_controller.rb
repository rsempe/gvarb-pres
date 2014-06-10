class BrigadesController < ApplicationController

  before_filter :find_brigade, only: [:edit, :update]

  def new
    @brigade = Brigade.new
  end

  def create
    @brigade = Brigade.new(brigade_params)
    if @brigade.save
      redirect_to brigades_path
    else
      render "new"
    end
  end

  def index
    @brigades = Brigade.all
  end

  def edit
    @brigade.disable_fallback
  end

  def update
    if @brigade.update_attributes(brigade_params)
      redirect_to brigades_path
    else
      render "edit"
    end
  end

  private

  def brigade_params
    params.require(:brigade).permit(:name, :description)
  end

  def find_brigade
    render_not_found unless @brigade = Brigade.where(id: params[:id]).first
  end

end
