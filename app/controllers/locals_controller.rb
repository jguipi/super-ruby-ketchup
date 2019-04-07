class LocalsController < ApplicationController
  before_action :set_local, only: [:show, :edit, :update, :destroy]

  # GET /locals
  # GET /locals.json
  def index
    @locals = Local.all
  end

  # GET /locals/1
  # GET /locals/1.json
  def show
    @point_service = PointService.find(params[:point_service_id])
  end

  # GET /locals/new
  def new
    @point_service = PointService.find(params[:point_service_id])
    @organisme = Organisme.find(params[:organisme_id])
    @local = Local.new
  end

  # GET /locals/1/edit
  def edit
    @point_service = PointService.find(params[:point_service_id])
  end

  # POST /locals
  # POST /locals.json
  def create
    @local = Local.new(local_params)
    @local.point_service_id = params[:point_service_id]
    @point_service = PointService.find(params[:point_service_id])
    params[:services] ||= []
    @local.services.delete_all
    @serv_table = params[:services]
    @serv_table.each do |servid|
      @local.services << Service.find(servid)
    end
    respond_to do |format|
      if @local.save
        format.html { redirect_to organisme_point_service_path(@point_service.organisme_id,@point_service.id), notice: 'Local was successfully created.' }
        format.json { render :index, status: :created, location: @point_service }
      else
        format.html { render :new }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  def add_service_to_local
    # get the service id
    @local = Local.find(params[:id])
    @point_service = PointService.find(params[:point_service_id])
    @service = Service.find(params[:ServiceID])
    @local.services << @service
    respond_to do |format|
      format.html { redirect_to organisme_point_service_local_path(@point_service.organisme_id,@point_service.id, @local), notice: 'Le service à été ajouté avec succès!' }
      format.json { render :show, status: :ok, location: @local }
    end
  end

  # get
  def remove_service_from_local
    @local = Local.find(params[:id])
    @point_service = PointService.find(params[:point_service_id])
    @service = Service.find(params[:ServiceID])
    @local.services.delete(@service)
    respond_to do |format|
      format.html { redirect_to organisme_point_service_local_path(@point_service.organisme_id,@point_service.id, @local), notice: 'Le service à été retiré avec succès!' }
      format.json { render :show, status: :ok, location: @local }
    end
  end

  # PATCH/PUT /locals/1
  # PATCH/PUT /locals/1.json
  def update
    @point_service = PointService.find(params[:point_service_id])
    respond_to do |format|
      if @local.update(local_params)
        format.html { redirect_to organisme_point_service_path(@point_service.organisme_id,@point_service.id), notice: 'Local was successfully updated.' }
        format.json { render :index, status: :ok, location: @point_service }
      else
        format.html { render :edit }
        format.json { render json: @local.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /locals/1
  # DELETE /locals/1.json
  def destroy
    @local.destroy
    respond_to do |format|
      format.html { redirect_to locals_url, notice: 'Local was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_local
      @local = Local.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def local_params
      params.require(:local).permit(:nom, :nombrePlaces, :point_service_id)
    end
end
