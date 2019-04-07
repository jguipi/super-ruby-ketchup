class OrganismeSerializer < ActiveModel::Serializer
  attributes :id, :name, :mail, :telephone, :adress
  has_many :employes
  has_many :point_services

end
