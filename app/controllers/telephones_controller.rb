class TelephonesController < ApplicationController

  def show
  end

  def index
    @telephones = Telephone.all
  end

  def new
    @telephones = Telephone.new
  end

  def create
    @referent = Referent.find(params[:referent_id])
    @telephone = @referent.telephones.create(telephone_params)
    redirect_to referent_path(@referent)
  end

  private
  def telephone_params
    params.require(:telephone).permit(:number, :numberType)
  end
end
