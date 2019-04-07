class PointServiceDepartement < ApplicationRecord
  belongs_to :point_service
  belongs_to :departement
end
