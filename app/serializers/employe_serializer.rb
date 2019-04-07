class EmployeSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :organisme
end
