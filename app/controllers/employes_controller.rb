class EmployesController < ApplicationController
  before_action :set_employe, only: [:show, :edit, :update, :destroy]

  # GET /employes
  # GET /employes.json
  def index
    @employes = Employe.all
  end

  # GET /employes/filter
  def filter
    element = Employe.where(:courriel => current_user.email).limit(1);
    if element.size >= 1
        @employe = element.first
    end
    @organismes = Organisme.includes(:employes).where(employes: {courriel: current_user.email})
  end

  # GET /employes/1
  # GET /employes/1.json
  def show
  end

  # GET /employes/new
  def new
    @employe = Employe.new
    if params.has_key?("organisme_id")
      @organisme = Organisme.find(params[:organisme_id])
      @employe.organisme_id = params[:organisme_id];
    end
    @options = Organisme.order("name").all.collect do |s| [s.name, s.id]
   end
  end

  # GET /employes/1/edit
  def edit
    @options = Organisme.order("name").all.collect do |s| [s.name, s.id]
   end
  end

  # POST /employes
  # POST /employes.json
  def create
    @organisme = Organisme.find(params[:organisme_id])
    @employe = Employe.new(employe_params)
      if params[:add_education]
        @options = Organisme.order("name").all.
        collect do |s|
        [s.name, s.id]
        end
         @employe.educations.build
        render :action => 'new'
      elsif params[:remove_education]
        @options = Organisme.order("name").all.
        collect do |s|
        [s.name, s.id]
        end
         render :action => 'new'
      else
      respond_to do |format|
        if @employe.save
          #check if user exists already
          count = User.where(:email => @employe.courriel).count
          if count == 0
            User.create!({:email => @employe.courriel, :password => "password", :password_confirmation => "password", :superadmin_role => @employe.role == "Directeur", :supervisor_role => @employe.role == "Coordonnateur" || @employe.role == "Intervenant", :user_role => true})
          end
          @organisme = Organisme.find(params[:organisme_id])
          format.html { redirect_to @organisme, notice: 'Employe was successfully created.' }
          format.json { render :show, status: :created, location: @employe }
        else
          @options = Organisme.order("name").all.
          collect do |s|
          [s.name, s.id]
          end
          format.html { render :new }
          format.json { render json: @employe.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # PATCH/PUT /employes/1
  # PATCH/PUT /employes/1.json
  def update
      if params[:add_education]
        @options = Organisme.order("name").all.collect do |s| [s.name, s.id] end
      	# rebuild the education attributes that doesn't have an id
      	unless params.to_unsafe_hash[:employe][:educations_attributes].blank?
    	  for attribute in params.to_unsafe_hash[:employe][:educations_attributes]
    	    @employe.educations.build(attribute.last.except(:_destroy)) unless attribute.last.has_key?(:id)
    	  end
      	end
        # add one more empty education attribute
        @employe.educations.build
        render :action => 'edit'
      elsif params[:remove_education]
        @options = Organisme.order("name").all.collect do |s| [s.name, s.id] end
        # collect all marked to delete education ids
        removed_educations = params.to_unsafe_hash[:employe][:educations_attributes].collect { |i, att| att[:id] if (att[:id] && att[:_destroy].to_i == 1) }
        # physically delete the educations from database
        Education.delete(removed_educations)
        flash[:notice] = "Education removed."
        for attribute in params.to_unsafe_hash[:employe][:educations_attributes]

        	# rebuild educations attributes that doesn't have an id and its _destroy attribute is not 1
          @employe.educations.build(attribute.last.except(:_destroy)) if (!attribute.last.has_key?(:id) && attribute.last[:_destroy].to_i == 0)
        end
         render :action => 'edit'
      else
        respond_to do |format|
        if @employe.update(employe_params)
          format.html { redirect_to @employe, notice: 'Employe was successfully updated.' }
          format.json { render :show, status: :ok, location: @employe }
        else
          @options = Organisme.order("name").all.collect do |s| [s.name, s.id] end
          format.html { render :edit }
          format.json { render json: @employe.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /employes/1
  # DELETE /employes/1.json
  def destroy
    @employe.destroy
    respond_to do |format|
      format.html { redirect_to employes_url, notice: 'Employe was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employe
      if(params.has_key?(:id))
        @employe = Employe.find(params[:id])
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employe_params
      params.require(:employe).permit(:motDePasse, :dateEmbauche, :dejaEmbaucher, :estDisponible, :telephone_cellulaire, :telephone_home, :telephone_travail, :nom, :prenom, :courriel, :role, :organisme_id, educations_attributes:[:type_education, :name, :date_completed, :_destroy, :id ])
    end
end
