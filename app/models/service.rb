class Service < ApplicationRecord
  has_and_belongs_to_many :locals
  validates :nom, presence: true, allow_blank: false
end
