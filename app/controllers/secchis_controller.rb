class SecchisController < ApplicationController
  before_action :set_secchi, only: [:show, :edit, :update, :destroy]
  before_action :all_secchis, only: [:show, :index, :create, :destroy, :update]
  respond_to :html, :js


  def all_secchis
    @secchis = Secchi.order("created_at DESC")
  end

  # GET /secchis
  # GET /secchis.json

  def index
    @secchis = Secchi.order("created_at DESC")
  end

  # GET /secchis/1
  # GET /secchis/1.json
  def show
    @secchi = Secchi.find(params[:id])
  end

  # GET /secchis/new
  def new
    @secchi = Secchi.new
    @lake = Lake.find(params[:lake_id])
    @secchi.lake_id = params[:lake_id]
  end

  # GET /secchis/1/edit
  def edit
  end

  # POST /secchis
  # POST /secchis.json
  def create

    @secchi = Secchi.new(secchi_params)
    @secchi.save!

    flash.now[:notice] = 'Secchi depth was successfully saved.'

    respond_to do |format|
      format.js
      format.json { render :show, status: :created, location: @secchi }
    end
  end

  # PATCH/PUT /secchis/1
  # PATCH/PUT /secchis/1.json
  def update
    @secchi.update!(secchi_params)
    flash.now[:notice] = 'Secchi depth was successfully updated.'
        respond_to do |format|
      format.js
      format.json { render :show, status: :ok, location: @secchi }
    end
  end

  # DELETE /secchis/1
  # DELETE /secchis/1.json
  def destroy
    @secchi.destroy
    flash.now[:notice] = 'Secchi depth was destroyed.'
    respond_to do |format|
      format.js
      format.json { head :no_content }
    end
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_secchi
      @secchi = Secchi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def secchi_params
      params.require(:secchi).permit(:sample_time, :weather, :comments,
        :lake_id, :secchi_depth_ft)
    end
end
