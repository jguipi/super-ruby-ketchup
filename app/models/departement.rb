class Departement < ApplicationRecord
  has_many :organisme_departements
  has_many :organismes, :through => :organisme_departements
  has_many :point_service_departements
  has_many :point_services, :through => :point_service_departements
  validates :description, allow_blank: false, presence: true
end
