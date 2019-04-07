class Local < ApplicationRecord
  has_and_belongs_to_many :services, -> { distinct }
  validates_presence_of :nom
  validates_presence_of :nombrePlaces
end
