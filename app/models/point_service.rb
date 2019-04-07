class PointService < ApplicationRecord
  has_one :adresse, :dependent => :destroy
  has_many :point_service_departements
  has_many :departements, -> {distinct}, through: :point_service_departements
  has_many :local
  belongs_to :organisme
  accepts_nested_attributes_for :adresse
  accepts_nested_attributes_for :local
  validates_presence_of :nom
end
