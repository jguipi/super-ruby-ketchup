class PointServiceSerializer < ActiveModel::Serializer
  attributes :id
  belongs_to :organisme
end
