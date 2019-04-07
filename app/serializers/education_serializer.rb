class EducationSerializer < ActiveModel::Serializer
  attributes :id, :type, :name, :date_completed
  has_one :employe
end
