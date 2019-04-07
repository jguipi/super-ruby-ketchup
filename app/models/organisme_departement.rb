class OrganismeDepartement < ApplicationRecord
  belongs_to :organisme
  belongs_to :departement
end
