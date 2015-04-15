class ChlorosController < ApplicationController
  before_action :set_chloro, only: [:show, :edit, :update, :destroy]
  before_action :all_chloros, only: [:show, :index, :create, :destroy, :update]

  respond_to :html, :js
  # GET /chloros
  # GET /chloros.json
  def all_chloros
    @chloros = Chloro.order("created_at DESC")
  end


  def index
    @chloros = Chloro.order("created_at DESC")
  end

  # GET /chloros/1
  # GET /chloros/1.json
  def show
  end

  # GET /chloros/new
  def new
      @chloro = Chloro.new
      @lake = Lake.find(params[:lake_id])
      @chloro.lake_id = params[:lake_id]
  end

  # GET /chloros/1/edit
  def edit
  end

  # POST /chloros
  # POST /chloros.json
  def create
    @chloro = Chloro.new(chloro_params)
    @chloro.save!
    flash.now[:notice] = 'Chlorophyll was successfully created'

    respond_to do |format|
      format.js
      format.json { render :show, status: :created, location: @chloro }
    end
  end

  # PATCH/PUT /chloros/1
  # PATCH/PUT /chloros/1.json
  def update
    @chloro.update!(chloro_params)
    flash.now[:notice] = 'Chlorophyll sample was successfully updated.'
        respond_to do |format|
      format.js
      format.json { render :show, status: :created, location: @chloro }
    end
  end

  # DELETE /chloros/1
  # DELETE /chloros/1.json
  def destroy
    flash.now[:notice] = 'Chlorophyll sample was destroyed.'
    @chloro.destroy
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chloro
      @chloro = Chloro.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def chloro_params
      params.require(:chloro).permit(:sample_time, :event, :comp_sample_depth,
        :weather, :comments, :secchi_id, :lake_id)
    end
end
