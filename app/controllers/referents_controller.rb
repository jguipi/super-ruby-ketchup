class ReferentsController < ApplicationController
  before_action :set_referent, only: [:show, :edit, :update, :destroy]

  # GET /referents
  # GET /referents.json
  def index

    if (params[:query] != nil)
      q = "%#{params[:query]}%";

      @queryParam = params[:query];
      #find referents that have fields fuzzilly matching the query
      #works for all the fields inside the referents. doesn't work with telephone or organisme since those aren't field
      #in Referents

      result = Referent.where("LOWER(prenom) LIKE ? OR LOWER(nom) LIKE ? OR LOWER(courriel) LIKE ? OR LOWER(fax) LIKE ? OR LOWER(title) LIKE ? OR LOWER(departement) LIKE ? OR refid LIKE ?",q.downcase,q.downcase,q.downcase,q.downcase,q.downcase,q.downcase,q)
      resultTelephone = Telephone.where("number LIKE ?",q)

      resultTelephone.each do |telephone|
        result = result + Referent.find(telephone.referent_id)
      end

      @referents =  result

    else
      @queryParam = nil;
      @referents = Referent.all;
    end

  end

  # GET /referents/1
  # GET /referents/1.json
  def show
  end

  # GET /referents/new
  def new
    @referent = Referent.new
    @options = Organisme.order("name").all
  end

  # GET /referents/1/edit
  def edit
    @referent = Referent.find(params[:id])
    @options = Organisme.order("name").all
  end

  # POST /referents
  # POST /referents.json
  def create
    @referent = Referent.new(referent_params)
    if params[:referent][:organisme_id] == ""
      #@referent.organisme = Organisme.first
    else
      @referent.organisme = Organisme.find(params[:referent][:organisme_id])
    end
    respond_to do |format|
      if @referent.save
        format.html { redirect_to @referent, notice: 'Referent was successfully created.' }
        format.json { render :show, status: :created, location: @referent }
      else
        format.html { render :new }
        format.json { render json: @referent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /referents/1
  # PATCH/PUT /referents/1.json
  def update

    if(!params[:referent][:organisme].nil?)
      @referent.organisme = Organisme.find(params[:referent][:organisme_id])
    end

    respond_to do |format|
      if @referent.update(referent_params)
        format.html { redirect_to @referent, notice: 'Referent was successfully updated.' }
        format.json { render :show, status: :ok, location: @referent }
      else
        format.html { render :edit }
        format.json { render json: @referent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /referents/1
  # DELETE /referents/1.json
  def destroy
    @referent.destroy
    respond_to do |format|
      format.html { redirect_to referents_url, notice: 'Referent was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def validate_email(text)

  end

  #GET referents/search
  def search

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_referent
        @referent = Referent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def referent_params
      params.require(:referent).permit(:nom, :prenom, :refid, :active, :fax, :courriel, :title, :departement,  :organisme_id, :preferenceContact, telephones_attributes:[:telephone_id, :number, :numberType, :id ])
    end



end
