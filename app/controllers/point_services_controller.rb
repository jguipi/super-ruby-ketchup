class PointServicesController < ApplicationController
  before_action :set_point_service, only: [:show, :edit, :update, :destroy]

  # GET /point_services
  # GET /point_services.json
  def index
    @point_services = PointService.all
  end

  # GET /point_services/1
  # GET /point_services/1.json
  def show
    @organisme = Organisme.find(params[:organisme_id])
  end

  # GET /point_services/new
  def new
    @organisme = Organisme.find(params[:organisme_id])
    @point_service = PointService.new
    logger.debug "Name of organisme: #{@organisme.name}"
  end

  # GET /point_services/1/edit
  def edit
    @organisme = Organisme.find(params[:organisme_id])
    logger.debug "Name of organisme: #{@organisme.name}"
  end

  # POST /point_services
  # POST /point_services.json
  def create
    @point_service = PointService.new(point_service_params)
    if (@point_service.adresse.present?)
      @point_service.adresse.point_service = @point_service
      @point_service.adresse.save
    end
    @organisme = Organisme.find(params[:organisme_id])
    params[:departements] ||= []
    @point_service.departements.delete_all
    @dep_table = params[:departements]
    logger.debug "Departements table sent : #@dep_table"
    @dep_table.each do |depid|
      @point_service.departements << Departement.find(depid)
    end
    @point_service.organisme = @organisme
    respond_to do |format|
      if @point_service.save
        format.html { redirect_to organisme_path(@organisme), notice: 'Point service was successfully created.' }
        format.json { render :index, status: :created, location: @organisme }
      else
        format.html { render :new }
        format.json { render json: @point_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_services/1
  # PATCH/PUT /point_services/1.json
  def update
    @organisme_id = @point_service.organisme_id
    params[:departements] ||= []
    @point_service.departements.delete_all
    @dep_table = params[:departements]
    logger.debug "Departements table sent : #@dep_table"
    @dep_table.each do |depid|
      @point_service.departements << Departement.find(depid)
    end
    respond_to do |format|
      if @point_service.update(point_service_params)
        format.html { redirect_to  organisme_point_service_path(@organisme_id, @point_service.id), notice: 'Le point de service a été mis à jour' }
        format.json { render :show, status: :ok, location: @point_service }
      else
        format.html { render :edit }
        format.json { render json: @point_service.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_services/1
  # DELETE /point_services/1.json
  def destroy
    @organisme_id = @point_service.organisme_id
    @point_service.destroy
    respond_to do |format|
      format.html { redirect_to organisme_path(@organisme_id), notice: 'Point service was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_point_service
      @point_service = PointService.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_service_params
     params.require(:point_service).permit(:id, :nom, :telephone, :courriel, :fax, :adresse, :organisme_id, :organisme, :adresse_attributes => [:id, :rue, :ville, :pays, :codePostal], :adresse => [:id, :rue, :ville, :pays, :codePostal])
    end
end
